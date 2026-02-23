-- seed_reading_long_content_3kyu_50.sql
-- 英検3級 長文の内容一致選択 約54問（掲示・Eメール・説明文）
-- 過去3回分の過去問傾向（3A掲示2問／3Bメール3問／3C説明文5問）に合わせた形式
-- 028 マイグレーション実行後に実行

-- ========== 3A 掲示・案内（各2問）==========

-- Passage 1: Volunteer Work
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'notice', 'long_content',
  'Volunteer Work

Are you interested in volunteering? There will be an event on Sunday morning for students to clean up the local park. Recently, Maplewood Park has been dirty. Volunteers will pick up all the trash and throw it away.

There will be gloves for volunteers to use. City staff members will prepare three trash cans. The red can will be for plastic bottles, the blue can will be for other plastic, and the yellow can will be for paper. The city staff will give lunch to all volunteers after cleaning. Volunteers should bring their own drinks.

When: September 19, 10:00 a.m. to 12:30 p.m.
Where: Maplewood Park',
  'Volunteer Work',
  'Volunteer Work

Are you interested in volunteering? There will be an event on Sunday morning for students to clean up the local park. Recently, Maplewood Park has been dirty. Volunteers will pick up all the trash and throw it away.

There will be gloves for volunteers to use. City staff members will prepare three trash cans. The red can will be for plastic bottles, the blue can will be for other plastic, and the yellow can will be for paper. The city staff will give lunch to all volunteers after cleaning. Volunteers should bring their own drinks.

When: September 19, 10:00 a.m. to 12:30 p.m.
Where: Maplewood Park'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Which trash can will the volunteers throw away paper in?',
  '["The red one.", "The green one.", "The blue one.", "The yellow one."]', 3, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What will the city staff do on September 19?',
  '["Sell cold drinks at the park.", "Throw away old gloves.", "Give lunch to the volunteers.", "Buy colorful plastic bottles."]', 2, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 2: To All Students
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'notice', 'long_content',
  'To All Students

We have a new librarian. Her name is Ms. Wilson. She worked at a bookstore for eight years and at the library at the local university for five years. We will have a welcome party for her next week.

At the welcome party, she will introduce herself. You can ask her questions. After that, you will have some time to talk to her and others. You can enjoy free drinks and snacks.

When: Friday, April 17, 3:30 p.m. to 5:00 p.m.
Where: School gym

If you are interested in the party, please tell your homeroom teacher before six o''clock on April 10.',
  'To All Students',
  'To All Students

We have a new librarian. Her name is Ms. Wilson. She worked at a bookstore for eight years and at the library at the local university for five years. We will have a welcome party for her next week.

At the welcome party, she will introduce herself. You can ask her questions. After that, you will have some time to talk to her and others. You can enjoy free drinks and snacks.

When: Friday, April 17, 3:30 p.m. to 5:00 p.m.
Where: School gym

If you are interested in the party, please tell your homeroom teacher before six o''clock on April 10.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How long did Ms. Wilson work at the local university''s library?',
  '["For five years.", "For six years.", "For eight years.", "For ten years."]', 0, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'At the welcome party, students can',
  '["meet many people from a foreign university.", "enjoy drinks and snacks for free.", "play sports in the gym.", "watch a new movie."]', 1, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 3: Notice - School Trip
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'notice', 'long_content',
  'Notice

Blue Sky Junior High School will have a school trip on Wednesday, October 18. We will visit a house built in the 17th century. The house has many rooms: an old kitchen, a living room, and bedrooms. There is also a garden outside.

The trip will be from 10:00 a.m. to 3:00 p.m. Students must bring their own lunch. We will eat together in the garden after the tour. You can bring a camera to take pictures of the garden, but please do not take pictures inside the house. All students must write a report about the house by November 1.',
  'Notice',
  'Notice

Blue Sky Junior High School will have a school trip on Wednesday, October 18. We will visit a house built in the 17th century. The house has many rooms: an old kitchen, a living room, and bedrooms. There is also a garden outside.

The trip will be from 10:00 a.m. to 3:00 p.m. Students must bring their own lunch. We will eat together in the garden after the tour. You can bring a camera to take pictures of the garden, but please do not take pictures inside the house. All students must write a report about the house by November 1.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What must students do on October 18?',
  '["Clean the garden.", "Take pictures of the house.", "Bring their own lunch.", "Take an exam at school."]', 2, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where can students take photos during the tour?',
  '["In the kitchen.", "In the garden.", "In the bedrooms.", "In the living room."]', 1, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 4: Art Club
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'notice', 'long_content',
  'Art Club - Painting Class

