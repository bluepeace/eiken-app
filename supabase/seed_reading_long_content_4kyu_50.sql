-- seed_reading_long_content_4kyu_50.sql
-- 英検4級 長文の内容一致選択 約50問（掲示・Eメール・説明文）
-- 過去3回分の過去問傾向（4A掲示2問／4Bメール3問／4C説明文5問）に合わせた形式
-- 028 マイグレーション実行後に実行

-- ========== 4A 掲示・案内（各2問）==========

-- Passage 1: School Library
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'notice', 'long_content',
  'School Library - Summer Hours

The library will be open from 9:00 a.m. to 5:00 p.m. from July 1 to August 31.
Students can borrow up to 5 books at a time.
Please return books by August 25 if you want to borrow more.
We have many new books about science and history this summer.
Come and read in our cool air-conditioned room!',
  'School Library - Summer Hours',
  'School Library - Summer Hours

The library will be open from 9:00 a.m. to 5:00 p.m. from July 1 to August 31.
Students can borrow up to 5 books at a time.
Please return books by August 25 if you want to borrow more.
We have many new books about science and history this summer.
Come and read in our cool air-conditioned room!'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When does the library close in summer?',
  '["At 4:00 p.m.", "At 5:00 p.m.", "At 6:00 p.m.", "At 7:00 p.m."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What should students do by August 25 if they want more books?',
  '["Buy new books.", "Return books.", "Visit the library.", "Read science books."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 2: Sports Day
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'notice', 'long_content',
  'Sports Day at North Park

Date: September 15 (Sunday)
Time: 10:00 a.m. to 3:00 p.m.
Place: North Park (near the station)

We will have running, jumping, and ball games.
Please bring a hat and a water bottle. Lunch will be sold at the park.
If it rains, we will have Sports Day on September 22.
Send an e-mail to sports@northpark.com by September 10 to join.',
  'Sports Day at North Park',
  'Sports Day at North Park

Date: September 15 (Sunday)
Time: 10:00 a.m. to 3:00 p.m.
Place: North Park (near the station)

We will have running, jumping, and ball games.
Please bring a hat and a water bottle. Lunch will be sold at the park.
If it rains, we will have Sports Day on September 22.
Send an e-mail to sports@northpark.com by September 10 to join.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What should people bring to Sports Day?',
  '["A ball.", "A hat and a water bottle.", "Lunch only.", "An umbrella."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When should people send an e-mail to join?',
  '["By September 15.", "By September 22.", "By September 10.", "By September 1."]', 2, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 3: Cafe Notice
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'notice', 'long_content',
  'Sunny Cafe - This Week

Monday to Friday: 8:00 a.m. to 6:00 p.m.
Saturday and Sunday: 9:00 a.m. to 7:00 p.m.

Today''s special: Apple pie and ice cream for $4.
Coffee is $2. Tea and juice are $3.
We have free Wi-Fi. Students can study here.
Please do not use your phone for a long time. Thank you!',
  'Sunny Cafe - This Week',
  'Sunny Cafe - This Week

Monday to Friday: 8:00 a.m. to 6:00 p.m.
Saturday and Sunday: 9:00 a.m. to 7:00 p.m.

Today''s special: Apple pie and ice cream for $4.
Coffee is $2. Tea and juice are $3.
We have free Wi-Fi. Students can study here.
Please do not use your phone for a long time. Thank you!'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is today''s special?',
  '["Coffee and tea.", "Apple pie and ice cream.", "Juice only.", "Wi-Fi."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When does the cafe close on Sunday?',
  '["At 6:00 p.m.", "At 7:00 p.m.", "At 8:00 p.m.", "At 9:00 p.m."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 4: Music Club
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'notice', 'long_content',
  'Music Club - Winter Concert

Date: December 20
Time: 2:00 p.m. to 4:00 p.m.
Place: School Hall

We will play songs from movies and Christmas music.
Tickets are $3 for students. Adults pay $5.
Please come 10 minutes before the start.
If you want to help us, talk to Mr. Green before December 10.',
  'Music Club - Winter Concert',
  'Music Club - Winter Concert

Date: December 20
Time: 2:00 p.m. to 4:00 p.m.
Place: School Hall

