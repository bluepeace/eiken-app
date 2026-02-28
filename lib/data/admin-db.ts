import { supabase } from "@/lib/supabase/client";

/** 管理者かどうか */
export async function checkIsAdmin(): Promise<boolean> {
  const {
    data: { user }
  } = await supabase.auth.getUser();
  if (!user) return false;

  const { data: rows } = await supabase
    .from("user_profiles")
    .select("role")
    .eq("auth_user_id", user.id)
    .limit(1);

  const profile = Array.isArray(rows) ? rows[0] : rows;
  return profile?.role === "admin";
}

/** 管理者用: 企業 */
export interface AdminOrganization {
  id: number;
  name: string;
  logo_url: string | null;
  created_at: string;
}

/** 管理者用: ユーザー一覧（メール・課金・所属企業含む） */
export interface AdminUser {
  id: string;
  display_id: number;
  auth_user_id: string;
  email: string | null;
  display_name: string | null;
  target_level: string | null;
  role: string;
  avatar_url: string | null;
  avatar_style: string | null;
  created_at: string;
  total_study_seconds: number;
  current_streak: number;
  subscription_status: string;
  subscription_source: string | null;
  subscription_current_period_end: string | null;
  stripe_customer_id: string | null;
  organization_id: number | null;
  organization_name: string | null;
}

export async function adminGetUsers(): Promise<AdminUser[]> {
  const { data, error } = await supabase.rpc("admin_get_users");

  if (error) {
    throw new Error(error.message);
  }

  return (data ?? []).map((r: Record<string, unknown>) => ({
    id: r.id as string,
    display_id: (r.display_id as number) ?? 0,
    auth_user_id: r.auth_user_id as string,
    email: (r.email as string) ?? null,
    display_name: (r.display_name as string) ?? null,
    target_level: (r.target_level as string) ?? null,
    role: (r.role as string) ?? "user",
    avatar_url: (r.avatar_url as string) ?? null,
    avatar_style: (r.avatar_style as string) ?? null,
    created_at: r.created_at as string,
    total_study_seconds: (r.total_study_seconds as number) ?? 0,
    current_streak: (r.current_streak as number) ?? 0,
    subscription_status: (r.subscription_status as string) ?? "free",
    subscription_source: (r.subscription_source as string) ?? null,
    subscription_current_period_end: (r.subscription_current_period_end as string) ?? null,
    stripe_customer_id: (r.stripe_customer_id as string) ?? null,
    organization_id: (r.organization_id as number) ?? null,
    organization_name: (r.organization_name as string) ?? null
  }));
}

// ========== 企業管理 ==========

export async function adminGetOrganizations(): Promise<AdminOrganization[]> {
  const { data, error } = await supabase
    .from("organizations")
    .select("id, name, logo_url, created_at")
    .order("id", { ascending: true });

  if (error) throw new Error(error.message);
  return (data ?? []).map((r) => ({
    id: r.id as number,
    name: (r.name as string) ?? "",
    logo_url: (r.logo_url as string) ?? null,
    created_at: (r.created_at as string) ?? ""
  }));
}

export async function adminCreateOrganization(name: string): Promise<AdminOrganization> {
  const { data, error } = await supabase
    .from("organizations")
    .insert({ name })
    .select("id, name, logo_url, created_at")
    .single();

  if (error) throw new Error(error.message);
  return {
    id: data.id as number,
    name: (data.name as string) ?? "",
    logo_url: (data.logo_url as string) ?? null,
    created_at: (data.created_at as string) ?? ""
  };
}

export async function adminUpdateOrganization(
  id: number,
  updates: { name?: string; logo_url?: string | null }
): Promise<void> {
  const { error } = await supabase
    .from("organizations")
    .update(updates)
    .eq("id", id);

  if (error) throw new Error(error.message);
}

