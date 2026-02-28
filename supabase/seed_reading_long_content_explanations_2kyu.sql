-- seed_reading_long_content_explanations_2kyu.sql
-- 長文の内容一致（2級）の解説を reading_passage_questions.explanation に反映
-- 043 マイグレーションおよび seed_reading_long_content_2kyu_50.sql 実行後に実行

UPDATE reading_passage_questions q
SET explanation = '本文 "This will help us check your understanding of the basics and make our in-class discussions more productive." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why does Sarah Freeman want course participants to take the quiz?';

UPDATE reading_passage_questions q
SET explanation = '"Our instructor will be attending an international conference in mid-May, so two classes will be moved to June." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'The class schedule will be changed because';

UPDATE reading_passage_questions q
SET explanation = '"you can catch up by watching the recorded lecture online" および "you can use this option only twice during the course" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is one thing Sarah says about catching up with a class?';

UPDATE reading_passage_questions q
SET explanation = '"It made me realize that many students at our school are actually interested in reading." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Last month, Jessica discovered that';

UPDATE reading_passage_questions q
SET explanation = '"I would like to understand what kind of support the library offers to students." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is Jessica interested in about the library?';

UPDATE reading_passage_questions q
SET explanation = '"Could you please write your answers on that document and return it to me by e-mail by November 25?" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Jessica ask staff members to do after answering the questions?';

UPDATE reading_passage_questions q
SET explanation = '電話の後、Julia が退職パーティーのサプライズ映画とIT支援の依頼についてメールで詳細を伝えていることから、今後の祝賀の詳細が決まった流れが正解です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What happened after the phone call today?';

UPDATE reading_passage_questions q
SET explanation = '"The movie will include slides about his achievements, photos with coworkers, and messages from customers." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'The surprise movie for Mr. Jenkins''s retirement party will';

UPDATE reading_passage_questions q
SET explanation = '"we are having trouble creating a clear graphic from the data" および "We also need help with video and sound equipment on the day of the event" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Julia Young want help with?';

UPDATE reading_passage_questions q
SET explanation = '"Your answers will help our facilitators plan activities that suit your needs." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why does David Park want participants to complete the questionnaire?';

UPDATE reading_passage_questions q
SET explanation = '"If you have any dietary requirements, please inform us by September 15." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'By when should participants inform the team about dietary requirements?';

UPDATE reading_passage_questions q
SET explanation = '"we will use an online platform for sharing materials during the workshop. Please make sure you can access the internet with your laptop or tablet." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is one thing participants need to prepare for the workshop?';

UPDATE reading_passage_questions q
SET explanation = '"From that date, we will introduce a flexible working system. You may choose to work from home up to two days per week" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What change will take effect from February 1?';

UPDATE reading_passage_questions q
SET explanation = '"On the days you work in the office, we ask you to use the online booking system to reserve a desk." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why are staff asked to use the online booking system?';

UPDATE reading_passage_questions q
SET explanation = '"A recording will be available for those who cannot join." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What can staff do if they cannot attend the meeting on January 22?';

UPDATE reading_passage_questions q
SET explanation = '"We plan to set up five stations where students will present their projects using tablets and large screens." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What will the Science Fair use for student presentations?';

UPDATE reading_passage_questions q
SET explanation = '"We also plan to live-stream the award ceremony for parents who cannot attend." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why does the school want to live-stream the award ceremony?';

UPDATE reading_passage_questions q
SET explanation = '"Could you please let us know by April 22 whether you can provide this support?" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'By when does Michael Brown need a reply from the Tech Support team?';

UPDATE reading_passage_questions q
SET explanation = '"To his surprise, his customers found it more convenient to pour hot water over the tea leaves while they were still in the bag. They used the bags just as they were delivered, instead of opening them." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why was Thomas Sullivan surprised at his customers?';

UPDATE reading_passage_questions q
SET explanation = '"As tea bags became more popular, hand-making them could not meet the demand. Filter paper was introduced... and was suitable for large-scale production." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'The development of tea bag materials was mainly influenced by';

UPDATE reading_passage_questions q
SET explanation = '"After World War II, however, lifestyles became busier... Tea bags fit well with the pace of modern life and finally became accepted." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why did tea bags finally become popular in Britain?';

UPDATE reading_passage_questions q
SET explanation = '"In the late 1990s, pyramid-shaped tea bags appeared. They gave more space for tea leaves to move around, which improved the taste." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Pyramid-shaped tea bags were introduced to';

UPDATE reading_passage_questions q
SET explanation = '"Recently, there has been a move towards using paper, cloth, or silk instead of nylon or materials containing plastic, in line with the global trend to reduce plastic use" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND p.title = 'History of Tea Bags'
  AND q.question_text = 'Which of the following statements is true?';

UPDATE reading_passage_questions q
SET explanation = '"The mirror test is a method used to find out if an animal can recognize itself." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'The mirror test is used';