We will have a painting class for students on Saturday, November 12. The class will start at 2:00 p.m. and end at 4:30 p.m. It will be in Room 201 at the Community Center.

Mr. Tanaka, a famous artist, will teach us how to paint landscapes. Please bring your own brushes and paper. We will provide paint. If you want to join, please send an e-mail to art@community.org by November 5. The class is free, but we can only accept 20 students.',
  'Art Club - Painting Class',
  'Art Club - Painting Class

We will have a painting class for students on Saturday, November 12. The class will start at 2:00 p.m. and end at 4:30 p.m. It will be in Room 201 at the Community Center.

Mr. Tanaka, a famous artist, will teach us how to paint landscapes. Please bring your own brushes and paper. We will provide paint. If you want to join, please send an e-mail to art@community.org by November 5. The class is free, but we can only accept 20 students.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When will the painting class end?',
  '["At 2:00 p.m.", "At 3:00 p.m.", "At 4:30 p.m.", "At 5:00 p.m."]', 2, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'By when should students send an e-mail to join?',
  '["By November 5.", "By November 12.", "By December 1.", "By December 5."]', 0, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 5: Science Museum
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'notice', 'long_content',
  'Science Museum - Special Event

On Sunday, March 20, we will have a special event for families. You can see how robots work and try to control them. The event will be from 9:30 a.m. to 12:00 p.m.

Tickets are 500 yen for adults and 200 yen for students. Children under 6 are free. You can buy tickets at the museum entrance. Please come early because we have a limit of 100 people. For more information, call 03-1234-5678.',
  'Science Museum - Special Event',
  'Science Museum - Special Event

On Sunday, March 20, we will have a special event for families. You can see how robots work and try to control them. The event will be from 9:30 a.m. to 12:00 p.m.

Tickets are 500 yen for adults and 200 yen for students. Children under 6 are free. You can buy tickets at the museum entrance. Please come early because we have a limit of 100 people. For more information, call 03-1234-5678.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How much do students pay for a ticket?',
  '["100 yen.", "200 yen.", "500 yen.", "Free."]', 1, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why should people come early?',
  '["The museum opens late.", "There is a limit of 100 people.", "Tickets are cheaper in the morning.", "The robots stop working at noon."]', 1, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 6: Book Week
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'notice', 'long_content',
  'Book Week at Our School

We will have Book Week from Monday, June 5 to Friday, June 9. Every day at lunch time, a teacher will read a story in the library. On Wednesday, June 7, a writer will visit our school and talk about her new book. The talk will be in the school hall from 1:00 p.m. to 2:00 p.m. All students are welcome. Please bring your student ID.',
  'Book Week at Our School',
  'Book Week at Our School

We will have Book Week from Monday, June 5 to Friday, June 9. Every day at lunch time, a teacher will read a story in the library. On Wednesday, June 7, a writer will visit our school and talk about her new book. The talk will be in the school hall from 1:00 p.m. to 2:00 p.m. All students are welcome. Please bring your student ID.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When will the writer visit the school?',
  '["On Monday.", "On Wednesday, June 7.", "On Friday.", "At lunch time."]', 1, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where will the writer''s talk be?',
  '["In the library.", "In the classroom.", "In the school hall.", "At lunch."]', 2, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 7: Tennis Club
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'notice', 'long_content',
  'Tennis Club - Summer Practice

Summer practice will start on July 1. We will practice every Tuesday and Thursday from 4:00 p.m. to 6:00 p.m. at the school tennis court. Please bring your racket, a hat, and a water bottle. We will have a match with Green Hill School on July 25. If you want to join the match, tell the captain by July 10. New members are welcome!',
  'Tennis Club - Summer Practice',
  'Tennis Club - Summer Practice

Summer practice will start on July 1. We will practice every Tuesday and Thursday from 4:00 p.m. to 6:00 p.m. at the school tennis court. Please bring your racket, a hat, and a water bottle. We will have a match with Green Hill School on July 25. If you want to join the match, tell the captain by July 10. New members are welcome!'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'On which days will the club practice?',
  '["Monday and Wednesday.", "Tuesday and Thursday.", "Friday and Saturday.", "Every day."]', 1, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'By when should students tell the captain to join the match?',
  '["By July 1.", "By July 10.", "By July 25.", "By June 30."]', 1, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 8: Cooking Class
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'notice', 'long_content',
  'Cooking Class for Students