We will play songs from movies and Christmas music.
Tickets are $3 for students. Adults pay $5.
Please come 10 minutes before the start.
If you want to help us, talk to Mr. Green before December 10.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How much do students pay for a ticket?',
  '["$2.", "$3.", "$4.", "$5."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When should people talk to Mr. Green if they want to help?',
  '["After December 20.", "Before December 10.", "On December 20.", "At 2:00 p.m."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 5: Swimming Pool
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'notice', 'long_content',
  'City Swimming Pool - Open!

Open from June 1 to August 31.
Hours: 10:00 a.m. to 6:00 p.m. every day.

Children (under 12): $2
Students: $3
Adults: $5

Please bring your swimsuit and a towel. We have a small shop. You can buy water and snacks there.
The pool is closed on rainy days. Check our website in the morning.',
  'City Swimming Pool - Open!',
  'City Swimming Pool - Open!

Open from June 1 to August 31.
Hours: 10:00 a.m. to 6:00 p.m. every day.

Children (under 12): $2
Students: $3
Adults: $5

Please bring your swimsuit and a towel. We have a small shop. You can buy water and snacks there.
The pool is closed on rainy days. Check our website in the morning.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How much do students pay to use the pool?',
  '["$2.", "$3.", "$5.", "Free."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When is the pool closed?',
  '["On weekends.", "On rainy days.", "In the morning.", "In June."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 6: Book Sale
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'notice', 'long_content',
  'Annual Book Sale - Central Library

Dates: March 14 (Saturday) and March 15 (Sunday)
Time: 9:00 a.m. to 4:00 p.m. both days

All used books are $1 or $2. We have books for children and adults.
You can bring your old books and exchange them on March 10 or 11.
Parking is free. The library is next to the bus station.
For more information, call 555-0123.',
  'Annual Book Sale - Central Library',
  'Annual Book Sale - Central Library

Dates: March 14 (Saturday) and March 15 (Sunday)
Time: 9:00 a.m. to 4:00 p.m. both days

All used books are $1 or $2. We have books for children and adults.
You can bring your old books and exchange them on March 10 or 11.
Parking is free. The library is next to the bus station.
For more information, call 555-0123.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What time does the book sale end on Sunday?',
  '["At 9:00 a.m.", "At 2:00 p.m.", "At 4:00 p.m.", "At 5:00 p.m."]', 2, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When can people bring their old books to exchange?',
  '["On March 14.", "On March 15.", "On March 10 or 11.", "At 9:00 a.m."]', 2, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 7: School Trip
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'notice', 'long_content',
  'School Trip to the Science Museum

Date: October 5 (Monday)
We will leave school at 8:30 a.m. and return at 3:00 p.m.

Bring: lunch, a drink, and a pen. Do not bring games or cameras.
Wear your school uniform. We will take a bus to the museum.
Parents: Please send the permission form to the school office by September 28.
If you have questions, ask your homeroom teacher.',
  'School Trip to the Science Museum',
  'School Trip to the Science Museum

Date: October 5 (Monday)
We will leave school at 8:30 a.m. and return at 3:00 p.m.

Bring: lunch, a drink, and a pen. Do not bring games or cameras.
Wear your school uniform. We will take a bus to the museum.
Parents: Please send the permission form to the school office by September 28.
If you have questions, ask your homeroom teacher.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What time will the students leave school?',
  '["At 3:00 p.m.", "At 8:30 a.m.", "At 9:00 a.m.", "At 12:00 p.m."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What should students NOT bring?',
  '["Lunch.", "A pen.", "Games.", "A drink."]', 2, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 8: Art Show
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'notice', 'long_content',
  'Student Art Show

When: November 8 and 9
Where: Community Center (Room 201)
Hours: 10:00 a.m. to 5:00 p.m. on both days

Students from five schools will show their pictures and sculptures.
Admission is free. Everyone is welcome.
We will have a short talk by a famous artist on November 8 at 2:00 p.m.
For details, visit our website or call the Community Center.',
  'Student Art Show',
  'Student Art Show

When: November 8 and 9
Where: Community Center (Room 201)
Hours: 10:00 a.m. to 5:00 p.m. on both days

Students from five schools will show their pictures and sculptures.
Admission is free. Everyone is welcome.
We will have a short talk by a famous artist on November 8 at 2:00 p.m.
For details, visit our website or call the Community Center.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where will the Art Show be?',
  '["At five schools.", "At Room 201, Community Center.", "At 10:00 a.m.", "On the website."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When is the talk by the famous artist?',
  '["On November 9.", "At 10:00 a.m.", "On November 8 at 2:00 p.m.", "At 5:00 p.m."]', 2, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== 4B Eメール（各3問）==========

