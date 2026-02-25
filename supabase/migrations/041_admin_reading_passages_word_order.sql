-- 041_admin_reading_passages_word_order.sql
-- 管理者が長文（reading_passages / reading_passage_questions）と語句整序（reading_word_order_questions）を編集できるようにする

-- reading_passages: 管理者は INSERT / UPDATE / DELETE
CREATE POLICY "管理者は reading_passages を挿入可能"
  ON public.reading_passages
  FOR INSERT
  WITH CHECK (public.is_admin());

CREATE POLICY "管理者は reading_passages を更新可能"
  ON public.reading_passages
  FOR UPDATE
  USING (public.is_admin());

CREATE POLICY "管理者は reading_passages を削除可能"
  ON public.reading_passages
  FOR DELETE
  USING (public.is_admin());

-- reading_passage_questions: 管理者は INSERT / UPDATE / DELETE
CREATE POLICY "管理者は reading_passage_questions を挿入可能"
  ON public.reading_passage_questions
  FOR INSERT
  WITH CHECK (public.is_admin());

CREATE POLICY "管理者は reading_passage_questions を更新可能"
  ON public.reading_passage_questions
  FOR UPDATE
  USING (public.is_admin());

CREATE POLICY "管理者は reading_passage_questions を削除可能"
  ON public.reading_passage_questions
  FOR DELETE
  USING (public.is_admin());

-- reading_word_order_questions: 管理者は INSERT / UPDATE / DELETE
CREATE POLICY "管理者は reading_word_order_questions を挿入可能"
  ON public.reading_word_order_questions
  FOR INSERT
  WITH CHECK (public.is_admin());

CREATE POLICY "管理者は reading_word_order_questions を更新可能"
  ON public.reading_word_order_questions
  FOR UPDATE
  USING (public.is_admin());

CREATE POLICY "管理者は reading_word_order_questions を削除可能"
  ON public.reading_word_order_questions
  FOR DELETE
  USING (public.is_admin());