/** 管理者用: ユーザー詳細（user_profiles の更新用） */
export async function adminGetUserProfile(profileId: string) {
  const { data, error } = await supabase
    .from("user_profiles")
    .select("id, auth_user_id, display_name, target_level, role, created_at, subscription_status, subscription_source, organization_id")
    .eq("id", profileId)
    .maybeSingle();

  if (error) throw new Error(error.message);
  return data;
}

/** 管理者用: ユーザープロフィール更新 */
export async function adminUpdateUserProfile(
  profileId: string,
  updates: {
    display_name?: string | null;
    target_level?: string | null;
    role?: string;
    subscription_status?: string;
    subscription_source?: string | null;
    organization_id?: number | null;
  }
) {
  const { error } = await supabase
    .from("user_profiles")
    .update(updates)
    .eq("id", profileId);

  if (error) throw new Error(error.message);
}

// ========== 単語管理 ==========

export interface VocabularyItem {
  id: number;
  level: string;
  word: string;
  meaning_ja: string;
  part_of_speech: string | null;
  category: string | null;
  pronunciation: string | null;
  example_en: string | null;
  example_ja: string | null;
}

export async function adminGetVocabulary(): Promise<VocabularyItem[]> {
  const all: VocabularyItem[] = [];
  const pageSize = 1000;
  let offset = 0;
  let hasMore = true;

  while (hasMore) {
    const { data, error } = await supabase
      .from("vocabulary")
      .select("id, level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja")
      .order("id", { ascending: true })
      .range(offset, offset + pageSize - 1);

    if (error) throw new Error(error.message);
    if (!data || data.length === 0) break;

    for (const r of data) {
      all.push({
        id: r.id as number,
        level: r.level as string,
        word: r.word as string,
        meaning_ja: r.meaning_ja as string,
        part_of_speech: (r.part_of_speech as string) ?? null,
        category: (r.category as string) ?? null,
        pronunciation: (r.pronunciation as string) ?? null,
        example_en: (r.example_en as string) ?? null,
        example_ja: (r.example_ja as string) ?? null
      });
    }
    hasMore = data.length >= pageSize;
    offset += pageSize;
  }

  return all;
}

export async function adminGetVocabularyById(id: number) {
  const { data, error } = await supabase
    .from("vocabulary")
    .select("id, level, word, meaning_ja, part_of_speech, category, pronunciation, example_en, example_ja")
    .eq("id", id)
    .maybeSingle();

  if (error) throw new Error(error.message);
  return data;
}

export interface VocabularyInput {
  level: string;
  word: string;
  meaning_ja: string;
  part_of_speech?: string | null;
  category?: string | null;
  pronunciation?: string | null;
  example_en?: string | null;
  example_ja?: string | null;
}

export async function adminCreateVocabulary(input: VocabularyInput) {
  const { data, error } = await supabase
    .from("vocabulary")
    .insert({
      level: input.level,
      word: input.word,
      meaning_ja: input.meaning_ja,
      part_of_speech: input.part_of_speech ?? null,
      category: input.category ?? null,
      pronunciation: input.pronunciation ?? null,
      example_en: input.example_en ?? null,
      example_ja: input.example_ja ?? null
    })
    .select("id")
    .maybeSingle();

  if (error) throw new Error(error.message);
  return data?.id;
}

export async function adminUpdateVocabulary(id: number, input: VocabularyInput) {
  const { error } = await supabase
    .from("vocabulary")
    .update({
      level: input.level,
      word: input.word,
      meaning_ja: input.meaning_ja,
      part_of_speech: input.part_of_speech ?? null,
      category: input.category ?? null,
      pronunciation: input.pronunciation ?? null,
      example_en: input.example_en ?? null,
      example_ja: input.example_ja ?? null
    })
    .eq("id", id);

  if (error) throw new Error(error.message);
}

export async function adminDeleteVocabulary(id: number) {
  const { error } = await supabase
    .from("vocabulary")
    .delete()
    .eq("id", id);

  if (error) throw new Error(error.message);
}

// ========== ライティング問題管理 ==========

