-- seed_reading_long_content_3kyu_translation_vocabulary.sql
-- 3級 長文の内容一致：日本語訳とポイント・単語解説（解説ページ用）
-- 052 マイグレーションおよび seed_reading_long_content_3kyu_50.sql 実行後に実行

-- ========== 3A 掲示 ==========

UPDATE reading_passages SET
  translation_ja = 'ボランティア活動

ボランティアに興味はありますか？日曜の朝、生徒が地元の公園を清掃するイベントがあります。最近メープルウッド公園は汚れています。ボランティアはゴミをすべて拾って捨てます。

ボランティア用の手袋を用意します。市の職員がゴミ箱を3つ準備します。赤い箱はペットボトル用、青い箱はその他のプラスチック用、黄色い箱は紙用です。清掃後、市の職員が全ボランティアに昼食を提供します。飲み物は各自持参してください。

いつ：9月19日 午前10時～12時30分
どこで：メープルウッド公園',
  vocabulary_notes = 'volunteer: ボランティア（名詞・動詞）
clean up: 清掃する
pick up ～ and throw it away: ～を拾って捨てる
staff: 職員、スタッフ
bring their own drinks: 各自飲み物を持ってくる'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Volunteer Work';

UPDATE reading_passages SET
  translation_ja = '全生徒へ

新しい司書の先生が着任しました。ウィルソン先生です。書店で8年、地元の大学の図書館で5年勤務されました。来週歓迎会を開きます。

歓迎会で自己紹介をされます。質問もできます。その後、先生や他の人と話す時間があります。無料の飲み物とお菓子を楽しめます。

いつ：4月17日（金）午後3時30分～5時
どこで：体育館

参加希望の方は、4月10日の6時までに担任の先生に伝えてください。',
  vocabulary_notes = 'librarian: 司書
welcome party: 歓迎会
introduce herself: 自己紹介する
homeroom teacher: 担任の先生
before six o''clock on April 10: 4月10日の6時までに'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'To All Students';

UPDATE reading_passages SET
  translation_ja = 'お知らせ

ブルー Sky 中学校は10月18日（水）に校外学習を行います。17世紀に建てられた家を訪れます。その家には古い台所、居間、寝室など多くの部屋があります。外には庭もあります。

行程は午前10時から午後3時までです。生徒はお弁当を持参してください。見学の後、庭で一緒に昼食をとります。庭の写真を撮るためにカメラを持ってきてかまいませんが、家の中の写真は撮らないでください。全員が11月1日までにその家についてのレポートを書くこと。',
  vocabulary_notes = 'school trip: 校外学習、遠足
built in the 17th century: 17世紀に建てられた
must bring their own lunch: お弁当を持参しなければならない
please do not take pictures inside: 中で写真を撮らないでください'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Notice';

UPDATE reading_passages SET
  translation_ja = '美術クラブ － 絵画教室

11月12日（土）に生徒向けの絵画教室を開きます。午後2時開始、午後4時30分終了です。市民センター201号室で行います。

有名な画家の田中先生が風景の描き方を教えてくれます。筆と紙は各自持参してください。絵の具は用意します。参加希望の方は11月5日までに art@community.org にメールを送ってください。無料ですが、定員20名です。',
  vocabulary_notes = 'landscape: 風景（画）
We will provide paint: 絵の具は用意する（provide = 提供する）
If you want to join: 参加したい場合
we can only accept 20 students: 20人までしか受け付けられない'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Art Club - Painting Class';

UPDATE reading_passages SET
  translation_ja = '科学博物館 － 特別イベント

3月20日（日）に家族向けの特別イベントを開催します。ロボットの仕組みを見て、操作を体験できます。午前9時30分から正午までです。

チケットは大人500円、生徒200円です。6歳未満は無料。博物館の入口で購入できます。定員100名のため、お早めにお越しください。詳しくは 03-1234-5678 まで。',
  vocabulary_notes = 'how robots work: ロボットの仕組み（どのように動くか）
