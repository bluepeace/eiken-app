-- 053_fix_rls_reading_passages_speaking_scenarios.sql
-- Security Advisor 対応: RLS を有効化
-- - reading_passages: ポリシーは存在するが RLS が無効だった
-- - speaking_scenarios: RLS が未設定だった

-- reading_passages: RLS を有効化し、全員 SELECT 可能にする
-- （管理者の INSERT/UPDATE/DELETE ポリシーは 041 で既に作成済み）
ALTER TABLE public.reading_passages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "reading_passages は全員参照可能"
  ON public.reading_passages
  FOR SELECT
  USING (true);

-- speaking_scenarios: RLS を有効化し、ポリシーを追加
ALTER TABLE public.speaking_scenarios ENABLE ROW LEVEL SECURITY;

CREATE POLICY "speaking_scenarios は全員参照可能"
  ON public.speaking_scenarios
  FOR SELECT
  USING (true);

CREATE POLICY "管理者は speaking_scenarios を挿入可能"
  ON public.speaking_scenarios
  FOR INSERT
  WITH CHECK (public.is_admin());

CREATE POLICY "管理者は speaking_scenarios を更新可能"
  ON public.speaking_scenarios
  FOR UPDATE
  USING (public.is_admin());

CREATE POLICY "管理者は speaking_scenarios を削除可能"
  ON public.speaking_scenarios
  FOR DELETE
  USING (public.is_admin());