export interface WritingPromptItem {
  id: number;
  level: string;
  prompt_type: string;
  title: string;
  prompt: string;
  word_count_min: number | null;
  word_count_max: number | null;
  time_limit_min_seconds: number | null;
  time_limit_max_seconds: number | null;
}

export async function adminGetWritingPrompts(): Promise<WritingPromptItem[]> {
  const all: WritingPromptItem[] = [];
  const pageSize = 1000;
  let offset = 0;
  let hasMore = true;

  while (hasMore) {
    const { data, error } = await supabase
      .from("writing_prompts")
      .select("id, level, prompt_type, title, prompt, word_count_min, word_count_max, time_limit_min_seconds, time_limit_max_seconds")
      .order("id", { ascending: true })
      .range(offset, offset + pageSize - 1);

    if (error) throw new Error(error.message);
    if (!data || data.length === 0) break;

    for (const r of data) {
      all.push({
        id: r.id as number,
        level: r.level as string,
        prompt_type: (r.prompt_type as string) ?? "essay",
        title: r.title as string,
        prompt: r.prompt as string,
        word_count_min: (r.word_count_min as number) ?? null,
        word_count_max: (r.word_count_max as number) ?? null,
        time_limit_min_seconds: (r.time_limit_min_seconds as number) ?? null,
        time_limit_max_seconds: (r.time_limit_max_seconds as number) ?? null
      });
    }
    hasMore = data.length >= pageSize;
    offset += pageSize;
  }

  return all;
}

export async function adminGetWritingPromptById(id: number) {
  const { data, error } = await supabase
    .from("writing_prompts")
    .select("id, level, prompt_type, title, prompt, word_count_min, word_count_max, time_limit_min_seconds, time_limit_max_seconds")
    .eq("id", id)
    .maybeSingle();

  if (error) throw new Error(error.message);
  return data;
}

export interface WritingPromptInput {
  level: string;
  prompt_type: "essay" | "email" | "summary";
  title: string;
  prompt: string;
  word_count_min?: number | null;
  word_count_max?: number | null;
  time_limit_min_seconds?: number | null;
  time_limit_max_seconds?: number | null;
}

export async function adminCreateWritingPrompt(input: WritingPromptInput) {
  const { data, error } = await supabase
    .from("writing_prompts")
    .insert({
      level: input.level,
      prompt_type: input.prompt_type,
      title: input.title,
      prompt: input.prompt,
      word_count_min: input.word_count_min ?? null,
      word_count_max: input.word_count_max ?? null,
      time_limit_min_seconds: input.time_limit_min_seconds ?? null,
      time_limit_max_seconds: input.time_limit_max_seconds ?? null
    })
    .select("id")
    .maybeSingle();

  if (error) throw new Error(error.message);
  return data?.id;
}

export async function adminUpdateWritingPrompt(id: number, input: WritingPromptInput) {
  const { error } = await supabase
    .from("writing_prompts")
    .update({
      level: input.level,
      prompt_type: input.prompt_type,
      title: input.title,
      prompt: input.prompt,
      word_count_min: input.word_count_min ?? null,
      word_count_max: input.word_count_max ?? null,
      time_limit_min_seconds: input.time_limit_min_seconds ?? null,
      time_limit_max_seconds: input.time_limit_max_seconds ?? null
    })
    .eq("id", id);

  if (error) throw new Error(error.message);
}

export async function adminDeleteWritingPrompt(id: number) {
  const { error } = await supabase
    .from("writing_prompts")
    .delete()
    .eq("id", id);

  if (error) throw new Error(error.message);
}

// ========== 基本設定 ==========

export interface AppSettings {
  admin_email: string | null;
}

export async function adminGetAppSettings(): Promise<AppSettings> {
  const { data, error } = await supabase
    .from("app_settings")
    .select("admin_email")
    .eq("id", 1)
    .maybeSingle();

  if (error) throw new Error(error.message);
  return {
    admin_email: (data?.admin_email as string) ?? null
  };
}

