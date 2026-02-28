-- seed_reading_long_content_2kyu_50.sql
-- 英検2級 長文の内容一致選択 約48問（Eメール3問×6題 + 説明文5問×6題）
-- 大問3形式：A Eメール240語程度・3問／B 説明文350語程度・5問。高校卒業程度・約5000語。
-- 038 以降のマイグレーション実行後に実行

-- ========== 3A Eメール（各3問・約240語）==========

-- Passage 1: Important course information (Sarah-style: marketing course)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'email', 'long_content',
  'From: Sarah Freeman <sfreeman@careerdevelopment.com>
To: All Course Participants <participants@careerdevelopment.com>
Date: March 23
Subject: Important course information

Dear participants,

Thank you for registering for our marketing course. I am Sarah Freeman from the course administration team. Before our first class on April 6, we would like you to watch a 15-minute video on our website and take a short quiz. This will help us check your understanding of the basics and make our in-class discussions more productive. Please complete this by April 1.

The course will be held on Tuesdays and Thursdays in April and May at 7 p.m. However, there is a schedule change. Our instructor will be attending an international conference in mid-May, so two classes will be moved to June. The course will now end on June 6 instead of May 30. We will send you the updated calendar by the end of this week.

If you miss a class, you can catch up by watching the recorded lecture online. We post a video of each session within 48 hours. Please note that you can use this option only twice during the course. We encourage you to attend in person so that you can join the discussion. If you miss three or more sessions, please speak to a course manager to discuss your situation.

Best regards,
Sarah Freeman
Marketing Course Administration',
  'Important course information',
  'From: Sarah Freeman <sfreeman@careerdevelopment.com>
To: All Course Participants <participants@careerdevelopment.com>
Date: March 23
Subject: Important course information

Dear participants,

Thank you for registering for our marketing course. I am Sarah Freeman from the course administration team. Before our first class on April 6, we would like you to watch a 15-minute video on our website and take a short quiz. This will help us check your understanding of the basics and make our in-class discussions more productive. Please complete this by April 1.

The course will be held on Tuesdays and Thursdays in April and May at 7 p.m. However, there is a schedule change. Our instructor will be attending an international conference in mid-May, so two classes will be moved to June. The course will now end on June 6 instead of May 30. We will send you the updated calendar by the end of this week.

If you miss a class, you can catch up by watching the recorded lecture online. We post a video of each session within 48 hours. Please note that you can use this option only twice during the course. We encourage you to attend in person so that you can join the discussion. If you miss three or more sessions, please speak to a course manager to discuss your situation.

Best regards,
Sarah Freeman
Marketing Course Administration'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why does Sarah Freeman want course participants to take the quiz?',
  '["To prepare a new video for the course.", "To check their understanding before the first class.", "To help them prepare presentations.", "To divide them into discussion groups."]', 1, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The class schedule will be changed because',
  '["another group needs to use the classroom.", "there are national holidays in May.", "the instructor will be away at a conference.", "participants will take math exams in June."]', 2, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one thing Sarah says about catching up with a class?',
  '["You can talk with the instructor online instead.", "You can take lessons from a different course.", "You will receive the materials by e-mail.", "You can watch the video of the class online, but only twice."]', 3, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 2: Questions about school library activities (Jessica-style)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'email', 'long_content',
  'From: Jessica Smith <jsmith@mounthigh.edu>
To: Library staff <librarystaff@mounthigh.edu>
Date: November 18
Subject: Questions about school library activities

Dear library staff,

I am Jessica Smith, a student at Mount High School. I attended the reading week event that the library organized last month. I especially enjoyed the lunchtime event where students introduced their favorite books. It made me realize that many students at our school are actually interested in reading. That encouraged me, and I hope the library will hold such events often.

As a member of the Student Council, I am involved in projects to improve school life. I would like to understand what kind of support the library offers to students. I have a few questions. First, what orientation do you provide for new students? Second, how does the library support study in each subject? Third, how do you plan to encourage students to use the library during long vacations?

I have put these questions in a separate document and am sending it with this e-mail. Could you please write your answers on that document and return it to me by e-mail by November 25? After I receive your answers, I would like to invite some of you to one of our Student Council meetings so that we can discuss how we can work together. We meet every Tuesday at 4 p.m. in Room 303. If you let us know in advance when you can attend, we can set aside about half an hour for discussion.

Sincerely,
Jessica Smith
Student Council',
  'Questions about school library activities',
  'From: Jessica Smith <jsmith@mounthigh.edu>
To: Library staff <librarystaff@mounthigh.edu>
Date: November 18
Subject: Questions about school library activities

Dear library staff,

I am Jessica Smith, a student at Mount High School. I attended the reading week event that the library organized last month. I especially enjoyed the lunchtime event where students introduced their favorite books. It made me realize that many students at our school are actually interested in reading. That encouraged me, and I hope the library will hold such events often.

