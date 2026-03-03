-- seed_reading_long_content_4kyu_translation_vocabulary.sql
-- 4級 長文の内容一致：日本語訳とポイント・単語解説（解説ページ用）
-- 052 マイグレーションおよび seed_reading_long_content_4kyu_50.sql（および additions）実行後に実行

-- ========== 4A 掲示 ==========

UPDATE reading_passages SET
  translation_ja = '学校図書館 － 夏の開館時間

7月1日から8月31日まで、図書館は午前9時から午後5時まで開いています。
生徒は一度に5冊まで本を借りることができます。
もっと借りたい場合は、8月25日までに本を返してください。
今年の夏は科学と歴史に関する新しい本がたくさん入りました。
涼しいエアコンの効いた部屋で、ぜひ読書を楽しんでください。',
  vocabulary_notes = 'borrow: 借りる（return「返す」とセットで覚える）
at a time: 一度に
if you want to borrow more: もっと借りたい場合（if ～「もし～なら」）
air-conditioned: エアコンが効いた'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'School Library - Summer Hours';

UPDATE reading_passages SET
  translation_ja = '北公園でスポーツデー

日付：9月15日（日）
時間：午前10時～午後3時
場所：北公園（駅近く）

走る、跳ぶ、ボールゲームを行います。
帽子と水筒を持ってきてください。昼食は公園で販売します。
雨の場合は、9月22日にスポーツデーを行います。
参加希望の方は9月10日までに sports@northpark.com にメールを送ってください。',
  vocabulary_notes = 'Sports Day: 運動会
bring: 持ってくる（take「持っていく」と対比）
If it rains: もし雨なら（条件を表す if）
to join: 参加するために'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Sports Day at North Park';

UPDATE reading_passages SET
  translation_ja = 'サニーカフェ － 今週の営業

月～金：午前8時～午後6時
土・日：午前9時～午後7時

本日のスペシャル：アップルパイとアイスクリームで4ドル。
コーヒーは2ドル。紅茶とジュースは3ドル。
無料Wi-Fiあり。学生はここで勉強できます。
長時間の電話の使用はご遠慮ください。ありがとうございます。',
  vocabulary_notes = 'special: スペシャル（目玉メニュー）
free Wi-Fi: 無料Wi-Fi
for a long time: 長時間
Please do not ～: ～しないでください（丁寧な禁止）'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Sunny Cafe - This Week';

UPDATE reading_passages SET
  translation_ja = '音楽クラブ － 冬のコンサート

日付：12月20日
時間：午後2時～4時
場所：学校ホール

映画の曲とクリスマス音楽を演奏します。
チケットは生徒3ドル。大人は5ドル。
開始10分前までにお越しください。
手伝いたい方は、12月10日までにグリーン先生に相談してください。',
  vocabulary_notes = 'Tickets are $3 for students: 生徒はチケットが3ドル（値段の言い方）
Please come 10 minutes before the start: 開始10分前までに来てください
If you want to help us: 手伝いたい場合
talk to ～: ～に相談する'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Music Club - Winter Concert';

UPDATE reading_passages SET
  translation_ja = '市営プール － オープン！

6月1日～8月31日までオープン。
営業時間：毎日午前10時～午後6時

子供（12歳未満）：2ドル
生徒：3ドル
大人：5ドル

水着とタオルを持ってきてください。小さな売店があります。水やお菓子を買えます。
プールは雨の日は休業です。朝、ウェブサイトでご確認ください。',
  vocabulary_notes = 'under 12: 12歳未満
rent: レンタルする、借りる
swimsuit: 水着
rainy days: 雨の日'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'City Swimming Pool - Open!';

UPDATE reading_passages SET
  translation_ja = '恒例ブックセール － 中央図書館

日付：3月14日（土）・15日（日）
時間：両日とも午前9時～午後4時

古本はすべて1ドルまたは2ドル。子供向け・大人向けの本があります。
3月10日または11日に古い本を持ってきて交換できます。
駐車場無料。図書館はバス停の隣です。
詳しくは 555-0123 までお電話ください。',
  vocabulary_notes = 'Annual: 毎年の、恒例の
used books: 古本、使用済みの本
exchange: 交換する
For more information: 詳しくは、さらに情報は'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Annual Book Sale - Central Library';

UPDATE reading_passages SET
  translation_ja = '科学博物館への校外学習

日付：10月5日（月）
午前8時30分に学校を出発し、午後3時に戻ります。

