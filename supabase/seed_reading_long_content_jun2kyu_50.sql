-- seed_reading_long_content_jun2kyu_50.sql
-- 英検準2級 長文の内容一致選択 約52問（Eメール3問×8題 + 説明文4問×7題）
-- 大問4形式：4A Eメール3問／4B 説明文4問。パッセージはEメール約200語・説明文240〜350語。
-- 028 マイグレーション実行後に実行

-- ========== 4A Eメール（各3問）==========

-- Passage 1: Interview request (museum) - past question style
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'email', 'long_content',
  'From: Todd Hamilton <t.hamilton@happytext.abc>
To: Gina Parker <gina.p@eastbridgehistorymuseum.com>
Date: January 10
Subject: An interview

Dear Ms. Parker,

My name is Todd Hamilton, and I am a student at Peterson High School. My social studies teacher, Mr. Garcia, gave me your e-mail address. I am preparing a presentation about a popular tourist spot in our area, and I have decided to focus on the Eastbridge History Museum because it is popular with both domestic and international visitors.

I have already found basic information about the history, events, buildings, and exhibitions on your museum''s website. However, I would like to ask you and your staff about what you do to attract visitors and what makes your museum more attractive than others. Would it be possible to have a short interview with you at your convenience? I would also like to ask for permission to take photos of the museum to use as slides in my presentation. If an interview is not possible, I would still be grateful if I could ask you some questions by e-mail.

Thank you for your time. I look forward to hearing from you.

Sincerely,
Todd Hamilton',
  'An interview',
  'From: Todd Hamilton <t.hamilton@happytext.abc>
To: Gina Parker <gina.p@eastbridgehistorymuseum.com>
Date: January 10
Subject: An interview

Dear Ms. Parker,

My name is Todd Hamilton, and I am a student at Peterson High School. My social studies teacher, Mr. Garcia, gave me your e-mail address. I am preparing a presentation about a popular tourist spot in our area, and I have decided to focus on the Eastbridge History Museum because it is popular with both domestic and international visitors.

I have already found basic information about the history, events, buildings, and exhibitions on your museum''s website. However, I would like to ask you and your staff about what you do to attract visitors and what makes your museum more attractive than others. Would it be possible to have a short interview with you at your convenience? I would also like to ask for permission to take photos of the museum to use as slides in my presentation. If an interview is not possible, I would still be grateful if I could ask you some questions by e-mail.

Thank you for your time. I look forward to hearing from you.

Sincerely,
Todd Hamilton'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How was Todd able to contact Ms. Parker?',
  '["By getting her contact information from his teacher.", "By finding her e-mail address on the museum''s website.", "By being introduced to her by a worker at the museum.", "By meeting her when he visited the museum."]', 0, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one thing Todd wants to ask about the museum?',
  '["Things visitors can do at the museum.", "The efforts that the museum makes to attract visitors.", "The main points of the events.", "The way to become a museum staff member."]', 1, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Todd wants to',
  '["make slides of the presentation with the staff members.", "send pictures of the museum by e-mail.", "use pictures taken at the museum in his presentation.", "show some slides of his high school life."]', 2, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 2: Tennis tournament
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'email', 'long_content',
  'From: Victoria Hill <info@grand-tennis.com>
To: Jake Adams <j.adams-123@network-globally.com>
Date: April 28
Subject: Important information about the tennis tournament

Dear Jake,

The tennis tournament on May 5 will be our fifth tournament this year. I am very excited because we have never had so many teams in a tournament before. We have received applications from men''s, women''s, and mixed teams.

I am writing to tell you that your team cannot play in the B-level group as you had planned. Because you applied a little late, there are no more spots left. All ten spots in the B-level group have been filled. Therefore, we would like to suggest that you play at a higher level, the A-level group. You could also move to the C-level group, or wait to see if a team in the B-level group cancels. However, we encourage you to take part in the A-level group. If your team cannot participate in any of these groups, we will refund your tournament fee immediately.

Please let us know your decision by May 1.

Best regards,
Victoria Hill',
  'Important information about the tennis tournament',
  'From: Victoria Hill <info@grand-tennis.com>
To: Jake Adams <j.adams-123@network-globally.com>
Date: April 28
Subject: Important information about the tennis tournament

Dear Jake,

The tennis tournament on May 5 will be our fifth tournament this year. I am very excited because we have never had so many teams in a tournament before. We have received applications from men''s, women''s, and mixed teams.

I am writing to tell you that your team cannot play in the B-level group as you had planned. Because you applied a little late, there are no more spots left. All ten spots in the B-level group have been filled. Therefore, we would like to suggest that you play at a higher level, the A-level group. You could also move to the C-level group, or wait to see if a team in the B-level group cancels. However, we encourage you to take part in the A-level group. If your team cannot participate in any of these groups, we will refund your tournament fee immediately.