As a member of the Student Council, I am involved in projects to improve school life. I would like to understand what kind of support the library offers to students. I have a few questions. First, what orientation do you provide for new students? Second, how does the library support study in each subject? Third, how do you plan to encourage students to use the library during long vacations?

I have put these questions in a separate document and am sending it with this e-mail. Could you please write your answers on that document and return it to me by e-mail by November 25? After I receive your answers, I would like to invite some of you to one of our Student Council meetings so that we can discuss how we can work together. We meet every Tuesday at 4 p.m. in Room 303. If you let us know in advance when you can attend, we can set aside about half an hour for discussion.

Sincerely,
Jessica Smith
Student Council'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Last month, Jessica discovered that',
  '["more students liked to read science fiction than short stories.", "students from other schools joined the reading week at her school.", "reading was one of the most common conversation topics.", "a lot of students in her school were actually interested in reading."]', 3, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is Jessica interested in about the library?',
  '["What assistance the library provides to help students.", "The most popular book categories among new students.", "The opening hours of the library during winter vacation.", "When she should arrange library events for new and graduating students."]', 0, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Jessica ask staff members to do after answering the questions?',
  '["Call her to discuss library improvements.", "Close the library to meet students.", "Send their answers back by e-mail.", "Attend the council''s meeting on Wednesday."]', 2, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 3: Retirement party (Julia-style)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'email', 'long_content',
  'From: Julia Young <j_young@nflowtech.com>
To: Todd Musk <t_musk@nflowtech.com>
Date: June 19
Subject: Retirement party

Dear Todd,

Thank you for your phone call today. I am Julia Young from the Sales Department at New Flow Technologies. I am writing to ask for your help with Mr. Jenkins''s retirement party next month.

We are planning a surprise movie for Mr. Jenkins. The movie will include slides about his achievements, photos with coworkers, and messages from customers. To make this a success, we need the professional support of the IT department. Our team has collected photos and sales data, but we are having trouble creating a clear graphic from the data. We also need help with video and sound equipment on the day of the event.

I am sorry to ask you during such a busy time, but we would be delighted if you could support us. Could you please let us know by June 26 whether you can help? If you have any questions, feel free to reply to this e-mail or call me.

Best regards,
Julia Young',
  'Retirement party',
  'From: Julia Young <j_young@nflowtech.com>
To: Todd Musk <t_musk@nflowtech.com>
Date: June 19
Subject: Retirement party

Dear Todd,

Thank you for your phone call today. I am Julia Young from the Sales Department at New Flow Technologies. I am writing to ask for your help with Mr. Jenkins''s retirement party next month.

We are planning a surprise movie for Mr. Jenkins. The movie will include slides about his achievements, photos with coworkers, and messages from customers. To make this a success, we need the professional support of the IT department. Our team has collected photos and sales data, but we are having trouble creating a clear graphic from the data. We also need help with video and sound equipment on the day of the event.

I am sorry to ask you during such a busy time, but we would be delighted if you could support us. Could you please let us know by June 26 whether you can help? If you have any questions, feel free to reply to this e-mail or call me.

Best regards,
Julia Young'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What happened after the phone call today?',
  '["The manager announced a new company policy about retirement.", "The IT department talked about new computers for the office.", "Julia Young''s team agreed on details for a future celebration.", "Employees talked about taking over tasks from Mr. Jenkins."]', 2, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The surprise movie for Mr. Jenkins''s retirement party will',
  '["show messages from people who are not members of his company.", "be sent to the family members of his coworkers from the past.", "include slides about his achievements and messages from customers.", "be shown on display screens set up on each table during the party."]', 2, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Julia Young want help with?',
  '["Collecting the necessary numbers about Mr. Jenkins''s sales for slides.", "Putting together a list of songs to play at the party.", "Checking and preparing computers at the sales department.", "Creating something to show Mr. Jenkins''s history at the company and setting up equipment."]', 3, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 4: Workshop confirmation
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'email', 'long_content',
  'From: David Park <d.park@globaltraining.co.jp>
To: Workshop Participants <workshop@globaltraining.co.jp>
Date: September 5
Subject: Confirmation – Leadership Workshop (October 10–11)

Dear participants,

Thank you for applying for our Leadership Workshop. I am David Park from the training team. I am pleased to confirm your place. The workshop will be held on October 10 and 11 at our main office. Please arrive by 8:45 a.m. on the first day for registration. The session will start at 9:00 a.m. and finish at 5:00 p.m. on both days.

You will work in small groups of five or six. We will send you the list of your group members and a short questionnaire by September 20. Please complete the questionnaire and return it by September 27. Your answers will help our facilitators plan activities that suit your needs.