export async function adminUpdateAppSettings(updates: { admin_email?: string | null }) {
  const { error } = await supabase
    .from("app_settings")
    .update({
      admin_email: updates.admin_email ?? null,
      updated_at: new Date().toISOString()
    })
    .eq("id", 1);

  if (error) throw new Error(error.message);
}

export interface ExamDateRow {
  id: string;
  exam_year: number;
  round: number;
  primary_date: string;
  secondary_date: string;
}

export async function adminGetExamDates(): Promise<ExamDateRow[]> {
  const { data, error } = await supabase
    .from("eiken_exam_dates")
    .select("id, exam_year, round, primary_date, secondary_date")
    .order("exam_year", { ascending: true })
    .order("round", { ascending: true });

  if (error) throw new Error(error.message);
  return (data ?? []).map((r) => ({
    id: r.id as string,
    exam_year: r.exam_year as number,
    round: r.round as number,
    primary_date: (r.primary_date as string) ?? "",
    secondary_date: (r.secondary_date as string) ?? ""
  }));
}

export async function adminUpsertExamDate(
  examYear: number,
  round: number,
  primaryDate: string,
  secondaryDate: string
) {
  const { error } = await supabase
    .from("eiken_exam_dates")
    .upsert(
      {
        exam_year: examYear,
        round,
        primary_date: primaryDate,
        secondary_date: secondaryDate,
        updated_at: new Date().toISOString()
      },
      { onConflict: "exam_year,round" }
    );

  if (error) throw new Error(error.message);
}

// ========== 月別背景設定 ==========

export interface MonthlyBackgroundRow {
  month: number;
  image_url: string | null;
}

export async function adminGetMonthlyBackgrounds(): Promise<MonthlyBackgroundRow[]> {
  const { data, error } = await supabase
    .from("monthly_backgrounds")
    .select("month, image_url")
    .order("month", { ascending: true });

  if (error) throw new Error(error.message);
  return (data ?? []).map((r) => ({
    month: r.month as number,
    image_url: (r.image_url as string) ?? null
  }));
}

export async function adminUpsertMonthlyBackground(
  month: number,
  imageUrl: string | null
) {
  const { error } = await supabase
    .from("monthly_backgrounds")
    .upsert(
      {
        month,
        image_url: imageUrl,
        updated_at: new Date().toISOString()
      },
      { onConflict: "month" }
    );

  if (error) throw new Error(error.message);
}

// ========== アバタープリセット ==========

export interface AvatarPresetRow {
  id: string;
  name: string;
  image_url: string;
  sort_order: number;
}

export async function adminGetAvatarPresets(): Promise<AvatarPresetRow[]> {
  const { data, error } = await supabase
    .from("avatar_presets")
    .select("id, name, image_url, sort_order")
    .order("sort_order", { ascending: true })
    .order("created_at", { ascending: true });

  if (error) throw new Error(error.message);
  return (data ?? []).map((r) => ({
    id: r.id as string,
    name: r.name as string,
    image_url: r.image_url as string,
    sort_order: (r.sort_order as number) ?? 0
  }));
}

export async function adminCreateAvatarPreset(
  name: string,
  imageUrl: string
): Promise<string> {
  const { data, error } = await supabase
    .from("avatar_presets")
    .insert({ name, image_url: imageUrl })
    .select("id")
    .maybeSingle();

  if (error) throw new Error(error.message);
  if (!data?.id) throw new Error("Failed to create avatar preset");
  return data.id as string;
}

export async function adminDeleteAvatarPreset(id: string) {
  const { error } = await supabase
    .from("avatar_presets")
    .delete()
    .eq("id", id);

  if (error) throw new Error(error.message);
}

// ========== バディ（一緒に学習するキャラクター） ==========

export interface BuddyRow {
  id: string;
  name: string;
  kind: string;
  image_url: string;
  sort_order: number;
}