Please let us know your decision by May 1.

Best regards,
Victoria Hill'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about the tennis tournament on May 5?',
  '["Victoria Hill expected more teams to apply.", "It includes only mixed teams of men and women.", "It is the first tournament Jake Adams will play in.", "More teams are attending than ever before."]', 3, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Jake''s team cannot play in the B-level group because',
  '["the spots for the group have been filled.", "not enough teams applied for the group.", "his team''s skills are too high for the level.", "his team is not allowed to play at the event."]', 0, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one thing that Victoria advised Jake to do?',
  '["Give up playing in the C-level group.", "Take part in the A-level group.", "Pay more for the tournament.", "Join another team in the B-level group."]', 1, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 3: Group presentation (climate change)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'email', 'long_content',
  'From: Aidan Norwick <aidan.norwick@link-humans.com>
To: Isabel Jones <isabel-m-jones@beyond-ocean.net>
Date: February 23
Subject: Group presentation

Hi Isabel,

I am writing to remind you about our group presentation next week. We have already decided on our roles. You will talk about the causes of climate change, and I will explain the effects. You will also give examples of actions in America to help the environment. The presentation should be about ten minutes long, so we need to keep each part short and clear.

I have finished the notes for my part and made three slides. I remember you were working on your second slide. I can review your slides if you like. Let''s exchange our slides by Thursday so we can check everything. We plan to practice together on Friday afternoon for a final rehearsal. If Friday is not good for you, please let me know. I am not available this weekend, but we could meet at another time.

Aidan',
  'Group presentation',
  'From: Aidan Norwick <aidan.norwick@link-humans.com>
To: Isabel Jones <isabel-m-jones@beyond-ocean.net>
Date: February 23
Subject: Group presentation

Hi Isabel,

I am writing to remind you about our group presentation next week. We have already decided on our roles. You will talk about the causes of climate change, and I will explain the effects. You will also give examples of actions in America to help the environment. The presentation should be about ten minutes long, so we need to keep each part short and clear.

I have finished the notes for my part and made three slides. I remember you were working on your second slide. I can review your slides if you like. Let''s exchange our slides by Thursday so we can check everything. We plan to practice together on Friday afternoon for a final rehearsal. If Friday is not good for you, please let me know. I am not available this weekend, but we could meet at another time.

Aidan'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about the presentation?',
  '["Its length will be around ten minutes for the two speakers.", "Aidan Norwick will explain what causes climate change.", "Isabel Jones will talk about examples of actions around the world.", "It will take place at a big school event next month."]', 0, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Aidan Norwick thinks that',
  '["there is so much left to do for the presentation.", "Isabel Jones needs only two slides for the presentation.", "it is important to finish writing notes for his part today.", "he and Isabel Jones are preparing well for the presentation."]', 3, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Aidan suggest to Isabel?',
  '["Meeting up on Friday for the final practice.", "Sending their slides to their teacher this Friday.", "Practicing together on Thursday afternoon.", "Spending some time together over the weekend."]', 0, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 4: Summer camp registration
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'email', 'long_content',
  'From: Camp Director <director@lakesidecamp.org>
To: Mrs. Sandra Webb <s.webb@mailnet.com>
Date: June 3
Subject: Your son''s registration for Summer Science Camp

Dear Mrs. Webb,

Thank you for your interest in our Summer Science Camp. We have received your application for your son, David. We are sorry to inform you that the camp session from July 15 to July 22 is now full. We had a record number of applications this year.

We have two other sessions available: July 8 to July 15 and July 22 to July 29. Both sessions offer the same activities, including nature walks, experiments, and star gazing. If you would like to switch to one of these sessions, please reply to this e-mail by June 10. We will keep a place for David in the July 8 session until we hear from you. If neither session is suitable, we will refund the full registration fee.

We look forward to hearing from you.

Yours sincerely,
James Miller
Camp Director',
  'Your son''s registration for Summer Science Camp',
  'From: Camp Director <director@lakesidecamp.org>
To: Mrs. Sandra Webb <s.webb@mailnet.com>
Date: June 3
Subject: Your son''s registration for Summer Science Camp

Dear Mrs. Webb,

Thank you for your interest in our Summer Science Camp. We have received your application for your son, David. We are sorry to inform you that the camp session from July 15 to July 22 is now full. We had a record number of applications this year.

We have two other sessions available: July 8 to July 15 and July 22 to July 29. Both sessions offer the same activities, including nature walks, experiments, and star gazing. If you would like to switch to one of these sessions, please reply to this e-mail by June 10. We will keep a place for David in the July 8 session until we hear from you. If neither session is suitable, we will refund the full registration fee.

We look forward to hearing from you.

