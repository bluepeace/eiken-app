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
}

/** 短文・会話問題を級・タイプで取得（最大 limit 件、ランダム出題用に多めに取得してからシャッフル） */
export async function fetchReadingShortQuestions(
  level: string,
  questionType: "short_fill" | "conversation_fill",
  limit: number
): Promise<ReadingShortQuestion[]> {
  const { data, error } = await supabase
    .from("reading_short_questions")
    .select("id, level, question_type, body, choices, correct_index, explanation")
    .eq("level", level)
    .eq("question_type", questionType)
    .limit(limit * 3);

  if (error || !data) return [];

  const parsed = data.map((row) => ({
    id: row.id as number,
    level: (row.level as string) ?? "",
    question_type: row.question_type as "short_fill" | "conversation_fill",
    body: (row.body as string) ?? "",
    choices: Array.isArray(row.choices) ? (row.choices as string[]) : [],
    correct_index: Number(row.correct_index) ?? 0,
    explanation: (row.explanation as string) ?? null,
  }));

  return parsed.slice(0, limit);
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
    .select("id, passage_id, question_text, choices, correct_index, order_num")
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
  }));
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
