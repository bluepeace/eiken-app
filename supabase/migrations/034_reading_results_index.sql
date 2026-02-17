-- 034_reading_results_index.sql
-- 短文空所などの優先度スコア取得で user_id + source_type で絞るため

create index if not exists idx_reading_results_user_source
  on public.reading_results (user_id, source_type);