We will have a cooking class on Saturday, February 18. We will learn how to make pasta and salad. The class will be from 10:00 a.m. to 12:30 p.m. at the Community Kitchen (next to the library). The fee is 1,000 yen. Please pay at the front desk by February 10. We need 15 students. Wear an apron and bring a towel. We will provide all ingredients.',
  'Cooking Class for Students',
  'Cooking Class for Students

We will have a cooking class on Saturday, February 18. We will learn how to make pasta and salad. The class will be from 10:00 a.m. to 12:30 p.m. at the Community Kitchen (next to the library). The fee is 1,000 yen. Please pay at the front desk by February 10. We need 15 students. Wear an apron and bring a towel. We will provide all ingredients.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What will students learn to make?',
  '["Rice and soup.", "Pasta and salad.", "Bread and juice.", "Cake and tea."]', 1, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'By when should students pay the fee?',
  '["By February 10.", "By February 18.", "By March 1.", "At 10:00 a.m."]', 0, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== 3B Eメール（各3問）==========

-- Passage 9: Bryan and Jill (Japanese lesson)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'email', 'long_content',
  'From: Bryan Fox
To: Jill White
Date: June 18
Subject: Japanese

Hi Jill,
I want to learn Japanese because I am interested in Japanese culture. Our high school offers Spanish, French, and German. I am studying Spanish now, and you are studying French. I plan to study abroad in Japan for a year when I go to college. I want to try judo there. Can your aunt teach me Japanese? She can speak Japanese, right? Please ask her. Write back soon!
Bryan

From: Jill White
To: Bryan Fox
Date: June 19
Subject: Sure!

Hi Bryan,
Yes! I asked my aunt. She lived in Japan for 10 years - 3 years in Hokkaido and 7 years in Tokyo. She came back to the United States a year ago. She speaks Japanese very well and knows a lot about Japanese culture. She said she can teach you. I gave her your phone number. By the way, I like Japanese comic books and TV shows. Let''s study Japanese together!
Jill

From: Bryan Fox
To: Jill White
Date: June 19
Subject: Thanks!

Hi Jill,
Thank you for talking to your aunt. She already called me! She will teach me Japanese on Wednesday evenings from 5:00 p.m. to 6:00 p.m. at a café near the station. The first lesson is this Wednesday. I think studying together is a great idea. Please come if you can!
Bryan',
  'Japanese',
  'From: Bryan Fox
To: Jill White
Date: June 18
Subject: Japanese

Hi Jill,
I want to learn Japanese because I am interested in Japanese culture. Our high school offers Spanish, French, and German. I am studying Spanish now, and you are studying French. I plan to study abroad in Japan for a year when I go to college. I want to try judo there. Can your aunt teach me Japanese? She can speak Japanese, right? Please ask her. Write back soon!
Bryan

From: Jill White
To: Bryan Fox
Date: June 19
Subject: Sure!

Hi Bryan,
Yes! I asked my aunt. She lived in Japan for 10 years - 3 years in Hokkaido and 7 years in Tokyo. She came back to the United States a year ago. She speaks Japanese very well and knows a lot about Japanese culture. She said she can teach you. I gave her your phone number. By the way, I like Japanese comic books and TV shows. Let''s study Japanese together!
Jill

From: Bryan Fox
To: Jill White
Date: June 19
Subject: Thanks!

Hi Jill,
Thank you for talking to your aunt. She already called me! She will teach me Japanese on Wednesday evenings from 5:00 p.m. to 6:00 p.m. at a café near the station. The first lesson is this Wednesday. I think studying together is a great idea. Please come if you can!
Bryan'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What language does Bryan study at high school?',
  '["Spanish.", "French.", "Japanese.", "German."]', 0, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How long did Jill''s aunt live in Tokyo?',
  '["For one year.", "For three years.", "For seven years.", "For ten years."]', 2, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Bryan want Jill to do on Wednesday evening?',
  '["Have a lesson with him at a café.", "Study with him in the school library.", "Meet him at a station near their school.", "Tell her aunt about his trip to Japan."]', 0, 2
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 10: Sophia and Anna (Mia, pickup)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'email', 'long_content',
  'From: Sophia Jones
To: Anna Jones
Date: September 25
Subject: Surprise!

Hi Mom,
College life is going well. I had a surprising experience last Monday. I met my old friend Mia in my art class at college! You remember Mia - we went to the same junior high school. She moved to a different city four years ago. We had lunch together at a restaurant last Friday and Saturday. We had a very good time. I was so surprised that she is at my college too. I will come home on October 20. Can you pick me up at Union Station at 5:00 p.m.? Love, Sophia

