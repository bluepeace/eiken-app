-- fix_reading_long_content_4kyu_level.sql
-- 4級長文内容一致のレベル修正（既存DB用）
-- 参照: docs/seed_reading_long_content_4kyu_レビュー.md
-- 実行: seed_reading_long_content_4kyu_50.sql 実行済みのDBで実行

-- Passage 8 (Student Art Show): sculptures → art
UPDATE public.reading_passages
SET body = REPLACE(body, 'pictures and sculptures', 'pictures and art'),
    content = REPLACE(content, 'pictures and sculptures', 'pictures and art')
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Student Art Show';

-- Passage 17 (A Summer in the Countryside): countryside → country, 過去完了 → 過去形
UPDATE public.reading_passages
SET
  body = REPLACE(REPLACE(body,
    'in the countryside', 'in the country'),
    'Maya had never caught a fish before. She was very happy when she caught her first fish.',
    'Maya caught a fish for the first time. She was very happy.'),
  content = REPLACE(REPLACE(content,
    'in the countryside', 'in the country'),
    'Maya had never caught a fish before. She was very happy when she caught her first fish.',
    'Maya caught a fish for the first time. She was very happy.')
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'A Summer in the Countryside';

-- Passage 14 (Ski trip): 選択肢 Whether → If
UPDATE public.reading_passage_questions q
SET choices = '["Where to buy gloves.", "If they need to bring lunch.", "What time to come to school.", "Who will drive the bus."]'::jsonb
FROM public.reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND p.title = 'Ski trip' AND q.question_text = 'What does Mio ask David about?';
