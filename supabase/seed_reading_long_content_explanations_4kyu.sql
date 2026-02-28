-- seed_reading_long_content_explanations_4kyu.sql
-- 長文の内容一致（4級）の解説を reading_passage_questions.explanation に反映
-- 043 マイグレーションおよび seed_reading_long_content_4kyu_50.sql 実行後に実行

UPDATE reading_passage_questions q
SET explanation = '本文に "The library will be open from 9:00 a.m. to 5:00 p.m." とあるので、閉館は 5:00 p.m. です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When does the library close in summer?';

UPDATE reading_passage_questions q
SET explanation = '"Please return books by August 25 if you want to borrow more." より、さらに借りるにはその日までに返す必要があります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What should students do by August 25 if they want more books?';

UPDATE reading_passage_questions q
SET explanation = '"Please bring a hat and a water bottle." と書いてあります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What should people bring to Sports Day?';

UPDATE reading_passage_questions q
SET explanation = '"Send an e-mail to sports@northpark.com by September 10 to join." より、参加希望のメールは9月10日までです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When should people send an e-mail to join?';

UPDATE reading_passage_questions q
SET explanation = '"Today''s special: Apple pie and ice cream for $4." が今日のスペシャルです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What is today''s special?';

UPDATE reading_passage_questions q
SET explanation = '"Saturday and Sunday: 9:00 a.m. to 7:00 p.m." なので、日曜の閉店は 7:00 p.m. です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When does the cafe close on Sunday?';

UPDATE reading_passage_questions q
SET explanation = '"Tickets are $3 for students. Adults pay $5." とあります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How much do students pay for a ticket?';

UPDATE reading_passage_questions q
SET explanation = '"If you want to help us, talk to Mr. Green before December 10." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When should people talk to Mr. Green if they want to help?';

UPDATE reading_passage_questions q
SET explanation = '"Students: $3" と書かれています。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How much do students pay to use the pool?';

UPDATE reading_passage_questions q
SET explanation = '"The pool is closed on rainy days." がそのままの答えです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When is the pool closed?';

UPDATE reading_passage_questions q
SET explanation = '"Time: 9:00 a.m. to 4:00 p.m. both days" なので、日曜も 4:00 p.m. 終了です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What time does the book sale end on Sunday?';

UPDATE reading_passage_questions q
SET explanation = '"You can bring your old books and exchange them on March 10 or 11." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When can people bring their old books to exchange?';

UPDATE reading_passage_questions q
SET explanation = '"We will leave school at 8:30 a.m." とあります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What time will the students leave school?';

UPDATE reading_passage_questions q
SET explanation = '"Do not bring games or cameras." より、持ってきてはいけないのは games と cameras です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What should students NOT bring?';

UPDATE reading_passage_questions q
SET explanation = '"Where: Community Center (Room 201)" が場所です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where will the Art Show be?';

UPDATE reading_passage_questions q
SET explanation = '"We will have a short talk by a famous artist on November 8 at 2:00 p.m." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When is the talk by the famous artist?';

UPDATE reading_passage_questions q
SET explanation = 'Tom のメールに "My birthday party is on May 25 at 3:00 p.m." とあります。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When is Tom''s birthday party?';

UPDATE reading_passage_questions q
SET explanation = '"Can you bring some juice?" が Tom の依頼です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Tom ask Yuki to bring?';

UPDATE reading_passage_questions q
SET explanation = 'Yuki の返信 "I have a piano lesson until 2:00 p.m. on May 25, so I will come at 2:30 p.m." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why will Yuki come at 2:30 p.m.?';

UPDATE reading_passage_questions q
SET explanation = 'Emma の "I need help with the science homework." が目的です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why does Emma want to meet Ken?';

UPDATE reading_passage_questions q
SET explanation = 'Ken の "I have soccer practice until 3:30 p.m. on Friday." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Ken have before 4:00 p.m. on Friday?';

UPDATE reading_passage_questions q
SET explanation = '"I need help with the English report. Can you help me next week?" が Ken の依頼です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Ken ask Emma to do?';

UPDATE reading_passage_questions q
SET explanation = 'Lisa の "We will arrive by train at 11:00 a.m." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How will Lisa''s family get to the city?';

UPDATE reading_passage_questions q
SET explanation = 'Hiroki の "There is a nice restaurant near the park. ... We can go to the park first and then have lunch." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where will Hiroki and Lisa have lunch?';

UPDATE reading_passage_questions q
SET explanation = '"My sister wants to meet you too. She will come with me." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Who will come with Hiroki to meet Lisa?';

UPDATE reading_passage_questions q
SET explanation = 'Mike の "There is a concert on September 20 at 7:00 p.m. at City Hall." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where will the concert be?';

UPDATE reading_passage_questions q
SET explanation = 'Saki の "I have a math test on September 21. I need to study on the night of the 20th." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why does Saki need to leave the concert early?';