From: Anna Jones
To: Sophia Jones
Date: September 25
Subject: Great!

Hi Sophia,
Thanks for the great news. I am so happy you met Mia again. Say hi to her for me. I remember you and Mia often went to the library together when you were in junior high. Mia was good at teaching you math. You didn''t like math much - you liked drawing and sports. I have many great memories of you two. About October 20 - I have to work at the hospital and won''t finish early, so I can''t pick you up. But your dad has a meeting that day and it will finish at 4:00 p.m. He can pick you up at the station. Love, Mom',
  'Surprise!',
  'From: Sophia Jones
To: Anna Jones
Date: September 25
Subject: Surprise!

Hi Mom,
College life is going well. I had a surprising experience last Monday. I met my old friend Mia in my art class at college! You remember Mia - we went to the same junior high school. She moved to a different city four years ago. We had lunch together at a restaurant last Friday and Saturday. We had a very good time. I was so surprised that she is at my college too. I will come home on October 20. Can you pick me up at Union Station at 5:00 p.m.? Love, Sophia

From: Anna Jones
To: Sophia Jones
Date: September 25
Subject: Great!

Hi Sophia,
Thanks for the great news. I am so happy you met Mia again. Say hi to her for me. I remember you and Mia often went to the library together when you were in junior high. Mia was good at teaching you math. You didn''t like math much - you liked drawing and sports. I have many great memories of you two. About October 20 - I have to work at the hospital and won''t finish early, so I can''t pick you up. But your dad has a meeting that day and it will finish at 4:00 p.m. He can pick you up at the station. Love, Mom'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When did Sophia meet Mia in her class at college?',
  '["Four years ago.", "Last Monday.", "Last Friday.", "Last Saturday."]', 1, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did Sophia and Mia often do together when they were junior high school students?',
  '["They tried many sports at school.", "They went to the library together.", "They drew pictures at Sophia''s home.", "They went home after school."]', 1, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What will Sophia''s mother do on October 20?',
  '["Pick Sophia up at Union Station.", "Work at the hospital.", "Visit her husband''s office.", "Meet her old friends at a café."]', 1, 2
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 11: Lucas and Grandpa (report, festival)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'email', 'long_content',
  'From: Lucas Miller
To: Kevin Miller
Date: May 8
Subject: About your city

Hi Grandpa,
I need to write a report for social studies. It is due next Friday. I have to write about another city. Can I interview you about your city this Saturday? I remember the exciting summer festival in your city. Write back soon! Lucas

From: Kevin Miller
To: Lucas Miller
Date: May 8
Subject: Sure!

Hi Lucas,
Yes, my city has a summer festival. But we have interesting festivals in other seasons too. There is a pumpkin festival in autumn - you came to that one. We also have a cherry blossom festival in spring and a winter parade. I can answer your questions, but I have a lot of work to do this Saturday and Sunday morning. Can we meet on Sunday afternoon instead? Can you come here alone by train? Grandpa

From: Lucas Miller
To: Kevin Miller
Date: May 9
Subject: On Sunday

Hi Grandpa,
Thanks for writing back. I have soccer practice on Sunday morning, but I can visit in the afternoon. Mom will drive me to your home on that day. I heard my friend has already written about the summer festival, so I decided to write about your city''s spring festival. Do you have some pictures of the festival I could see? Lucas',
  'About your city',
  'From: Lucas Miller
To: Kevin Miller
Date: May 8
Subject: About your city

Hi Grandpa,
I need to write a report for social studies. It is due next Friday. I have to write about another city. Can I interview you about your city this Saturday? I remember the exciting summer festival in your city. Write back soon! Lucas

From: Kevin Miller
To: Lucas Miller
Date: May 8
Subject: Sure!

Hi Lucas,
Yes, my city has a summer festival. But we have interesting festivals in other seasons too. There is a pumpkin festival in autumn - you came to that one. We also have a cherry blossom festival in spring and a winter parade. I can answer your questions, but I have a lot of work to do this Saturday and Sunday morning. Can we meet on Sunday afternoon instead? Can you come here alone by train? Grandpa

From: Lucas Miller
To: Kevin Miller
Date: May 9
Subject: On Sunday