Yours sincerely,
James Miller
Camp Director'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why did the camp director write to Mrs. Webb?',
  '["To thank her for visiting the camp.", "To tell her that the July 15–22 session is full.", "To ask for more information about David.", "To invite her to a parent meeting."]', 1, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What can David do if his family chooses another session?',
  '["Pay a lower fee.", "Get the same activities as the full session.", "Attend for a longer period.", "Bring a friend for free."]', 1, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'By when should Mrs. Webb reply if she wants to switch sessions?',
  '["By June 3.", "By June 10.", "By July 8.", "By July 15."]', 1, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 5: Part-time job reply
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'email', 'long_content',
  'From: Helen Walsh <h.walsh@citylibrary.gov>
To: Ryan Cole <ryan.cole@studentmail.edu>
Date: September 12
Subject: Re: Part-time job application

Dear Ryan,

Thank you for applying for the part-time position at the City Library. We have reviewed your application and would like to invite you for an interview. The interview will be on September 20 at 2:00 p.m. at the main library. Please come to the front desk and ask for me. The interview will take about 30 minutes. We will ask you about your experience with books and computers, and why you want to work at the library.

Please bring a copy of your school schedule so we can see when you are free. We need someone who can work on weekday afternoons and Saturday mornings. If September 20 is not convenient for you, please reply by September 15 and we will suggest another date. We look forward to meeting you.

Best regards,
Helen Walsh
Library Manager',
  'Re: Part-time job application',
  'From: Helen Walsh <h.walsh@citylibrary.gov>
To: Ryan Cole <ryan.cole@studentmail.edu>
Date: September 12
Subject: Re: Part-time job application

Dear Ryan,

Thank you for applying for the part-time position at the City Library. We have reviewed your application and would like to invite you for an interview. The interview will be on September 20 at 2:00 p.m. at the main library. Please come to the front desk and ask for me. The interview will take about 30 minutes. We will ask you about your experience with books and computers, and why you want to work at the library.

Please bring a copy of your school schedule so we can see when you are free. We need someone who can work on weekday afternoons and Saturday mornings. If September 20 is not convenient for you, please reply by September 15 and we will suggest another date. We look forward to meeting you.

Best regards,
Helen Walsh
Library Manager'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Helen Walsh want Ryan to do?',
  '["Send his application again.", "Come for an interview.", "Start work the next day.", "Bring a friend to the library."]', 1, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What should Ryan bring to the interview?',
  '["A book and a computer.", "A copy of his school schedule.", "A letter from his teacher.", "Proof of his address."]', 1, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When does the library need the new worker to be available?',
  '["On weekday mornings only.", "On weekday afternoons and Saturday mornings.", "On Sundays only.", "Every day after school."]', 1, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 6: School trip confirmation
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'email', 'long_content',
  'From: Ms. Karen Lee <k.lee@riversidehigh.edu>
To: Parents and guardians
Date: October 1
Subject: Confirmation – School trip to the Science Center

Dear Parents and Guardians,

This is to confirm the school trip for Grade 10 students to the National Science Center on October 18. Students will leave school at 8:30 a.m. and return by 4:00 p.m. They will need to bring a packed lunch and a drink. They should not bring large bags or valuable items, as storage space is limited.

At the Science Center, students will take part in a workshop on renewable energy and visit the exhibition halls. They will also have time to try the interactive displays. Please ensure your child has signed the permission form. The deadline for handing in the form is October 10. If you have any questions, please contact the school office or reply to this e-mail.

Thank you for your cooperation.

Karen Lee
Grade 10 Coordinator',
  'Confirmation – School trip to the Science Center',
  'From: Ms. Karen Lee <k.lee@riversidehigh.edu>
To: Parents and guardians
Date: October 1
Subject: Confirmation – School trip to the Science Center

Dear Parents and Guardians,

This is to confirm the school trip for Grade 10 students to the National Science Center on October 18. Students will leave school at 8:30 a.m. and return by 4:00 p.m. They will need to bring a packed lunch and a drink. They should not bring large bags or valuable items, as storage space is limited.

At the Science Center, students will take part in a workshop on renewable energy and visit the exhibition halls. They will also have time to try the interactive displays. Please ensure your child has signed the permission form. The deadline for handing in the form is October 10. If you have any questions, please contact the school office or reply to this e-mail.

Thank you for your cooperation.

Karen Lee
Grade 10 Coordinator'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What will students do at the Science Center?',
  '["Store their bags and valuables.", "Take part in a workshop on renewable energy.", "Eat lunch at a restaurant.", "Sign the permission form."]', 1, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'By when must the permission form be handed in?',
  '["By October 1.", "By October 10.", "By October 18.", "By 4:00 p.m."]', 1, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why should students not bring large bags?',
  '["The Science Center does not allow bags.", "Storage space is limited.", "They will carry equipment for the workshop.", "The bus has no space for bags."]', 1, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 7: Book club invitation
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'email', 'long_content',
  'From: Nina Foster <nina.foster@community-center.org>