export async function adminGetBuddies(): Promise<BuddyRow[]> {
  const { data, error } = await supabase
    .from("buddies")
    .select("id, name, kind, image_url, sort_order")
    .order("sort_order", { ascending: true })
    .order("created_at", { ascending: true });

  if (error) throw new Error(error.message);
  return (data ?? []).map((r) => ({
    id: r.id as string,
    name: r.name as string,
    kind: (r.kind as string) ?? "dog",
    image_url: r.image_url as string,
    sort_order: (r.sort_order as number) ?? 0
  }));
}

export async function adminCreateBuddy(input: {
  name: string;
  kind: string;
  image_url: string;
  sort_order?: number;
}): Promise<string> {
  const { data, error } = await supabase
    .from("buddies")
    .insert({
      name: input.name.trim(),
      kind: input.kind.trim() || "dog",
      image_url: input.image_url,
      sort_order: input.sort_order ?? 0
    })
    .select("id")
    .maybeSingle();

  if (error) throw new Error(error.message);
  if (!data?.id) throw new Error("Failed to create buddy");
  return data.id as string;
}

export async function adminUpdateBuddy(
  id: string,
  input: { name?: string; kind?: string; image_url?: string; sort_order?: number }
) {
  const updates: Record<string, unknown> = {};
  if (input.name !== undefined) updates.name = input.name.trim();
  if (input.kind !== undefined) updates.kind = input.kind.trim() || "dog";
  if (input.image_url !== undefined) updates.image_url = input.image_url;
  if (input.sort_order !== undefined) updates.sort_order = input.sort_order;
  if (Object.keys(updates).length === 0) return;

  const { error } = await supabase.from("buddies").update(updates).eq("id", id);
  if (error) throw new Error(error.message);
}

export async function adminDeleteBuddy(id: string) {
  const { error } = await supabase.from("buddies").delete().eq("id", id);
  if (error) throw new Error(error.message);
}

// ========== バディコメント（表示用コメントの管理） ==========

export type BuddyCommentCategory =
  | "regular"
  | "streak_0"
  | "streak_3_5"
  | "streak_5_10"
  | "streak_11";

export interface BuddyCommentRow {
  id: string;
  body: string;
  category: BuddyCommentCategory;
  sort_order: number;
}

export async function adminGetBuddyComments(
  category?: BuddyCommentCategory
): Promise<BuddyCommentRow[]> {
  let q = supabase
    .from("buddy_comments")
    .select("id, body, category, sort_order")
    .order("sort_order", { ascending: true })
    .order("created_at", { ascending: true });
  if (category) q = q.eq("category", category);
  const { data, error } = await q;
  if (error) throw new Error(error.message);
  return (data ?? []).map((r) => ({
    id: r.id as string,
    body: r.body as string,
    category: (r.category as BuddyCommentCategory) ?? "regular",
    sort_order: (r.sort_order as number) ?? 0
  }));
}

export async function adminCreateBuddyComment(input: {
  body: string;
  category: BuddyCommentCategory;
  sort_order?: number;
}): Promise<string> {
  const { data, error } = await supabase
    .from("buddy_comments")
    .insert({
      body: input.body.trim(),
      category: input.category,
      sort_order: input.sort_order ?? 0
    })
    .select("id")
    .maybeSingle();
  if (error) throw new Error(error.message);
  if (!data?.id) throw new Error("Failed to create buddy comment");
  return data.id as string;
}

export async function adminUpdateBuddyComment(
  id: string,
  input: { body?: string; category?: BuddyCommentCategory; sort_order?: number }
) {
  const updates: Record<string, unknown> = {};
  if (input.body !== undefined) updates.body = input.body.trim();
  if (input.category !== undefined) updates.category = input.category;
  if (input.sort_order !== undefined) updates.sort_order = input.sort_order;
  if (Object.keys(updates).length === 0) return;
  const { error } = await supabase
    .from("buddy_comments")
    .update(updates)
    .eq("id", id);
  if (error) throw new Error(error.message);
}

export async function adminDeleteBuddyComment(id: string) {
  const { error } = await supabase.from("buddy_comments").delete().eq("id", id);
  if (error) throw new Error(error.message);
}