持参するもの：お弁当、飲み物、ペン。ゲームやカメラは持ってこないでください。
制服を着用してください。バスで博物館まで行きます。
保護者の方：許可書を9月28日までに学校事務所に提出してください。
質問がある場合は担任の先生に聞いてください。',
  vocabulary_notes = 'School Trip: 校外学習、遠足
permission form: 許可書、同意書
homeroom teacher: 担任の先生
Do not bring ～: ～を持ってこないでください'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'School Trip to the Science Museum';

UPDATE reading_passages SET
  translation_ja = '生徒アートショー

いつ：11月8日・9日
どこで：市民センター（201号室）
時間：両日とも午前10時～午後5時

5つの学校の生徒が絵や作品を展示します。
入場無料。どなたでも歓迎です。
11月8日午後2時に有名な画家による短いお話があります。
詳細はウェブサイトをご覧になるか、市民センターにお電話ください。',
  vocabulary_notes = 'Admission is free: 入場無料
Everyone is welcome: どなたでも歓迎です
a short talk: 短いスピーチ・お話
For details: 詳細は'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Student Art Show';

-- ========== 4B Eメール ==========

UPDATE reading_passages SET
  translation_ja = '差出人：トム・デイビス
宛先：佐藤ユキ
日付：5月10日
件名：誕生日パーティー

ユキへ、
僕の誕生日パーティーは5月25日午後3時に僕の家でやるよ。来てほしい！ゲームをしてピザを食べるよ。ジュースを持ってきてもらえる？5月18日までに返事を書いてね。またね！
トム

差出人：佐藤ユキ
宛先：トム・デイビス
日付：5月12日
件名：Re: 誕生日パーティー

トムへ、
招待ありがとう。パーティーに行くよ！オレンジジュースを持っていくね。5月25日は午後2時までピアノのレッスンがあるから、2時30分に行くね。それでいい？楽しみにしているよ。
ユキ',
  vocabulary_notes = 'invitation: 招待
write back: 返事を書く
I have a piano lesson until 2:00 p.m.: 午後2時までピアノのレッスンがある
I am looking forward to it: 楽しみにしている（よく使う表現）'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Birthday party';

UPDATE reading_passages SET
  translation_ja = '差出人：エマ・ブラウン
宛先：田中ケン
日付：6月5日
件名：理科の宿題

ケンへ、
理科の宿題で助けが必要なの。3番の問題がわからない。金曜日の放課後、一緒に勉強できない？午後4時に図書館で会おう。ノートは持っていく。早く返事を書いてね。
エマ

差出人：田中ケン
宛先：エマ・ブラウン
日付：6月6日
件名：Re: 理科の宿題

エマへ、
もちろん！手伝うよ。でも金曜日は午後3時30分までサッカーの練習があるんだ。だから午後4時に図書館に行くね。そこで会おう。ところで、英語のレポートで助けが必要なんだ。来週手伝ってもらえる？',
  vocabulary_notes = 'I need help with ～: ～で助けが必要
after school: 放課後
By the way: ところで（話題を変えるとき）
report: レポート、報告書'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Science homework';

UPDATE reading_passages SET
  translation_ja = '差出人：リサ・ホワイト
宛先：木村ヒロキ
日付：7月20日
件名：週末の予定

ヒロキへ、
8月2日に家族であなたの街に行くの。午前11時に電車で着く予定。その日に会える？新しい公園に行きたいの。ランチにいい場所、知ってる？教えて！
リサ

差出人：木村ヒロキ
宛先：リサ・ホワイト
日付：7月22日
件名：Re: 週末の予定

リサへ、
いいね！午前11時に駅で会おう。公園の近くにいいレストランがあるよ。11時30分に開く。まず公園に行って、それから昼食にしよう。妹も君に会いたがっている。一緒に行くよ。
ヒロキ',
  vocabulary_notes = 'We will arrive by train: 電車で到着する（by train = 電車で）
Let me know: 教えてね
We can go to the park first and then have lunch: まず公園に行ってそれから昼食（first ～ then ～）'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Weekend plans';

UPDATE reading_passages SET
  translation_ja = '差出人：マイク・ジョンソン
宛先：山本サキ
日付：9月3日
件名：コンサートのチケット

サキへ、
9月20日午後7時に市庁舎でコンサートがあるよ。チケットが2枚ある。一緒に行かない？コンサートは午後9時に終わる。午後6時30分に駅で会おう。来れるか9月10日までに教えて。
マイク