Lunch will be provided on both days. If you have any dietary requirements, please inform us by September 15. Also, we will use an online platform for sharing materials during the workshop. Please make sure you can access the internet with your laptop or tablet. If you have any questions, do not hesitate to contact us.

Best regards,
David Park
Global Training Inc.',
  'Confirmation – Leadership Workshop',
  'From: David Park <d.park@globaltraining.co.jp>
To: Workshop Participants <workshop@globaltraining.co.jp>
Date: September 5
Subject: Confirmation – Leadership Workshop (October 10–11)

Dear participants,

Thank you for applying for our Leadership Workshop. I am David Park from the training team. I am pleased to confirm your place. The workshop will be held on October 10 and 11 at our main office. Please arrive by 8:45 a.m. on the first day for registration. The session will start at 9:00 a.m. and finish at 5:00 p.m. on both days.

You will work in small groups of five or six. We will send you the list of your group members and a short questionnaire by September 20. Please complete the questionnaire and return it by September 27. Your answers will help our facilitators plan activities that suit your needs.

Lunch will be provided on both days. If you have any dietary requirements, please inform us by September 15. Also, we will use an online platform for sharing materials during the workshop. Please make sure you can access the internet with your laptop or tablet. If you have any questions, do not hesitate to contact us.

Best regards,
David Park
Global Training Inc.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why does David Park want participants to complete the questionnaire?',
  '["To decide who will be in each group.", "To help facilitators plan suitable activities.", "To check if participants can attend both days.", "To collect feedback after the workshop."]', 1, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'By when should participants inform the team about dietary requirements?',
  '["September 5.", "September 15.", "September 20.", "September 27."]', 1, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one thing participants need to prepare for the workshop?',
  '["A printed copy of the group list.", "A device that can access the internet.", "Their lunch for both days.", "A report to submit on the first day."]', 1, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 5: Company announcement
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'email', 'long_content',
  'From: Helen Morris <hmorris@briton.co.uk>
To: All Staff <allstaff@briton.co.uk>
Date: January 14
Subject: New office policy from February

Dear colleagues,

I am Helen Morris from Human Resources. I am writing to inform you about a change in our office policy that will take effect from February 1.

From that date, we will introduce a flexible working system. You may choose to work from home up to two days per week, as long as your team manager agrees and your work can be done remotely. On the days you work in the office, we ask you to use the online booking system to reserve a desk. This will help us manage the number of people in the building and maintain a safe environment.

We will hold an online meeting on January 22 to explain the new system and answer your questions. The meeting will start at 3 p.m. and will last about one hour. Please register by January 20 if you wish to attend. A recording will be available for those who cannot join. If you have any concerns, please contact your manager or the HR team.

Best regards,
Helen Morris',
  'New office policy from February',
  'From: Helen Morris <hmorris@briton.co.uk>
To: All Staff <allstaff@briton.co.uk>
Date: January 14
Subject: New office policy from February

Dear colleagues,

I am Helen Morris from Human Resources. I am writing to inform you about a change in our office policy that will take effect from February 1.

From that date, we will introduce a flexible working system. You may choose to work from home up to two days per week, as long as your team manager agrees and your work can be done remotely. On the days you work in the office, we ask you to use the online booking system to reserve a desk. This will help us manage the number of people in the building and maintain a safe environment.

We will hold an online meeting on January 22 to explain the new system and answer your questions. The meeting will start at 3 p.m. and will last about one hour. Please register by January 20 if you wish to attend. A recording will be available for those who cannot join. If you have any concerns, please contact your manager or the HR team.

Best regards,
Helen Morris'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What change will take effect from February 1?',
  '["Staff must work in the office every day.", "Staff may work from home up to two days per week.", "Staff must attend a meeting every week.", "Staff must use a new building."]', 1, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why are staff asked to use the online booking system?',
  '["To apply for holidays.", "To reserve a desk when working in the office.", "To order equipment for home use.", "To book a place at the meeting."]', 1, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What can staff do if they cannot attend the meeting on January 22?',
  '["They can skip the new policy.", "They can watch a recording of the meeting.", "They can send a substitute from their team.", "They must attend a later meeting in person."]', 1, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 6: Request for event support
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'email', 'long_content',
  'From: Michael Brown <m.brown@riverview.edu>
To: Tech Support <techsupport@riverview.edu>
Date: April 8
Subject: Request for support – Science Fair (May 15)

Dear Tech Support team,

I am Michael Brown, a teacher at River View High School. Our annual Science Fair will be held on May 15 in the school hall. We would like to request your support for the event.

This year we plan to set up five stations where students will present their projects using tablets and large screens. We will need a stable Wi-Fi connection in the hall and help with connecting the devices. We also plan to live-stream the award ceremony for parents who cannot attend. We would need one or two staff members from your team to be present from 9 a.m. to 2 p.m. on that day.