-- Passage 9: Emails about a party
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'email', 'long_content',
  'From: Tom Davis
To: Yuki Sato
Date: May 10
Subject: Birthday party

Hi Yuki,
My birthday party is on May 25 at 3:00 p.m. at my house. I want you to come! We will play games and eat pizza. Can you bring some juice? Please write back by May 18. See you!
Tom

From: Yuki Sato
To: Tom Davis
Date: May 12
Subject: Re: Birthday party

Hi Tom,
Thank you for the invitation. I will come to your party! I can bring orange juice. I have a piano lesson until 2:00 p.m. on May 25, so I will come at 2:30 p.m. Is that OK? I am looking forward to it.
Yuki',
  'Birthday party',
  'From: Tom Davis
To: Yuki Sato
Date: May 10
Subject: Birthday party

Hi Yuki,
My birthday party is on May 25 at 3:00 p.m. at my house. I want you to come! We will play games and eat pizza. Can you bring some juice? Please write back by May 18. See you!
Tom

From: Yuki Sato
To: Tom Davis
Date: May 12
Subject: Re: Birthday party

Hi Tom,
Thank you for the invitation. I will come to your party! I can bring orange juice. I have a piano lesson until 2:00 p.m. on May 25, so I will come at 2:30 p.m. Is that OK? I am looking forward to it.
Yuki'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When is Tom''s birthday party?',
  '["On May 10.", "On May 12.", "On May 18.", "On May 25."]', 3, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Tom ask Yuki to bring?',
  '["Pizza.", "Games.", "Some juice.", "A present."]', 2, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why will Yuki come at 2:30 p.m.?',
  '["The party starts at 2:30.", "She has a piano lesson until 2:00 p.m.", "She wants to bring juice.", "Tom asked her to come early."]', 1, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 10: Emails about homework
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'email', 'long_content',
  'From: Emma Brown
To: Ken Tanaka
Date: June 5
Subject: Science homework

Hi Ken,
I need help with the science homework. I don''t understand question 3. Can we study together after school on Friday? We can meet at the library at 4:00 p.m. I will bring my notebook. Please write back soon.
Emma

From: Ken Tanaka
To: Emma Brown
Date: June 6
Subject: Re: Science homework

Hi Emma,
Sure! I can help you. But I have soccer practice until 3:30 p.m. on Friday. So I will go to the library at 4:00 p.m. See you there. By the way, I need help with the English report. Can you help me next week?
Ken',
  'Science homework',
  'From: Emma Brown
To: Ken Tanaka
Date: June 5
Subject: Science homework

Hi Ken,
I need help with the science homework. I don''t understand question 3. Can we study together after school on Friday? We can meet at the library at 4:00 p.m. I will bring my notebook. Please write back soon.
Emma

From: Ken Tanaka
To: Emma Brown
Date: June 6
Subject: Re: Science homework

Hi Emma,
Sure! I can help you. But I have soccer practice until 3:30 p.m. on Friday. So I will go to the library at 4:00 p.m. See you there. By the way, I need help with the English report. Can you help me next week?
Ken'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why does Emma want to meet Ken?',
  '["To play soccer.", "To get help with science homework.", "To go to the library.", "To write a report."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Ken have before 4:00 p.m. on Friday?',
  '["Science class.", "Soccer practice.", "English report.", "Library time."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Ken ask Emma to do?',
  '["Help him with the English report next week.", "Bring her notebook.", "Meet at 3:30 p.m.", "Do question 3 for him."]', 0, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 11: Emails about a visit
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'email', 'long_content',
  'From: Lisa White
To: Hiroki Kimura
Date: July 20
Subject: Weekend plans

Hi Hiroki,
My family will visit your city on August 2. We will arrive by train at 11:00 a.m. Can we see you that day? We want to go to the new park. Do you know a good place for lunch? Let me know!
Lisa

From: Hiroki Kimura
To: Lisa White
Date: July 22
Subject: Re: Weekend plans

Hi Lisa,
Great! I will meet you at the station at 11:00 a.m. There is a nice restaurant near the park. It opens at 11:30 a.m. We can go to the park first and then have lunch. My sister wants to meet you too. She will come with me.
Hiroki',
  'Weekend plans',
  'From: Lisa White