// ========== リーディング（短文・会話問題） ==========

export interface AdminReadingShortQuestion {
  id: number;
  level: string;
  question_type: string;
  body: string;
  choices: string[];
  correct_index: number;
  explanation: string | null;
  created_at?: string;
}

export async function adminGetReadingShortQuestions(): Promise<AdminReadingShortQuestion[]> {
  const all: AdminReadingShortQuestion[] = [];
  const pageSize = 500;
  let offset = 0;
  let hasMore = true;

  while (hasMore) {
    const { data, error } = await supabase
      .from("reading_short_questions")
      .select("id, level, question_type, body, choices, correct_index, explanation, created_at")
      .order("id", { ascending: true })
      .range(offset, offset + pageSize - 1);

    if (error) throw new Error(error.message);
    if (!data || data.length === 0) break;

    for (const r of data) {
      all.push({
        id: r.id as number,
        level: (r.level as string) ?? "",
        question_type: (r.question_type as string) ?? "",
        body: (r.body as string) ?? "",
        choices: Array.isArray(r.choices) ? (r.choices as string[]) : [],
        correct_index: Number(r.correct_index) ?? 0,
        explanation: (r.explanation as string) ?? null,
        created_at: r.created_at as string | undefined
      });
    }
    hasMore = data.length >= pageSize;
    offset += pageSize;
  }

  return all;
}

/** 管理者用: 長文の内容一致（reading_passages）一覧 */
export interface AdminReadingPassage {
  id: number;
  level: string;
  genre: string | null;
  passage_type: string;
  title: string | null;
  body: string | null;
  question_count: number;
}

export async function adminGetReadingPassages(
  passageType: "long_content" | "long_fill" = "long_content"
): Promise<AdminReadingPassage[]> {
  const { data: passages, error: passError } = await supabase
    .from("reading_passages")
    .select("id, level, genre, passage_type, title, body")
    .eq("passage_type", passageType)
    .order("id", { ascending: true });

  if (passError) throw new Error(passError.message);
  if (!passages || passages.length === 0) return [];

  const ids = passages.map((p) => p.id as number);
  const { data: questions, error: qError } = await supabase
    .from("reading_passage_questions")
    .select("passage_id")
    .in("passage_id", ids);

  if (qError) throw new Error(qError.message);

  const countByPassage = new Map<number, number>();
  for (const q of questions ?? []) {
    const pid = q.passage_id as number;
    countByPassage.set(pid, (countByPassage.get(pid) ?? 0) + 1);
  }

  return passages.map((p) => ({
    id: p.id as number,
    level: (p.level as string) ?? "",
    genre: (p.genre as string) ?? null,
    passage_type: (p.passage_type as string) ?? "",
    title: (p.title as string) ?? null,
    body: (p.body as string) ?? null,
    question_count: countByPassage.get(p.id as number) ?? 0
  }));
}

export async function adminDeleteReadingPassage(id: number) {
  const { error } = await supabase
    .from("reading_passages")
    .delete()
    .eq("id", id);

  if (error) throw new Error(error.message);
}

/** 管理者用: 長文1件取得（設問付き） */
export interface AdminReadingPassageQuestion {
  id: number;
  question_text: string;
  choices: string[];
  correct_index: number;
  order_num: number;
  explanation: string | null;
}

export interface AdminReadingPassageDetail {
  id: number;
  level: string;
  genre: string | null;
  passage_type: string;
  title: string | null;
  body: string | null;
  questions: AdminReadingPassageQuestion[];
}