control: 操作する、コントロールする
we have a limit of 100 people: 定員100名
For more information: 詳しくは'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Science Museum - Special Event';

UPDATE reading_passages SET
  translation_ja = '本校のブックウィーク

6月5日（月）から6月9日（金）までブックウィークを開催します。毎日昼休みに先生が図書館でお話を読みます。6月7日（水）には作家が来校し、新作について話します。講演は午後1時から2時まで体育館で行います。全生徒歓迎。生徒証を持ってきてください。',
  vocabulary_notes = 'at lunch time: 昼休みに
a writer will visit our school: 作家が学校を訪れる
talk about her new book: 新作について話す
All students are welcome: 全生徒歓迎'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Book Week at Our School';

UPDATE reading_passages SET
  translation_ja = 'テニス部 － 夏の練習

夏の練習は7月1日から始まります。毎週火曜と木曜の午後4時から6時まで学校のテニスコートで練習します。ラケット、帽子、水筒を持ってきてください。7月25日にグリーンヒル校との試合があります。試合に参加したい方は7月10日までにキャプテンに伝えてください。新入部員歓迎です。',
  vocabulary_notes = 'tennis court: テニスコート
racket: ラケット
We will have a match with ～: ～と試合をする
captain: キャプテン
New members are welcome: 新入部員歓迎'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Tennis Club - Summer Practice';

UPDATE reading_passages SET
  translation_ja = '生徒向け料理教室

2月18日（土）に料理教室を開きます。パスタとサラダの作り方を学びます。午前10時から12時30分まで、コミュニティキッチン（図書館隣）で行います。参加費は1,000円です。2月10日までに受付でお支払いください。定員15名。エプロンを着用し、タオルを持ってきてください。材料はすべて用意します。',
  vocabulary_notes = 'fee: 参加費、料金
front desk: 受付
We need 15 students: 15名必要（定員の意味）
apron: エプロン
We will provide all ingredients: 材料はすべて用意する'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Cooking Class for Students';

-- ========== 3B Eメール ==========

UPDATE reading_passages SET
  translation_ja = '差出人：ブライアン・フォックス
宛先：ジル・ホワイト
日付：6月18日
件名：日本語

ジルへ、
日本の文化に興味があるから日本語を習いたい。高校ではスペイン語、フランス語、ドイツ語が選べる。僕は今スペイン語を、君はフランス語を勉強している。大学に入ったら1年間日本に留学する予定だ。そこで柔道をやってみたい。君の叔母さんに日本語を教えてもらえないかな？日本語が話せるよね？聞いてみて。すぐ返事を書いてね！
ブライアン

差出人：ジル・ホワイト
宛先：ブライアン・フォックス
日付：6月19日
件名：もちろん！

ブライアンへ、
うん、叔母に聞いたよ。日本に10年住んでいたの―北海道に3年、東京に7年。1年前にアメリカに戻ってきた。日本語がとても上手で日本の文化もよく知っている。教えてくれるって。君の電話番号も伝えた。ところで私は日本の漫画やテレビ番組が好き。一緒に日本語勉強しよう！
ジル

差出人：ブライアン・フォックス
宛先：ジル・ホワイト
日付：6月19日
件名：ありがとう！

ジルへ、
叔母さんに話してくれてありがとう。もう電話くれた！水曜の夕方5時から6時まで駅近くのカフェで日本語を教えてくれる。最初のレッスンは今週の水曜。一緒に勉強するのはいいアイデアだと思う。来れるなら来てね！',
  vocabulary_notes = 'I am interested in ～: ～に興味がある
offers: ～を提供する（科目などを）
study abroad: 留学する
Write back soon: すぐ返事を書いて
By the way: ところで'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Japanese';

UPDATE reading_passages SET
  translation_ja = '差出人：ソフィア・ジョーンズ
宛先：アンナ・ジョーンズ
日付：9月25日
件名：びっくり！