To: Members of the Young Readers Club
Date: November 5
Subject: Next meeting and new project

Dear members,

Our next meeting will be on November 18 at 4:00 p.m. in Room 3 at the Community Center. This month we will discuss the book "Wild River" by Jane Cole. Please read at least the first five chapters before the meeting. If you have not yet borrowed the book, you can pick it up at the center''s front desk.

We are also starting a new project. We will create a short video to introduce our favorite books to other students. Each member will talk about one book for about two minutes. We will film the video at the December meeting. If you do not want to appear in the video, you can still help by writing the script or choosing the music. Please tell me your preference by November 12.

See you at the meeting!

Nina Foster
Club Leader',
  'Next meeting and new project',
  'From: Nina Foster <nina.foster@community-center.org>
To: Members of the Young Readers Club
Date: November 5
Subject: Next meeting and new project

Dear members,

Our next meeting will be on November 18 at 4:00 p.m. in Room 3 at the Community Center. This month we will discuss the book "Wild River" by Jane Cole. Please read at least the first five chapters before the meeting. If you have not yet borrowed the book, you can pick it up at the center''s front desk.

We are also starting a new project. We will create a short video to introduce our favorite books to other students. Each member will talk about one book for about two minutes. We will film the video at the December meeting. If you do not want to appear in the video, you can still help by writing the script or choosing the music. Please tell me your preference by November 12.

See you at the meeting!

Nina Foster
Club Leader'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What should members do before the November 18 meeting?',
  '["Borrow a book from the front desk.", "Read at least the first five chapters of Wild River.", "Create a short video.", "Write the script for the video."]', 1, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When will the club film the video?',
  '["At the November meeting.", "At the December meeting.", "By November 12.", "At 4:00 p.m."]', 1, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What can members do if they do not want to appear in the video?',
  '["Skip the December meeting.", "Help by writing the script or choosing the music.", "Discuss a different book.", "Borrow another book."]', 1, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 8: Hotel booking change
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'email', 'long_content',
  'From: Sunset Hotel <reservations@sunset-hotel.com>
To: Mr. Paul Turner <p.turner@email.com>
Date: March 14
Subject: Change to your reservation

Dear Mr. Turner,

Thank you for your reservation at Sunset Hotel for March 25 to March 28. We are sorry to inform you that the room type you requested, a double room with a sea view, is not available on those dates due to a booking error. We have already received many reservations for the spring holiday period.

We would like to offer you a double room without a sea view at the same price. Alternatively, we have a family room with a sea view available, but it would cost an extra 5,000 yen per night. If you prefer to cancel your reservation, we will refund the full amount within five business days. Please let us know your choice by March 18 by replying to this e-mail or calling our front desk. We apologize for any inconvenience.

Yours sincerely,
Reservations Team
Sunset Hotel',
  'Change to your reservation',
  'From: Sunset Hotel <reservations@sunset-hotel.com>
To: Mr. Paul Turner <p.turner@email.com>
Date: March 14
Subject: Change to your reservation

Dear Mr. Turner,

Thank you for your reservation at Sunset Hotel for March 25 to March 28. We are sorry to inform you that the room type you requested, a double room with a sea view, is not available on those dates due to a booking error. We have already received many reservations for the spring holiday period.

We would like to offer you a double room without a sea view at the same price. Alternatively, we have a family room with a sea view available, but it would cost an extra 5,000 yen per night. If you prefer to cancel your reservation, we will refund the full amount within five business days. Please let us know your choice by March 18 by replying to this e-mail or calling our front desk. We apologize for any inconvenience.

Yours sincerely,
Reservations Team
Sunset Hotel'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why is the double room with a sea view not available?',
  '["The hotel is closed for repairs.", "There was a booking error and the period is busy.", "Mr. Turner did not pay in advance.", "The hotel has changed its prices."]', 1, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What can Mr. Turner get at the same price as his original request?',
  '["A family room with a sea view.", "A double room without a sea view.", "A refund only.", "An extra night free."]', 1, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'By when should Mr. Turner tell the hotel his choice?',
  '["By March 14.", "By March 18.", "By March 25.", "Within five business days."]', 1, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== 4B 説明文（各4問）==========

-- Passage 9: Animals That Improve the Environment (beavers)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'narrative', 'long_content',
  'Animals That Improve the Environment

Beavers are animals that live in lakes and rivers in North America and Europe. When people hear about beavers, not many of them think about the help beavers give to the environment. In the past, the number of beavers became smaller because of human activities in various parts of the world. But today, experts say that bringing beavers back into nature can help protect the environment. Therefore, action has been taken to increase the number of them.