Could you please let us know by April 22 whether you can provide this support? If you have any questions about the schedule or equipment, please contact me. We would be very grateful for your help in making the Science Fair a success.

Sincerely,
Michael Brown
Science Department',
  'Request for support – Science Fair',
  'From: Michael Brown <m.brown@riverview.edu>
To: Tech Support <techsupport@riverview.edu>
Date: April 8
Subject: Request for support – Science Fair (May 15)

Dear Tech Support team,

I am Michael Brown, a teacher at River View High School. Our annual Science Fair will be held on May 15 in the school hall. We would like to request your support for the event.

This year we plan to set up five stations where students will present their projects using tablets and large screens. We will need a stable Wi-Fi connection in the hall and help with connecting the devices. We also plan to live-stream the award ceremony for parents who cannot attend. We would need one or two staff members from your team to be present from 9 a.m. to 2 p.m. on that day.

Could you please let us know by April 22 whether you can provide this support? If you have any questions about the schedule or equipment, please contact me. We would be very grateful for your help in making the Science Fair a success.

Sincerely,
Michael Brown
Science Department'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What will the Science Fair use for student presentations?',
  '["Paper posters only.", "Tablets and large screens.", "Radio broadcasts.", "Printed booklets."]', 1, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why does the school want to live-stream the award ceremony?',
  '["To show the ceremony to other schools.", "So that parents who cannot attend can watch.", "To record the ceremony for the school archive.", "To replace the in-person ceremony."]', 1, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'By when does Michael Brown need a reply from the Tech Support team?',
  '["April 8.", "April 15.", "April 22.", "May 15."]', 2, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== 3B 説明文（各5問・約350語）==========

-- Passage 7: History of Tea Bags (past exam style)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'narrative', 'long_content',
  'History of Tea Bags

Thomas Sullivan, a tea importer in New York, accidentally invented tea bags in the early 1900s. He sent samples of tea leaves to his customers in small silk bags. To his surprise, his customers found it more convenient to pour hot water over the tea leaves while they were still in the bag. They used the bags just as they were delivered, instead of opening them. This made making tea easier and simplified cleaning the pot.

At first, silk was used for the bags, but customers said silk was not ideal for making tea. Cotton was then used instead. As tea bags became more popular, hand-making them could not meet the demand. Filter paper was introduced. It was cheap, allowed water to pass through, kept the tea leaves inside, and was suitable for large-scale production. Today, filter paper and nylon are commonly used for tea bags.

Tea bags first spread in the United States and Canada. In Britain, it took time for them to become popular. Some people there once considered it rude to use tea bags. After World War II, however, lifestyles became busier and the traditional way of making tea with loose leaves was often difficult. Tea bags fit well with the pace of modern life and finally became accepted. In the late 1990s, pyramid-shaped tea bags appeared. They gave more space for tea leaves to move around, which improved the taste. Recently, there has been a move towards using paper, cloth, or silk instead of nylon or materials containing plastic, in line with the global trend to reduce plastic use and make single-use products more environmentally friendly.',
  'History of Tea Bags',
  'History of Tea Bags

Thomas Sullivan, a tea importer in New York, accidentally invented tea bags in the early 1900s. He sent samples of tea leaves to his customers in small silk bags. To his surprise, his customers found it more convenient to pour hot water over the tea leaves while they were still in the bag. They used the bags just as they were delivered, instead of opening them. This made making tea easier and simplified cleaning the pot.

At first, silk was used for the bags, but customers said silk was not ideal for making tea. Cotton was then used instead. As tea bags became more popular, hand-making them could not meet the demand. Filter paper was introduced. It was cheap, allowed water to pass through, kept the tea leaves inside, and was suitable for large-scale production. Today, filter paper and nylon are commonly used for tea bags.

