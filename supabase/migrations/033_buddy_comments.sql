-- 033_buddy_comments.sql
-- バディが表示するコメントを管理。レギュラー＋連続学習日数別。管理画面で登録・編集。

create table if not exists public.buddy_comments (
  id uuid primary key default gen_random_uuid(),
  body text not null,
  category text not null default 'regular',
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

comment on column public.buddy_comments.category is 'regular: 通常 | streak_0: 0日 | streak_3_5: 3〜5日 | streak_5_10: 5〜10日 | streak_11: 11日以上（本文に{{days}}で日数を挿入）';

alter table public.buddy_comments enable row level security;

create policy "buddy_comments 全員閲覧"
  on public.buddy_comments for select
  using (true);

create policy "buddy_comments 管理者のみ挿入"
  on public.buddy_comments for insert
  with check (public.is_admin());

create policy "buddy_comments 管理者のみ更新"
  on public.buddy_comments for update
  using (public.is_admin());

create policy "buddy_comments 管理者のみ削除"
  on public.buddy_comments for delete
  using (public.is_admin());

-- 初期データ: レギュラー（褒め・励まし・寄り添い、性別を感じさせない表現）
insert into public.buddy_comments (body, category, sort_order)
select v.body, 'regular', v.ord
from (values
  (0, '今日も一緒に頑張ろう。'),
  (1, '少しずつで大丈夫だよ。'),
  (2, 'また会えてうれしいな。'),
  (3, '今日の調子はどう？'),
  (4, '一緒に学習、頑張ろう。'),
  (5, '今日も少しずつでいいよ。'),
  (6, '無理しないでね。'),
  (7, '困ったらいつでも聞いてね。'),
  (8, '続けてるの、えらいね。'),
  (9, '毎日頑張ってるね。'),
  (10, 'よくやってるよ。'),
  (11, 'そのペースでいいんだよ。'),
  (12, '昨日も今日も、えらい。'),
  (13, 'ちょっとずつでいいから、続けよう。'),
  (14, '今日も来てくれてありがとう。'),
  (15, '一緒にいられてうれしい。'),
  (16, '疲れたら休んでいいよ。'),
  (17, 'また明日も待ってるね。'),
  (18, 'できたこと、すごいよ。'),
  (19, '前より進んでるね。'),
  (20, 'その意気込み、いいね。'),
  (21, '焦らなくて大丈夫。'),
  (22, '今日も一歩、進もう。'),
  (23, 'いつも応援してるよ。'),
  (24, 'わからなかったら、ヒント見てみよう。'),
  (25, '復習すると忘れにくくなるよ。'),
  (26, '書く練習、大事だね。'),
  (27, '読むの、一緒に頑張ろう。'),
  (28, '単語、たくさん覚えようね。'),
  (29, '目標、一緒に達成しよう。'),
  (30, '今日もありがとう。'),
  (31, '明日も会おうね。'),
  (32, 'よく続いてるね。'),
  (33, 'その調子。'),
  (34, '無理しすぎないでね。'),
  (35, '今日はここまでにしよう。'),
  (36, 'また今度、一緒にやろう。'),
  (37, 'できたね。'),
  (38, 'いい感じだよ。'),
  (39, 'ちょっと休憩も大事だよ。')
) as v(ord, body)
where not exists (select 1 from public.buddy_comments limit 1);

-- 連続日数別（0日・3〜5日・5〜10日・11日以上）
insert into public.buddy_comments (body, category, sort_order)
select v.body, v.category, v.ord
from (values
  (0, 'streak_0', 'はじめまして。一緒に学習、頑張ろうね。'),
  (1, 'streak_0', 'はじめまして。少しずつで大丈夫だからね。'),
  (2, 'streak_0', '今日から一緒に学んでいこう。'),
  (0, 'streak_3_5', '継続してくれてありがとう。'),
  (1, 'streak_3_5', '続けてくれてうれしいな。'),
  (2, 'streak_3_5', '毎日来てくれてありがとう。'),
  (0, 'streak_5_10', '継続できてすごいよ。'),
  (1, 'streak_5_10', 'よく続いてるね。えらい。'),
  (2, 'streak_5_10', 'その調子で一緒に頑張ろう。'),
  (0, 'streak_11', '{{days}}日連続で学習、すごい。'),
  (1, 'streak_11', '{{days}}日続いてるね。本当にえらい。'),
  (2, 'streak_11', '{{days}}日連続、すごいペースだよ。')
) as v(ord, category, body)
where not exists (select 1 from public.buddy_comments where category <> 'regular' limit 1);