Beavers can bring many advantages. Riding Mountain National Park in Canada is a good example of the positive effects of beavers. In the park, beavers help reduce the risk of water problems. To protect themselves from other animals, beavers make dams, something similar to walls in rivers. Because their dams slow the flow of water, they can prevent natural disasters like floods. The dams also clean the water by removing harmful materials. This improves the quality of water.

Beavers also have a positive impact on wild animals thanks to their dams. Because their dams create places with healthier water that flows very slowly, they make great homes for other wild animals. For example, in one part of the United Kingdom, a study found that beavers created a nice environment for birds to live in. There are now more frogs and other species living there, too.

Some farmers think that there will be negative effects on food production if beavers are not controlled well. This is because beavers may eat crops like corn on farms. However, there is still the fact that they are a great help to nature. The British government has decided to introduce beavers back into the wild. So, the number of beavers will continue to grow in the future, while farmers hope that the animals will be controlled properly.',
  'Animals That Improve the Environment',
  'Animals That Improve the Environment

Beavers are animals that live in lakes and rivers in North America and Europe. When people hear about beavers, not many of them think about the help beavers give to the environment. In the past, the number of beavers became smaller because of human activities in various parts of the world. But today, experts say that bringing beavers back into nature can help protect the environment. Therefore, action has been taken to increase the number of them.

Beavers can bring many advantages. Riding Mountain National Park in Canada is a good example of the positive effects of beavers. In the park, beavers help reduce the risk of water problems. To protect themselves from other animals, beavers make dams, something similar to walls in rivers. Because their dams slow the flow of water, they can prevent natural disasters like floods. The dams also clean the water by removing harmful materials. This improves the quality of water.

Beavers also have a positive impact on wild animals thanks to their dams. Because their dams create places with healthier water that flows very slowly, they make great homes for other wild animals. For example, in one part of the United Kingdom, a study found that beavers created a nice environment for birds to live in. There are now more frogs and other species living there, too.

Some farmers think that there will be negative effects on food production if beavers are not controlled well. This is because beavers may eat crops like corn on farms. However, there is still the fact that they are a great help to nature. The British government has decided to introduce beavers back into the wild. So, the number of beavers will continue to grow in the future, while farmers hope that the animals will be controlled properly.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What happened to beavers in the past?',
  '["They were introduced to Europe from North America.", "They decreased in many places due to human activities.", "They had an influence on human lifestyles and activities.", "They increased rapidly in number and harmed the environment."]', 1, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'In Riding Mountain National Park in Canada,',
  '["beavers help get rid of bad substances from the water.", "beavers have no enemies with which they have to live.", "beavers make dams in the water as their gathering places.", "beavers do not influence natural disasters."]', 0, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How do beavers have a positive impact on other wild animals?',
  '["They help other animals hunt their food.", "They leave food that other animals can eat.", "They create homes suitable for other animals.", "They clean other animals'' bodies with water."]', 2, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why do some people think beavers may have negative effects?',
  '["Because some beavers fail to control the water flow using their dams.", "Because beavers attack farm animals when they are nervous.", "Because other animals that are attracted to beavers may harm humans.", "Because there is a chance that beavers may eat crops on farms."]', 3, 3
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 10: A Unique Italian Village (Chamois)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'narrative', 'long_content',
  'A Unique Italian Village

Chamois is a small village in Italy. It is surrounded by high mountains and is known for its beautiful nature. Many people visit the village throughout the year to enjoy the scenery and outdoor activities. However, Chamois is different from most villages in one important way: no cars are allowed there. The village has only about 100 people, and the only way to reach it without walking is by cable car.

In the early 1960s, Italy was building more and more roads. People in Chamois used to travel by bicycle or on foot to visit other villages. When the government suggested building a road for cars to Chamois, the people were against the idea. They did not want cars to damage the nature around their village. Instead, they decided to build cable cars. The cable cars made it easier and faster to travel to other areas while keeping the environment safe.

Today, Chamois is known as an environmentally friendly village. Because there are no cars, the air is clean and the streets are quiet. The village is part of a group called the "Alpine Pearls," which includes towns that work to protect the beauty of nature and offer climate-friendly ways to travel. Visitors to Chamois can enjoy hiking, skiing, and the peace of a village that has chosen to stay close to nature.',
  'A Unique Italian Village',
  'A Unique Italian Village

Chamois is a small village in Italy. It is surrounded by high mountains and is known for its beautiful nature. Many people visit the village throughout the year to enjoy the scenery and outdoor activities. However, Chamois is different from most villages in one important way: no cars are allowed there. The village has only about 100 people, and the only way to reach it without walking is by cable car.