UPDATE reading_passage_questions q
SET explanation = '二人とも "I will meet you at the station at 6:30 p.m." と書いているので、駅で 6:30 p.m. が正解です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When will Mike and Saki meet?';

UPDATE reading_passage_questions q
SET explanation = 'Anna の "Our history project is due on October 20." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When is the history project due?';

UPDATE reading_passage_questions q
SET explanation = 'Riku の "I have a dentist appointment at 12:00. I will finish around 12:30. So I can come to the cafe at 1:30 p.m." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why will Riku come at 1:30 p.m. instead of 1:00 p.m.?';

UPDATE reading_passage_questions q
SET explanation = 'Anna の "I will bring the books we need." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What will Anna bring to the cafe?';

UPDATE reading_passage_questions q
SET explanation = 'David の "We will leave school at 7:00 a.m." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What time will they leave school for the ski trip?';

UPDATE reading_passage_questions q
SET explanation = 'David の "Don''t forget to give the permission form to Mr. Brown by November 8." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When should students give the permission form to Mr. Brown?';

UPDATE reading_passage_questions q
SET explanation = 'Mio の "do we need to bring our own lunch or will the school give us lunch?" が質問内容です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Mio ask David about?';

UPDATE reading_passage_questions q
SET explanation = '"Pochi is three years old." がそのままの答えです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How old is Pochi?';

UPDATE reading_passage_questions q
SET explanation = '"She also feeds him at 7:00 a.m. and 6:00 p.m. every day." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'When does Sarah feed Pochi?';

UPDATE reading_passage_questions q
SET explanation = '"The doctor said Pochi needed to rest for one week." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did the doctor say when Pochi was sick?';

UPDATE reading_passage_questions q
SET explanation = '"Sarah stayed with Pochi every day after school. She read books to him." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did Sarah do for Pochi when he was sick?';

UPDATE reading_passage_questions q
SET explanation = '"Sarah wants to work at an animal hospital when she grows up." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Sarah want to do when she grows up?';

UPDATE reading_passage_questions q
SET explanation = '"The game started at 10:00 a.m. at Central Stadium." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Where was the soccer game?';

UPDATE reading_passage_questions q
SET explanation = '"They were behind 2-0." が前半終了時のスコアです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What was the score at the end of the first half?';

UPDATE reading_passage_questions q
SET explanation = '"his friend Yuji passed the ball to Takeshi" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Who passed the ball to Takeshi for the last goal?';

UPDATE reading_passage_questions q
SET explanation = 'コーチの "You did a great job. Practice more and you will become a better player." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did the coach say to Takeshi after the game?';

UPDATE reading_passage_questions q
SET explanation = '"He wants to play in the national competition next year." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Takeshi want to do next year?';

UPDATE reading_passage_questions q
SET explanation = '"she visited her grandparents in the countryside for two weeks" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How long did Maya stay with her grandparents?';

UPDATE reading_passage_questions q
SET explanation = '"Every morning, Maya helped her grandmother in the garden. She watered the plants and picked tomatoes." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did Maya do every morning?';

UPDATE reading_passage_questions q
SET explanation = '"She was very happy when she caught her first fish." が理由です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Why was Maya very happy at the river?';

UPDATE reading_passage_questions q
SET explanation = '"Maya''s grandmother taught her how to make strawberry jam." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did Maya''s grandmother teach her?';

UPDATE reading_passage_questions q
SET explanation = '"Maya brought the jam back to Osaka." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did Maya bring back to Osaka?';

UPDATE reading_passage_questions q
SET explanation = '"Akari made a project about plants. She wanted to know: do plants grow better with music?" がテーマです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What was Akari''s project about?';

UPDATE reading_passage_questions q
SET explanation = '"She watered both plants every day for four weeks." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How long did Akari do her plant experiment?';

UPDATE reading_passage_questions q
SET explanation = '"She said the plant with music grew a little taller." が結果です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did Akari find in her experiment?';

UPDATE reading_passage_questions q
SET explanation = '"Akari won second prize." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What prize did Akari win?';

UPDATE reading_passage_questions q
SET explanation = '"Maybe I will study about light and plants." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What does Akari want to study next year?';

UPDATE reading_passage_questions q
SET explanation = '"They went by bus." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'How did Taro''s class get to the museum?';

UPDATE reading_passage_questions q
SET explanation = '"Taro was interested in the old maps." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What was Taro interested in at the museum?';

UPDATE reading_passage_questions q
SET explanation = '"He sent it to his grandfather." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Who did Taro send the postcard to?';

UPDATE reading_passage_questions q
SET explanation = '"Write a short report about what you saw. Bring it next week." が先生の指示です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'What did the teacher ask the students to do?';

UPDATE reading_passage_questions q
SET explanation = '"He wants to go to the museum again with his family." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '4級' AND p.passage_type = 'long_content'
  AND q.question_text = 'Taro wants to';
