-- 031_admin_reading_short_questions.sql
-- 管理者が reading_short_questions を登録・編集・削除できるようにする

CREATE POLICY "管理者は reading_short_questions を挿入可能"
  ON public.reading_short_questions
  FOR INSERT
  WITH CHECK (public.is_admin());

CREATE POLICY "管理者は reading_short_questions を更新可能"
  ON public.reading_short_questions
  FOR UPDATE
  USING (public.is_admin());

CREATE POLICY "管理者は reading_short_questions を削除可能"
  ON public.reading_short_questions
  FOR DELETE
  USING (public.is_admin());