To: Hiroki Kimura
Date: July 20
Subject: Weekend plans

Hi Hiroki,
My family will visit your city on August 2. We will arrive by train at 11:00 a.m. Can we see you that day? We want to go to the new park. Do you know a good place for lunch? Let me know!
Lisa

From: Hiroki Kimura
To: Lisa White
Date: July 22
Subject: Re: Weekend plans

Hi Lisa,
Great! I will meet you at the station at 11:00 a.m. There is a nice restaurant near the park. It opens at 11:30 a.m. We can go to the park first and then have lunch. My sister wants to meet you too. She will come with me.
Hiroki'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How will Lisa''s family get to the city?',
  '["By car.", "By bus.", "By train.", "By taxi."]', 2, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where will Hiroki and Lisa have lunch?',
  '["At the station.", "At a restaurant near the park.", "At Hiroki''s house.", "At the new park."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Who will come with Hiroki to meet Lisa?',
  '["His father.", "His sister.", "His teacher.", "His friend."]', 1, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 12: Emails about a concert
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'email', 'long_content',
  'From: Mike Johnson
To: Saki Yamamoto
Date: September 3
Subject: Concert tickets

Hi Saki,
There is a concert on September 20 at 7:00 p.m. at City Hall. I have two tickets. Do you want to go with me? The concert will end at 9:00 p.m. I can meet you at the station at 6:30 p.m. Tell me by September 10 if you can come.
Mike

From: Saki Yamamoto
To: Mike Johnson
Date: September 5
Subject: Re: Concert tickets

Hi Mike,
I would love to go! But I have a math test on September 21. I need to study on the night of the 20th. So I can only stay until 8:00 p.m. Is that OK? I will meet you at the station at 6:30 p.m. Thanks!
Saki',
  'Concert tickets',
  'From: Mike Johnson
To: Saki Yamamoto
Date: September 3
Subject: Concert tickets

Hi Saki,
There is a concert on September 20 at 7:00 p.m. at City Hall. I have two tickets. Do you want to go with me? The concert will end at 9:00 p.m. I can meet you at the station at 6:30 p.m. Tell me by September 10 if you can come.
Mike

From: Saki Yamamoto
To: Mike Johnson
Date: September 5
Subject: Re: Concert tickets

Hi Mike,
I would love to go! But I have a math test on September 21. I need to study on the night of the 20th. So I can only stay until 8:00 p.m. Is that OK? I will meet you at the station at 6:30 p.m. Thanks!
Saki'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where will the concert be?',
  '["At the station.", "At City Hall.", "At Mike''s house.", "At school."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why does Saki need to leave the concert early?',
  '["The concert is too long.", "She has a math test on September 21.", "She will meet Mike at 6:30.", "City Hall closes at 8:00."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When will Mike and Saki meet?',
  '["At 7:00 p.m.", "At 6:30 p.m. at the station.", "On September 10.", "At 9:00 p.m."]', 1, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 13: Emails about a project
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'email', 'long_content',
  'From: Anna Clark
To: Riku Suzuki
Date: October 8
Subject: History project

Hi Riku,
Our history project is due on October 20. We need to work on it together. I am free on Saturday afternoon. Can we meet at the cafe near the school at 1:00 p.m.? I will bring the books we need. Please tell me if Saturday is OK.
Anna

From: Riku Suzuki
To: Anna Clark
Date: October 9
Subject: Re: History project

Hi Anna,
Saturday is good. But I have a dentist appointment at 12:00. I will finish around 12:30. So I can come to the cafe at 1:30 p.m. Is that all right? I will bring my laptop. We can also work on Sunday if we need more time.
Riku',
  'History project',
  'From: Anna Clark
To: Riku Suzuki
Date: October 8
Subject: History project

Hi Riku,
Our history project is due on October 20. We need to work on it together. I am free on Saturday afternoon. Can we meet at the cafe near the school at 1:00 p.m.? I will bring the books we need. Please tell me if Saturday is OK.
Anna

From: Riku Suzuki
To: Anna Clark
Date: October 9
Subject: Re: History project

