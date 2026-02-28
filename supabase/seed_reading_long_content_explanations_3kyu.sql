-- seed_reading_long_content_explanations_3kyu.sql
-- 長文の内容一致（3級）の解説を reading_passage_questions.explanation に反映
-- 043 マイグレーションおよび seed_reading_long_content_3kyu_50.sql 実行後に実行

UPDATE reading_passage_questions q
SET explanation = '本文に "The yellow can will be for paper." とあるので、紙は黄色い缶に入れます。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Which trash can will the volunteers throw away paper in?';

UPDATE reading_passage_questions q
SET explanation = '"The city staff will give lunch to all volunteers after cleaning." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What will the city staff do on September 19?';

UPDATE reading_passage_questions q
SET explanation = '"She worked at a bookstore for eight years and at the library at the local university for five years." より、大学図書館では5年です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How long did Ms. Wilson work at the local university''s library?';

UPDATE reading_passage_questions q
SET explanation = '"You can enjoy free drinks and snacks." と書いてあります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'At the welcome party, students can';

UPDATE reading_passage_questions q
SET explanation = '"Students must bring their own lunch." が必須事項です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What must students do on October 18?';

UPDATE reading_passage_questions q
SET explanation = '"You can bring a camera to take pictures of the garden, but please do not take pictures inside the house." より、写真OKなのは庭だけです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where can students take photos during the tour?';

UPDATE reading_passage_questions q
SET explanation = '"The class will start at 2:00 p.m. and end at 4:30 p.m." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When will the painting class end?';

UPDATE reading_passage_questions q
SET explanation = '"If you want to join, please send an e-mail to art@community.org by November 5." とあります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'By when should students send an e-mail to join?';

UPDATE reading_passage_questions q
SET explanation = '"Tickets are 500 yen for adults and 200 yen for students." より、生徒は200円です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How much do students pay for a ticket?';

UPDATE reading_passage_questions q
SET explanation = '"Please come early because we have a limit of 100 people." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why should people come early?';

UPDATE reading_passage_questions q
SET explanation = '"On Wednesday, June 7, a writer will visit our school and talk about her new book." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When will the writer visit the school?';

UPDATE reading_passage_questions q
SET explanation = '"The talk will be in the school hall from 1:00 p.m. to 2:00 p.m." とあります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where will the writer''s talk be?';

UPDATE reading_passage_questions q
SET explanation = '"We will practice every Tuesday and Thursday from 4:00 p.m. to 6:00 p.m." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'On which days will the club practice?';

UPDATE reading_passage_questions q
SET explanation = '"If you want to join the match, tell the captain by July 10." と書いてあります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'By when should students tell the captain to join the match?';

UPDATE reading_passage_questions q
SET explanation = '"We will learn how to make pasta and salad." が内容です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What will students learn to make?';

UPDATE reading_passage_questions q
SET explanation = '"Please pay at the front desk by February 10." が期限です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'By when should students pay the fee?';

UPDATE reading_passage_questions q
SET explanation = 'Bryan のメールに "I am studying Spanish now" とあります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What language does Bryan study at high school?';

UPDATE reading_passage_questions q
SET explanation = 'Jill の返信 "She lived in Japan for 10 years - 3 years in Hokkaido and 7 years in Tokyo." より、東京では7年です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How long did Jill''s aunt live in Tokyo?';

UPDATE reading_passage_questions q
SET explanation = 'Bryan の3通目 "I think studying together is a great idea. Please come if you can!" と、水曜夕方のレッスンは "at a café near the station" なので、Jill に同じ時間にカフェで一緒にレッスンに来てほしいと言っています。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Bryan want Jill to do on Wednesday evening?';

UPDATE reading_passage_questions q
SET explanation = 'Sophia のメール "I had a surprising experience last Monday. I met my old friend Mia in my art class at college!" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When did Sophia meet Mia in her class at college?';

UPDATE reading_passage_questions q
SET explanation = 'Anna の返信 "I remember you and Mia often went to the library together when you were in junior high." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did Sophia and Mia often do together when they were junior high school students?';

UPDATE reading_passage_questions q
SET explanation = 'Anna が "I have to work at the hospital and won''t finish early, so I can''t pick you up." と言っているので、10月20日は病院で仕事をします。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What will Sophia''s mother do on October 20?';

UPDATE reading_passage_questions q
SET explanation = 'Lucas の1通目 "I need to write a report... Can I interview you about your city this Saturday?" より、インタビューの依頼が目的です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why did Lucas write to his grandfather?';

UPDATE reading_passage_questions q
SET explanation = 'Grandpa の返信 "I have a lot of work to do this Saturday and Sunday morning. Can we meet on Sunday afternoon instead?" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When will Lucas''s grandfather be able to meet Lucas?';

UPDATE reading_passage_questions q
SET explanation = 'Lucas の2通目 "I decided to write about your city''s spring festival." とあり、Grandpa の街の春祭り（cherry blossom festival）について書くことにしたとあります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did Lucas choose to write about for his report?';

UPDATE reading_passage_questions q
SET explanation = 'Emma のメール "I have a music lesson until 1:00 p.m., so I can go to the 5:00 p.m. show." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why will Emma go to the 5:00 p.m. show?';

