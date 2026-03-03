-- seed_reading_long_content_jun2kyu_translation_vocabulary.sql
-- 準2級 長文の内容一致：日本語訳とポイント・単語解説（解説ページ用）
-- 052 マイグレーションおよび seed_reading_long_content_jun2kyu_50.sql 実行後に実行

-- ========== 4A Eメール ==========

UPDATE reading_passages SET
  translation_ja = '差出人：トッド・ハミルトン
宛先：ジーナ・パーカー
日付：1月10日
件名：インタビューについて

パーカー様

ペターソン高校の生徒、トッド・ハミルトンと申します。社会科のガルシア先生からメールアドレスをいただきました。地域の有名な観光スポットについてのプレゼンを準備しており、国内・海外の来館者に人気があるためイーストブリッジ歴史博物館に焦点を当げることにしました。

博物館のウェブサイトで歴史、イベント、建物、展示の基本情報はすでに得ています。しかし、来館者を引きつけるための取り組みや、他館より魅力的にしている点について、あなたとスタッフにお聞きしたいです。ご都合のよいときに短いインタビューをさせていただくことは可能でしょうか。プレゼンのスライド用に博物館の写真を撮る許可もお願いしたいです。インタビューが難しければ、メールでいくつか質問させていただくだけでもありがたいです。

お時間をいただきありがとうございます。ご返信をお待ちしております。

敬具
トッド・ハミルトン',
  vocabulary_notes = 'focus on ～: ～に焦点を当げる
domestic and international visitors: 国内・海外の来館者
attract visitors: 来館者を引きつける
at your convenience: ご都合のよいときに
I would be grateful if ～: ～していただければありがたい
look forward to hearing from you: ご返信をお待ちしております'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'An interview';

UPDATE reading_passages SET
  translation_ja = '差出人：ヴィクトリア・ヒル
宛先：ジェイク・アダムス
日付：4月28日
件名：テニス大会に関する重要なお知らせ

ジェイク様

5月5日のテニス大会は今年5回目の大会となります。これまでにないほど多くのチームの申し込みがあり、大変嬉しく思っています。男子・女子・混合チームから申し込みがありました。

お伝えしたいのは、ご予定のBレベルでプレーしていただくことができないということです。申し込みが少し遅れたため、枠が残っていません。Bレベルは10枠すべて埋まっています。そのため、上のAレベルでの参加をご提案します。Cレベルに移るか、Bレベルでキャンセルが出るか待つことも可能です。ただしAレベルへの参加を推奨します。いずれのグループにも参加できない場合は、大会費をすぐに返金いたします。

5月1日までにご決定をお知らせください。

敬具
ヴィクトリア・ヒル',
  vocabulary_notes = 'spots have been filled: 枠が埋まっている
Therefore: したがって
we would like to suggest that ～: ～をご提案します
refund: 返金する
encourage ～ to ～: ～に～するよう勧める'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'Important information about the tennis tournament';

UPDATE reading_passages SET
  translation_ja = '差出人：エイダン・ノーウィック
宛先：イザベル・ジョーンズ
日付：2月23日
件名：グループプレゼン

イザベルへ

来週のグループプレゼンのリマインドです。役割はもう決まっている。君が気候変動の原因を話し、僕が影響を説明する。君はアメリカの環境保護の取り組みの例も出す。プレゼンは約10分なので、各部分を短く明確にする必要がある。

僕のパートのメモは終えてスライドを3枚作った。君は2枚目を進めていたよね。よければ君のスライドをチェックできる。木曜までにスライドを交換して全体を確認しよう。金曜の午後に最終リハーサルの練習を予定している。金曜が無理なら教えて。今週末は予定が入っているが、別の時間なら会える。

エイダン',
  vocabulary_notes = 'remind ～ about ～: ～に～を思い出させる
the causes of climate change: 気候変動の原因
rehearsal: リハーサル
I am not available: 都合がつかない
exchange ～ by Thursday: 木曜までに～を交換する'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'Group presentation';