Hi Anna,
Saturday is good. But I have a dentist appointment at 12:00. I will finish around 12:30. So I can come to the cafe at 1:30 p.m. Is that all right? I will bring my laptop. We can also work on Sunday if we need more time.
Riku'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When is the history project due?',
  '["On October 8.", "On October 9.", "On October 20.", "On Saturday."]', 2, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why will Riku come at 1:30 p.m. instead of 1:00 p.m.?',
  '["He has a history class.", "He has a dentist appointment at 12:00.", "He will bring his laptop.", "The cafe opens at 1:30."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What will Anna bring to the cafe?',
  '["Her laptop.", "The books they need.", "Nothing.", "A dentist form."]', 1, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 14: Emails about a trip
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'email', 'long_content',
  'From: David Lee
To: Mio Nakamura
Date: November 1
Subject: Ski trip

Hi Mio,
Our ski trip is on November 15. We will leave school at 7:00 a.m. Please bring warm clothes and gloves. We will rent skis at the ski resort. Don''t forget to give the permission form to Mr. Brown by November 8. See you!
David

From: Mio Nakamura
To: David Lee
Date: November 3
Subject: Re: Ski trip

Hi David,
I am excited about the trip! I will bring my warm jacket and gloves. I have a question: do we need to bring our own lunch or will the school give us lunch? My mother said she can make sandwiches for everyone if we need them. Let me know!
Mio',
  'Ski trip',
  'From: David Lee
To: Mio Nakamura
Date: November 1
Subject: Ski trip

Hi Mio,
Our ski trip is on November 15. We will leave school at 7:00 a.m. Please bring warm clothes and gloves. We will rent skis at the ski resort. Don''t forget to give the permission form to Mr. Brown by November 8. See you!
David

From: Mio Nakamura
To: David Lee
Date: November 3
Subject: Re: Ski trip

Hi David,
I am excited about the trip! I will bring my warm jacket and gloves. I have a question: do we need to bring our own lunch or will the school give us lunch? My mother said she can make sandwiches for everyone if we need them. Let me know!
Mio'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What time will they leave school for the ski trip?',
  '["At 7:00 a.m.", "At 8:00 a.m.", "At 11:00 a.m.", "At 3:00 p.m."]', 0, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When should students give the permission form to Mr. Brown?',
  '["On November 15.", "On November 3.", "By November 8.", "By November 1."]', 2, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Mio ask David about?',
  '["Where to buy gloves.", "Whether they need to bring lunch.", "What time to come to school.", "Who will drive the bus."]', 1, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== 4C 説明文（各5問）==========

-- Passage 15: A Girl and Her Dog
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'narrative', 'long_content',
  'A Girl and Her Dog

Sarah is 12 years old. She lives in Tokyo with her parents and her dog, Pochi. Pochi is three years old. Sarah walks Pochi every morning before school. She also feeds him at 7:00 a.m. and 6:00 p.m. every day.

Last month, Pochi was sick. Sarah was very worried. She took him to the animal hospital. The doctor said Pochi needed to rest for one week. Sarah stayed with Pochi every day after school. She read books to him. After one week, Pochi became healthy again.

Sarah wants to work at an animal hospital when she grows up. She loves animals. She is now reading a book about dogs. She says, "I want to help many animals like Pochi."',
  'A Girl and Her Dog',
  'A Girl and Her Dog

Sarah is 12 years old. She lives in Tokyo with her parents and her dog, Pochi. Pochi is three years old. Sarah walks Pochi every morning before school. She also feeds him at 7:00 a.m. and 6:00 p.m. every day.

Last month, Pochi was sick. Sarah was very worried. She took him to the animal hospital. The doctor said Pochi needed to rest for one week. Sarah stayed with Pochi every day after school. She read books to him. After one week, Pochi became healthy again.

Sarah wants to work at an animal hospital when she grows up. She loves animals. She is now reading a book about dogs. She says, "I want to help many animals like Pochi."'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How old is Pochi?',
  '["Two years old.", "Three years old.", "Seven years old.", "Twelve years old."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When does Sarah feed Pochi?',
  '["Once a day.", "At 7:00 a.m. and 6:00 p.m. every day.", "Only when Pochi is sick.", "Before she goes to school only."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did the doctor say when Pochi was sick?',
  '["Pochi needed to go to school.", "Pochi needed to rest for one week.", "Sarah should read more books.", "Sarah should not walk Pochi."]', 1, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did Sarah do for Pochi when he was sick?',
  '["She took him to school.", "She stayed with him and read books to him.", "She bought a new book about dogs.", "She went to the animal hospital alone."]', 1, 3
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Sarah want to do when she grows up?',
  '["Have many dogs.", "Work at an animal hospital.", "Write books about animals.", "Live in Tokyo."]', 1, 4
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 16: The Soccer Game
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'narrative', 'long_content',
  'The Soccer Game