ママへ、
大学生活は順調よ。先週月曜、すごいことがあった。大学の美術の授業で昔の友達のミアに会ったの！覚えてるでしょ、同じ中学校だった子。4年前に別の街に引っ越したの。先週の金曜と土曜にレストランで一緒にランチをした。とても楽しかった。同じ大学にいるなんて驚いた。10月20日に帰る。午後5時にユニオン駅に迎えに来てもらえる？ ソフィア

差出人：アンナ・ジョーンズ
宛先：ソフィア・ジョーンズ
日付：9月25日
件名：すごい！

ソフィアへ、
いい知らせありがとう。ミアにまた会えたなんて嬉しい。私からもよろしく伝えて。中学のときあなたとミアがよく一緒に図書館に行ってたのを覚えてる。ミアはあなたに数学を教えるのが上手だった。あなたは数学はあまり好きじゃなかった―絵やスポーツが好きだった。二人のいい思い出がたくさんある。10月20日についてだけど、病院で仕事があって早く終われないから迎えに行けない。でもお父さんはその日会議があって4時に終わるの。お父さんが駅に迎えに行けるわ。 ママより',
  vocabulary_notes = 'pick me up: 迎えに来る（車で）
Say hi to her for me: 私からよろしく伝えて
was good at teaching you math: 数学を教えるのが得意だった
won''t finish early: 早く終われない'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Surprise!';

UPDATE reading_passages SET
  translation_ja = '差出人：ルーカス・ミラー
宛先：ケビン・ミラー
日付：5月8日
件名：あなたの街について

おじいちゃんへ、
社会科のレポートを書かないといけない。来週の金曜が提出期限なんだ。他の街について書くことになってる。今週の土曜、おじいちゃんの街についてインタビューしてもいい？おじいちゃんの街のあの楽しい夏祭りを覚えてる。すぐ返事を書いてね！ ルーカス

差出人：ケビン・ミラー
宛先：ルーカス・ミラー
日付：5月8日
件名：もちろん！

ルーカスへ、
ああ、うちの街には夏祭りがある。でも他の季節にも面白い祭りがある。秋にはかぼちゃ祭りがある―君も来たよね。春には桜祭り、冬にはパレードもある。質問には答えるけど、今週の土曜と日曜の朝はやることがたくさんある。日曜の午後にしてもらえる？電車で一人で来られる？ おじいちゃん

差出人：ルーカス・ミラー
宛先：ケビン・ミラー
日付：5月9日
件名：日曜で

おじいちゃんへ、
返事ありがとう。日曜の朝はサッカーの練習があるけど、午後なら伺える。その日ママが車で送ってくれる。友達がもう夏祭りについて書いたって聞いたから、おじいちゃんの街の春祭りについて書くことにした。祭りの写真、何枚か見せてもらえる？ ルーカス',
  vocabulary_notes = 'social studies: 社会科
It is due next Friday: 来週の金曜が提出期限
interview: インタビューする
instead: 代わりに（日曜の午後に、の意味）
I decided to write about ～: ～について書くことにした'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'About your city';

UPDATE reading_passages SET
  translation_ja = '差出人：エマ・リー
宛先：ベン・クラーク
日付：10月5日
件名：今週末の映画

ベンへ、
スターシネマに宇宙の新しい映画がある。見たいの。土曜一緒に行かない？2時と5時の回がある。1時まで音楽のレッスンがあるから、5時の回なら行ける。教えて！
エマ

差出人：ベン・クラーク
宛先：エマ・リー
日付：10月6日
件名：Re: 今週末の映画

エマへ、
ぜひ行きたい！5時の回でいいよ。4時30分に映画館の前で会おう。弟も来たがっている。いい？宇宙の映画が好きなんだ。映画の後に夕食を食べよう。映画館の隣に新しいピザ屋がある。',
  vocabulary_notes = 'I have a music lesson until 1:00 p.m.: 1時まで音楽のレッスンがある
Let me know: 教えてね
in front of the cinema: 映画館の前で
next to: ～の隣に'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Movie this weekend';

UPDATE reading_passages SET
  translation_ja = '差出人：ケイト・ブラウン
