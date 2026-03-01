-- seed_reading_long_fill_jun2kyu_50.sql
-- 英検準2級 長文の語句空所補充 50問（1パッセージ2空所形式）
-- 過去問形式: 約110〜150語の物語・説明文、空所2か所・各4肢選択。028 マイグレーション実行後に実行。

-- ========== 1: Friendship with Mrs. Philip (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'story', 'long_fill',
  E'Friendship with Mrs. Philip

Ellie is a high school student. Last year, her family moved to a town by the sea. Their neighbor, Mrs. Philip, welcomed them with a cherry pie. Ellie loved it and asked Mrs. Philip to teach her how to bake. One day, Mrs. Philip happily __BLANK__. During that time, they enjoyed cooking and talking together.

A few months later, Mrs. Philip had to leave for a month to take care of her sick brother. Ellie __BLANK__ every day. So, she started exchanging e-mails with Mrs. Philip. When Mrs. Philip came back, Ellie welcomed her with a pie she made herself. Mrs. Philip was very happy.',
  'Friendship with Mrs. Philip',
  E'Friendship with Mrs. Philip

Ellie is a high school student. Last year, her family moved to a town by the sea. Their neighbor, Mrs. Philip, welcomed them with a cherry pie. Ellie loved it and asked Mrs. Philip to teach her how to bake. One day, Mrs. Philip happily __BLANK__. During that time, they enjoyed cooking and talking together.

A few months later, Mrs. Philip had to leave for a month to take care of her sick brother. Ellie __BLANK__ every day. So, she started exchanging e-mails with Mrs. Philip. When Mrs. Philip came back, Ellie welcomed her with a pie she made herself. Mrs. Philip was very happy.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["gave Ellie a cherry pie", "told Ellie about a good bakery", "introduced other neighbors to Ellie", "invited Ellie to her home"]', 3
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["enjoyed swimming in the sea", "watched TV with him", "felt very sad and missed her", "went to her house"]', 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 2: A Friend in Spain (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'story', 'long_fill',
  E'A Friend in Spain

Sophie was born in America. She works in her hometown now. When she was in college, she studied abroad in Spain. There she met Andre, and they became good friends. They often talked about their dreams. One day, she asked __BLANK__. He said that he wanted to be an actor and was working hard on his training.

Five years later, Sophie was watching a Spanish movie. She saw a character who looked familiar. It was Andre! She found on the Internet that he had been an actor for a few years. She felt that __BLANK__. This made her so happy. She learned from this that she should also try to make her own dreams come true.',
  'A Friend in Spain',
  E'A Friend in Spain

Sophie was born in America. She works in her hometown now. When she was in college, she studied abroad in Spain. There she met Andre, and they became good friends. They often talked about their dreams. One day, she asked __BLANK__. He said that he wanted to be an actor and was working hard on his training.

Five years later, Sophie was watching a Spanish movie. She saw a character who looked familiar. It was Andre! She found on the Internet that he had been an actor for a few years. She felt that __BLANK__. This made her so happy. She learned from this that she should also try to make her own dreams come true.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["how he learned English", "where he hoped to live", "what he wanted to become", "why he had so many friends"]', 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["she must give up her dream", "she should become an actor", "he should have gone back to college", "he must have realized his dream"]', 3
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 3: Old Friends (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'story', 'long_fill',
  E'Old Friends

Ruby is a college student. She is from a small town but now lives in New York. Last summer, she went back to her hometown. She found that her childhood friend Alfred''s house was no longer there. His family had moved away. __BLANK__, she decided to try to contact him. She had not talked to him for a long time.

Ruby sent him a message. They agreed to meet. They had not seen each other for a long time but did not feel uncomfortable at all. __BLANK__. Ruby realized how important childhood friends are.',
  'Old Friends',
  E'Old Friends

Ruby is a college student. She is from a small town but now lives in New York. Last summer, she went back to her hometown. She found that her childhood friend Alfred''s house was no longer there. His family had moved away. __BLANK__, she decided to try to contact him. She had not talked to him for a long time.

Ruby sent him a message. They agreed to meet. They had not seen each other for a long time but did not feel uncomfortable at all. __BLANK__. Ruby realized how important childhood friends are.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["When her college called her", "While she was there", "When her family visited her", "When she was in New York"]', 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["had a great time together", "learned making new friends was great", "felt sorry about each other''s pets", "found it hard to have conversations"]', 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 4: A Summer Job ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'story', 'long_fill',
  E'A Summer Job

Ken wanted to save money for a new computer. He was only fifteen, so he could not work at most places. __BLANK__, he asked his uncle if he could help at his flower shop. His uncle said yes and promised to pay him a little each week.

Ken worked there every morning for two months. He learned how to take care of flowers and how to talk to customers. __BLANK__. He was able to buy the computer he wanted and also made a good memory with his uncle.',
  'A Summer Job',
  E'A Summer Job

Ken wanted to save money for a new computer. He was only fifteen, so he could not work at most places. __BLANK__, he asked his uncle if he could help at his flower shop. His uncle said yes and promised to pay him a little each week.

Ken worked there every morning for two months. He learned how to take care of flowers and how to talk to customers. __BLANK__. He was able to buy the computer he wanted and also made a good memory with his uncle.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "So", "At last", "One day"]', 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["He did not like the job", "In the end, he was glad he had tried", "His uncle was angry", "The shop closed"]', 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 5: The Lost Key ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'story', 'long_fill',
  E'The Lost Key

Yuki was going to meet her friend at the station. She left her house in a hurry. When she got to the station, she could not find her train card. She looked in her bag again and again. __BLANK__, she remembered that she had left it on the table at home.

She had to go back. She was late for the meeting. When she arrived, her friend was still waiting. Yuki said she was sorry. Her friend said, "Don''t worry. __BLANK__." Yuki was relieved and they had a good time together.',
  'The Lost Key',
  E'The Lost Key

Yuki was going to meet her friend at the station. She left her house in a hurry. When she got to the station, she could not find her train card. She looked in her bag again and again. __BLANK__, she remembered that she had left it on the table at home.

She had to go back. She was late for the meeting. When she arrived, her friend was still waiting. Yuki said she was sorry. Her friend said, "Don''t worry. __BLANK__." Yuki was relieved and they had a good time together.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Suddenly", "Yesterday", "Next week", "At the station"]', 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["I will go home", "It happens to everyone", "You are always late", "I did not want to see you"]', 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 6 ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'story', 'long_fill',
  E'My First Concert

Tom had never been to a live concert. His favorite band was coming to his city. He asked his older sister to go with him. She said yes. __BLANK__, they bought tickets online and waited for the day.

On the day of the concert, the hall was full of people. When the music started, Tom felt very excited. __BLANK__. He decided he would go to more concerts in the future.',
  'My First Concert',
  E'My First Concert\n\nTom had never been to a live concert. His favorite band was coming to his city. He asked his older sister to go with him. She said yes. __BLANK__, they bought tickets online and waited for the day.\n\nOn the day of the concert, the hall was full of people. When the music started, Tom felt very excited. __BLANK__. He decided he would go to more concerts in the future.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "So", "Still", "Later"]', 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["He did not enjoy it", "He had a wonderful time", "His sister left early", "The band did not come"]', 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 7 ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'story', 'long_fill',
  E'A Letter from Grandma

Mika lives in Tokyo. Her grandmother lives in the countryside. They do not see each other often. Last week, Mika received a letter from her grandmother. __BLANK__. She wrote about her garden and the birds she saw every morning.

Mika wanted to reply. She sat down and wrote a long letter about her school and her new friends. She also put in a photo. When her grandmother got the letter, she called Mika. __BLANK__. Mika was happy to hear her voice.',
  'A Letter from Grandma',
  E'A Letter from Grandma\n\nMika lives in Tokyo. Her grandmother lives in the countryside. They do not see each other often. Last week, Mika received a letter from her grandmother. __BLANK__. She wrote about her garden and the birds she saw every morning.\n\nMika wanted to reply. She sat down and wrote a long letter about her school and her new friends. She also put in a photo. When her grandmother got the letter, she called Mika. __BLANK__. Mika was happy to hear her voice.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["It was from her friend", "It made her very happy", "She did not read it", "It was about school"]', 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["She was angry", "She said she was very glad", "She did not answer", "She sent another letter"]', 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 8 ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'story', 'long_fill',
  E'The School Festival

Our school festival was last Saturday. Many students worked hard to prepare for it. Our class decided to sell sandwiches and juice. __BLANK__, we had to buy ingredients and make a lot of sandwiches. It was tiring but we had fun working together.

On the day of the festival, many people came. We sold almost everything. __BLANK__. We are already thinking about what to do next year.',
  'The School Festival',
  E'The School Festival\n\nOur school festival was last Saturday. Many students worked hard to prepare for it. Our class decided to sell sandwiches and juice. __BLANK__, we had to buy ingredients and make a lot of sandwiches. It was tiring but we had fun working together.\n\nOn the day of the festival, many people came. We sold almost everything. __BLANK__. We are already thinking about what to do next year.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["After that", "Before the festival", "So", "Because"]', 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nobody came", "We were very disappointed", "It was a great success", "We closed early"]', 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 9 ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'story', 'long_fill',
  E'A Trip to the Mountain

Last summer, my family went to the mountains. We stayed at a small hotel for three days. On the first day, we went hiking. The view from the top was beautiful. __BLANK__, we took many photos and had lunch there.

On the second day, it rained. We could not go outside. __BLANK__. We played board games and read books. It was a different kind of fun. I want to go back again next year.',
  'A Trip to the Mountain',
  E'A Trip to the Mountain\n\nLast summer, my family went to the mountains. We stayed at a small hotel for three days. On the first day, we went hiking. The view from the top was beautiful. __BLANK__, we took many photos and had lunch there.\n\nOn the second day, it rained. We could not go outside. __BLANK__. We played board games and read books. It was a different kind of fun. I want to go back again next year.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "So", "Then", "Still"]', 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["We went hiking again", "We stayed inside the hotel", "We went home early", "We were very sad"]', 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 10 ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'story', 'long_fill',
  E'A New Hobby

Emma''s brother started playing the guitar. She often heard him practice in his room. One day, she asked him to teach her a few chords. __BLANK__. He was happy to show her. She practiced every day after school.

After a few months, Emma could play a simple song. Her brother said she was getting better. __BLANK__. Now they sometimes play music together on weekends.',
  'A New Hobby',
  E'A New Hobby\n\nEmma''s brother started playing the guitar. She often heard him practice in his room. One day, she asked him to teach her a few chords. __BLANK__. He was happy to show her. She practiced every day after school.\n\nAfter a few months, Emma could play a simple song. Her brother said she was getting better. __BLANK__. Now they sometimes play music together on weekends.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["He said no", "He said he was too busy", "He said yes", "He left the room"]', 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["She stopped practicing", "She was proud of herself", "She gave up", "She sold the guitar"]', 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 11–20 ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Birthday Surprise\n\nIt was Mom''s birthday. Dad and I wanted to do something special. We decided to make dinner together. __BLANK__, we looked for a good recipe online. We chose her favorite pasta.\n\nWe cooked while Mom was at work. When she came home, the table was set. She was very surprised. __BLANK__. That night we had a wonderful time as a family.', 'The Birthday Surprise', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["First", "Finally", "So", "But"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["She was not hungry", "She said thank you and smiled", "She went to bed", "She was angry"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Rainy Day\n\nIt was raining hard. I had no umbrella. I was waiting for the bus when a woman came and stood next to me. She had a big umbrella. __BLANK__. I said thank you. We talked a little while we waited.\n\nThe bus came. We got on together. When I got off, I said thank you again. She smiled. __BLANK__. I will never forget her kindness.', 'A Rainy Day', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["She left", "She shared her umbrella with me", "She was angry", "She ran away"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I was sad", "It was a small thing but it meant a lot", "I did not see her again", "She asked for money"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'Learning to Swim\n\nI was afraid of water. My friend Lisa could swim well. She said she would teach me. We went to the pool every Saturday. __BLANK__, I could only put my face in the water. Lisa was patient.\n\nAfter two months, I could swim a short distance. I was so happy. __BLANK__. Now I like going to the pool with my friends.', 'Learning to Swim', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["At first", "At last", "So", "Then"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I gave up", "I was proud of myself", "Lisa was angry", "I never went back"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Lost Dog\n\nA small dog was running in the park. It had no collar. A boy was calling its name. The dog looked scared. I walked slowly toward it. __BLANK__. Soon it let me come close. I picked it up gently.\n\nI took the dog to the boy. He was so happy. He said the dog had run away that morning. __BLANK__. I was glad I could help.', 'The Lost Dog', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["I ran away", "I did not move", "I spoke to it in a soft voice", "I shouted"]', 2 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["He was angry", "He said thank you many times", "He left", "He did not want the dog"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Present for Dad\n\nFather''s Day was coming. I wanted to give Dad something special. He liked to drink coffee in the morning. __BLANK__, I decided to buy him a nice coffee cup. I saved my pocket money for a month.\n\nOn Father''s Day, I gave him the cup. He was surprised and happy. He said he would use it every day. __BLANK__. I felt good.', 'A Present for Dad', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "But", "However", "Then"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["He did not like it", "He smiled and thanked me", "He gave it back", "He was sad"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'Moving to a New School\n\nI moved to a new town in April. I had to go to a new school. I was nervous. On the first day, a girl in my class said hello. Her name was Saki. __BLANK__. She showed me around the school and ate lunch with me.\n\nNow Saki is my best friend. We study together and play after school. __BLANK__. I am glad I met her.', 'Moving to a New School', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["She ignored me", "She was very kind", "She was busy", "She left early"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I have no friends", "I feel at home now", "I want to move again", "I am still nervous"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Science Project\n\nOur teacher said we would have a science project. We could work in pairs. I asked my friend Ben to be my partner. We chose to study plants. __BLANK__, we read books and did experiments. We wrote down what we saw.\n\nOn the day we presented our project, the teacher said we did a good job. __BLANK__. We were both happy.', 'The Science Project', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["For two weeks", "So", "However", "At last"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["We failed", "We got a high grade", "We had to do it again", "We were sad"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Trip to the Library\n\nI needed a book for my report. I went to the library. I could not find the book on the shelf. A librarian asked if I needed help. I told her the name of the book. __BLANK__. She found it on the computer and went to get it for me.\n\nI took the book home and read it. It had exactly what I needed. __BLANK__. I will ask the librarians when I need help again.', 'A Trip to the Library', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["She said no", "She said she would help me", "She was busy", "She left"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I was disappointed", "I was grateful", "I did not read it", "I lost the book"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'Grandpa''s Story\n\nMy grandfather likes to talk about the past. When I visit him, he tells me stories. Last week he told me about his first job. __BLANK__. He had to get up at five every morning. He said it was hard but he learned a lot.\n\nI enjoy listening to his stories. __BLANK__. I want to remember them when I am older.', 'Grandpa''s Story', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["He worked at a bakery", "He did not work", "He was a teacher", "He stayed home"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["They are boring", "They are always interesting", "I don''t believe him", "I forget them"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Soccer Game\n\nOur team had an important game on Sunday. We had practiced every day. On the day of the game, the other team was strong. We were behind by one goal at half time. __BLANK__, our coach said we could do it. We went back to the field with more energy.\n\nIn the last minute, I got the ball and passed it to Ken. He shot and scored. The game was a tie. __BLANK__. We were proud of ourselves.', 'The Soccer Game', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["However", "So", "In the break", "Then"]', 2 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["We lost", "We did our best", "We gave up", "We were sad"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 21–30 ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'Cooking with Mom\n\nMom was making dinner. I asked if I could help. She said yes and gave me a job. I had to cut the vegetables. __BLANK__. I was careful not to cut my fingers. Mom said I did well.\n\nWe sat down to eat. The food was delicious. __BLANK__. I want to help in the kitchen again.', 'Cooking with Mom', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["I did it slowly", "I ran away", "I broke the plate", "I was tired"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I did not like it", "I was proud of our meal", "Mom was angry", "We ordered pizza"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Broken Bicycle\n\nMy bicycle had a flat tire. I did not know how to fix it. I took it to a shop near my house. The man there said he could fix it in an hour. __BLANK__, I walked around the town. I found a small park I had never seen before.\n\nWhen I went back, the bicycle was ready. I paid and rode home. __BLANK__. I was glad I had found the shop.', 'The Broken Bicycle', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["While I waited", "So", "However", "Then"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["It was still broken", "It was as good as new", "I lost it", "I was sad"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Surprise Party\n\nMy friends wanted to have a surprise party for me. They did not tell me anything. On my birthday, my friend asked me to come to her house. When I opened the door, everyone shouted "Happy Birthday!" __BLANK__. I had no idea they were planning it.\n\nWe had cake and played games. __BLANK__. It was the best birthday I have ever had.', 'A Surprise Party', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["I was not surprised", "I was very surprised", "I was angry", "I went home"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["Nobody had fun", "I had a great time", "I left early", "We fought"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The English Speech\n\nI had to give a speech in English at school. I was very nervous. I practiced every day in front of the mirror. __BLANK__, I could not remember the words. But I kept trying.\n\nOn the day of the speech, I took a deep breath and started. I made a small mistake but I did not stop. __BLANK__. My teacher said I did a good job.', 'The English Speech', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["At first", "So", "However", "Finally"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I forgot everything", "I finished my speech", "I ran away", "I started to cry"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'Helping at the Park\n\nOur class went to clean the park. We picked up trash and pulled weeds. It was a sunny day and the work was tiring. __BLANK__, we took a break and drank water. Our teacher said we were doing a good job.\n\nWhen we finished, the park looked much better. An old man who was walking there said thank you. __BLANK__. I want to do it again.', 'Helping at the Park', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["In the middle", "At the end", "So", "But"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I was bored", "I felt good about what we did", "I was angry", "I went home"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Art Class\n\nI joined an art class at the community center. I had never painted before. The teacher showed us how to mix colors. __BLANK__, my painting did not look good. The teacher said everyone starts that way.\n\nI kept going to the class. After a few months, I could paint a simple landscape. __BLANK__. I still go to the class every week.', 'The Art Class', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["At first", "So", "Then", "At last"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I gave up", "I was proud of my progress", "I left the class", "I was sad"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Visit to the Museum\n\nWe went to the history museum on a school trip. There were many old things to see. Our guide told us stories about the past. __BLANK__, I was not very interested. But when she started talking about how people lived long ago, I listened carefully.\n\nI learned a lot that day. __BLANK__. I want to go back with my family.', 'A Visit to the Museum', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["At first", "So", "However", "Then"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I was bored", "It was a great experience", "I forgot everything", "I left early"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Stray Cat\n\nA thin cat was sitting in front of our house. It looked hungry. I gave it some milk and fish. The cat ate everything. __BLANK__, it came back every day. We started to leave food out for it.\n\nAfter a few weeks, the cat let us pet it. We decided to take it to the vet and then keep it. __BLANK__. We named it Tora and now it is part of our family.', 'The Stray Cat', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["After that", "So", "However", "Then"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["The cat ran away", "The cat became our pet", "We gave it away", "We were sad"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The School Play\n\nOur class was going to do a play. I wanted to be in it. The teacher said we would have auditions. I practiced my lines many times. __BLANK__, I was chosen for a small role. I was happy.\n\nWe practiced for a month. On the day of the play, I was nervous but I did my best. __BLANK__. My parents said they enjoyed it.', 'The School Play', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["However", "So", "In the end", "Then"]', 2 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["We failed", "Everything went well", "I forgot my lines", "Nobody came"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Message from an Old Friend\n\nI got an e-mail from Mike. We were good friends in elementary school but he moved away. I had not heard from him for five years. __BLANK__. He said he was coming to my city and wanted to meet.\n\nWe met at a café. We talked for two hours. He had changed a little but we had a lot to talk about. __BLANK__. We promised to keep in touch.', 'A Message from an Old Friend', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["I was surprised", "I was not interested", "I was angry", "I forgot him"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["It was boring", "It was like old times", "We had a fight", "We did not talk"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Summer Festival\n\nOur town has a summer festival every year. There are food stalls and games. Last year I went with my family. We ate yakisoba and watched the dance. __BLANK__, we saw fireworks. The sky was full of colors.\n\nI took many photos. When I look at them now, I remember that night. __BLANK__. I am looking forward to the next festival.', 'The Summer Festival', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["At the end", "So", "However", "First"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["It was a bad night", "It was a wonderful memory", "I was tired", "I want to forget it"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 31–40 ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Bad Cold\n\nI had a bad cold last week. I had to stay in bed. I could not go to school. My friend Yuki brought my homework to my house. __BLANK__. She said the class missed me. I was glad to hear that.\n\nAfter three days, I felt better. I went back to school. My friends asked how I was. __BLANK__. I was happy to have such good friends.', 'A Bad Cold', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["She did not come", "She stayed for a while and talked", "She was busy", "She left quickly"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["Nobody cared", "They were kind to me", "They were angry", "I was alone"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Book Report\n\nI had to write a book report for English class. I chose a mystery novel. I read it every night before bed. __BLANK__, I finished it in two weeks. I liked the ending.\n\nI wrote my report and handed it in. The teacher said I had written a good summary. __BLANK__. I want to read more books by the same author.', 'The Book Report', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "At last", "However", "Then"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I was disappointed", "I was happy with the result", "I failed", "I did not care"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'Learning from Mistakes\n\nI failed the math test. I had not studied enough. I was sad and a little ashamed. My teacher said I could take the test again if I studied more. __BLANK__, I made a study plan and followed it every day.\n\nI took the test again. This time I passed. __BLANK__. I learned that hard work can make a difference.', 'Learning from Mistakes', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "However", "Then", "But"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I was still sad", "I was proud of myself", "I gave up", "I did not care"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Tennis Match\n\nI play tennis at school. Last month we had a match against another school. The score was very close. In the last set, I was serving. My hands were shaking. __BLANK__, I took a deep breath and hit the ball. We won the point and the match.\n\nMy team ran to me and cheered. __BLANK__. I will never forget that moment.', 'The Tennis Match', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "Then", "However", "At that moment"]', 3 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I was sad", "I was so happy", "I left", "Nobody cared"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Gift for My Sister\n\nMy sister was going to study abroad. I wanted to give her something useful. I did not have much money. __BLANK__, I decided to make a small photo album. I put in pictures of our family and our trips together.\n\nWhen I gave it to her, she looked at every page. She said she would take it with her and look at it when she felt lonely. __BLANK__. I was glad I had made it.', 'A Gift for My Sister', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "However", "Then", "But"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["She did not like it", "She seemed to really like it", "She threw it away", "She was angry"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Interview\n\nI had to go to an interview for a part-time job. I was nervous. I wore a clean shirt and practiced what I would say. When I entered the room, the manager smiled. __BLANK__. She asked me about my school and my interests. I tried to answer clearly.\n\nA week later, I got a call. They said I had the job. __BLANK__. I could not believe it at first.', 'The Interview', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["She was strict", "She was friendly", "She was busy", "She left the room"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I was disappointed", "I was very happy", "I did not want the job", "I was confused"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Walk in the Morning\n\nI started getting up early to take a walk. At first it was hard. __BLANK__, I got used to it. I liked the quiet streets and the fresh air. Sometimes I saw the same people and we said good morning.\n\nNow I look forward to my morning walk. __BLANK__. I feel more energetic during the day.', 'A Walk in the Morning', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "But after a week", "However", "Then"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I am always tired", "It has become a good habit", "I stopped", "I hate it"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The School Trip\n\nWe went to Kyoto on our school trip. We visited many temples and ate traditional food. On the second day, we had free time. My friends and I walked around the old streets. __BLANK__, we found a small shop that sold sweets. We bought some and ate them by the river.\n\nOn the last day, we took a lot of group photos. __BLANK__. I want to go back to Kyoto again.', 'The School Trip', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "Then", "However", "At one point"]', 3 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["It was boring", "It was a great way to end the trip", "We were sad", "We fought"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'Volunteering\n\nI joined a volunteer group that helps clean the beach. We meet once a month. The first time I went, I was surprised by how much trash there was. __BLANK__, we filled many bags. I felt tired but also good.\n\nNow I always go when I can. __BLANK__. I have also made new friends in the group.', 'Volunteering', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["After a few hours", "So", "However", "Then"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I quit", "I think it is meaningful", "I am bored", "I go alone"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Piano Recital\n\nI had been taking piano lessons for two years. My teacher said I was ready for a recital. I had to play in front of many people. I practiced the same piece every day. __BLANK__, I could play it without looking at the music.\n\nOn the day of the recital, I was nervous. When I sat down at the piano, I took a deep breath. __BLANK__. The audience clapped. I was relieved and happy.', 'The Piano Recital', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["At last", "So", "However", "Then"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I made many mistakes", "I played as I had practiced", "I forgot everything", "I ran away"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A New Neighbor\n\nA new family moved in next door. I saw a girl about my age. I wanted to say hello but I was shy. One day she was in her garden. __BLANK__, I went outside and said hi. She smiled and said hi back. We started talking.\n\nNow we often walk to school together. __BLANK__. I am glad I said hello that day.', 'A New Neighbor', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "Then", "However", "Finally"]', 3 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["We never talk", "We have become good friends", "She moved away", "I am still shy"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 41–50 ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Cooking Contest\n\nOur school had a cooking contest. I entered with my friend. We decided to make curry rice. We practiced at my house many times. __BLANK__, we could make it taste good. We added a little secret ingredient.\n\nOn the day of the contest, we cooked in front of the judges. We were nervous but we did our best. __BLANK__. We won second place. We were so happy.', 'The Cooking Contest', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["At first", "So", "In the end", "However"]', 2 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["We failed", "The result was announced", "We left early", "Nobody liked it"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Letter to My Future Self\n\nOur teacher asked us to write a letter to ourselves. We would open it in three years. I wrote about my dreams and what I wanted to do. __BLANK__, I wrote about my friends and my family. I sealed the letter and gave it to the teacher.\n\nI often wonder what I will think when I read it. __BLANK__. I hope I have worked hard and am closer to my dreams.', 'A Letter to My Future Self', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "I also", "However", "Then"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I don''t care", "I hope I will be proud of myself", "I will be sad", "I will forget it"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Broken Window\n\nI was playing catch in the yard. I threw the ball too hard. It hit the window and the glass broke. I was scared. I went inside and told my father. __BLANK__. He said we would fix it together. He was not angry.\n\nWe went to the store and bought new glass. We put it in together. __BLANK__. I learned that it is better to tell the truth when something goes wrong.', 'The Broken Window', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["He was very angry", "He listened to me", "He did not believe me", "He left"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I was punished", "My father said he was proud that I had told him", "We never fixed it", "I was sad"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The First Snow\n\nI woke up and looked out the window. Everything was white. It had snowed in the night. I had never seen so much snow. __BLANK__, I put on my coat and ran outside. I made a snowman with my brother.\n\nWe had a snowball fight. Our hands were cold but we did not want to go inside. __BLANK__. I hope it snows again next winter.', 'The First Snow', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "However", "Then", "Later"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["It was boring", "It was a wonderful day", "We were tired", "We got sick"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Homework Help\n\nMy classmate was having trouble with math. She asked me if I could help her. I was not the best at math but I said I would try. We sat down after school. __BLANK__, I explained the problem step by step. She listened carefully and asked questions.\n\nAfter an hour, she said she understood. She thanked me. __BLANK__. I felt good that I could help someone.', 'The Homework Help', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "Together", "However", "Then"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I was tired", "I was happy to hear that", "I was bored", "I left"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Old Camera\n\nI found an old camera in my grandfather''s room. He said I could have it. It used film, not a memory card. I had never used one before. __BLANK__, my grandfather showed me how to put in the film and take a picture. I took a photo of him.\n\nWhen the film was developed, the photo came out well. __BLANK__. I still keep that photo in my room.', 'The Old Camera', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "Then", "However", "First"]', 3 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I lost it", "I was happy with it", "It was blurry", "I was disappointed"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Talent Show\n\nOur school had a talent show. I wanted to do something but I was not sure what. My friend said we could sing a song together. We practiced for two weeks. __BLANK__, we could sing it well. We chose a popular song that everyone knew.\n\nOn the day of the show, we stood on the stage. The lights were bright. We started to sing. __BLANK__. When we finished, everyone clapped. We were so nervous but also very happy.', 'The Talent Show', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["At last", "So", "However", "Then"]', 0 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["We forgot the words", "We did our best", "We stopped", "Nobody listened"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Visit to the Farm\n\nWe went to a farm on a class trip. We saw cows, chickens, and pigs. The farmer let us feed the chickens. __BLANK__, we picked fresh vegetables. We had never seen vegetables growing in the ground before.\n\nWe had lunch at the farm. The salad was made from the vegetables we had picked. __BLANK__. I learned that food comes from the hard work of many people.', 'A Visit to the Farm', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "Then", "However", "After that"]', 3 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["It was not delicious", "It tasted very fresh", "We did not eat", "We were full"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Lost Wallet\n\nI was walking home when I found a wallet on the ground. I picked it up. There was money and a student ID inside. I did not know what to do. __BLANK__, I took it to the police station. The officer said thank you and took my name.\n\nTwo days later, the owner of the wallet called me. He was a student from another school. He said he wanted to thank me in person. __BLANK__. He said he was very grateful. I was glad I had done the right thing.', 'The Lost Wallet', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "Then", "However", "Finally"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["He was angry", "We met and he thanked me", "He did not come", "He asked for more money"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'The Last Day of School\n\nIt was the last day of the school year. We cleaned our classroom and said goodbye to our teacher. She had been kind to us all year. __BLANK__, we gave her a thank-you card that we had all signed. She smiled and said she would miss us.\n\nI felt a little sad to leave that class. __BLANK__. I will remember the fun we had and the things we learned.', 'The Last Day of School', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["So", "Then", "However", "At the end"]', 3 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["I was happy to leave", "But I was also excited for the next year", "I forgot everything", "I was angry"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content) VALUES ('準2級','story','long_fill', E'A Dream Come True\n\nI had always wanted to see the ocean. I had only seen it in pictures. Last summer, my family went to the beach. When I first saw the blue water, I could not say anything. __BLANK__. I ran to the water and felt the waves on my feet.\n\nWe stayed for three days. I swam and built sandcastles. __BLANK__. I took many photos to remember it. I hope I can go again.', 'A Dream Come True', '');
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 0, '["I was disappointed", "I was so excited", "I was tired", "I was scared"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index) SELECT id, 1, '["It was boring", "It was the best trip ever", "I got sunburned", "I wanted to go home"]', 1 FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