In the early 1960s, Italy was building more and more roads. People in Chamois used to travel by bicycle or on foot to visit other villages. When the government suggested building a road for cars to Chamois, the people were against the idea. They did not want cars to damage the nature around their village. Instead, they decided to build cable cars. The cable cars made it easier and faster to travel to other areas while keeping the environment safe.

Today, Chamois is known as an environmentally friendly village. Because there are no cars, the air is clean and the streets are quiet. The village is part of a group called the "Alpine Pearls," which includes towns that work to protect the beauty of nature and offer climate-friendly ways to travel. Visitors to Chamois can enjoy hiking, skiing, and the peace of a village that has chosen to stay close to nature.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Which is correct to describe Chamois?',
  '["The fastest way to get to the village is by car.", "The nature of the village is gradually decreasing.", "The village used to be a big city with many people.", "The village welcomes many visitors throughout the year."]', 3, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'In the early 1960s, people in Chamois',
  '["used many ways to move around in the village.", "had streets they could use to drive to other villages.", "needed to walk or ride a bicycle to visit other villages.", "agreed to build roads between the village and other villages."]', 2, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why did the people of Chamois want cable cars?',
  '["To keep the nature of the village.", "To enjoy the view of the village.", "To accept more tourists to the village.", "To carry older people easily."]', 0, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about Chamois today?',
  '["It is a disappearing village due to its small number of people.", "It has been removed from the group of the Alpine Pearls.", "It is making its transportation system eco-friendly without cars.", "It is solving problems caused by its poor natural environment."]', 2, 3
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 11: Salt
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'narrative', 'long_content',
  'Salt

Salt is necessary for humans to survive. Today it is easy to find and we mainly use it to add flavor to our food. But in the past, people thought about salt in a very different way. It had many more uses and was much more valuable.

A long time ago, there were no refrigerators. People used salt to preserve food so that it would last longer. Salt was also used in medicine. People used it to treat both humans and animals when they were sick or injured. In addition, salt was so valuable that it was sometimes used like money. In Europe, the salt trade helped cities grow and led to the building of new roads so that salt could be produced and carried from place to place. In many parts of the world, wars were fought over salt.

Salt is still important today. We use it in cooking and in some medicines. We also use it in new ways. For example, we use salt to clean and polish metal, and we put it on roads in winter to melt snow and prevent accidents. Salt will probably continue to play an important role in our lives in the future.',
  'Salt',
  'Salt

Salt is necessary for humans to survive. Today it is easy to find and we mainly use it to add flavor to our food. But in the past, people thought about salt in a very different way. It had many more uses and was much more valuable.

A long time ago, there were no refrigerators. People used salt to preserve food so that it would last longer. Salt was also used in medicine. People used it to treat both humans and animals when they were sick or injured. In addition, salt was so valuable that it was sometimes used like money. In Europe, the salt trade helped cities grow and led to the building of new roads so that salt could be produced and carried from place to place. In many parts of the world, wars were fought over salt.

Salt is still important today. We use it in cooking and in some medicines. We also use it in new ways. For example, we use salt to clean and polish metal, and we put it on roads in winter to melt snow and prevent accidents. Salt will probably continue to play an important role in our lives in the future.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did people think about salt in the past?',
  '["It was an item that was easily available anywhere.", "It was one of the best discoveries in the cooking world.", "It had other purposes than adding flavor to meals.", "It had various tastes when it was cooked differently."]', 2, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'People in the past used salt as',
  '["an item to keep people from catching a cold.", "a poison to kill dangerous animals.", "a medicine to treat injured animals.", "a product to wash people''s hair."]', 2, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about the impact of salt in the past?',
  '["Salt was offered to end war everywhere around the world.", "Money became useless because it was replaced with salt.", "Roads were created only by rich salt producers.", "New cities and roads were built to make or carry salt."]', 3, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How does salt help people''s lives today?',
  '["It is used in beauty products to make people''s skin smooth.", "It can be used as an item to clean things with.", "It helps people stay warm on snowy days.", "It helps to cool down people''s bodies when they are sick."]', 1, 3
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 12: The History of Chocolate
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'narrative', 'long_content',
  'The History of Chocolate

Chocolate is loved by people all over the world. It is made from cacao, which grows in hot, rainy areas. The story of chocolate began in Central America thousands of years ago. The people there made a bitter drink from cacao. They did not add sugar, and only certain people could drink it. When Spanish people came to Central America in the 1500s, they took cacao back to Europe. In Europe, people added sugar and milk to the drink. It became sweet and popular. Later, people learned how to make solid chocolate. In the 1800s, a factory in Switzerland made the first chocolate bar.

Today, chocolate is used in many ways. We eat it as candy, use it in cakes, and drink it as hot chocolate. Some studies say that a little dark chocolate may be good for your health. However, eating too much chocolate is not a good idea because it often contains a lot of sugar and fat. Chocolate has come a long way from the bitter drink of the past, and it will probably remain a favorite for many people in the future.',
  'The History of Chocolate',
  'The History of Chocolate