UPDATE reading_passage_questions q
SET explanation = 'Ben の返信 "I will meet you in front of the cinema at 4:30 p.m." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where will Ben meet Emma?';

UPDATE reading_passage_questions q
SET explanation = '"We can eat dinner after the movie. There is a new pizza place next to the cinema." より、映画の後にピザ屋で食事をしたいと言っています。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Ben want to do after the movie?';

UPDATE reading_passage_questions q
SET explanation = 'Kate のメール "Our class will have a camping trip from August 3 to August 5. We will go to Lake View Camp." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What will Kate do with her class from August 3 to 5?';

UPDATE reading_passage_questions q
SET explanation = '"Can you drive me to the meeting point at school at 8:00 a.m. on August 3? Mom said she has to work early that day." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why does Kate ask her dad to drive her?';

UPDATE reading_passage_questions q
SET explanation = 'Dad の返信 "Remember to bring a rain jacket. The weather can change quickly at the lake." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Kate''s dad tell her to bring?';

UPDATE reading_passage_questions q
SET explanation = 'Tom のメール "Our school play is on December 10 at 6:00 p.m. in the school hall." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where will the school play be?';

UPDATE reading_passage_questions q
SET explanation = '"You can buy them at the school office from November 20." とあります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When can students buy tickets?';

UPDATE reading_passage_questions q
SET explanation = '"After the play, we will have a party in the gym." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What will happen after the play?';

UPDATE reading_passage_questions q
SET explanation = '1段落目 "About 10,000 people live there." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How many people live in Buñol?';

UPDATE reading_passage_questions q
SET explanation = '2段落目 "During a parade, some children pushed a musician. The musician got angry and threw a tomato at them." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What happened during the parade in 1945?';

UPDATE reading_passage_questions q
SET explanation = '本文 "At this festival, people throw tomatoes at each other." および "They throw tomatoes for about one hour." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What do a lot of people do at La Tomatina?';

UPDATE reading_passage_questions q
SET explanation = '最後の段落 "some people do not think it is a good idea. Cleaning up after the festival is difficult." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Some people do not like La Tomatina because';

UPDATE reading_passage_questions q
SET explanation = '全体のテーマはスペインの Buñol で行われる La Tomatina という有名な祭りです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND p.title = 'La Tomatina'
  AND q.question_text = 'What is this story about?';

UPDATE reading_passage_questions q
SET explanation = '1段落目 "The Three Sisters Method helps people to grow many vegetables in a small area." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When people use the Three Sisters Method, they can';

UPDATE reading_passage_questions q
SET explanation = '2段落目 "they plant corn first. Next, they plant beans, and they plant pumpkins last." が順序の根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What do people plant first when they use the Three Sisters Method?';

UPDATE reading_passage_questions q
SET explanation = '3段落目 "Pumpkins also have large leaves. They are important because they protect the area around the vegetables from the sun." が根拠です（the area around the vegetables = 土の部分なので soil と言い換え可）。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What do the pumpkins'' leaves do?';

UPDATE reading_passage_questions q
SET explanation = '最後の段落 "When Europeans went to North America in the 1600s, they took new plants and animals with them. Since then, the food that Native Americans eat has changed." より、先住民の食べるものが変わった（different foods の言い換え）が正解です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What happened after Europeans went to North America?';

UPDATE reading_passage_questions q
SET explanation = '主旨は、トウモロコシ・豆・カボチャを一緒に育てる「スリシスターズ」という特別な栽培方法の説明です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND p.title = 'The Three Sisters'
  AND q.question_text = 'What is this story about?';

UPDATE reading_passage_questions q
SET explanation = '1段落目 "He enjoyed going for walks in nature and playing the piano." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'As a child, Ansel Adams';

UPDATE reading_passage_questions q
SET explanation = '2段落目 "He got his first camera. He took many pictures in Yosemite National Park. He went on hikes in the mountains there." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did Adams do when he got his first camera?';

UPDATE reading_passage_questions q
SET explanation = '3段落目 "His photos of nature were very popular. People said they looked like paintings." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why were Adams''s photographs popular?';

UPDATE reading_passage_questions q
SET explanation = '最後の段落 "In 1980, he received an award from the President of the United States." が根拠です（won = received の言い換え）。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What happened in 1980?';

UPDATE reading_passage_questions q
SET explanation = '全体のテーマは、1902年生まれの写真家 Ansel Adams の生涯と仕事です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND p.title = 'Ansel Adams'
  AND q.question_text = 'What is this story about?';

UPDATE reading_passage_questions q
SET explanation = '1段落目 "A long time ago, people in Central America first used cacao." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where did people first use cacao?';

UPDATE reading_passage_questions q
SET explanation = '"Only rich people and soldiers could drink it." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Who could drink the first cacao drink a long time ago?';

UPDATE reading_passage_questions q
SET explanation = '2段落目 "In the 1800s, a factory in Switzerland made the first chocolate bar." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where was the first chocolate bar made?';

UPDATE reading_passage_questions q
SET explanation = '最後の段落 "But eating too much chocolate is not good. It has a lot of sugar and fat." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why is eating too much chocolate not good?';

UPDATE reading_passage_questions q
SET explanation = '主旨は、カカオの利用からヨーロッパへの伝播、チョコレートバーの誕生までのチョコレートの歴史です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '3級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is this story mainly about?';