UPDATE reading_passages SET
  translation_ja = '差出人：キャンプディレクター
宛先：サンドラ・ウェブ様
日付：6月3日
件名：サマーサイエンスキャンプへのお子様の申し込みについて

ウェブ様

サマーサイエンスキャンプへのお申し込みありがとうございます。息子のデイビッドさんの申し込みを受理しました。申し訳ございませんが、7月15日～22日の回は定員に達しました。今年は申し込み数が過去最多でした。

他に7月8日～15日と7月22日～29日の2回がございます。どちらも自然散策、実験、星空観察など同じプログラムです。いずれかに変更をご希望の場合は、6月10日までにこのメールに返信してください。ご連絡いただくまで7月8日回の席をデイビッドさんのために確保しておきます。どちらの回もご都合が悪い場合は、申込金全額を返金いたします。

ご返信をお待ちしております。

敬具
ジェームズ・ミラー
キャンプディレクター',
  vocabulary_notes = 'We are sorry to inform you that ～: ～とお伝えし申し訳ございません
session is now full: その回は定員に達した
record number of applications: 過去最多の申し込み数
switch to ～: ～に変更する
refund the full registration fee: 申込金全額を返金する'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'Your son''s registration for Summer Science Camp';

UPDATE reading_passages SET
  translation_ja = '差出人：ヘレン・ウォルシュ
宛先：ライアン・コール
日付：9月12日
件名：Re: パートタイム応募について

ライアン様

市立図書館のパートタイム職への応募ありがとうございます。書類を審査し、面接にご招待したくご連絡いたしました。面接は9月20日午後2時に本館で行います。受付で私をお呼びください。約30分です。本やコンピュータの経験、図書館で働きたい理由をお聞きします。

空いている時間がわかるよう、学校の時間割のコピーを持ってきてください。平日の午後と土曜の午前に働ける方が必要です。9月20日がご都合悪い場合は、9月15日までに返信いただければ別の日をご提案します。お会いできるのを楽しみにしております。

敬具
ヘレン・ウォルシュ
図書館マネージャー',
  vocabulary_notes = 'part-time position: パートタイムの職
invite ～ for an interview: ～を面接に招待する
ask for me: 私を呼ぶ、私の名前を伝える
convenient: 都合がよい
weekday afternoons: 平日の午後'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'Re: Part-time job application';

UPDATE reading_passages SET
  translation_ja = '差出人：カレン・リー
宛先：保護者の皆様
日付：10月1日
件名：確認－科学センターへの校外学習

保護者様

10月18日の10年生の国立科学センターへの校外学習を確認いたします。生徒は午前8時30分に学校を出発し、午後4時までに戻ります。お弁当と飲み物を持参してください。保管スペースに限りがあるため、大きなかばんや貴重品は持ってこないでください。

科学センターでは再生可能エネルギーに関するワークショップに参加し、展示ホールを見学します。インタラクティブ展示も体験する時間があります。許可書に署名済みかご確認ください。提出期限は10月10日です。ご質問は学校事務所またはこのメールへの返信でお問い合わせください。

ご協力ありがとうございます。

カレン・リー
10年生担当',
  vocabulary_notes = 'This is to confirm ～: ～を確認いたします
packed lunch: お弁当
storage space is limited: 保管スペースに限りがある
renewable energy: 再生可能エネルギー
ensure: ～であることを確認する
hand in: 提出する'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'Confirmation – School trip to the Science Center';

UPDATE reading_passages SET
  translation_ja = '差出人：ニーナ・フォスター
宛先：ヤングリーダーズクラブ会員
日付：11月5日
件名：次回の例会と新プロジェクト

会員の皆様

次回の例会は11月18日午後4時、市民センター3号室です。今月はジェーン・コール著「ワイルドリバー」を議論します。例会までに少なくとも最初の5章をお読みください。まだ本を借りていない方は、センター受付でお受け取りいただけます。