Chocolate is loved by people all over the world. It is made from cacao, which grows in hot, rainy areas. The story of chocolate began in Central America thousands of years ago. The people there made a bitter drink from cacao. They did not add sugar, and only certain people could drink it. When Spanish people came to Central America in the 1500s, they took cacao back to Europe. In Europe, people added sugar and milk to the drink. It became sweet and popular. Later, people learned how to make solid chocolate. In the 1800s, a factory in Switzerland made the first chocolate bar.

Today, chocolate is used in many ways. We eat it as candy, use it in cakes, and drink it as hot chocolate. Some studies say that a little dark chocolate may be good for your health. However, eating too much chocolate is not a good idea because it often contains a lot of sugar and fat. Chocolate has come a long way from the bitter drink of the past, and it will probably remain a favorite for many people in the future.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where did the story of chocolate begin?',
  '["In Europe.", "In Switzerland.", "In Central America.", "In a factory in the 1800s."]', 2, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did people in Europe add to the cacao drink?',
  '["Salt and water.", "Sugar and milk.", "Spices and fruit.", "Ice and honey."]', 1, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Where was the first chocolate bar made?',
  '["In Central America.", "In Spain.", "In a factory in Switzerland.", "In the 1500s."]', 2, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why is eating too much chocolate not a good idea?',
  '["It was only for certain people in the past.", "It often contains a lot of sugar and fat.", "It is made from cacao in hot areas.", "It became popular in Europe."]', 1, 3
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 13: Solar Energy
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'narrative', 'long_content',
  'Solar Energy

The sun gives us light and warmth every day. For a long time, people have tried to use the sun''s energy in different ways. Today, solar panels are used in many countries to turn sunlight into electricity. This is called solar power. Solar power is clean because it does not produce harmful gases. It is also renewable, which means we can use it again and again as long as the sun shines.

In the past, solar panels were expensive and not very efficient. But over the years, technology has improved. Solar panels have become cheaper and better at producing electricity. Many homes and schools now have solar panels on their roofs. Some countries have built large solar farms in sunny areas. These farms can provide electricity for thousands of people.

However, solar power has some limitations. It does not work at night, and when the sky is cloudy, less electricity is produced. So we still need other sources of energy. Many experts believe that in the future, we will use a mix of solar power and other clean energy sources. This will help us protect the environment and reduce our dependence on fossil fuels.',
  'Solar Energy',
  'Solar Energy

The sun gives us light and warmth every day. For a long time, people have tried to use the sun''s energy in different ways. Today, solar panels are used in many countries to turn sunlight into electricity. This is called solar power. Solar power is clean because it does not produce harmful gases. It is also renewable, which means we can use it again and again as long as the sun shines.

In the past, solar panels were expensive and not very efficient. But over the years, technology has improved. Solar panels have become cheaper and better at producing electricity. Many homes and schools now have solar panels on their roofs. Some countries have built large solar farms in sunny areas. These farms can provide electricity for thousands of people.

However, solar power has some limitations. It does not work at night, and when the sky is cloudy, less electricity is produced. So we still need other sources of energy. Many experts believe that in the future, we will use a mix of solar power and other clean energy sources. This will help us protect the environment and reduce our dependence on fossil fuels.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why is solar power called clean energy?',
  '["It works at night.", "It does not produce harmful gases.", "It is used in many countries.", "It is cheap."]', 1, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What has happened to solar panels over the years?',
  '["They have become more expensive.", "They have become cheaper and more efficient.", "They only work in large farms.", "They produce harmful gases now."]', 1, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one limitation of solar power?',
  '["It only works in cold countries.", "It does not work at night.", "It is not renewable.", "It damages the environment."]', 1, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do many experts believe about the future?',
  '["Solar power will replace all other energy.", "We will use a mix of solar and other clean energy.", "Solar panels will disappear.", "Fossil fuels will become cheaper."]', 1, 3
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 14: The Great Wall of China
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'narrative', 'long_content',
  'The Great Wall of China

The Great Wall of China is one of the most famous structures in the world. It is a long wall that was built over many centuries. The first parts of the wall were built more than 2,000 years ago to protect China from enemies from the north. Different rulers added to the wall over time. Most of the wall we see today was built during the Ming dynasty, which lasted from the 14th to the 17th century. The wall is so long that it stretches across mountains, deserts, and grasslands. It is often said that the Great Wall can be seen from space, but this is not true. However, it is still an amazing achievement.