Tea bags first spread in the United States and Canada. In Britain, it took time for them to become popular. Some people there once considered it rude to use tea bags. After World War II, however, lifestyles became busier and the traditional way of making tea with loose leaves was often difficult. Tea bags fit well with the pace of modern life and finally became accepted. In the late 1990s, pyramid-shaped tea bags appeared. They gave more space for tea leaves to move around, which improved the taste. Recently, there has been a move towards using paper, cloth, or silk instead of nylon or materials containing plastic, in line with the global trend to reduce plastic use and make single-use products more environmentally friendly.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why was Thomas Sullivan surprised at his customers?',
  '["They sent the tea samples back to him without opening them.", "They asked for bigger bags to make it easier to make tea.", "They used the tea leaves in the bags just as they were delivered.", "They mixed different types of tea from different bags together."]', 2, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The development of tea bag materials was mainly influenced by',
  '["the need for a large amount of production of tea bags.", "the desire to improve the taste of tea by using filters.", "the demand for handmade bags over machine-made ones.", "the popularity of smaller bags for easy transportation."]', 0, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why did tea bags finally become popular in Britain?',
  '["The quality of tea in bags improved to match British tea culture.", "British tea companies said it was not rude to use tea bags.", "The government provided financial support to tea bag factories.", "They fit well with the pace of modern life of British people."]', 3, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Pyramid-shaped tea bags were introduced to',
  '["reduce the amount of tea leaves used and cut production costs.", "make tea bags look more modern and appealing to customers.", "give more space for tea leaves to move around in tea bags.", "compete with a traditional tea-making method in the market."]', 2, 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Which of the following statements is true?',
  '["Filter paper was the first material used to make tea bags.", "The materials used for tea bags are becoming more eco-friendly.", "It was Sullivan''s customers'' idea to put tea leaves in silk bags.", "People in Britain never used tea bags until very recently."]', 1, 4
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 8: The Mirror Test (past exam style)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'narrative', 'long_content',
  'The Mirror Test

Humans and animals differ in many ways, including language and culture. One question scientists have long asked is whether animals can recognize themselves. The mirror test is a method used to find out if an animal can recognize itself. In this test, a mark is placed on an animal''s body in a spot it cannot see without a mirror. If the animal tries to remove or touch the mark after seeing its reflection, it is thought to show self-recognition.

Researchers have used this test on a type of fish called cleaner wrasses. At first, the fish attacked their reflections, perhaps thinking they were other fish. After they became used to the mirror, they were marked while they were asleep. When they woke up and saw themselves in the mirror, many tried to remove the mark by rubbing their bodies against the tank or the sand. In another experiment, the fish were shown photographs. They tried to remove marks from pictures of themselves but not from pictures of other marked fish. This suggests they can tell the difference between themselves and others.

The mirror test is still subject to debate. Some researchers point out that animals that are not familiar with mirrors may not understand how they work. Failing the test does not always mean an animal lacks self-recognition. In addition, vision is not the main sense for all animals. Some rely more on smell or other senses. The test may not be suitable for every species. Despite these limitations, studies like the one on cleaner wrasses have shown that some fish may have a form of self-awareness, which has surprised many people and changed the way we think about animal minds.',
  'The Mirror Test',
  'The Mirror Test

Humans and animals differ in many ways, including language and culture. One question scientists have long asked is whether animals can recognize themselves. The mirror test is a method used to find out if an animal can recognize itself. In this test, a mark is placed on an animal''s body in a spot it cannot see without a mirror. If the animal tries to remove or touch the mark after seeing its reflection, it is thought to show self-recognition.

Researchers have used this test on a type of fish called cleaner wrasses. At first, the fish attacked their reflections, perhaps thinking they were other fish. After they became used to the mirror, they were marked while they were asleep. When they woke up and saw themselves in the mirror, many tried to remove the mark by rubbing their bodies against the tank or the sand. In another experiment, the fish were shown photographs. They tried to remove marks from pictures of themselves but not from pictures of other marked fish. This suggests they can tell the difference between themselves and others.

The mirror test is still subject to debate. Some researchers point out that animals that are not familiar with mirrors may not understand how they work. Failing the test does not always mean an animal lacks self-recognition. In addition, vision is not the main sense for all animals. Some rely more on smell or other senses. The test may not be suitable for every species. Despite these limitations, studies like the one on cleaner wrasses have shown that some fish may have a form of self-awareness, which has surprised many people and changed the way we think about animal minds.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The mirror test is used',
  '["to test an animal''s ability to see in the dark.", "to find out how far an animal can see.", "to determine if an animal can recognize itself.", "to see when a baby recognizes who its mother is."]', 2, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How did the cleaner wrasses behave when they were first shown a mirror?',
  '["They opened and closed their mouths many times.", "They compared the color of their body to that of the mirrored fish.", "They attacked their reflections, thinking they were other fish.", "They began to swim in a different way than before."]', 2, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did the cleaner wrasses do when they were shown a picture of themselves with a mark?',
  '["They tried to get rid of the mark on their body.", "They escaped from the picture and hid behind a rock.", "They ignored the picture and showed no interest.", "They began swimming with other fish in the tank."]', 0, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'In the discussion about the mirror test, it has been pointed out that',
  '["it costs a lot of money and takes too much time.", "it is too dangerous to use a piece of glass in the water.", "it only works on fish and some types of monkeys.", "it needs to consider the other senses that animals have."]', 3, 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Which of the following statements is true?',
  '["Some fish can understand the difference between themselves and others.", "The cleaner wrasses were marked first and then placed in a tank with a mirror.", "The cleaner wrasses did not notice the marks that were put on their bodies.", "It was found that only animals with large brains understand how to use mirrors."]', 0, 4
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 9: Stopping Advertisements (past exam style)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'narrative', 'long_content',
  'Stopping Advertisements