新プロジェクトも始めます。お気に入りの本を他の生徒に紹介する短い動画を作ります。各会員が1冊について約2分話します。12月の例会で撮影します。動画に映りたくない方は、台本を書くか音楽を選ぶことで参加できます。11月12日までに希望をお知らせください。

例会でお会いしましょう。

ニーナ・フォスター
クラブリーダー',
  vocabulary_notes = 'at least the first five chapters: 少なくとも最初の5章
pick it up: 受け取る、取りに来る
appear in the video: 動画に映る
script: 台本
preference: 希望、好み'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'Next meeting and new project';

UPDATE reading_passages SET
  translation_ja = '差出人：サンセットホテル
宛先：ポール・ターナー様
日付：3月14日
件名：ご予約の変更について

ターナー様

3月25日～28日のサンセットホテルご予約ありがとうございます。申し訳ございませんが、ご希望の海側ダブルルームは予約の手違いおよび春休みの混雑のため、該当期間はご用意できません。

同料金で海側でないダブルルームをご用意できます。または海側のファミリールームもございますが、1泊あたり5,000円追加となります。キャンセルをご希望の場合は、5営業日以内に全額返金いたします。3月18日までにこのメールへの返信またはフロントへのお電話でご選択をお知らせください。ご不便をおかけし申し訳ございません。

敬具
予約担当
サンセットホテル',
  vocabulary_notes = 'due to a booking error: 予約の手違いにより
Alternatively: あるいは、代わりに
an extra 5,000 yen per night: 1泊あたり5,000円追加
within five business days: 5営業日以内に
We apologize for any inconvenience: ご不便をおかけし申し訳ございません'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'Change to your reservation';

-- ========== 4B 説明文 ==========

UPDATE reading_passages SET
  translation_ja = '環境を良くする動物

ビーバーは北アメリカとヨーロッパの湖や川に住む動物です。ビーバーと聞いて、環境への貢献を思い浮かべる人は多くありません。かつては世界各地の人間活動の影響でビーバーの数は減りました。しかし今日、専門家はビーバーを自然に戻すことが環境保護に役立つと言います。そのため、数を増やす取り組みが行われています。

ビーバーは多くの利点をもたらします。カナダのライディングマウンテン国立公園は、ビーバーの好影響の良い例です。公園ではビーバーが水問題のリスクを減らすのに役立っています。他の動物から身を守るため、ビーバーは川に壁のようなダムを作ります。ダムが水流を遅くするため、洪水などの自然災害を防げます。ダムは有害物質を取り除いて水を浄化し、水質を改善します。

ビーバーはダムのおかげで野生動物にも良い影響を与えます。ダムが流れの遅いより健全な水の場所を作るため、他の野生動物のすみかになります。例えばイギリスのある地域では、ビーバーが鳥の住みよい環境を作ったという研究があります。カエルや他の種も増えています。

一部の農家は、ビーバーを適切に管理しないと食料生産に悪影響があると考えています。ビーバーが農場のトウモロコシなどの作物を食べる可能性があるためです。しかし自然への貢献は事実として残ります。英国政府はビーバーを野生に再導入することを決めました。今後もビーバーの数は増え続ける一方、農家は適切に管理されることを望んでいます。',
  vocabulary_notes = 'bring ～ back into nature: ～を自然に戻す
action has been taken: 取り組みが行われた
reduce the risk of ～: ～のリスクを減らす
dam: ダム
remove harmful materials: 有害物質を取り除く
positive impact: 好影響
negative effects: 悪影響
introduce ～ back into the wild: ～を野生に再導入する'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'Animals That Improve the Environment';

UPDATE reading_passages SET
  translation_ja = 'ユニークなイタリアの村

シャモワはイタリアの小さな村です。高い山に囲まれ、美しい自然で知られています。多くの人が一年を通じて景色とアウトドアを楽しみに訪れます。しかしシャモワは一点で他のほとんどの村と違います。車の乗り入れが禁止されているのです。人口は約100人で、歩かずに着く方法はケーブルカーだけです。