export async function adminGetReadingPassageById(
  id: number
): Promise<AdminReadingPassageDetail | null> {
  const { data: passage, error: passError } = await supabase
    .from("reading_passages")
    .select("id, level, genre, passage_type, title, body")
    .eq("id", id)
    .maybeSingle();

  if (passError) throw new Error(passError.message);
  if (!passage) return null;

  const { data: questions, error: qError } = await supabase
    .from("reading_passage_questions")
    .select("id, question_text, choices, correct_index, order_num, explanation")
    .eq("passage_id", id)
    .order("order_num", { ascending: true });

  if (qError) throw new Error(qError.message);

  return {
    id: passage.id as number,
    level: (passage.level as string) ?? "",
    genre: (passage.genre as string) ?? null,
    passage_type: (passage.passage_type as string) ?? "",
    title: (passage.title as string) ?? null,
    body: (passage.body as string) ?? null,
    questions: (questions ?? []).map((q) => ({
      id: q.id as number,
      question_text: (q.question_text as string) ?? "",
      choices: Array.isArray(q.choices) ? (q.choices as string[]) : [],
      correct_index: Number(q.correct_index) ?? 0,
      order_num: Number(q.order_num) ?? 0,
      explanation: (q.explanation as string) ?? null
    }))
  };
}

export interface AdminReadingPassageQuestionInput {
  question_text: string;
  choices: string[];
  correct_index: number;
  order_num: number;
  explanation?: string | null;
}

export interface AdminReadingPassageUpdateInput {
  level: string;
  genre: string | null;
  passage_type: "long_content" | "long_fill";
  title: string | null;
  body: string | null;
  questions: AdminReadingPassageQuestionInput[];
}

export async function adminUpdateReadingPassage(
  id: number,
  input: AdminReadingPassageUpdateInput
) {
  const bodyText = input.body?.trim() ?? "";
  const { error: passError } = await supabase
    .from("reading_passages")
    .update({
      level: input.level,
      genre: input.genre || null,
      passage_type: input.passage_type,
      title: input.title?.trim() || null,
      body: bodyText || null,
      content: bodyText || ""
    })
    .eq("id", id);

  if (passError) throw new Error(passError.message);

  const { error: delError } = await supabase
    .from("reading_passage_questions")
    .delete()
    .eq("passage_id", id);

  if (delError) throw new Error(delError.message);

  if (input.questions.length > 0) {
    const rows = input.questions.map((q, i) => ({
      passage_id: id,
      question_text: q.question_text.trim(),
      choices: q.choices,
      correct_index: q.correct_index,
      order_num: q.order_num ?? i,
      explanation: (q.explanation?.trim() && q.explanation.trim().length > 0) ? q.explanation.trim() : null
    }));
    const { error: insError } = await supabase
      .from("reading_passage_questions")
      .insert(rows);
    if (insError) throw new Error(insError.message);
  }
}

export async function adminGetReadingShortQuestionById(id: number) {
  const { data, error } = await supabase
    .from("reading_short_questions")
    .select("id, level, question_type, body, choices, correct_index, explanation, created_at")
    .eq("id", id)
    .maybeSingle();

  if (error) throw new Error(error.message);
  if (!data) return null;

  return {
    id: data.id as number,
    level: (data.level as string) ?? "",
    question_type: (data.question_type as string) ?? "",
    body: (data.body as string) ?? "",
    choices: Array.isArray(data.choices) ? (data.choices as string[]) : [],
    correct_index: Number(data.correct_index) ?? 0,
    explanation: (data.explanation as string) ?? null,
    created_at: data.created_at as string | undefined
  };
}

export interface AdminReadingShortQuestionInput {
  level: string;
  question_type: "short_fill" | "conversation_fill";
  body: string;
  choices: string[];
  correct_index: number;
  explanation?: string | null;
}

export async function adminCreateReadingShortQuestion(
  input: AdminReadingShortQuestionInput
): Promise<number> {
  const { data, error } = await supabase
    .from("reading_short_questions")
    .insert({
      level: input.level,
      question_type: input.question_type,
      body: input.body.trim(),
      choices: input.choices,
      correct_index: input.correct_index,
      explanation: input.explanation?.trim() || null
    })
    .select("id")
    .maybeSingle();

  if (error) throw new Error(error.message);
  if (!data?.id) throw new Error("Failed to create question");
  return data.id as number;
}