Advertising has a long history, from ancient Egypt to the invention of newspapers. It has helped businesses share information about their products and increase sales. At the same time, it has caused problems such as spreading incorrect information and filling cities with signs and billboards. As advertisements have increased in people''s daily lives, people are more likely to encounter wrong or misleading information.

Many countries have decided to control certain types of advertisements to protect people''s health and well-being. For example, tobacco advertising has been reduced or banned in many places because of health concerns. In Australia and the United Kingdom, there are strict rules against advertising alcohol to young people. Some areas have removed advertisements for unhealthy food from schools. Advertising is strictly controlled in these ways to protect the public.

In São Paulo, Brazil, a law called the Clean City Law was passed in the early 2000s. It banned advertisements on taxis, buses, and the outsides of stores. People could appreciate the appearance of buildings more. At first, electronic signs were not included in the ban. Later, Grenoble in France decided to ban certain advertisements, including electronic signs. Some companies tried to put up new electronic signs before the ban took effect, but they failed. Where signs were removed, trees and plants were put in their place. In Switzerland, the city of Vernier tried to ban outdoor advertisements to restore the city''s beauty and improve the environment. However, some people argued that banning advertisements could limit the right to advertise and freedom of speech. Some businesses also worried that they would lose customers if they could not advertise.',
  'Stopping Advertisements',
  'Stopping Advertisements

Advertising has a long history, from ancient Egypt to the invention of newspapers. It has helped businesses share information about their products and increase sales. At the same time, it has caused problems such as spreading incorrect information and filling cities with signs and billboards. As advertisements have increased in people''s daily lives, people are more likely to encounter wrong or misleading information.

Many countries have decided to control certain types of advertisements to protect people''s health and well-being. For example, tobacco advertising has been reduced or banned in many places because of health concerns. In Australia and the United Kingdom, there are strict rules against advertising alcohol to young people. Some areas have removed advertisements for unhealthy food from schools. Advertising is strictly controlled in these ways to protect the public.

In São Paulo, Brazil, a law called the Clean City Law was passed in the early 2000s. It banned advertisements on taxis, buses, and the outsides of stores. People could appreciate the appearance of buildings more. At first, electronic signs were not included in the ban. Later, Grenoble in France decided to ban certain advertisements, including electronic signs. Some companies tried to put up new electronic signs before the ban took effect, but they failed. Where signs were removed, trees and plants were put in their place. In Switzerland, the city of Vernier tried to ban outdoor advertisements to restore the city''s beauty and improve the environment. However, some people argued that banning advertisements could limit the right to advertise and freedom of speech. Some businesses also worried that they would lose customers if they could not advertise.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'With an increase in advertisements in people''s daily lives,',
  '["people are more likely to encounter incorrect information.", "stores are putting more effort into creating better ads than others.", "the importance of advertising in ancient Egypt has become a target of study.", "ordinary people have started creating their own advertisements."]', 0, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why have some countries decided to control certain types of advertisements?',
  '["To encourage young people to cook more at home.", "To promote products that are environmentally friendly.", "To protect people''s health from harm.", "To increase profits for businesses selling healthier products."]', 2, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Under São Paulo''s Clean City Law, electronic signs were',
  '["given a few years before being completely banned.", "discussed more often than any other topic.", "criticized more by government officials.", "left without becoming the target of the law at first."]', 3, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'In Switzerland, some people think that',
  '["banning advertisements would infringe upon the right to advertise and freedom of speech.", "removing advertisements would boost the economy and attract more tourists.", "fewer advertisements would lead to a decrease in violent crimes.", "banning advertisements would make it easier for cities to attract new businesses."]', 0, 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Which of the following statements is true?',
  '["Television appeared in the twentieth century mainly to broadcast advertisements.", "Advertisements can help businesses share information about their products and make a profit.", "São Paulo followed Grenoble''s method to ban electronic advertisements.", "Freedom of speech is considered the most important right in Switzerland."]', 1, 4
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 10: Bees and Pollination
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'narrative', 'long_content',
  'Bees and Pollination

Bees play a vital role in agriculture and natural ecosystems. They pollinate many of the crops that humans eat, including fruits, vegetables, and nuts. Without bees, the production of these foods would drop sharply. In recent years, however, the number of bees has been declining in many parts of the world. Scientists have identified several causes. The use of certain pesticides can harm bees. Loss of habitat, as cities and farms expand, leaves bees with fewer places to live and fewer flowers to feed on. Climate change has also affected the timing of when flowers bloom and when bees are active, which can make it harder for bees to find food.