1960年代初頭、イタリアでは道路建設が進んでいました。シャモワの人々は自転車や徒歩で他の村へ行っていました。政府がシャモワへ車道を造る案を出したとき、住民は反対しました。車で村周辺の自然を壊したくなかったのです。代わりにケーブルカーを造ることにしました。ケーブルカーで他地域への移動が楽に速くなり、環境も守られました。

今日、シャモワは環境に優しい村として知られています。車がないため空気はきれいで道は静かです。「アルパイン・パールズ」という、自然の美を守り気候に優しい移動を提供する町のグループに属しています。訪れた人はハイキング、スキー、自然に寄り添う村の静けさを楽しめます。',
  vocabulary_notes = 'is surrounded by ～: ～に囲まれている
throughout the year: 一年を通じて
the only way to reach it without walking: 歩かずに着く唯一の方法
cable car: ケーブルカー
were against the idea: その案に反対した
damage: 損なう、壊す
environmentally friendly: 環境に優しい
climate-friendly: 気候に優しい'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'A Unique Italian Village';

UPDATE reading_passages SET
  translation_ja = '塩

塩は人が生きるために必要です。今では手に入りやすく、主に食べ物に味をつけるのに使います。しかし昔は、人々は塩をまったく違うものとして考えていました。用途はもっと多く、はるかに価値がありました。

昔は冷蔵庫がありませんでした。人々は食べ物を長持ちさせるために塩で保存しました。塩は薬としても使われ、人や動物が病気やけがをしたときに治療に使いました。さらに塩はとても貴重で、時にはお金のように使われました。ヨーロッパでは塩の交易が都市を成長させ、塩の生産と運搬のために新しい道路の建設につながりました。世界の多くの地域で、塩をめぐって戦争が起きました。

塩は今でも重要です。料理や一部の薬に使い、新しい使い方もしています。例えば金属を磨くのに使い、冬には道路にまいて雪を溶かし事故を防ぎます。塩はこれからも私たちの生活で重要な役割を果たし続けるでしょう。',
  vocabulary_notes = 'survive: 生き延びる
preserve food: 食べ物を保存する
treat: 治療する
injured: けがをした
led to the building of ～: ～の建設につながった
wars were fought over salt: 塩をめぐって戦争が起きた
polish: 磨く
melt: 溶かす
play an important role: 重要な役割を果たす'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'Salt';

UPDATE reading_passages SET
  translation_ja = 'チョコレートの歴史

チョコレートは世界中で愛されています。暑く雨の多い地域で育つカカオから作られます。チョコレートの歴史は何千年も前の中央アメリカに始まります。そこで人々はカカオから苦い飲み物を作り、砂糖は加えず、限られた人だけが飲めました。1500年代にスペイン人が中央アメリカに来て、カカオをヨーロッパに持ち帰りました。ヨーロッパでは砂糖と牛乳を加え、甘く人気になりました。後に固形チョコレートの作り方が広まり、1800年代にスイスの工場が最初の板チョコを作りました。

今日、チョコレートはさまざまに使われます。お菓子として食べ、ケーキに使い、ホットチョコレートとして飲みます。少量のダークチョコレートは健康に良いという研究もあります。ただし食べすぎはよくありません。糖分と脂肪が多いことが多いためです。チョコレートは昔の苦い飲み物から長い道のりを経て、これからも多くの人に愛され続けるでしょう。',
  vocabulary_notes = 'certain people: 限られた人々、特定の人々
solid chocolate: 固形チョコレート
chocolate bar: 板チョコ
contains: 含む
has come a long way: 長い道のりを経てきた
remain a favorite: お気に入りであり続ける'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'The History of Chocolate';

UPDATE reading_passages SET
  translation_ja = '太陽エネルギー

太陽は毎日光と温かさを与えてくれます。長い間、人々は太陽のエネルギーをさまざまな方法で利用しようとしてきました。今日、多くの国でソーラーパネルが日光を電気に変えるのに使われています。これを太陽光発電といいます。太陽光発電は有害なガスを出さないためクリーンです。再生可能でもあり、太陽が照る限り何度でも使えます。