Takeshi is 14 years old. He is on the school soccer team. Last Saturday, his team had an important game. The game started at 10:00 a.m. at Central Stadium. Many students and parents came to watch.

Takeshi''s team did not play well in the first half. They were behind 2-0. But in the second half, Takeshi scored two goals. The score became 2-2. Then, in the last minute, his friend Yuji passed the ball to Takeshi. Takeshi kicked the ball and scored! His team won 3-2. Everyone was very happy.

After the game, the coach said to Takeshi, "You did a great job. Practice more and you will become a better player." Takeshi was tired but very excited. He wants to play in the national competition next year.',
  'The Soccer Game',
  'The Soccer Game

Takeshi is 14 years old. He is on the school soccer team. Last Saturday, his team had an important game. The game started at 10:00 a.m. at Central Stadium. Many students and parents came to watch.

Takeshi''s team did not play well in the first half. They were behind 2-0. But in the second half, Takeshi scored two goals. The score became 2-2. Then, in the last minute, his friend Yuji passed the ball to Takeshi. Takeshi kicked the ball and scored! His team won 3-2. Everyone was very happy.

After the game, the coach said to Takeshi, "You did a great job. Practice more and you will become a better player." Takeshi was tired but very excited. He wants to play in the national competition next year.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where was the soccer game?',
  '["At the school.", "At Central Stadium.", "At Takeshi''s house.", "At the national competition."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What was the score at the end of the first half?',
  '["0-0.", "2-0. Takeshi''s team was behind.", "2-2.", "3-2."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Who passed the ball to Takeshi for the last goal?',
  '["The coach.", "Yuji.", "A parent.", "A teacher."]', 1, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did the coach say to Takeshi after the game?',
  '["Stop playing soccer.", "You did a great job. Practice more.", "The game was too long.", "Yuji is a better player."]', 1, 3
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Takeshi want to do next year?',
  '["Become a coach.", "Play in the national competition.", "Score more goals in one game.", "Watch more games."]', 1, 4
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 17: A Summer in the Countryside
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'narrative', 'long_content',
  'A Summer in the Countryside

Maya is 13 years old. She lives in Osaka. Last summer, she visited her grandparents in the countryside for two weeks. Her grandparents have a small farm. They grow vegetables and have some chickens.

Every morning, Maya helped her grandmother in the garden. She watered the plants and picked tomatoes. In the afternoon, she often went to the river with her grandfather. They sometimes caught fish. Maya had never caught a fish before. She was very happy when she caught her first fish.

On the last day, Maya''s grandmother taught her how to make strawberry jam. Maya brought the jam back to Osaka. Her family loved it. Maya says, "I want to visit my grandparents again next summer. I learned many things and had a great time."',
  'A Summer in the Countryside',
  'A Summer in the Countryside

Maya is 13 years old. She lives in Osaka. Last summer, she visited her grandparents in the countryside for two weeks. Her grandparents have a small farm. They grow vegetables and have some chickens.

Every morning, Maya helped her grandmother in the garden. She watered the plants and picked tomatoes. In the afternoon, she often went to the river with her grandfather. They sometimes caught fish. Maya had never caught a fish before. She was very happy when she caught her first fish.

On the last day, Maya''s grandmother taught her how to make strawberry jam. Maya brought the jam back to Osaka. Her family loved it. Maya says, "I want to visit my grandparents again next summer. I learned many things and had a great time."'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How long did Maya stay with her grandparents?',
  '["One week.", "Two weeks.", "One month.", "All summer."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did Maya do every morning?',
  '["She went to the river.", "She helped in the garden and picked tomatoes.", "She caught fish.", "She made jam."]', 1, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why was Maya very happy at the river?',
  '["She learned to swim.", "She caught her first fish.", "Her grandfather was there.", "The river was beautiful."]', 1, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did Maya''s grandmother teach her?',
  '["How to grow vegetables.", "How to catch fish.", "How to make strawberry jam.", "How to water plants."]', 2, 3
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did Maya bring back to Osaka?',
  '["Vegetables.", "Fish.", "Strawberry jam.", "Chickens."]', 2, 4
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 18: The Science Fair
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'narrative', 'long_content',
  'The Science Fair

