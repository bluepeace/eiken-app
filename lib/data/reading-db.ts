import { supabase } from "@/lib/supabase/client";

/** 短文・会話の語句空所補充 1問 */
export interface ReadingShortQuestion {
  id: number;
  level: string;
  question_type: "short_fill" | "conversation_fill";
  body: string;
  choices: string[];
  correct_index: number;
  /** 正解の解説（日本語） */
  explanation: string | null;
}

/** 語句整序 1問 */
export interface ReadingWordOrderQuestion {
  id: number;
  level: string;
  prompt_ja: string;
  words: string[];
  correct_order: number[];
}

/** 長文パッセージ（長文語句空所・内容一致の親） */
export interface ReadingPassage {
  id: number;
  level: string;
  genre: string | null;
  passage_type: "long_fill" | "long_content";
  body: string | null;
  title?: string;
  content?: string; // 既存カラム互換
}

/** 長文の空所1つ分 */
export interface ReadingPassageBlank {
  id: number;
  passage_id: number;
  blank_index: number;
  choices: string[];
  correct_index: number;
}

/** 長文の内容一致設問1つ */
export interface ReadingPassageQuestion {
  id: number;
  passage_id: number;
  question_text: string;
  choices: string[];
  correct_index: number;
  order_num: number;
  /** 正解の解説（日本語） */
  explanation: string | null;
}

/** 短文空所の優先度スコア（間違い回数 − 正解回数。正のとき出題優先） */
export async function getReadingShortPriorityScores(
  profileId: string
): Promise<{ id: number; score: number }[]> {
  const { data, error } = await supabase
    .from("reading_results")
    .select("source_id, is_correct")
    .eq("user_id", profileId)
    .eq("source_type", "short");

  if (error || !data) return [];

  const wrongMap = new Map<number, number>();
  const correctMap = new Map<number, number>();
  for (const row of data) {
    const id = Number(row.source_id);
    if (row.is_correct) {
      correctMap.set(id, (correctMap.get(id) ?? 0) + 1);
    } else {
      wrongMap.set(id, (wrongMap.get(id) ?? 0) + 1);
    }
  }
  const ids = new Set([...wrongMap.keys(), ...correctMap.keys()]);
  return [...ids]
    .map((id) => ({
      id,
      score: (wrongMap.get(id) ?? 0) - (correctMap.get(id) ?? 0),
    }))
    .filter((x) => x.score > 0)
    .sort((a, b) => b.score - a.score);
}