昔、ソーラーパネルは高価で効率もあまりよくなかった。しかし年月を経て技術が進み、ソーラーパネルは安くなり発電効率も上がりました。今では多くの家庭や学校の屋上にソーラーパネルがあります。日当たりのよい地域に大規模なソーラーファームを建設した国もあり、何千人もの人に電力を供給できます。

ただし太陽光発電には限界があります。夜は発電できず、曇りの日は発電量が減ります。そのため他のエネルギー源も必要です。多くの専門家は、将来は太陽光と他のクリーンエネルギーを組み合わせて使うと考えています。そうすれば環境を守り、化石燃料への依存を減らせます。',
  vocabulary_notes = 'turn ～ into ～: ～を～に変える
solar power: 太陽光発電
renewable: 再生可能な
efficient: 効率的な
solar farm: ソーラーファーム（大規模太陽光発電所）
limitations: 限界
dependence on fossil fuels: 化石燃料への依存'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'Solar Energy';

UPDATE reading_passages SET
  translation_ja = '万里の長城

万里の長城は世界で最も有名な建造物の一つです。何世紀にもわたって築かれた長い壁です。最初の部分は2千年以上前、北からの敵から中国を守るために造られました。時代とともに様々な支配者が壁を増築しました。今日目にする大部分は14世紀から17世紀まで続いた明の時代に造られました。壁は山、砂漠、草原を越えて延びるほど長いです。宇宙から見えると言われることがありますが、それは事実ではありません。それでも驚くべき偉業です。

万里の長城の建設は非常に困難でした。労働者は急な丘に重い石やレンガを運ばねばなりませんでした。酷暑と厳寒の中で働き、多くの人が建設中に命を落としました。壁は敵を防ぐだけでなく、交易を管理し門で税を徴収するためにも造られました。今日、万里の長城は人気の観光地で、毎年何百万人も訪れます。ユネスコ世界遺産でもあり、世界の歴史の重要な一部として保護されています。',
  vocabulary_notes = 'structure: 建造物
stretch across ～: ～にわたって延びる
achievement: 偉業、達成
steep: 急な
keep enemies out: 敵を防ぐ
UNESCO World Heritage Site: ユネスコ世界遺産'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'The Great Wall of China';

UPDATE reading_passages SET
  translation_ja = 'ミツバチと環境

ミツバチは小さな昆虫ですが、私たちの生活でとても重要な役割を果たしています。花から花へ花粉を運ぶことで、植物が実や種を作るのを助けます。この過程を授粉といいます。リンゴ、アーモンド、イチゴなど私たちが食べる多くの食物はミツバチに依存しています。ミツバチがいなければ、農家はこれらの作物を育てるのがずっと難しくなります。しかし近年、世界各地でミツバチの数が減っています。科学者は食料供給に影響する可能性があると心配しています。

ミツバチが減っている理由はいくつかあります。一つは農場で使われる特定の化学物質です。ミツバチが花に来たときにこれらの物質が害になることがあります。もう一つは、ミツバチが住み餌を見つけられる場所の喪失です。都市や農地が多くの自然を置き換えました。気候変動も花の咲く時期を変えることでミツバチに影響している可能性があります。花の咲く時期がずれると、ミツバチは十分な餌を見つけられないことがあります。

人々は今、ミツバチを助けようとしています。有害な化学物質を減らす農家もいれば、ミツバチの好きな花を植える都市もあります。庭やベランダに花を植えることであなたも助けられます。小さな花壇でもミツバチの休み場や餌場になります。力を合わせれば、この大切な昆虫を守れるでしょう。',
  vocabulary_notes = 'play an important role: 重要な役割を果たす
pollen: 花粉
pollination: 授粉
depend on ～: ～に依存する
food supply: 食料供給
bloom: 花が咲く
a patch of flowers: 花壇、一区画の花'
WHERE level = '準2級' AND passage_type = 'long_content' AND title = 'Bees and the Environment';