export async function adminUpdateReadingShortQuestion(
  id: number,
  input: AdminReadingShortQuestionInput
) {
  const { error } = await supabase
    .from("reading_short_questions")
    .update({
      level: input.level,
      question_type: input.question_type,
      body: input.body.trim(),
      choices: input.choices,
      correct_index: input.correct_index,
      explanation: input.explanation?.trim() || null
    })
    .eq("id", id);

  if (error) throw new Error(error.message);
}

export async function adminDeleteReadingShortQuestion(id: number) {
  const { error } = await supabase
    .from("reading_short_questions")
    .delete()
    .eq("id", id);

  if (error) throw new Error(error.message);
}

/** 管理者用: 語句整序問題一覧 */
export interface AdminReadingWordOrderQuestion {
  id: number;
  level: string;
  prompt_ja: string;
  words: string[];
  correct_order: number[];
  created_at?: string;
}

export async function adminGetReadingWordOrderQuestions(): Promise<AdminReadingWordOrderQuestion[]> {
  const all: AdminReadingWordOrderQuestion[] = [];
  const pageSize = 500;
  let offset = 0;
  let hasMore = true;

  while (hasMore) {
    const { data, error } = await supabase
      .from("reading_word_order_questions")
      .select("id, level, prompt_ja, words, correct_order, created_at")
      .order("id", { ascending: true })
      .range(offset, offset + pageSize - 1);

    if (error) throw new Error(error.message);
    if (!data || data.length === 0) break;

    for (const r of data) {
      all.push({
        id: r.id as number,
        level: (r.level as string) ?? "",
        prompt_ja: (r.prompt_ja as string) ?? "",
        words: Array.isArray(r.words) ? (r.words as string[]) : [],
        correct_order: Array.isArray(r.correct_order) ? (r.correct_order as number[]) : [],
        created_at: r.created_at as string | undefined
      });
    }
    hasMore = data.length >= pageSize;
    offset += pageSize;
  }

  return all;
}

/** 管理者用: 語句整序1件取得 */
export async function adminGetReadingWordOrderQuestionById(
  id: number
): Promise<AdminReadingWordOrderQuestion | null> {
  const { data, error } = await supabase
    .from("reading_word_order_questions")
    .select("id, level, prompt_ja, words, correct_order, created_at")
    .eq("id", id)
    .maybeSingle();

  if (error) throw new Error(error.message);
  if (!data) return null;

  return {
    id: data.id as number,
    level: (data.level as string) ?? "",
    prompt_ja: (data.prompt_ja as string) ?? "",
    words: Array.isArray(data.words) ? (data.words as string[]) : [],
    correct_order: Array.isArray(data.correct_order) ? (data.correct_order as number[]) : [],
    created_at: data.created_at as string | undefined
  };
}

export interface AdminReadingWordOrderQuestionInput {
  level: string;
  prompt_ja: string;
  words: string[];
  correct_order: number[];
}

export async function adminUpdateReadingWordOrderQuestion(
  id: number,
  input: AdminReadingWordOrderQuestionInput
) {
  const { error } = await supabase
    .from("reading_word_order_questions")
    .update({
      level: input.level,
      prompt_ja: input.prompt_ja.trim(),
      words: input.words,
      correct_order: input.correct_order
    })
    .eq("id", id);

  if (error) throw new Error(error.message);
}

export async function adminCreateReadingWordOrderQuestion(
  input: AdminReadingWordOrderQuestionInput
): Promise<number> {
  const { data, error } = await supabase
    .from("reading_word_order_questions")
    .insert({
      level: input.level,
      prompt_ja: input.prompt_ja.trim(),
      words: input.words,
      correct_order: input.correct_order
    })
    .select("id")
    .maybeSingle();

  if (error) throw new Error(error.message);
  if (!data?.id) throw new Error("Failed to create question");
  return data.id as number;
}

export async function adminDeleteReadingWordOrderQuestion(id: number) {
  const { error } = await supabase
    .from("reading_word_order_questions")
    .delete()
    .eq("id", id);

  if (error) throw new Error(error.message);
}
