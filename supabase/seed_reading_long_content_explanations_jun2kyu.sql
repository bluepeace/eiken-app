-- seed_reading_long_content_explanations_jun2kyu.sql
-- 長文の内容一致（準2級）の解説を reading_passage_questions.explanation に反映
-- 028 マイグレーションおよび seed_reading_long_content_jun2kyu_50.sql 実行後に実行

UPDATE reading_passage_questions q
SET explanation = '本文 "My social studies teacher, Mr. Garcia, gave me your e-mail address." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How was Todd able to contact Ms. Parker?';

UPDATE reading_passage_questions q
SET explanation = '"I would like to ask you and your staff about what you do to attract visitors and what makes your museum more attractive than others." が依頼内容です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is one thing Todd wants to ask about the museum?';

UPDATE reading_passage_questions q
SET explanation = '"I would also like to ask for permission to take photos of the museum to use as slides in my presentation." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Todd wants to';

UPDATE reading_passage_questions q
SET explanation = '"we have never had so many teams in a tournament before" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is true about the tennis tournament on May 5?';

UPDATE reading_passage_questions q
SET explanation = '"Because you applied a little late, there are no more spots left. All ten spots in the B-level group have been filled." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Jake''s team cannot play in the B-level group because';

UPDATE reading_passage_questions q
SET explanation = '"we encourage you to take part in the A-level group" が勧めている内容です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is one thing that Victoria advised Jake to do?';

UPDATE reading_passage_questions q
SET explanation = '"The presentation should be about ten minutes long" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is true about the presentation?';

UPDATE reading_passage_questions q
SET explanation = 'Aidan が自分のパートのノートを終え3枚スライドを作ったこと、Isabel の2枚目のスライドについて触れ、金曜にリハーサルする計画を述べていることから、二人で準備が進んでいるという内容が正解です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Aidan Norwick thinks that';

UPDATE reading_passage_questions q
SET explanation = '"We plan to practice together on Friday afternoon for a final rehearsal." が提案です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Aidan suggest to Isabel?';

UPDATE reading_passage_questions q
SET explanation = '"We are sorry to inform you that the camp session from July 15 to July 22 is now full." が手紙の主な目的です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why did the camp director write to Mrs. Webb?';

UPDATE reading_passage_questions q
SET explanation = '"Both sessions offer the same activities, including nature walks, experiments, and star gazing." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What can David do if his family chooses another session?';

UPDATE reading_passage_questions q
SET explanation = '"If you would like to switch to one of these sessions, please reply to this e-mail by June 10." が期限です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'By when should Mrs. Webb reply if she wants to switch sessions?';

UPDATE reading_passage_questions q
SET explanation = '"We would like to invite you for an interview. The interview will be on September 20 at 2:00 p.m." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Helen Walsh want Ryan to do?';

UPDATE reading_passage_questions q
SET explanation = '"Please bring a copy of your school schedule so we can see when you are free." が持参物です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What should Ryan bring to the interview?';

UPDATE reading_passage_questions q
SET explanation = '"We need someone who can work on weekday afternoons and Saturday mornings." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When does the library need the new worker to be available?';

UPDATE reading_passage_questions q
SET explanation = '"At the Science Center, students will take part in a workshop on renewable energy and visit the exhibition halls." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What will students do at the Science Center?';

UPDATE reading_passage_questions q
SET explanation = '"The deadline for handing in the form is October 10." が期限です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'By when must the permission form be handed in?';

UPDATE reading_passage_questions q
SET explanation = '"They should not bring large bags or valuable items, as storage space is limited." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why should students not bring large bags?';

UPDATE reading_passage_questions q
SET explanation = '"This month we will discuss the book Wild River by Jane Cole. Please read at least the first five chapters before the meeting." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What should members do before the November 18 meeting?';

UPDATE reading_passage_questions q
SET explanation = '"We will film the video at the December meeting." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When will the club film the video?';

UPDATE reading_passage_questions q
SET explanation = '"If you do not want to appear in the video, you can still help by writing the script or choosing the music." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What can members do if they do not want to appear in the video?';

UPDATE reading_passage_questions q
SET explanation = '"the room type you requested... is not available on those dates due to a booking error. We have already received many reservations for the spring holiday period." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why is the double room with a sea view not available?';

UPDATE reading_passage_questions q
SET explanation = '"We would like to offer you a double room without a sea view at the same price." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What can Mr. Turner get at the same price as his original request?';

UPDATE reading_passage_questions q
SET explanation = '"Please let us know your choice by March 18" が期限です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'By when should Mr. Turner tell the hotel his choice?';

UPDATE reading_passage_questions q
SET explanation = '"In the past, the number of beavers became smaller because of human activities in various parts of the world." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What happened to beavers in the past?';