Some countries have taken action to protect bees. In Europe, the use of some pesticides that are harmful to bees has been restricted. Farmers are encouraged to plant flowers around their fields to provide food for bees. In cities, people have created "bee hotels" and rooftop gardens where bees can nest and find pollen. Schools and communities sometimes keep beehives and learn about the importance of bees.

Researchers are also studying wild bees, not only honeybees. There are thousands of species of bees, and many of them are important pollinators. By understanding where they live and what they need, we can better protect them. The decline of bees is a global problem, but efforts by governments, farmers, and ordinary people can help slow it down and support the recovery of bee populations.',
  'Bees and Pollination',
  'Bees and Pollination

Bees play a vital role in agriculture and natural ecosystems. They pollinate many of the crops that humans eat, including fruits, vegetables, and nuts. Without bees, the production of these foods would drop sharply. In recent years, however, the number of bees has been declining in many parts of the world. Scientists have identified several causes. The use of certain pesticides can harm bees. Loss of habitat, as cities and farms expand, leaves bees with fewer places to live and fewer flowers to feed on. Climate change has also affected the timing of when flowers bloom and when bees are active, which can make it harder for bees to find food.

Some countries have taken action to protect bees. In Europe, the use of some pesticides that are harmful to bees has been restricted. Farmers are encouraged to plant flowers around their fields to provide food for bees. In cities, people have created "bee hotels" and rooftop gardens where bees can nest and find pollen. Schools and communities sometimes keep beehives and learn about the importance of bees.

Researchers are also studying wild bees, not only honeybees. There are thousands of species of bees, and many of them are important pollinators. By understanding where they live and what they need, we can better protect them. The decline of bees is a global problem, but efforts by governments, farmers, and ordinary people can help slow it down and support the recovery of bee populations.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why are bees important for humans?',
  '["They produce honey that is sold worldwide.", "They pollinate many crops that humans eat.", "They protect farms from other insects.", "They are used in medical research."]', 1, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, what has caused the decline of bees?',
  '["Bees have moved to warmer countries.", "The use of certain pesticides and loss of habitat.", "Farmers have stopped planting flowers.", "Governments have banned beekeeping."]', 1, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What have some people in cities done to help bees?',
  '["They have removed all flowers from parks.", "They have created bee hotels and rooftop gardens.", "They have stopped using any pesticides.", "They have moved beehives to the countryside."]', 1, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do researchers study besides honeybees?',
  '["Only the honey that bees produce.", "Wild bees and many species of bees.", "Bees in ancient Egypt.", "Bees that live in cold regions only."]', 1, 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do we learn from the passage?',
  '["Bees are only found in Europe.", "The decline of bees is a global problem that can be addressed by various efforts.", "Farmers do not need bees for their crops.", "Pesticides have no effect on bees."]', 1, 4
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 11: Sleep and Health
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'narrative', 'long_content',
  'Sleep and Health

Sleep is essential for both physical and mental health. When we sleep, our body repairs itself and our brain processes the information we have learned during the day. Adults are generally advised to get seven to nine hours of sleep per night. However, many people today do not get enough sleep. Busy schedules, the use of smartphones and computers at night, and stress can all make it difficult to fall asleep or to sleep well.

Lack of sleep has been linked to various health problems. It can weaken the immune system, making people more likely to get sick. It can also affect mood and concentration, and over a long period it may increase the risk of conditions such as heart disease and diabetes. On the other hand, good sleep can improve memory, help with weight management, and support overall well-being.

To improve sleep, experts suggest going to bed and waking up at the same time every day, even on weekends. It is also helpful to avoid screens for at least an hour before bed, because the light from devices can interfere with the body''s natural sleep cycle. Keeping the bedroom dark, quiet, and cool can make it easier to fall asleep. Exercise during the day can promote better sleep, but exercising too close to bedtime may have the opposite effect. If sleep problems continue, it is important to consult a doctor, as they may be a sign of a sleep disorder or another health issue.',
  'Sleep and Health',
  'Sleep and Health

Sleep is essential for both physical and mental health. When we sleep, our body repairs itself and our brain processes the information we have learned during the day. Adults are generally advised to get seven to nine hours of sleep per night. However, many people today do not get enough sleep. Busy schedules, the use of smartphones and computers at night, and stress can all make it difficult to fall asleep or to sleep well.

Lack of sleep has been linked to various health problems. It can weaken the immune system, making people more likely to get sick. It can also affect mood and concentration, and over a long period it may increase the risk of conditions such as heart disease and diabetes. On the other hand, good sleep can improve memory, help with weight management, and support overall well-being.