Hi Grandpa,
Thanks for writing back. I have soccer practice on Sunday morning, but I can visit in the afternoon. Mom will drive me to your home on that day. I heard my friend has already written about the summer festival, so I decided to write about your city''s spring festival. Do you have some pictures of the festival I could see? Lucas'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why did Lucas write to his grandfather?',
  '["To share the news about Lucas''s city.", "To ask about interviewing his grandfather.", "To invite his grandfather to a soccer game.", "To ask about making pumpkin pies."]', 1, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When will Lucas''s grandfather be able to meet Lucas?',
  '["On Friday afternoon.", "On Saturday morning.", "On Sunday morning.", "On Sunday afternoon."]', 3, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did Lucas choose to write about for his report?',
  '["The spring festival in his grandfather''s city.", "The summer festival in his city.", "The pumpkin festival in his grandfather''s city.", "The winter parade in his city."]', 0, 2
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 12: Emma and Ben (movie)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'email', 'long_content',
  'From: Emma Lee
To: Ben Clark
Date: October 5
Subject: Movie this weekend

Hi Ben,
There is a new movie at Star Cinema. It is about space. I want to see it. Can you go with me on Saturday? The movie starts at 2:00 p.m. and 5:00 p.m. I have a music lesson until 1:00 p.m., so I can go to the 5:00 p.m. show. Let me know!
Emma

From: Ben Clark
To: Emma Lee
Date: October 6
Subject: Re: Movie this weekend

Hi Emma,
I would love to go! The 5:00 p.m. show is good for me. I will meet you in front of the cinema at 4:30 p.m. My brother wants to come too. Is that OK? He likes space movies. We can eat dinner after the movie. There is a new pizza place next to the cinema.
Ben',
  'Movie this weekend',
  'From: Emma Lee
To: Ben Clark
Date: October 5
Subject: Movie this weekend

Hi Ben,
There is a new movie at Star Cinema. It is about space. I want to see it. Can you go with me on Saturday? The movie starts at 2:00 p.m. and 5:00 p.m. I have a music lesson until 1:00 p.m., so I can go to the 5:00 p.m. show. Let me know!
Emma

From: Ben Clark
To: Emma Lee
Date: October 6
Subject: Re: Movie this weekend

Hi Emma,
I would love to go! The 5:00 p.m. show is good for me. I will meet you in front of the cinema at 4:30 p.m. My brother wants to come too. Is that OK? He likes space movies. We can eat dinner after the movie. There is a new pizza place next to the cinema.
Ben'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why will Emma go to the 5:00 p.m. show?',
  '["The 2:00 p.m. show is full.", "She has a music lesson until 1:00 p.m.", "Ben can only go at 5:00 p.m.", "The cinema is closed in the afternoon."]', 1, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where will Ben meet Emma?',
  '["At the pizza place.", "In front of the cinema.", "At Star Cinema at 5:00 p.m.", "At the music lesson."]', 1, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Ben want to do after the movie?',
  '["Go to a music lesson.", "Eat dinner at a pizza place.", "See another movie.", "Go home with his brother."]', 1, 2
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 13: Kate and Dad (camping)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'email', 'long_content',
  'From: Kate Brown
To: David Brown
Date: July 12
Subject: Camping trip

Hi Dad,
Our class will have a camping trip from August 3 to August 5. We will go to Lake View Camp. I need to bring a sleeping bag, a flashlight, and insect spray. The teacher said we will cook our meals together. Can you drive me to the meeting point at school at 8:00 a.m. on August 3? Mom said she has to work early that day. Thanks!
Kate

From: David Brown
To: Kate Brown
Date: July 13
Subject: Re: Camping trip

Hi Kate,
No problem. I will drive you to school at 8:00 a.m. on August 3. Have a great time! Remember to bring a rain jacket. The weather can change quickly at the lake. Call me when you get back on August 5. I want to hear all about it.
Dad',
  'Camping trip',
  'From: Kate Brown
To: David Brown
Date: July 12
Subject: Camping trip

Hi Dad,
Our class will have a camping trip from August 3 to August 5. We will go to Lake View Camp. I need to bring a sleeping bag, a flashlight, and insect spray. The teacher said we will cook our meals together. Can you drive me to the meeting point at school at 8:00 a.m. on August 3? Mom said she has to work early that day. Thanks!
Kate

From: David Brown
To: Kate Brown
Date: July 13
Subject: Re: Camping trip