差出人：山本サキ
宛先：マイク・ジョンソン
日付：9月5日
件名：Re: コンサートのチケット

マイクへ、
行きたい！でも9月21日に数学のテストがあるの。20日の夜は勉強しないといけない。だから8時までしかいられない。それでいい？午後6時30分に駅で会うね。ありがとう！',
  vocabulary_notes = 'I would love to go: ぜひ行きたい（丁寧な言い方）
I need to study: 勉強しないといけない
I can only stay until 8:00 p.m.: 8時までしかいられない（only で「～だけ」）'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Concert tickets';

UPDATE reading_passages SET
  translation_ja = '差出人：アンナ・クラーク
宛先：鈴木リク
日付：10月8日
件名：歴史のプロジェクト

リクへ、
歴史のプロジェクトは10月20日が提出期限だよ。一緒にやらないと。土曜の午後は空いてる。午後1時に学校近くのカフェで会えない？必要な本は持っていく。土曜でいいか教えて。
アンナ

差出人：鈴木リク
宛先：アンナ・クラーク
日付：10月9日
件名：Re: 歴史のプロジェクト

アンナへ、
土曜でいいよ。でも12時に歯医者の予約がある。12時30分頃終わる。だから午後1時30分にカフェに行ける。それでいい？ノートパソコンは持っていく。もっと時間が必要なら日曜も作業できるよ。
リク',
  vocabulary_notes = 'is due on ～: ～が提出期限
I am free on Saturday afternoon: 土曜の午後は空いている
dentist appointment: 歯医者の予約
if we need more time: もっと時間が必要なら'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'History project';

UPDATE reading_passages SET
  translation_ja = '差出人：デイビッド・リー
宛先：中村ミオ
日付：11月1日
件名：スキー旅行

ミオへ、
スキー旅行は11月15日だ。午前7時に学校を出発する。暖かい服と手袋を持ってきて。スキー場でスキーをレンタルする。許可書を11月8日までにブラウン先生に渡すのを忘れないで。またね！
デイビッド

差出人：中村ミオ
宛先：デイビッド・リー
日付：11月3日
件名：Re: スキー旅行

デイビッドへ、
旅行が楽しみ！暖かいジャケットと手袋を持っていくね。質問なんだけど、お弁当は自分で持っていく？それとも学校が用意する？必要なら母がみんな分のサンドイッチを作ってくれるって。教えて！
ミオ',
  vocabulary_notes = 'Don''t forget to ～: ～を忘れないで
give ～ to ～: ～を～に渡す
Do we need to bring our own lunch: 自分でお弁当を持っていく必要があるか
if we need them: 必要なら'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Ski trip';

-- ========== 4C 説明文 ==========

UPDATE reading_passages SET
  translation_ja = '少女と彼女の犬

サラは12歳です。両親と犬のポチと東京に住んでいます。ポチは3歳です。サラは毎朝学校の前にポチを散歩させます。毎日午前7時と午後6時にエサをあげています。

先月、ポチが病気になりました。サラはとても心配しました。動物病院に連れて行きました。医師はポチは1週間休む必要があると言いました。サラは放課後毎日ポチと一緒にいました。本を読んであげました。1週間後、ポチはまた元気になりました。

サラは大きくなったら動物病院で働きたいと思っています。動物が大好きです。今は犬についての本を読んでいます。「ポチのような多くの動物を助けたい」と言っています。',
  vocabulary_notes = 'feed: エサをやる、食事を与える
was sick: 病気だった（be sick = 気分が悪い／病気）
animal hospital: 動物病院
when she grows up: 大人になったら、大きくなったら'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'A Girl and Her Dog';

UPDATE reading_passages SET
  translation_ja = 'サッカーの試合

タケシは14歳です。学校のサッカー部に入っています。先週土曜日、チームは大切な試合をしました。試合は午前10時にセントラルスタジアムで始まりました。多くの生徒と保護者が見に来ました。

タケシのチームは前半はうまくいきませんでした。2対0で負けていました。しかし後半、タケシが2点ゴールを決めました。スコアは2対2になりました。そして最後の1分、友達のユウジがタケシにボールをパスしました。タケシが蹴ってゴール！チームは3対2で勝ちました。みんなとても喜びました。

試合後、コーチはタケシに「よくやった。もっと練習すればもっと上手な選手になれる」と言いました。タケシは疲れていましたがとても興奮していました。来年は全国大会に出たいと思っています。',
  vocabulary_notes = 'the first half / the second half: 前半／後半