function shuffleReading<T>(arr: T[]): T[] {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

/** 短文・会話問題を級・タイプで取得。profileId 指定時は間違えた問題を優先（正解した問題は出題回数減） */
export async function fetchReadingShortQuestions(
  level: string,
  questionType: "short_fill" | "conversation_fill",
  limit: number,
  profileId?: string | null
): Promise<ReadingShortQuestion[]> {
  const { data, error } = await supabase
    .from("reading_short_questions")
    .select("id, level, question_type, body, choices, correct_index, explanation")
    .eq("level", level)
    .eq("question_type", questionType)
    .limit(limit * 10);

  if (error || !data) return [];

  const parsed: ReadingShortQuestion[] = data.map((row) => ({
    id: row.id as number,
    level: (row.level as string) ?? "",
    question_type: row.question_type as "short_fill" | "conversation_fill",
    body: (row.body as string) ?? "",
    choices: Array.isArray(row.choices) ? (row.choices as string[]) : [],
    correct_index: Number(row.correct_index) ?? 0,
    explanation: (row.explanation as string) ?? null,
  }));

  if (!profileId || parsed.length === 0) {
    return shuffleReading(parsed).slice(0, limit);
  }

  const priorityScores = await getReadingShortPriorityScores(profileId);
  const priorityIds = new Set(priorityScores.map((p) => p.id));
  const priorityItems = shuffleReading(parsed.filter((q) => priorityIds.has(q.id)));
  const restItems = shuffleReading(parsed.filter((q) => !priorityIds.has(q.id)));

  let nFromPriority = Math.min(4, priorityItems.length);
  let nFromRest = Math.min(limit - nFromPriority, restItems.length);
  if (nFromRest < 0) nFromRest = 0;
  if (nFromPriority + nFromRest < limit) {
    nFromPriority = Math.min(limit - nFromRest, priorityItems.length);
  }
  const selected = shuffleReading([
    ...priorityItems.slice(0, nFromPriority),
    ...restItems.slice(0, nFromRest),
  ]);
  return selected.slice(0, limit);
}

/** 語句整序問題を級で取得 */
export async function fetchReadingWordOrderQuestions(
  level: string,
  limit: number
): Promise<ReadingWordOrderQuestion[]> {
  const { data, error } = await supabase
    .from("reading_word_order_questions")
    .select("id, level, prompt_ja, words, correct_order")
    .eq("level", level)
    .limit(limit * 3);

  if (error || !data) return [];

  return data.map((row) => ({
    id: row.id as number,
    level: (row.level as string) ?? "",
    prompt_ja: (row.prompt_ja as string) ?? "",
    words: Array.isArray(row.words) ? (row.words as string[]) : [],
    correct_order: Array.isArray(row.correct_order)
      ? (row.correct_order as number[])
      : [],
  })).slice(0, limit);
}

/** 長文パッセージを級・種別で1本取得（ランダム） */
export async function fetchReadingPassage(
  level: string,
  passageType: "long_fill" | "long_content"
): Promise<ReadingPassage | null> {
  const { data, error } = await supabase
    .from("reading_passages")
    .select("id, level, genre, passage_type, body, title, content")
    .eq("level", level)
    .eq("passage_type", passageType)
    .limit(20);

  if (error || !data || data.length === 0) return null;

  const row = data[Math.floor(Math.random() * data.length)];
  const body = row.body ?? row.content ?? "";
  return {
    id: row.id as number,
    level: (row.level as string) ?? "",
    genre: (row.genre as string) ?? null,
    passage_type: row.passage_type as "long_fill" | "long_content",
    body: body || null,
    title: row.title as string | undefined,
    content: row.content as string | undefined,
  };
}

/** 長文の語句空所リストを取得（passage_id 指定） */
export async function fetchReadingPassageBlanks(
  passageId: number
): Promise<ReadingPassageBlank[]> {
  const { data, error } = await supabase
    .from("reading_passage_blanks")
    .select("id, passage_id, blank_index, choices, correct_index")
    .eq("passage_id", passageId)
    .order("blank_index", { ascending: true });

  if (error || !data) return [];

  return data.map((row) => ({
    id: row.id as number,
    passage_id: row.passage_id as number,
    blank_index: Number(row.blank_index) ?? 0,
    choices: Array.isArray(row.choices) ? (row.choices as string[]) : [],
    correct_index: Number(row.correct_index) ?? 0,
  }));
}

/** 長文の内容一致設問リストを取得（passage_id 指定） */
export async function fetchReadingPassageQuestions(
  passageId: number
): Promise<ReadingPassageQuestion[]> {
  const { data, error } = await supabase
    .from("reading_passage_questions")
    .select("id, passage_id, question_text, choices, correct_index, order_num, explanation")
    .eq("passage_id", passageId)
    .order("order_num", { ascending: true });

  if (error || !data) return [];

  return data.map((row) => ({
    id: row.id as number,
    passage_id: row.passage_id as number,
    question_text: (row.question_text as string) ?? "",
    choices: Array.isArray(row.choices) ? (row.choices as string[]) : [],
    correct_index: Number(row.correct_index) ?? 0,
    order_num: Number(row.order_num) ?? 0,
    explanation: (row.explanation as string) ?? null,
  }));
}

/** 解答履歴1件（短文・会話・語句整序・長文語句空所・長文内容一致） */
export interface ReadingHistoryEntry {
  id: number;
  sourceType: string;
  sourceId: number;
  userAnswer: number;
  isCorrect: boolean;
  createdAt: string;
  level: string;
  questionType: "short_fill" | "conversation_fill" | "word_order" | "long_fill" | "long_content";
  bodySnippet: string;
  /** ユーザーが選んだ選択肢のテキスト（語句整序では null） */
  userAnswerText: string | null;
  /** 正解の選択肢テキスト（語句整序では正解英文） */
  correctAnswerText: string | null;
  /** 解説（日本語） */
  explanation: string | null;
}

/** 短文・会話・語句整序・長文語句空所・長文内容一致の解答履歴を取得（新しい順） */
export async function getReadingHistory(
  profileId: string,
  limit = 50
): Promise<ReadingHistoryEntry[]> {
  const { data: results, error: resError } = await supabase
    .from("reading_results")
    .select("id, source_type, source_id, user_answer, is_correct, created_at")
    .eq("user_id", profileId)
    .in("source_type", ["short", "word_order", "passage_fill", "passage_content"])
    .order("created_at", { ascending: false })
    .limit(limit);

  if (resError || !results || results.length === 0) return [];

  const shortIds = [...new Set(results.filter((r) => r.source_type === "short").map((r) => Number(r.source_id)))];
  const wordOrderIds = [...new Set(results.filter((r) => r.source_type === "word_order").map((r) => Number(r.source_id)))];
  const passageFillIds = [...new Set(results.filter((r) => r.source_type === "passage_fill").map((r) => Number(r.source_id)))];
  const passageContentIds = [...new Set(results.filter((r) => r.source_type === "passage_content").map((r) => Number(r.source_id)))];

  type QuestionMeta = {
    sourceType: "short" | "word_order" | "passage_fill" | "passage_content";
    level: string;
    question_type: "short_fill" | "conversation_fill" | "word_order" | "long_fill" | "long_content";
    body: string;
    choices: string[];
    correct_index: number;
    correctSentence?: string;
    explanation: string | null;
  };
  const questionMap = new Map<string, QuestionMeta>();

  if (shortIds.length > 0) {
    const { data: questions } = await supabase
      .from("reading_short_questions")
      .select("id, level, question_type, body, choices, correct_index, explanation")
      .in("id", shortIds);
    for (const q of questions ?? []) {
      const body = (q.body as string) ?? "";
      const choices = Array.isArray(q.choices) ? (q.choices as string[]) : [];
      questionMap.set(`short-${q.id}`, {
        sourceType: "short",
        level: (q.level as string) ?? "",
        question_type: (q.question_type === "conversation_fill" ? "conversation_fill" : "short_fill"),
        body: body.replace(/__BLANK__/g, "（ ）").slice(0, 80) + (body.length > 80 ? "…" : ""),
        choices,
        correct_index: Number(q.correct_index) ?? 0,
        explanation: (q.explanation as string) ?? null,
      });
    }
  }

  if (wordOrderIds.length > 0) {
    const { data: wq } = await supabase
      .from("reading_word_order_questions")
      .select("id, level, prompt_ja, words, correct_order")
      .in("id", wordOrderIds);
    for (const q of wq ?? []) {
      const words = Array.isArray(q.words) ? (q.words as string[]) : [];
      const order = Array.isArray(q.correct_order) ? (q.correct_order as number[]) : [];
      const correctSentence = order.map((i) => words[i]).join(" ");
      questionMap.set(`word_order-${q.id}`, {
        sourceType: "word_order",
        level: (q.level as string) ?? "",
        question_type: "word_order",
        body: (q.prompt_ja as string) ?? "",
        choices: [],
        correct_index: 0,
        correctSentence,
        explanation: null,
      });
    }
  }

  if (passageFillIds.length > 0) {
    const { data: blanks } = await supabase
      .from("reading_passage_blanks")
      .select("id, passage_id, choices, correct_index")
      .in("id", passageFillIds);
    const passageIds = [...new Set((blanks ?? []).map((b) => b.passage_id as number))];
    const { data: passages } = passageIds.length > 0
      ? await supabase.from("reading_passages").select("id, level, title").in("id", passageIds)
      : { data: [] };
    const passageById = new Map((passages ?? []).map((p) => [p.id as number, p]));
    for (const b of blanks ?? []) {
      const p = passageById.get(b.passage_id as number);
      const choices = Array.isArray(b.choices) ? (b.choices as string[]) : [];
      const title = (p?.title as string) ?? "長文";
      questionMap.set(`passage_fill-${b.id}`, {
        sourceType: "passage_fill",
        level: (p?.level as string) ?? "",
        question_type: "long_fill",
        body: `長文の語句空所: ${title}`,
        choices,
        correct_index: Number(b.correct_index) ?? 0,
        explanation: null,
      });
    }
  }

  if (passageContentIds.length > 0) {
    const { data: pq } = await supabase
      .from("reading_passage_questions")
      .select("id, passage_id, question_text, choices, correct_index, explanation")
      .in("id", passageContentIds);
    const passageIds = [...new Set((pq ?? []).map((q) => q.passage_id as number))];
    const { data: passages } = passageIds.length > 0
      ? await supabase.from("reading_passages").select("id, level").in("id", passageIds)
      : { data: [] };
    const passageById = new Map((passages ?? []).map((p) => [p.id as number, p]));
    for (const q of pq ?? []) {
      const p = passageById.get(q.passage_id as number);
      const body = (q.question_text as string) ?? "";
      const choices = Array.isArray(q.choices) ? (q.choices as string[]) : [];
      questionMap.set(`passage_content-${q.id}`, {
        sourceType: "passage_content",
        level: (p?.level as string) ?? "",
        question_type: "long_content",
        body: body.slice(0, 80) + (body.length > 80 ? "…" : ""),
        choices,
        correct_index: Number(q.correct_index) ?? 0,
        explanation: (q.explanation as string) ?? null,
      });
    }
  }

  return results.map((r) => {
    const st = (r.source_type as string) ?? "short";
    const sid = Number(r.source_id);
    const q = questionMap.get(`${st}-${sid}`);
    const sourceType = (r.source_type as string) ?? "short";
    const userAnsIdx = Number(r.user_answer);
    const correctIdx = q?.correct_index ?? 0;
    const choices = q?.choices ?? [];

    if (sourceType === "word_order" && q?.sourceType === "word_order") {
      return {
        id: r.id as number,
        sourceType,
        sourceId: Number(r.source_id),
        userAnswer: userAnsIdx,
        isCorrect: Boolean(r.is_correct),
        createdAt: (r.created_at as string) ?? "",
        level: q.level,
        questionType: "word_order" as const,
        bodySnippet: q.body,
        userAnswerText: null,
        correctAnswerText: q.correctSentence ?? null,
        explanation: q.explanation ?? null,
      };
    }

    if (sourceType === "passage_fill" && q?.sourceType === "passage_fill") {
      return {
        id: r.id as number,
        sourceType,
        sourceId: Number(r.source_id),
        userAnswer: userAnsIdx,
        isCorrect: Boolean(r.is_correct),
        createdAt: (r.created_at as string) ?? "",
        level: q.level,
        questionType: "long_fill" as const,
        bodySnippet: q.body,
        userAnswerText: choices[userAnsIdx] ?? null,
        correctAnswerText: choices[correctIdx] ?? null,
        explanation: q.explanation ?? null,
      };
    }

    if (sourceType === "passage_content" && q?.sourceType === "passage_content") {
      return {
        id: r.id as number,
        sourceType,
        sourceId: Number(r.source_id),
        userAnswer: userAnsIdx,
        isCorrect: Boolean(r.is_correct),
        createdAt: (r.created_at as string) ?? "",
        level: q.level,
        questionType: "long_content" as const,
        bodySnippet: q.body,
        userAnswerText: choices[userAnsIdx] ?? null,
        correctAnswerText: choices[correctIdx] ?? null,
        explanation: q.explanation ?? null,
      };
    }

    return {
      id: r.id as number,
      sourceType,
      sourceId: Number(r.source_id),
      userAnswer: userAnsIdx,
      isCorrect: Boolean(r.is_correct),
      createdAt: (r.created_at as string) ?? "",
      level: q?.level ?? "",
      questionType: (q?.question_type === "conversation_fill" ? "conversation_fill" : "short_fill") as "short_fill" | "conversation_fill",
      bodySnippet: q?.body ?? "",
      userAnswerText: choices[userAnsIdx] ?? null,
      correctAnswerText: choices[correctIdx] ?? null,
      explanation: q?.explanation ?? null,
    };
  });
}

/** 間違えた問題の集計（全種別、間違い回数が多い順） */
export interface ReadingWrongStats {
  sourceId: number;
  sourceType: "short" | "word_order" | "passage_fill" | "passage_content";
  wrongCount: number;
  level: string;
  questionType: "short_fill" | "conversation_fill" | "word_order" | "long_fill" | "long_content";
  bodySnippet: string;
  /** 正解の選択肢テキスト（語句整序では正解英文） */
  correctAnswerText: string | null;
  /** 解説（日本語） */
  explanation: string | null;
}

export async function getReadingWrongStats(
  profileId: string
): Promise<ReadingWrongStats[]> {
  const { data, error } = await supabase
    .from("reading_results")
    .select("source_type, source_id")
    .eq("user_id", profileId)
    .in("source_type", ["short", "word_order", "passage_fill", "passage_content"])
    .eq("is_correct", false);

  if (error || !data) return [];

  const countMap = new Map<string, number>();
  for (const row of data) {
    const key = `${row.source_type}-${row.source_id}`;
    countMap.set(key, (countMap.get(key) ?? 0) + 1);
  }

  const shortIds = [...new Set(data.filter((r) => r.source_type === "short").map((r) => Number(r.source_id)))];
  const wordOrderIds = [...new Set(data.filter((r) => r.source_type === "word_order").map((r) => Number(r.source_id)))];
  const passageFillIds = [...new Set(data.filter((r) => r.source_type === "passage_fill").map((r) => Number(r.source_id)))];
  const passageContentIds = [...new Set(data.filter((r) => r.source_type === "passage_content").map((r) => Number(r.source_id)))];

  const result: ReadingWrongStats[] = [];

  if (shortIds.length > 0) {
    const { data: questions } = await supabase
      .from("reading_short_questions")
      .select("id, level, question_type, body, choices, correct_index, explanation")
      .in("id", shortIds);
    for (const q of questions ?? []) {
      const body = (q.body as string) ?? "";
      const choices = Array.isArray(q.choices) ? (q.choices as string[]) : [];
      const correctIdx = Number(q.correct_index) ?? 0;
      const key = `short-${q.id}`;
      result.push({
        sourceId: q.id as number,
        sourceType: "short",
        wrongCount: countMap.get(key) ?? 0,
        level: (q.level as string) ?? "",
        questionType: (q.question_type === "conversation_fill" ? "conversation_fill" : "short_fill") as "short_fill" | "conversation_fill",
        bodySnippet: body.replace(/__BLANK__/g, "（ ）").slice(0, 80) + (body.length > 80 ? "…" : ""),
        correctAnswerText: choices[correctIdx] ?? null,
        explanation: (q.explanation as string) ?? null,
      });
    }
  }

  if (wordOrderIds.length > 0) {
    const { data: wq } = await supabase
      .from("reading_word_order_questions")
      .select("id, level, prompt_ja, words, correct_order")
      .in("id", wordOrderIds);
    for (const q of wq ?? []) {
      const words = Array.isArray(q.words) ? (q.words as string[]) : [];
      const order = Array.isArray(q.correct_order) ? (q.correct_order as number[]) : [];
      const correctSentence = order.map((i) => words[i]).join(" ");
      const key = `word_order-${q.id}`;
      result.push({
        sourceId: q.id as number,
        sourceType: "word_order",
        wrongCount: countMap.get(key) ?? 0,
        level: (q.level as string) ?? "",
        questionType: "word_order",
        bodySnippet: (q.prompt_ja as string) ?? "",
        correctAnswerText: correctSentence || null,
        explanation: null,
      });
    }
  }

  if (passageFillIds.length > 0) {
    const { data: blanks } = await supabase
      .from("reading_passage_blanks")
      .select("id, passage_id, choices, correct_index")
      .in("id", passageFillIds);
    const passageIds = [...new Set((blanks ?? []).map((b) => b.passage_id as number))];
    const { data: passages } = passageIds.length > 0
      ? await supabase.from("reading_passages").select("id, level, title").in("id", passageIds)
      : { data: [] };
    const passageById = new Map((passages ?? []).map((p) => [p.id as number, p]));
    for (const b of blanks ?? []) {
      const p = passageById.get(b.passage_id as number);
      const choices = Array.isArray(b.choices) ? (b.choices as string[]) : [];
      const correctIdx = Number(b.correct_index) ?? 0;
      const key = `passage_fill-${b.id}`;
      const title = (p?.title as string) ?? "長文";
      result.push({
        sourceId: b.id as number,
        sourceType: "passage_fill",
        wrongCount: countMap.get(key) ?? 0,
        level: (p?.level as string) ?? "",
        questionType: "long_fill",
        bodySnippet: `長文の語句空所: ${title}`,
        correctAnswerText: choices[correctIdx] ?? null,
        explanation: null,
      });
    }
  }

  if (passageContentIds.length > 0) {
    const { data: pq } = await supabase
      .from("reading_passage_questions")
      .select("id, passage_id, question_text, choices, correct_index, explanation")
      .in("id", passageContentIds);
    const passageIds = [...new Set((pq ?? []).map((q) => q.passage_id as number))];
    const { data: passages } = passageIds.length > 0
      ? await supabase.from("reading_passages").select("id, level").in("id", passageIds)
      : { data: [] };
    const passageById = new Map((passages ?? []).map((p) => [p.id as number, p]));
    for (const q of pq ?? []) {
      const p = passageById.get(q.passage_id as number);
      const body = (q.question_text as string) ?? "";
      const choices = Array.isArray(q.choices) ? (q.choices as string[]) : [];
      const correctIdx = Number(q.correct_index) ?? 0;
      const key = `passage_content-${q.id}`;
      result.push({
        sourceId: q.id as number,
        sourceType: "passage_content",
        wrongCount: countMap.get(key) ?? 0,
        level: (p?.level as string) ?? "",
        questionType: "long_content",
        bodySnippet: body.slice(0, 80) + (body.length > 80 ? "…" : ""),
        correctAnswerText: choices[correctIdx] ?? null,
        explanation: (q.explanation as string) ?? null,
      });
    }
  }

  return result.sort((a, b) => b.wrongCount - a.wrongCount);
}

/** 回答履歴を保存（任意・ログイン時） */
export async function saveReadingResult(
  profileId: string,
  sourceType: "short" | "word_order" | "passage_fill" | "passage_content",
  sourceId: number,
  userAnswer: number,
  isCorrect: boolean
): Promise<{ error: Error | null }> {
  const { error } = await supabase.from("reading_results").insert({
    user_id: profileId,
    source_type: sourceType,
    source_id: sourceId,
    user_answer: userAnswer,
    is_correct: isCorrect,
  });
  return { error: error ?? null };
}