Hi Kate,
No problem. I will drive you to school at 8:00 a.m. on August 3. Have a great time! Remember to bring a rain jacket. The weather can change quickly at the lake. Call me when you get back on August 5. I want to hear all about it.
Dad'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What will Kate do with her class from August 3 to 5?',
  '["Study at school.", "Go on a camping trip.", "Cook at home.", "Work at the lake."]', 1, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why does Kate ask her dad to drive her?',
  '["Her mom has to work early that day.", "The bus does not go to the lake.", "She has too much to carry.", "Her dad wants to see the camp."]', 0, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Kate''s dad tell her to bring?',
  '["A sleeping bag.", "A rain jacket.", "Insect spray.", "A flashlight."]', 1, 2
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 14: Tom and Sarah (school play)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'email', 'long_content',
  'From: Tom Wilson
To: Sarah Green
Date: November 8
Subject: School play

Hi Sarah,
Our school play is on December 10 at 6:00 p.m. in the school hall. I am in the play! I have a small part. My parents will come. Can you come too? Tickets are 300 yen for students. You can buy them at the school office from November 20. After the play, we will have a party in the gym. I hope you can come!
Tom

From: Sarah Green
To: Tom Wilson
Date: November 10
Subject: Re: School play

Hi Tom,
I will definitely come! I will buy a ticket on November 20. I am excited to see you on stage. My sister wants to come too. How much are tickets for adults? I will ask my mom. Maybe we can go to a café after the party. See you!
Sarah',
  'School play',
  'From: Tom Wilson
To: Sarah Green
Date: November 8
Subject: School play

Hi Sarah,
Our school play is on December 10 at 6:00 p.m. in the school hall. I am in the play! I have a small part. My parents will come. Can you come too? Tickets are 300 yen for students. You can buy them at the school office from November 20. After the play, we will have a party in the gym. I hope you can come!
Tom

From: Sarah Green
To: Tom Wilson
Date: November 10
Subject: Re: School play

Hi Tom,
I will definitely come! I will buy a ticket on November 20. I am excited to see you on stage. My sister wants to come too. How much are tickets for adults? I will ask my mom. Maybe we can go to a café after the party. See you!
Sarah'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where will the school play be?',
  '["In the gym.", "In the school hall.", "At a café.", "At the school office."]', 1, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When can students buy tickets?',
  '["On November 8.", "On November 10.", "From November 20.", "On December 10."]', 2, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What will happen after the play?',
  '["Students will go home.", "There will be a party in the gym.", "Tom will go to a café.", "Tickets will be sold."]', 1, 2
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== 3C 説明文（各5問）==========

-- Passage 15: La Tomatina
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'narrative', 'long_content',
  'La Tomatina

Buñol is a small town in Spain. About 10,000 people live there. But every year on the last Wednesday of August, more than 30,000 people come to the town. They come for La Tomatina, a famous festival. At this festival, people throw tomatoes at each other.

The festival started in 1945. During a parade, some children pushed a musician. The musician got angry and threw a tomato at them. Then many people started throwing tomatoes. The government did not like it and stopped the festival for a while. But in 1957, people wanted the festival again, so it started again.

Today, people from many countries join La Tomatina. They throw tomatoes for about one hour. Many people wear white clothes. After the festival, their clothes turn red because of the tomatoes. La Tomatina is very famous, but some people do not think it is a good idea. Cleaning up after the festival is difficult. Some people also say it is wrong to throw food when many people in the world do not have enough to eat.',
  'La Tomatina',
  'La Tomatina

Buñol is a small town in Spain. About 10,000 people live there. But every year on the last Wednesday of August, more than 30,000 people come to the town. They come for La Tomatina, a famous festival. At this festival, people throw tomatoes at each other.

The festival started in 1945. During a parade, some children pushed a musician. The musician got angry and threw a tomato at them. Then many people started throwing tomatoes. The government did not like it and stopped the festival for a while. But in 1957, people wanted the festival again, so it started again.

Today, people from many countries join La Tomatina. They throw tomatoes for about one hour. Many people wear white clothes. After the festival, their clothes turn red because of the tomatoes. La Tomatina is very famous, but some people do not think it is a good idea. Cleaning up after the festival is difficult. Some people also say it is wrong to throw food when many people in the world do not have enough to eat.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How many people live in Buñol?',
  '["About 10,000 people.", "About 20,000 people.", "About 22,000 people.", "About 50,000 people."]', 0, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What happened during the parade in 1945?',
  '["Children played music at school.", "Children danced in the street.", "A musician bought tomatoes at the market.", "A musician got angry at some children."]', 3, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do a lot of people do at La Tomatina?',
  '["Perform a dance.", "Throw tomatoes at each other.", "Wear white clothes.", "Go to a farm."]', 1, 2
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Some people do not like La Tomatina because',
  '["there are too many people.", "cleaning up after the festival is difficult.", "it is too expensive.", "the tomatoes are not delicious."]', 1, 3
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is this story about?',
  '["A parade in 1945.", "A new city in Spain.", "A famous festival.", "A farming event."]', 2, 4
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 16: The Three Sisters
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'narrative', 'long_content',
  'The Three Sisters