To improve sleep, experts suggest going to bed and waking up at the same time every day, even on weekends. It is also helpful to avoid screens for at least an hour before bed, because the light from devices can interfere with the body''s natural sleep cycle. Keeping the bedroom dark, quiet, and cool can make it easier to fall asleep. Exercise during the day can promote better sleep, but exercising too close to bedtime may have the opposite effect. If sleep problems continue, it is important to consult a doctor, as they may be a sign of a sleep disorder or another health issue.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why do many people not get enough sleep today?',
  '["Doctors advise them to sleep less.", "Busy schedules, use of devices at night, and stress.", "They need less sleep than in the past.", "Sleep is no longer considered important."]', 1, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Lack of sleep can',
  '["strengthen the immune system.", "improve mood and concentration.", "increase the risk of heart disease and diabetes over time.", "make people need less food."]', 2, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why do experts suggest avoiding screens before bed?',
  '["Screens are too expensive to use at night.", "The light from devices can interfere with the body''s natural sleep cycle.", "Screens make the room too bright.", "People never use screens for important work."]', 1, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is said about exercise and sleep?',
  '["Exercise at any time has no effect on sleep.", "Exercise during the day can promote better sleep.", "People should only exercise at bedtime.", "Exercise is harmful to sleep."]', 1, 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do we learn from the passage?',
  '["Sleep is only important for children.", "Good sleep can improve memory and support overall well-being.", "Seven to nine hours of sleep is too much for adults.", "Doctors do not treat sleep problems."]', 1, 4
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 12: History of the Bicycle
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'narrative', 'long_content',
  'History of the Bicycle

The bicycle is one of the most widely used forms of transportation in the world. Its history goes back to the early 19th century. The first machine that looked like a bicycle was built in Germany. It had no pedals; riders pushed it with their feet on the ground. Later, pedals were added, and the front wheel became much larger than the back wheel. This design was hard to ride and could be dangerous. In the 1880s, the "safety bicycle" was developed. It had two wheels of the same size and a chain that drove the back wheel. This design is similar to the bicycles we use today and made cycling much safer and more practical.

Bicycles quickly became popular for both travel and sport. They gave people a cheap and independent way to travel. In many countries, bicycles were also used for delivering mail and goods. During the 20th century, cars became more common, and in some places cycling declined. In recent decades, however, interest in cycling has grown again. People are concerned about the environment and health, and bicycles produce no pollution and provide exercise. Many cities have built cycle lanes and introduced sharing systems where people can rent bicycles for short trips.

Today, electric bicycles have become popular. They use a battery to assist the rider, making it easier to climb hills or travel long distances. In some countries, they have become a common way to commute. The bicycle has changed a lot since the 19th century, but it remains an important means of transport and a symbol of simple, sustainable mobility.',
  'History of the Bicycle',
  'History of the Bicycle

The bicycle is one of the most widely used forms of transportation in the world. Its history goes back to the early 19th century. The first machine that looked like a bicycle was built in Germany. It had no pedals; riders pushed it with their feet on the ground. Later, pedals were added, and the front wheel became much larger than the back wheel. This design was hard to ride and could be dangerous. In the 1880s, the "safety bicycle" was developed. It had two wheels of the same size and a chain that drove the back wheel. This design is similar to the bicycles we use today and made cycling much safer and more practical.

Bicycles quickly became popular for both travel and sport. They gave people a cheap and independent way to travel. In many countries, bicycles were also used for delivering mail and goods. During the 20th century, cars became more common, and in some places cycling declined. In recent decades, however, interest in cycling has grown again. People are concerned about the environment and health, and bicycles produce no pollution and provide exercise. Many cities have built cycle lanes and introduced sharing systems where people can rent bicycles for short trips.

Today, electric bicycles have become popular. They use a battery to assist the rider, making it easier to climb hills or travel long distances. In some countries, they have become a common way to commute. The bicycle has changed a lot since the 19th century, but it remains an important means of transport and a symbol of simple, sustainable mobility.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What was the first bicycle-like machine like?',
  '["It had pedals and two wheels of the same size.", "It had no pedals; riders pushed it with their feet.", "It was powered by an electric battery.", "It had three wheels for stability."]', 1, 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The "safety bicycle" made cycling',
  '["faster than cars.", "much safer and more practical.", "only for sport.", "popular only in Germany."]', 1, 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why has interest in cycling grown again in recent decades?',
  '["Cars have become too expensive.", "People are more concerned about the environment and health.", "Governments have banned cars in cities.", "Bicycles have become faster than before."]', 1, 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about electric bicycles?',
  '["They were first developed in the 19th century.", "They use a battery to assist the rider.", "They are not allowed in most cities.", "They are only for long-distance travel."]', 1, 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do we learn from the passage?',
  '["The bicycle has not changed since the 19th century.", "The bicycle remains an important means of transport and sustainable mobility.", "Bicycles were never used for delivering mail.", "Electric bicycles have replaced all other bicycles."]', 1, 4
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