宛先：デイビッド・ブラウン
日付：7月12日
件名：キャンプ旅行

パパへ、
クラスで8月3日から5日までキャンプに行くの。レイクビューキャンプに行く。寝袋、懐中電灯、虫除けスプレーを持っていく必要がある。先生はみんなで一緒に食事を作るって言ってた。8月3日の午前8時に学校の集合場所まで車で送ってもらえる？ママはその日早く仕事があるって。ありがとう！
ケイト

差出人：デイビッド・ブラウン
宛先：ケイト・ブラウン
日付：7月13日
件名：Re: キャンプ旅行

ケイトへ、
問題ない。8月3日午前8時に学校まで送るよ。楽しんでおいで！雨がっぱを持っていくのを忘れないで。湖では天気が急に変わるから。8月5日に帰ったら電話して。話をいっぱい聞かせてね。
パパより',
  vocabulary_notes = 'sleeping bag: 寝袋
flashlight: 懐中電灯
insect spray: 虫除けスプレー
meeting point: 集合場所
Remember to bring ～: ～を持っていくのを忘れないで
when you get back: 帰ったら'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Camping trip';

UPDATE reading_passages SET
  translation_ja = '差出人：トム・ウィルソン
宛先：サラ・グリーン
日付：11月8日
件名：学園祭の劇

サラへ、
学園祭の劇は12月10日午後6時に体育館でやる。僕も出る！小さな役だけど。両親も来る。君も来られる？生徒は300円。11月20日から事務室で買える。劇の後、体育館でパーティーがある。来てくれたら嬉しい！
トム

差出人：サラ・グリーン
宛先：トム・ウィルソン
日付：11月10日
件名：Re: 学園祭の劇

トムへ、
絶対行く！11月20日にチケット買うね。舞台で君を見るのが楽しみ。妹も行きたいって。大人のチケットはいくら？ママに聞いてみる。パーティーの後、カフェに行けるかも。またね！
サラ',
  vocabulary_notes = 'school play: 学園祭の劇、演劇
I have a small part: 小さな役を演じる
I hope you can come: 来てくれたら嬉しい
I will definitely come: 絶対行く
on stage: 舞台で'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'School play';

-- ========== 3C 説明文 ==========

UPDATE reading_passages SET
  translation_ja = 'ラ・トマティーナ

ブニョルはスペインの小さな町です。約1万人が住んでいます。しかし毎年8月の最後の水曜日には3万人以上が町にやってきます。有名な祭り「ラ・トマティーナ」のためです。この祭りでは人々がお互いにトマトを投げ合います。

祭りは1945年に始まりました。パレードの最中、何人かの子供が音楽家を押しました。音楽家は怒って子供たちにトマトを投げました。すると多くの人がトマトを投げ始めました。政府は気に入らず、しばらく祭りを中止しました。しかし1957年、人々が再び祭りを望んだので、再開されました。

今日では多くの国から人がラ・トマティーナに参加します。約1時間トマトを投げ合います。多くの人が白い服を着ます。祭りの後、服はトマトで赤く染まります。ラ・トマティーナはとても有名ですが、いいことだと思わない人もいます。祭り後の清掃は大変です。世界には十分な食べ物がない人が多いのに食べ物を投げるのはよくないと言う人もいます。',
  vocabulary_notes = 'throw ～ at each other: お互いに～を投げ合う
during a parade: パレードの最中に
for a while: しばらくの間
turn red because of ～: ～のせいで赤くなる
Cleaning up: 清掃（すること）
do not have enough to eat: 十分な食べ物がない'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'La Tomatina';

UPDATE reading_passages SET
  translation_ja = 'スリーシスターズ（三姉妹農法）

世界中で人々はさまざまな野菜を育てています。野菜を育てるのは難しいことがあります。どれくらい日光や水が必要かわからないこともあります。北アメリカのネイティブアメリカンには野菜を育てる伝統的な方法があります。スリーシスターズ法と呼ばれます。この方法では狭い場所で多くの野菜を育てられます。