UPDATE reading_passage_questions q
SET explanation = '"At first, the fish attacked their reflections, perhaps thinking they were other fish." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How did the cleaner wrasses behave when they were first shown a mirror?';

UPDATE reading_passage_questions q
SET explanation = '"They tried to remove marks from pictures of themselves but not from pictures of other marked fish." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did the cleaner wrasses do when they were shown a picture of themselves with a mark?';

UPDATE reading_passage_questions q
SET explanation = '"vision is not the main sense for all animals. Some rely more on smell or other senses. The test may not be suitable for every species." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'In the discussion about the mirror test, it has been pointed out that';

UPDATE reading_passage_questions q
SET explanation = '写真実験で "They tried to remove marks from pictures of themselves but not from pictures of other marked fish. This suggests they can tell the difference between themselves and others." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND p.title = 'The Mirror Test'
  AND q.question_text = 'Which of the following statements is true?';

UPDATE reading_passage_questions q
SET explanation = '"it has caused problems such as spreading incorrect information" および "As advertisements have increased... people are more likely to encounter wrong or misleading information." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'With an increase in advertisements in people''s daily lives,';

UPDATE reading_passage_questions q
SET explanation = '"Many countries have decided to control certain types of advertisements to protect people''s health and well-being." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why have some countries decided to control certain types of advertisements?';

UPDATE reading_passage_questions q
SET explanation = '"At first, electronic signs were not included in the ban." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Under São Paulo''s Clean City Law, electronic signs were';

UPDATE reading_passage_questions q
SET explanation = '"some people argued that banning advertisements could limit the right to advertise and freedom of speech." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'In Switzerland, some people think that';

UPDATE reading_passage_questions q
SET explanation = '"It has helped businesses share information about their products and increase sales." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND p.title = 'Stopping Advertisements'
  AND q.question_text = 'Which of the following statements is true?';

UPDATE reading_passage_questions q
SET explanation = '"They pollinate many of the crops that humans eat, including fruits, vegetables, and nuts." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why are bees important for humans?';

UPDATE reading_passage_questions q
SET explanation = '"Scientists have identified several causes. The use of certain pesticides can harm bees. Loss of habitat... leaves bees with fewer places to live" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'According to the passage, what has caused the decline of bees?';

UPDATE reading_passage_questions q
SET explanation = '"In cities, people have created ''bee hotels'' and rooftop gardens where bees can nest and find pollen." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What have some people in cities done to help bees?';

UPDATE reading_passage_questions q
SET explanation = '"Researchers are also studying wild bees, not only honeybees. There are thousands of species of bees." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What do researchers study besides honeybees?';

UPDATE reading_passage_questions q
SET explanation = '"The decline of bees is a global problem, but efforts by governments, farmers, and ordinary people can help slow it down and support the recovery of bee populations." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND p.title = 'Bees and Pollination'
  AND q.question_text = 'What do we learn from the passage?';

UPDATE reading_passage_questions q
SET explanation = '"Busy schedules, the use of smartphones and computers at night, and stress can all make it difficult to fall asleep or to sleep well." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why do many people not get enough sleep today?';

UPDATE reading_passage_questions q
SET explanation = '"over a long period it may increase the risk of conditions such as heart disease and diabetes." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Lack of sleep can';

UPDATE reading_passage_questions q
SET explanation = '"avoid screens for at least an hour before bed, because the light from devices can interfere with the body''s natural sleep cycle." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why do experts suggest avoiding screens before bed?';

UPDATE reading_passage_questions q
SET explanation = '"Exercise during the day can promote better sleep, but exercising too close to bedtime may have the opposite effect." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is said about exercise and sleep?';

UPDATE reading_passage_questions q
SET explanation = '"good sleep can improve memory, help with weight management, and support overall well-being." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND p.title = 'Sleep and Health'
  AND q.question_text = 'What do we learn from the passage?';

UPDATE reading_passage_questions q
SET explanation = '"The first machine that looked like a bicycle was built in Germany. It had no pedals; riders pushed it with their feet on the ground." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What was the first bicycle-like machine like?';

UPDATE reading_passage_questions q
SET explanation = '"This design is similar to the bicycles we use today and made cycling much safer and more practical." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'The "safety bicycle" made cycling';

UPDATE reading_passage_questions q
SET explanation = '"People are concerned about the environment and health, and bicycles produce no pollution and provide exercise." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why has interest in cycling grown again in recent decades?';

UPDATE reading_passage_questions q
SET explanation = '"They use a battery to assist the rider, making it easier to climb hills or travel long distances." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is true about electric bicycles?';

UPDATE reading_passage_questions q
SET explanation = '"it remains an important means of transport and a symbol of simple, sustainable mobility." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '2級' AND p.passage_type = 'long_content'
  AND p.title = 'History of the Bicycle'
  AND q.question_text = 'What do we learn from the passage?';
