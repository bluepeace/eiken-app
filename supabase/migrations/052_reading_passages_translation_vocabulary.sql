-- 長文の解説用: 日本語訳とポイント・単語説明
ALTER TABLE reading_passages
  ADD COLUMN IF NOT EXISTS translation_ja text,
  ADD COLUMN IF NOT EXISTS vocabulary_notes text;

COMMENT ON COLUMN reading_passages.translation_ja IS '長文の日本語訳（解説ページ用）';
COMMENT ON COLUMN reading_passages.vocabulary_notes IS 'ポイントとなる単語・表現の説明（解説ページ用）';