スリーシスターズ法では、トウモロコシ、豆、カボチャの3種類を一緒に育てます。ネイティブアメリカンにはこれらの野菜にまつわる話があります。それによると、3つは「姉妹」です。トウモロコシが長女、豆が次女、カボチャが三女。育てる順番は、まずトウモロコシ、次に豆、最後にカボチャです。

トウモロコシを先に植えると、豆はトウモロコシの株に絡まって伸び、日光を得られます。カボチャは地面を這うので、動物がトウモロコシや豆に簡単に近づけません。カボチャの葉は大きく、野菜の周りを日差しから守るので土が乾きすぎません。3つの野菜は互いに助け合って育ちます。

1600年代にヨーロッパ人が北アメリカに来たとき、新しい植物や動物を持ち込みました。それ以来ネイティブアメリカンの食べるものは変わりました。しかし今でも多くのネイティブアメリカンや他の農家がスリーシスターズ法を使っています。',
  vocabulary_notes = 'traditional method: 伝統的な方法
in a small area: 狭い場所で
According to them: 彼ら（彼女ら）によると
protect ～ from the sun: ～を日差しから守る
Since then: それ以来
However: しかし'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'The Three Sisters';

UPDATE reading_passages SET
  translation_ja = 'アンセル・アダムス

アンセル・アダムスは有名なアメリカの写真家でした。1902年生まれです。子供の頃は学校はあまり好きではありませんでした。自然の中を歩いたりピアノを弾いたりするのが好きでした。10年間ピアノを練習し、最初はプロの音楽家になりたかったのです。

1910年代に初めてカメラを手にしました。ヨセミテ国立公園でたくさん写真を撮りました。山をハイキングし、公園で働く人たちのクラブに入りました。ヨセミテの山々の写真を撮るのが大好きでした。

1920年代後半、アダムスは音楽家ではなくプロの写真家になることを決めました。成功しました。多くの写真集を出版し、写真を売りました。自然の写真はとても人気で、絵のようだと言われました。企業の製品の写真も撮りました。

アダムスは芸術として写真を撮るのが好きでした。企業のための写真はあまり好きではありませんでした。自然の写真に集中したかったのです。作品は美術館で展示され、写真も教えました。1980年、アメリカ大統領から賞を受けました。当時最も有名な写真家の一人でした。',
  vocabulary_notes = 'photographer: 写真家
professional: プロの、専門の
go on hikes: ハイキングに行く
instead of: ～ではなく（～の代わりに）
focus on ～: ～に集中する
received an award: 賞を受けた'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'Ansel Adams';

UPDATE reading_passages SET
  translation_ja = 'チョコレートの歴史

世界中の多くの人がチョコレートが好きです。でもどこから来るか知っていますか？チョコレートはカカオから作られます。カカオの木は暑く雨の多い地域で育ちます。昔、中央アメリカの人々が最初にカカオを使いました。苦い飲み物を作り、砂糖は入れませんでした。裕福な人と兵士だけが飲めました。

1500年代にスペイン人が中央アメリカに行き、カカオをヨーロッパに持ち帰りました。ヨーロッパでは砂糖と牛乳を加え、甘く人気になりました。後に固形チョコレートの作り方が広まり、1800年代にスイスの工場で最初の板チョコが作られました。今では多くの国でチョコレートが作られ、スイスとベルギーが有名です。

チョコレートはおいしいだけではありません。少量のダークチョコレートは健康にいいという研究もあります。ただし食べすぎはよくありません。糖分と脂肪が多いです。楽しみながら、食べすぎないようにしましょう。',
  vocabulary_notes = 'cacao: カカオ（チョコレートの原料）
bitter: 苦い
solid chocolate: 固形チョコレート
chocolate bar: 板チョコ
is not only delicious: おいしいだけではない
dark chocolate: ダークチョコレート'
WHERE level = '3級' AND passage_type = 'long_content' AND title = 'The History of Chocolate';