were behind 2-0: 2対0で負けていた
scored (two goals): （2点）ゴールを決めた
national competition: 全国大会'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'The Soccer Game';

UPDATE reading_passages SET
  translation_ja = '田舎の夏

マヤは13歳です。大阪に住んでいます。去年の夏、2週間田舎の祖父母を訪ねました。祖父母は小さな農園を持っています。野菜を作り、ニワトリも飼っています。

毎朝マヤは祖母と庭を手伝いました。植物に水をやり、トマトを収穫しました。午後はよく祖父と川に行きました。ときどき魚を釣りました。マヤは初めて魚を釣りました。とても嬉しかったです。

最後の日に、祖母はイチゴジャムの作り方を教えてくれました。マヤはジャムを大阪に持って帰りました。家族は気に入りました。マヤは「来年も夏に祖父母に会いに行きたい。たくさんのことを学んで、とても楽しかった」と言っています。',
  vocabulary_notes = 'the country / countryside: 田舎
grow vegetables: 野菜を育てる
for the first time: 初めて
taught her how to make ～: ～の作り方を教えた'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'A Summer in the Countryside';

UPDATE reading_passages SET
  translation_ja = '科学展覧会

アカリは中学生です。科学が好きです。10月、学校で科学展覧会がありました。アカリは植物についての研究をしました。植物は音楽を聞くとよく育つだろうか、知りたかったのです。1つは静かな部屋に、もう1つは音楽が流れる部屋に置きました。4週間毎日両方に水をやりました。

科学展でアカリは結果を発表しました。音楽を聞いた方の植物が少し背が高く育ったと言いました。多くの生徒と先生が彼女の研究を見に来ました。ある先生がたくさん質問しました。アカリは緊張していましたが、すべての質問にうまく答えました。

アカリは2等賞を取りました。とても驚いて嬉しかったです。両親も展覧会に来て、たくさん写真を撮りました。アカリは「来年も別の研究をしたい。光と植物について調べるかもしれない」と言っています。',
  vocabulary_notes = 'science fair: 科学展覧会、理科研究発表会
do plants grow better with music: 植物は音楽でよく育つか（疑問文が「～か」の内容）
watered: 水をやった（water = 水をやる）
second prize: 2等賞'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'The Science Fair';

UPDATE reading_passages SET
  translation_ja = '博物館への旅行

先月、タロウのクラスは歴史博物館に行きました。バスで行きました。バスは午前9時に学校を出て、午前10時に博物館に着きました。ガイドが案内してくれました。昔の道具や服について話してくれました。タロウは昔の地図に興味を持ちました。たくさんメモを取りました。

正午、博物館のカフェテリアで昼食をとりました。タロウは友達のユキとケンと席を並べました。昼食後は自由時間でした。タロウは博物館の売店で絵はがきを買いました。祖父に送りました。祖父は歴史が好きです。

クラスは午後2時に博物館を出ました。バスの中で先生が「見たことについて短いレポートを書きなさい。来週持ってきなさい」と言いました。タロウは旅行は楽しかったと思いました。家族とまた博物館に行きたいと思っています。',
  vocabulary_notes = 'guide: ガイド、案内役
was interested in ～: ～に興味があった
free time: 自由時間
permission form: 許可書（本文では report「レポート」）'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'A Trip to the Museum';

-- ========== 追加問題 ==========

UPDATE reading_passages SET
  translation_ja = 'ルーシーの初めてのペット

ルーシーは9歳です。いとこのジェーンの家で、ジェーンとジェーンの猫と遊ぶのが好きです。ジェーンは10歳です。ある日、ジェーンの猫が4匹の子猫を産みました。ルーシーはジェーンのお母さんに「1匹もらってもいい？」と聞きました。ジェーンのお母さんは「ご両親に聞いてごらん」と言いました。

ルーシーは家に帰ってお母さんに聞きました。お母さんは「毎日世話をするって約束できる？」と言いました。ルーシーは「うん、できる！」と言いました。お母さんは「じゃあ、猫を飼っていいわよ」と言いました。ルーシーはとても嬉しかったです。「世界中でいちばん幸せな女の子！」と言いました。',
  vocabulary_notes = 'cousin: いとこ
Can I have one?: 1つ（1匹）もらってもいい？（依頼の言い方）
promise to ～: ～することを約束する
take care of ～: ～の世話をする
the happiest ～ in the whole world: 世界中でいちばん幸せな～'
WHERE level = '4級' AND passage_type = 'long_content' AND title = 'Lucy''s First Pet';