Around the world, people grow many kinds of vegetables. Growing vegetables can be difficult. It is sometimes hard to know how much sun and water they need. Native American people in North America have a traditional method for growing vegetables. It is called the Three Sisters Method. The Three Sisters Method helps people to grow many vegetables in a small area.

In the Three Sisters Method, three different vegetables are grown together. The vegetables are corn, beans, and pumpkins. Native Americans have stories about these vegetables. According to them, the vegetables are "sisters." Corn is the oldest sister, beans are the middle sister, and pumpkins are the youngest sister. When Native Americans grow these vegetables, they plant corn first. Next, they plant beans, and they plant pumpkins last.

If people plant the corn first, the beans can use the corn plants to grow and get light from the sun. The pumpkins grow along the ground, so animals cannot go near the corn and beans easily. Pumpkins also have large leaves. They are important because they protect the area around the vegetables from the sun. Because of this, the ground does not become too dry. These three vegetables help each other to grow.

When Europeans went to North America in the 1600s, they took new plants and animals with them. Since then, the food that Native Americans eat has changed. However, many Native Americans and other farmers still use the Three Sisters Method today.',
  'The Three Sisters',
  'The Three Sisters

Around the world, people grow many kinds of vegetables. Growing vegetables can be difficult. It is sometimes hard to know how much sun and water they need. Native American people in North America have a traditional method for growing vegetables. It is called the Three Sisters Method. The Three Sisters Method helps people to grow many vegetables in a small area.

In the Three Sisters Method, three different vegetables are grown together. The vegetables are corn, beans, and pumpkins. Native Americans have stories about these vegetables. According to them, the vegetables are "sisters." Corn is the oldest sister, beans are the middle sister, and pumpkins are the youngest sister. When Native Americans grow these vegetables, they plant corn first. Next, they plant beans, and they plant pumpkins last.

If people plant the corn first, the beans can use the corn plants to grow and get light from the sun. The pumpkins grow along the ground, so animals cannot go near the corn and beans easily. Pumpkins also have large leaves. They are important because they protect the area around the vegetables from the sun. Because of this, the ground does not become too dry. These three vegetables help each other to grow.

When Europeans went to North America in the 1600s, they took new plants and animals with them. Since then, the food that Native Americans eat has changed. However, many Native Americans and other farmers still use the Three Sisters Method today.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When people use the Three Sisters Method, they can',
  '["learn about hundreds of Native American foods.", "use plants to get clean water for drinking.", "grow vegetables without light or water.", "grow many vegetables in a small area."]', 3, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do people plant first when they use the Three Sisters Method?',
  '["Pumpkins.", "Sunflowers.", "Beans.", "Corn."]', 3, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do the pumpkins'' leaves do?',
  '["They protect the soil from the sun.", "They help to keep the soil dry.", "They protect the corn from the beans.", "They help animals to find the corn."]', 0, 2
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What happened after Europeans went to North America?',
  '["Native Americans began to eat different foods.", "Native Americans stopped using the Three Sisters Method.", "Europeans said pumpkins should be eaten on Halloween.", "Europeans said Native Americans should eat more fruit."]', 0, 3
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is this story about?',
  '["A new way to cook vegetables.", "A special way to grow vegetables.", "Three farmers who were sisters.", "Three women who started a food company."]', 1, 4
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 17: Ansel Adams
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'narrative', 'long_content',
  'Ansel Adams

Ansel Adams was a famous American photographer. He was born in 1902. When he was a child, he did not like school very much. He enjoyed going for walks in nature and playing the piano. He practiced the piano for ten years. He first wanted to become a professional musician.

In the 1910s, Adams got his first camera. He took many pictures in Yosemite National Park. He went on hikes in the mountains there. He joined a club of people who worked in the park. He loved to take pictures of the mountains of Yosemite.

In the late 1920s, Adams decided to become a professional photographer instead of a musician. He was successful. He published many photo books and sold his pictures. His photos of nature were very popular. People said they looked like paintings. He also took pictures of products for companies.