UPDATE reading_passage_questions q
SET explanation = '"The dams also clean the water by removing harmful materials." が「悪い物質を水から取り除く」の言い換えです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'In Riding Mountain National Park in Canada,';

UPDATE reading_passage_questions q
SET explanation = '"their dams create places with healthier water... they make great homes for other wild animals" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How do beavers have a positive impact on other wild animals?';

UPDATE reading_passage_questions q
SET explanation = '"Some farmers think that there will be negative effects... This is because beavers may eat crops like corn on farms." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why do some people think beavers may have negative effects?';

UPDATE reading_passage_questions q
SET explanation = '"Many people visit the village throughout the year to enjoy the scenery and outdoor activities." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Which is correct to describe Chamois?';

UPDATE reading_passage_questions q
SET explanation = '"People in Chamois used to travel by bicycle or on foot to visit other villages." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'In the early 1960s, people in Chamois';

UPDATE reading_passage_questions q
SET explanation = '道路建設に反対し、"Instead, they decided to build cable cars... while keeping the environment safe" とあるので、自然を守るためです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why did the people of Chamois want cable cars?';

UPDATE reading_passage_questions q
SET explanation = '車を入れず、ケーブルカーで移動する「車を使わない環境に優しい交通」が本文の内容です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is true about Chamois today?';

UPDATE reading_passage_questions q
SET explanation = '"In the past, people thought about salt in a very different way. It had many more uses and was much more valuable." および保存・医薬・通貨などの記述が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did people think about salt in the past?';

UPDATE reading_passage_questions q
SET explanation = '"Salt was also used in medicine. People used it to treat both humans and animals when they were sick or injured." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'People in the past used salt as';

UPDATE reading_passage_questions q
SET explanation = '"In Europe, the salt trade helped cities grow and led to the building of new roads so that salt could be produced and carried from place to place." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is true about the impact of salt in the past?';

UPDATE reading_passage_questions q
SET explanation = '"We also use it in new ways. For example, we use salt to clean and polish metal" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How does salt help people''s lives today?';

UPDATE reading_passage_questions q
SET explanation = '"The story of chocolate began in Central America thousands of years ago." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where did the story of chocolate begin?';

UPDATE reading_passage_questions q
SET explanation = '"In Europe, people added sugar and milk to the drink." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did people in Europe add to the cacao drink?';

UPDATE reading_passage_questions q
SET explanation = '"In the 1800s, a factory in Switzerland made the first chocolate bar." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where was the first chocolate bar made?';

UPDATE reading_passage_questions q
SET explanation = '"eating too much chocolate is not a good idea because it often contains a lot of sugar and fat" が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why is eating too much chocolate not a good idea?';

UPDATE reading_passage_questions q
SET explanation = '"Solar power is clean because it does not produce harmful gases." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why is solar power called clean energy?';

UPDATE reading_passage_questions q
SET explanation = '"Solar panels have become cheaper and better at producing electricity." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What has happened to solar panels over the years?';

UPDATE reading_passage_questions q
SET explanation = '"It does not work at night, and when the sky is cloudy, less electricity is produced." が限界として述べられています。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is one limitation of solar power?';

UPDATE reading_passage_questions q
SET explanation = '"Many experts believe that in the future, we will use a mix of solar power and other clean energy sources." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What do many experts believe about the future?';

UPDATE reading_passage_questions q
SET explanation = '"The first parts of the wall were built more than 2,000 years ago to protect China from enemies from the north." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why was the Great Wall first built?';

UPDATE reading_passage_questions q
SET explanation = '"Most of the wall we see today was built during the Ming dynasty" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When was most of the wall we see today built?';

UPDATE reading_passage_questions q
SET explanation = '"Workers had to carry heavy stones and bricks up steep hills." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is true about building the Great Wall?';

UPDATE reading_passage_questions q
SET explanation = '"It is also a UNESCO World Heritage Site, which means it is protected as an important part of world history." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does UNESCO World Heritage Site mean for the Great Wall?';

UPDATE reading_passage_questions q
SET explanation = '"They help plants make fruits and seeds by carrying pollen from one flower to another. This process is called pollination." および "Many of the foods we eat... depend on bees" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why are bees important for our food?';

UPDATE reading_passage_questions q
SET explanation = '"the number of bees has been decreasing in many parts of the world. Scientists are worried about this because it could affect our food supply" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What are scientists worried about?';

UPDATE reading_passage_questions q
SET explanation = '"One reason is the use of certain chemicals on farms. These chemicals can harm bees when they visit the flowers." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is one reason why bees are disappearing?';

UPDATE reading_passage_questions q
SET explanation = '"You can also help by planting flowers in your garden or on your balcony." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How can people help bees according to the passage?';