Building the Great Wall was very difficult. Workers had to carry heavy stones and bricks up steep hills. They worked in very hot and very cold weather. Many people lost their lives during the construction. The wall was built not only to keep enemies out but also to control trade and collect taxes at the gates. Today, the Great Wall is a popular tourist destination. Millions of people visit it every year. It is also a UNESCO World Heritage Site, which means it is protected as an important part of world history.',
  'The Great Wall of China',
  'The Great Wall of China

The Great Wall of China is one of the most famous structures in the world. It is a long wall that was built over many centuries. The first parts of the wall were built more than 2,000 years ago to protect China from enemies from the north. Different rulers added to the wall over time. Most of the wall we see today was built during the Ming dynasty, which lasted from the 14th to the 17th century. The wall is so long that it stretches across mountains, deserts, and grasslands. It is often said that the Great Wall can be seen from space, but this is not true. However, it is still an amazing achievement.

Building the Great Wall was very difficult. Workers had to carry heavy stones and bricks up steep hills. They worked in very hot and very cold weather. Many people lost their lives during the construction. The wall was built not only to keep enemies out but also to control trade and collect taxes at the gates. Today, the Great Wall is a popular tourist destination. Millions of people visit it every year. It is also a UNESCO World Heritage Site, which means it is protected as an important part of world history.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why was the Great Wall first built?',
  '["To attract tourists.", "To protect China from enemies from the north.", "To control the weather.", "To collect stones and bricks."]', 1, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'When was most of the wall we see today built?',
  '["More than 2,000 years ago.", "During the Ming dynasty.", "In the 20th century.", "Last year."]', 1, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about building the Great Wall?',
  '["It was easy and quick.", "Workers had to carry heavy materials up steep hills.", "Only a few people worked on it.", "It was built in one year."]', 1, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does UNESCO World Heritage Site mean for the Great Wall?',
  '["It can be seen from space.", "It is protected as an important part of world history.", "It is the longest wall in the world.", "It was built by UNESCO."]', 1, 3
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 15: Bees and the Environment
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級', 'narrative', 'long_content',
  'Bees and the Environment

Bees are small insects, but they play a very important role in our lives. They help plants make fruits and seeds by carrying pollen from one flower to another. This process is called pollination. Many of the foods we eat, such as apples, almonds, and strawberries, depend on bees. Without bees, farmers would have a much harder time growing these crops. In recent years, however, the number of bees has been decreasing in many parts of the world. Scientists are worried about this because it could affect our food supply.

There are several reasons why bees are disappearing. One reason is the use of certain chemicals on farms. These chemicals can harm bees when they visit the flowers. Another reason is the loss of places where bees can live and find food. Cities and farms have replaced many wild areas. Climate change may also be affecting bees by changing when flowers bloom. When flowers bloom at different times, bees may not find enough food.

People are now trying to help bees. Some farmers are using fewer harmful chemicals. Some cities are planting more flowers that bees like. You can also help by planting flowers in your garden or on your balcony. Even a small patch of flowers can give bees a place to rest and find food. By working together, we can help protect these important insects.',
  'Bees and the Environment',
  'Bees and the Environment

Bees are small insects, but they play a very important role in our lives. They help plants make fruits and seeds by carrying pollen from one flower to another. This process is called pollination. Many of the foods we eat, such as apples, almonds, and strawberries, depend on bees. Without bees, farmers would have a much harder time growing these crops. In recent years, however, the number of bees has been decreasing in many parts of the world. Scientists are worried about this because it could affect our food supply.

There are several reasons why bees are disappearing. One reason is the use of certain chemicals on farms. These chemicals can harm bees when they visit the flowers. Another reason is the loss of places where bees can live and find food. Cities and farms have replaced many wild areas. Climate change may also be affecting bees by changing when flowers bloom. When flowers bloom at different times, bees may not find enough food.

People are now trying to help bees. Some farmers are using fewer harmful chemicals. Some cities are planting more flowers that bees like. You can also help by planting flowers in your garden or on your balcony. Even a small patch of flowers can give bees a place to rest and find food. By working together, we can help protect these important insects.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why are bees important for our food?',
  '["They make honey for us to eat.", "They help plants make fruits and seeds through pollination.", "They keep other insects away from crops.", "They work on farms."]', 1, 0
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What are scientists worried about?',
  '["Bees are too many in cities.", "The number of bees has been decreasing and it could affect our food supply.", "Bees are harmful to flowers.", "Bees do not like strawberries."]', 1, 1
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one reason why bees are disappearing?',
  '["Bees are eating too much pollen.", "The use of certain chemicals on farms can harm bees.", "Bees prefer to live in cities.", "Flowers have become too large."]', 1, 2
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How can people help bees according to the passage?',
  '["By keeping bees in their homes.", "By planting flowers in their garden or on their balcony.", "By using more chemicals on farms.", "By building more cities."]', 1, 3
FROM public.reading_passages WHERE level = '準2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