Adams liked taking photos as art. He did not like taking photos for companies very much. He wanted to focus on nature photographs. His photos were shown in museums. He also taught photography. In 1980, he received an award from the President of the United States. He was one of the most famous photographers of his time.',
  'Ansel Adams',
  'Ansel Adams

Ansel Adams was a famous American photographer. He was born in 1902. When he was a child, he did not like school very much. He enjoyed going for walks in nature and playing the piano. He practiced the piano for ten years. He first wanted to become a professional musician.

In the 1910s, Adams got his first camera. He took many pictures in Yosemite National Park. He went on hikes in the mountains there. He joined a club of people who worked in the park. He loved to take pictures of the mountains of Yosemite.

In the late 1920s, Adams decided to become a professional photographer instead of a musician. He was successful. He published many photo books and sold his pictures. His photos of nature were very popular. People said they looked like paintings. He also took pictures of products for companies.

Adams liked taking photos as art. He did not like taking photos for companies very much. He wanted to focus on nature photographs. His photos were shown in museums. He also taught photography. In 1980, he received an award from the President of the United States. He was one of the most famous photographers of his time.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'As a child, Ansel Adams',
  '["learned how to draw.", "liked to go to school.", "went for walks in nature and played the piano.", "wanted to be a photographer."]', 2, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did Adams do when he got his first camera?',
  '["He took pictures of buildings.", "He went on hikes in the mountains.", "He worked at a camera store.", "He joined a photography club."]', 1, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why were Adams''s photographs popular?',
  '["They were photos of old products.", "They looked like paintings.", "They were in many newspapers.", "They were not expensive."]', 1, 2
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What happened in 1980?',
  '["Adams showed his photos in museums.", "Adams wrote a book.", "Adams won an award.", "Adams worked for the government."]', 2, 3
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is this story about?',
  '["A professional piano player.", "A new camera from the 1900s.", "How to take photographs of nature.", "A photographer in the 1900s."]', 3, 4
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 18: The History of Chocolate
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '3級', 'narrative', 'long_content',
  'The History of Chocolate

Many people around the world love chocolate. But do you know where it comes from? Chocolate is made from cacao. Cacao trees grow in hot, rainy places. A long time ago, people in Central America first used cacao. They made a bitter drink from it. They did not add sugar. Only rich people and soldiers could drink it.

In the 1500s, people from Spain went to Central America. They took cacao back to Europe. In Europe, people added sugar and milk to the drink. It became sweet and popular. Later, people learned how to make solid chocolate. In the 1800s, a factory in Switzerland made the first chocolate bar. Today, many countries make chocolate. Switzerland and Belgium are famous for their chocolate.

Chocolate is not only delicious. Some studies say a little dark chocolate can be good for your health. But eating too much chocolate is not good. It has a lot of sugar and fat. Enjoy chocolate, but do not eat too much!',
  'The History of Chocolate',
  'The History of Chocolate

Many people around the world love chocolate. But do you know where it comes from? Chocolate is made from cacao. Cacao trees grow in hot, rainy places. A long time ago, people in Central America first used cacao. They made a bitter drink from it. They did not add sugar. Only rich people and soldiers could drink it.

In the 1500s, people from Spain went to Central America. They took cacao back to Europe. In Europe, people added sugar and milk to the drink. It became sweet and popular. Later, people learned how to make solid chocolate. In the 1800s, a factory in Switzerland made the first chocolate bar. Today, many countries make chocolate. Switzerland and Belgium are famous for their chocolate.

Chocolate is not only delicious. Some studies say a little dark chocolate can be good for your health. But eating too much chocolate is not good. It has a lot of sugar and fat. Enjoy chocolate, but do not eat too much!'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where did people first use cacao?',
  '["In Europe.", "In Switzerland.", "In Central America.", "In Belgium."]', 2, 0
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Who could drink the first cacao drink a long time ago?',
  '["Only children.", "Only rich people and soldiers.", "People in Switzerland.", "Everyone in Europe."]', 1, 1
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where was the first chocolate bar made?',
  '["In Central America.", "In Spain.", "In a factory in Switzerland.", "In Belgium."]', 2, 2
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why is eating too much chocolate not good?',
  '["It is too expensive.", "It has a lot of sugar and fat.", "It is bitter.", "It comes from far away."]', 1, 3
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is this story mainly about?',
  '["How to grow cacao trees.", "The history of chocolate.", "Travel to Central America.", "Sugar and milk."]', 1, 4
FROM public.reading_passages WHERE level = '3級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
