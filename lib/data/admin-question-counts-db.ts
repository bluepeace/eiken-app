import { supabase } from "@/lib/supabase/client";

export interface QuestionCountRow {
  category: "vocabulary" | "writing" | "reading";
  level: string;
  question_type: string | null;
  count: number;
  /** リーディング長文のみ: 問題数（パッセージ数）。count は設問数。 */
  passage_count: number | null;
  updated_at: string;
}

export async function adminGetQuestionCounts(): Promise<QuestionCountRow[]> {
  const { data, error } = await supabase
    .from("question_counts")
    .select("category, level, question_type, count, passage_count, updated_at")
    .order("category")
    .order("level");

  if (error) throw new Error(error.message);
  return (data ?? []).map((r) => ({
    category: r.category as QuestionCountRow["category"],
    level: (r.level as string) ?? "",
    question_type: (r.question_type as string) ?? null,
    count: Number(r.count) ?? 0,
    passage_count: r.passage_count != null ? Number(r.passage_count) : null,
    updated_at: (r.updated_at as string) ?? ""
  }));
}

/** 集計を再実行（管理者のみ。0:00 の cron でも呼ばれる） */
export async function adminRefreshQuestionCounts(): Promise<void> {
  const { error } = await supabase.rpc("refresh_question_counts");
  if (error) throw new Error(error.message);
}