Akari is a junior high school student. She likes science. In October, her school had a science fair. Akari made a project about plants. She wanted to know: do plants grow better with music? She put one plant in a quiet room and another plant in a room with music. She watered both plants every day for four weeks.

At the science fair, Akari showed her results. She said the plant with music grew a little taller. Many students and teachers came to see her project. One teacher asked her many questions. Akari was nervous but she answered all the questions well.

Akari won second prize. She was very surprised and happy. Her parents came to the fair and took many photos. Akari says, "I want to do another project next year. Maybe I will study about light and plants."',
  'The Science Fair',
  'The Science Fair

Akari is a junior high school student. She likes science. In October, her school had a science fair. Akari made a project about plants. She wanted to know: do plants grow better with music? She put one plant in a quiet room and another plant in a room with music. She watered both plants every day for four weeks.

At the science fair, Akari showed her results. She said the plant with music grew a little taller. Many students and teachers came to see her project. One teacher asked her many questions. Akari was nervous but she answered all the questions well.

Akari won second prize. She was very surprised and happy. Her parents came to the fair and took many photos. Akari says, "I want to do another project next year. Maybe I will study about light and plants."'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What was Akari''s project about?',
  '["Music in schools.", "Plants and music.", "Water and plants.", "Photos of plants."]', 1, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How long did Akari do her plant experiment?',
  '["One week.", "Two weeks.", "Four weeks.", "One month and a half."]', 2, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did Akari find in her experiment?',
  '["Plants need no water.", "The plant with music grew a little taller.", "The quiet room was better.", "Music is bad for plants."]', 1, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What prize did Akari win?',
  '["First prize.", "Second prize.", "No prize.", "Best photo."]', 1, 3
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Akari want to study next year?',
  '["Music and plants again.", "Light and plants.", "Water only.", "Photos."]', 1, 4
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 19: A Trip to the Museum
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '4級', 'narrative', 'long_content',
  'A Trip to the Museum

Last month, Taro''s class went to the History Museum. They went by bus. The bus left school at 9:00 a.m. and arrived at the museum at 10:00 a.m. A guide showed them around. She told them about old tools and clothes. Taro was interested in the old maps. He took many notes.

At 12:00 p.m., they had lunch in the museum cafeteria. Taro sat with his friends Yuki and Ken. After lunch, they had free time. Taro bought a postcard at the museum shop. He sent it to his grandfather. His grandfather likes history.

The class left the museum at 2:00 p.m. On the bus, the teacher said, "Write a short report about what you saw. Bring it next week." Taro thought the trip was fun. He wants to go to the museum again with his family.',
  'A Trip to the Museum',
  'A Trip to the Museum

Last month, Taro''s class went to the History Museum. They went by bus. The bus left school at 9:00 a.m. and arrived at the museum at 10:00 a.m. A guide showed them around. She told them about old tools and clothes. Taro was interested in the old maps. He took many notes.

At 12:00 p.m., they had lunch in the museum cafeteria. Taro sat with his friends Yuki and Ken. After lunch, they had free time. Taro bought a postcard at the museum shop. He sent it to his grandfather. His grandfather likes history.

The class left the museum at 2:00 p.m. On the bus, the teacher said, "Write a short report about what you saw. Bring it next week." Taro thought the trip was fun. He wants to go to the museum again with his family.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How did Taro''s class get to the museum?',
  '["On foot.", "By train.", "By bus.", "By car."]', 2, 0
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What was Taro interested in at the museum?',
  '["Old tools.", "Old clothes.", "Old maps.", "The cafeteria."]', 2, 1
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Who did Taro send the postcard to?',
  '["Yuki.", "Ken.", "His grandfather.", "The teacher."]', 2, 2
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did the teacher ask the students to do?',
  '["Buy postcards.", "Write a short report and bring it next week.", "Go to the museum again.", "Have lunch at the cafeteria."]', 1, 3
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Taro wants to',
  '["become a guide.", "go to the museum again with his family.", "write a long report.", "buy more postcards."]', 1, 4
FROM public.reading_passages WHERE level = '4級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
