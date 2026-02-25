# マイグレーションのリネームと別PCでのプル

## 今回のリネーム

- `035_question_counts.sql` → `038_question_counts.sql`
- `036_question_counts_reading_by_questions.sql` → `039_question_counts_reading_by_questions.sql`
- `037_question_counts_passage_count.sql` → `040_question_counts_passage_count.sql`

035–037 は組織まわりで使用するため、question_counts 側を 038–040 にずらした。

## 別PCでプルしたとき

1. **Git**  
   リネームを「削除＋追加」のコミットとして受け取る。作業ツリーには 038 / 039 / 040 のファイルだけが残り、035_question_counts などは消える。

2. **Supabase のマイグレーション履歴**  
   どのマイグレーションを実行済みかは、DB の `supabase_migrations.schema_migrations` に**ファイル名**で記録される。

   - **そのPCで昔の 035/036/037（question_counts）をまだ実行していない場合**  
     035/036/037（organizations）を実行したあと、038 / 039 / 040 が「未実行」として実行される。想定どおり。

   - **そのPCで昔の 035/036/037（question_counts）をすでに実行している場合**  
     履歴には `035_question_counts.sql` などが残る。リネーム後はファイル名が 038/039/040 に変わるので、038 / 039 / 040 は「未実行」とみなされ、もう一度実行される。  
     038–040 は `create table if not exists` や `create or replace function`、`add column if not exists` を使っているため、二重実行してもエラーにならず安全。

3. **結論**  
   リネームをコミットして別PCでプルしても、  
   - Git 上は新しいファイル名だけになる  
   - DB 上は 038/039/040 が未実行なら実行され、既に同等の変更が入っていても idempotent なので問題にならない。
