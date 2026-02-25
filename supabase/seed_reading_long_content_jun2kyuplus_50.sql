-- seed_reading_long_content_jun2kyuplus_50.sql
-- 英検準2級プラス 長文の内容一致選択 約53問（Eメール3問×6題 + 説明文5問×7題）
-- 大問3形式（2級と同じ）：A Eメール3問／B 説明文5問。Eメール約200語・説明文約320語。
-- 038 以降のマイグレーション実行後に実行

-- ========== 3A Eメール（各3問）==========

-- Passage 1: Speech at school festival (Harvey - Heidi, tennis player)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'email', 'long_content',
  'From: Harvey Rogers <h.r.0622@ocean-letter.net>
To: Heidi Collins <heidicollins@prime-eletter.com>
Date: October 2
Subject: Speech at school festival

Dear Heidi,

This is Harvey Rogers. I am a high school student at Eagle Lake High School, and I recently talked with you. Thank you for accepting our request to give a speech at our school festival. The festival will be held on Saturday, October 19. Your event is planned to begin at 1 p.m. Many students are excited to meet you, a professional tennis player who graduated from our high school.

We would like to discuss the topics you plan to cover during the event. You already told us that you were thinking of talking about your life as a professional athlete. It would be great if you could also speak about your high school days and how you overcame challenges in your life. If you could share any advice for young people who want to follow their dreams, that would be wonderful too.

We will have a short time for students to ask you some questions. If possible, we would also like to take pictures of you with students. After the talk, we will offer you a tour of the school. You are more than welcome to visit our school''s tennis team and meet the players. Just for your information, the school newspaper team is interested in writing a short article about the event.

Thank you,
Harvey Rogers',
  'Speech at school festival',
  'From: Harvey Rogers <h.r.0622@ocean-letter.net>
To: Heidi Collins <heidicollins@prime-eletter.com>
Date: October 2
Subject: Speech at school festival

Dear Heidi,

This is Harvey Rogers. I am a high school student at Eagle Lake High School, and I recently talked with you. Thank you for accepting our request to give a speech at our school festival. The festival will be held on Saturday, October 19. Your event is planned to begin at 1 p.m. Many students are excited to meet you, a professional tennis player who graduated from our high school.

We would like to discuss the topics you plan to cover during the event. You already told us that you were thinking of talking about your life as a professional athlete. It would be great if you could also speak about your high school days and how you overcame challenges in your life. If you could share any advice for young people who want to follow their dreams, that would be wonderful too.

We will have a short time for students to ask you some questions. If possible, we would also like to take pictures of you with students. After the talk, we will offer you a tour of the school. You are more than welcome to visit our school''s tennis team and meet the players. Just for your information, the school newspaper team is interested in writing a short article about the event.

Thank you,
Harvey Rogers'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about Heidi Collins?',
  '["She quit playing tennis as a professional athlete.", "She was invited to a university as a guest speaker.", "She will have a tennis tournament on October 19.", "She went to the same high school as Harvey Rogers."]', 3, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Heidi told Harvey that she would talk about',
  '["how she achieved her dream of teaching tennis.", "how she became a professional photographer.", "how she lived a professional athlete''s life.", "how she had spent her high school days."]', 2, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What will Heidi do on the day of the event?',
  '["Look around the school before the event.", "Take pictures with students at the event.", "Have an interview with a local newspaper company.", "Play tennis against high school students."]', 1, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 2: Writing contest (Jacob - Maria)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'email', 'long_content',
  'From: Jacob Francis <general@queens-fall.com>
To: Maria Stone <maria.stone.123@ocean-network.com>
Date: November 12
Subject: Writing contest

Dear Maria Stone,

Thank you for sending your essay to our city writing contest. I am Jacob Francis, one of the organizers. I am pleased to inform you that your essay about "life goals" has won first prize in the high school category.

We chose your essay for several reasons. Your writing skills are excellent, and your storytelling is compelling. Your word choice and expression of feelings were also excellent, and we were impressed by how seriously you think about your future. We believe that your view of life could positively impact other high school students and adults.

We would like to ask you to read your essay as a speech at an upcoming city event next month. This will give you the opportunity to share your thoughts with a large audience. A local newspaper company will also be present, and we hope to showcase great students like you. Please let us know by November 20 if you can take part.

Thank you,
Jacob Francis',
  'Writing contest',
  'From: Jacob Francis <general@queens-fall.com>
To: Maria Stone <maria.stone.123@ocean-network.com>
Date: November 12
Subject: Writing contest

Dear Maria Stone,

Thank you for sending your essay to our city writing contest. I am Jacob Francis, one of the organizers. I am pleased to inform you that your essay about "life goals" has won first prize in the high school category.

We chose your essay for several reasons. Your writing skills are excellent, and your storytelling is compelling. Your word choice and expression of feelings were also excellent, and we were impressed by how seriously you think about your future. We believe that your view of life could positively impact other high school students and adults.

We would like to ask you to read your essay as a speech at an upcoming city event next month. This will give you the opportunity to share your thoughts with a large audience. A local newspaper company will also be present, and we hope to showcase great students like you. Please let us know by November 20 if you can take part.

Thank you,
Jacob Francis'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why did Jacob Francis send an e-mail to Maria Stone?',
  '["To let her know that he received her essay.", "To share the news of her winning a prize.", "To ask her to send him her essay again.", "To tell her about the city''s writing contest."]', 1, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'One of the reasons Maria Stone''s essay was chosen is that',
  '["young people would agree with her view of life.", "she described what exactly life was all about.", "it used some expressions students do not often use.", "reading her essay would positively influence others."]', 3, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did Jacob Francis ask Maria Stone to do?',
  '["Come to the city event to receive an award.", "Practice her speech for a big event outside the city.", "Let people hear her speech at the city event.", "Send her essay to a local newspaper company."]', 2, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 3: Hotel stay (Ryan - Bella)
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'email', 'long_content',
  'From: Ryan Knight <contact@twin-riverside-hotel.com>
To: Bella Patterson <bella.patterson.0613@unite-portal.com>
Date: April 20
Subject: About your stay at our hotel

Dear Bella Patterson,

Thank you for choosing the Twin Riverside Hotel. We are pleased to confirm your reservation. We understand that this is your first stay with us and that you are staying for an interview test at a university near us. We hope to make your trip comfortable.

Our hotel is located on a quiet street, but there are many restaurants and cafés nearby. Transportation is within a few minutes. The hotel is especially suitable for single travelers, and we welcome many students and business travelers. Each room has a desk and a chair, and there is a space in the hotel for guests to use for study or work.

Payment was not required when you booked, so the full amount is due when you arrive. If you cancel on the day of your stay, the full amount must be paid. Please note that cancellation is not possible through our website. Cancellation is only accepted by phone or e-mail. If you have any questions, please contact us.

Thank you,
Ryan Knight',
  'About your stay at our hotel',
  'From: Ryan Knight <contact@twin-riverside-hotel.com>
To: Bella Patterson <bella.patterson.0613@unite-portal.com>
Date: April 20
Subject: About your stay at our hotel

Dear Bella Patterson,

Thank you for choosing the Twin Riverside Hotel. We are pleased to confirm your reservation. We understand that this is your first stay with us and that you are staying for an interview test at a university near us. We hope to make your trip comfortable.

Our hotel is located on a quiet street, but there are many restaurants and cafés nearby. Transportation is within a few minutes. The hotel is especially suitable for single travelers, and we welcome many students and business travelers. Each room has a desk and a chair, and there is a space in the hotel for guests to use for study or work.

Payment was not required when you booked, so the full amount is due when you arrive. If you cancel on the day of your stay, the full amount must be paid. Please note that cancellation is not possible through our website. Cancellation is only accepted by phone or e-mail. If you have any questions, please contact us.

Thank you,
Ryan Knight'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why is Bella Patterson staying at the Twin Riverside Hotel?',
  '["Because she will have an interview at a place near the hotel.", "Because she liked her last stay at the hotel very much.", "Because she read a book that recommended the hotel.", "Because she will meet her relatives near the hotel."]', 0, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about the Twin Riverside Hotel?',
  '["It is on a busy street with many restaurants and cafés.", "It is designed to attract younger people rather than elderly people.", "It has a space where guests can concentrate on their tasks.", "It has rooms for several single guests to share together."]', 2, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'If Bella wants to cancel her reservation,',
  '["she may get back half of the amount she paid.", "she can avoid paying whenever she cancels it.", "she should go to the hotel''s website first.", "she must call the hotel or send an e-mail."]', 3, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 4: Magazine contribution request
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'email', 'long_content',
  'From: Emma Walsh <e.walsh@greenlife-magazine.com>
To: Dr. James Chen <j.chen@university.edu>
Date: March 5
Subject: Request for an article

Dear Dr. Chen,

I am Emma Walsh, an editor at Green Life Magazine. We focus on environmental issues and sustainable living. I have read your recent research on how trees in cities can improve air quality and reduce stress. We would like to invite you to write a short article for our June issue.

The article should be around 800 words and written for general readers, not only experts. We would like you to explain your main findings and suggest what people can do in their daily lives to support urban green spaces. You could also include one or two photos from your research if you have them. The deadline for the first draft is April 15. We will send you our feedback within two weeks and ask for any changes before we publish.

Please let us know by March 20 whether you can accept this request. We believe your work would inspire many of our readers. Thank you for your time.

Best regards,
Emma Walsh',
  'Request for an article',
  'From: Emma Walsh <e.walsh@greenlife-magazine.com>
To: Dr. James Chen <j.chen@university.edu>
Date: March 5
Subject: Request for an article

Dear Dr. Chen,

I am Emma Walsh, an editor at Green Life Magazine. We focus on environmental issues and sustainable living. I have read your recent research on how trees in cities can improve air quality and reduce stress. We would like to invite you to write a short article for our June issue.

The article should be around 800 words and written for general readers, not only experts. We would like you to explain your main findings and suggest what people can do in their daily lives to support urban green spaces. You could also include one or two photos from your research if you have them. The deadline for the first draft is April 15. We will send you our feedback within two weeks and ask for any changes before we publish.

Please let us know by March 20 whether you can accept this request. We believe your work would inspire many of our readers. Thank you for your time.

Best regards,
Emma Walsh'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why did Emma Walsh write to Dr. Chen?',
  '["To ask him to join the magazine as an editor.", "To invite him to write an article for the magazine.", "To order his research photos.", "To thank him for reading Green Life Magazine."]', 1, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Emma ask Dr. Chen to include in the article?',
  '["Only expert-level language.", "Suggestions for what people can do in daily life.", "Photos of the magazine office.", "A list of other researchers."]', 1, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'By when should Dr. Chen send his first draft?',
  '["By March 5.", "By March 20.", "By April 15.", "By June."]', 2, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 5: Volunteer event
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'email', 'long_content',
  'From: Lisa Park <l.park@community-action.org>
To: David Moore <d.moore@email.com>
Date: May 8
Subject: Thank you – Beach cleanup

Dear David,

Thank you for taking part in our beach cleanup event on May 5. We had over 80 volunteers, and together we collected more than 200 bags of trash. Your help made a real difference. We have received many positive comments from local residents.

We are planning another event on June 15. This time we will focus on planting native plants near the beach to prevent soil from washing away. We need people who can help for at least two hours. We will provide gloves and tools. If you would like to join again, please reply to this e-mail by June 1. We will send you the exact meeting place and time. We are also looking for volunteers who can take photos of the event for our website. If you are interested in that role, please let us know in your reply.

We hope to see you again.

Sincerely,
Lisa Park',
  'Thank you – Beach cleanup',
  'From: Lisa Park <l.park@community-action.org>
To: David Moore <d.moore@email.com>
Date: May 8
Subject: Thank you – Beach cleanup

Dear David,

Thank you for taking part in our beach cleanup event on May 5. We had over 80 volunteers, and together we collected more than 200 bags of trash. Your help made a real difference. We have received many positive comments from local residents.

We are planning another event on June 15. This time we will focus on planting native plants near the beach to prevent soil from washing away. We need people who can help for at least two hours. We will provide gloves and tools. If you would like to join again, please reply to this e-mail by June 1. We will send you the exact meeting place and time. We are also looking for volunteers who can take photos of the event for our website. If you are interested in that role, please let us know in your reply.

We hope to see you again.

Sincerely,
Lisa Park'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did David do on May 5?',
  '["He sent an e-mail to Lisa Park.", "He took part in a beach cleanup event.", "He planted native plants near the beach.", "He took photos for the website."]', 1, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What will the June 15 event focus on?',
  '["Collecting trash on the beach.", "Planting native plants near the beach.", "Taking photos for the website.", "Teaching residents about the ocean."]', 1, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Lisa ask David to do if he wants to join the June event?',
  '["Pay a fee by June 1.", "Reply to the e-mail by June 1.", "Bring his own gloves and tools.", "Stay for the whole day."]', 1, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 6: Internship offer
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'email', 'long_content',
  'From: Tom Bradley <t.bradley@sunrise-design.com>
To: Yuki Tanaka <y.tanaka@studentmail.edu>
Date: September 3
Subject: Internship offer

Dear Yuki,

Thank you for applying for our summer internship and for attending the interview last week. We are pleased to offer you a position in our design team. The internship will run from September 16 to December 13. You will work three days per week, from 9 a.m. to 5 p.m. You will assist our designers with research and simple design tasks. We will assign you a mentor who will support you throughout the program.

Please confirm your acceptance by September 10. You will need to sign the attached agreement and send it back by e-mail. We also need a copy of your student ID and your schedule so we can plan your training. On your first day, please come to the main office on the third floor by 8:50 a.m. We will give you an orientation and introduce you to the team. If you have any questions before then, do not hesitate to contact me.

We look forward to working with you.

Best regards,
Tom Bradley',
  'Internship offer',
  'From: Tom Bradley <t.bradley@sunrise-design.com>
To: Yuki Tanaka <y.tanaka@studentmail.edu>
Date: September 3
Subject: Internship offer

Dear Yuki,

Thank you for applying for our summer internship and for attending the interview last week. We are pleased to offer you a position in our design team. The internship will run from September 16 to December 13. You will work three days per week, from 9 a.m. to 5 p.m. You will assist our designers with research and simple design tasks. We will assign you a mentor who will support you throughout the program.

Please confirm your acceptance by September 10. You will need to sign the attached agreement and send it back by e-mail. We also need a copy of your student ID and your schedule so we can plan your training. On your first day, please come to the main office on the third floor by 8:50 a.m. We will give you an orientation and introduce you to the team. If you have any questions before then, do not hesitate to contact me.

We look forward to working with you.

Best regards,
Tom Bradley'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about Yuki Tanaka?',
  '["She has already worked at Sunrise Design.", "She applied for an internship and had an interview.", "She will work five days per week.", "She will start on September 10."]', 1, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Yuki need to do by September 10?',
  '["Start working at the office.", "Confirm her acceptance and send the signed agreement.", "Meet her mentor.", "Attend another interview."]', 1, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What will happen on Yuki''s first day?',
  '["She will sign the agreement.", "She will have an orientation and be introduced to the team.", "She will meet Tom Bradley for an interview.", "She will receive her schedule."]', 1, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== 3B 説明文（各5問）==========

-- Passage 7: Polar Bears
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'narrative', 'long_content',
  'Polar Bears

Tens of thousands of polar bears live in the world, mostly in Canada. Climate change has a major impact on them, and it has become difficult or impossible for some populations to survive. A study shows that the Arctic has been warming more than twice as fast as the world average since the mid-1990s.

Global warming affects the polar bears'' shelter and food supply. They usually live on ice and catch animals there. When there is less ice, they are forced onto land. On land, they try to eat things like berries, but they lose weight quickly and face danger. A three-year study observed twenty polar bears during the summer months. Some of them rested to save energy, but most tried to find food. Almost all of them lost an average of one kilogram per day. This shows how hard it is for polar bears to survive the summer without enough ice.

Studies suggest that polar bears could struggle to exist until 2100 if greenhouse gases are not reduced. In some areas, polar bears may not survive beyond 2030. Another study says there could be almost no Arctic ice in summer by 2040. The future of polar bears is closely linked to whether humans can reduce the production of greenhouse gases.',
  'Polar Bears',
  'Polar Bears

Tens of thousands of polar bears live in the world, mostly in Canada. Climate change has a major impact on them, and it has become difficult or impossible for some populations to survive. A study shows that the Arctic has been warming more than twice as fast as the world average since the mid-1990s.

Global warming affects the polar bears'' shelter and food supply. They usually live on ice and catch animals there. When there is less ice, they are forced onto land. On land, they try to eat things like berries, but they lose weight quickly and face danger. A three-year study observed twenty polar bears during the summer months. Some of them rested to save energy, but most tried to find food. Almost all of them lost an average of one kilogram per day. This shows how hard it is for polar bears to survive the summer without enough ice.

Studies suggest that polar bears could struggle to exist until 2100 if greenhouse gases are not reduced. In some areas, polar bears may not survive beyond 2030. Another study says there could be almost no Arctic ice in summer by 2040. The future of polar bears is closely linked to whether humans can reduce the production of greenhouse gases.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about global warming in the Arctic?',
  '["The impact is much greater than in other parts of the planet.", "The impact is much less than what it used to be in the 1990s.", "The number of polar bears in the Arctic has been increasing.", "The number of animals in the Arctic is twice as many as in Canada."]', 0, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Ice is important for polar bears because',
  '["they can swim whenever they want in order to lose weight.", "they are safer from enemies when they are on the ice.", "living on the ice is convenient for them to find other polar bears.", "living on the ice makes it easier for them to catch their food."]', 3, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'During the study of polar bears in summer, most polar bears',
  '["searched for ice to find a place to live.", "took action to find something to eat.", "were full of energy until the summer ended.", "ate ice in the end because of a lack of food."]', 1, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What could happen if greenhouse gases are not reduced?',
  '["Most polar bears could still be alive one hundred years from now.", "Polar bears could find a way to survive on their own.", "The Arctic ice could disappear by 2040, even in winter.", "Most polar bears could be completely gone by 2100."]', 3, 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do we learn from the passage?',
  '["Most of the surviving polar bears today will move to warmer places.", "There will be more ice in the Arctic and in Canada by 2040.", "Polar bears lose weight if they cannot find their food on the ice.", "Polar bears can survive for a long time on only berries."]', 2, 4
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 8: The Great Green Wall
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'narrative', 'long_content',
  'A Big Project in Africa

The Great Green Wall is a project by several African countries. They are planting trees and other plants across the region. It is not a real wall, but the name helps people imagine a line of green across the continent. The project aims to improve the condition of the soil, help farmers grow more crops, boost economies, and improve the quality of life for local people.

The area around the Sahara Desert has been damaged by climate change, terrible weather events, and human activities such as repeated farming. Scientists are working to prevent further damage and to bring back plants that are native to the area. Millions of people live in these dry regions and depend on the land.

The project has already shown positive effects in some countries. In Senegal, trees that were planted produce fruits that are good for people''s health. In Ethiopia, growing trees that are native to the area has helped the soil hold more water. As a result, a large amount of land has recovered. There are two key points to making the project successful. First, local people must take good care of the trees after they are planted. Second, the project creates jobs so that local people can earn more money. This is one of the main goals and helps both the environment and the economy in African countries.',
  'A Big Project in Africa',
  'A Big Project in Africa

The Great Green Wall is a project by several African countries. They are planting trees and other plants across the region. It is not a real wall, but the name helps people imagine a line of green across the continent. The project aims to improve the condition of the soil, help farmers grow more crops, boost economies, and improve the quality of life for local people.

The area around the Sahara Desert has been damaged by climate change, terrible weather events, and human activities such as repeated farming. Scientists are working to prevent further damage and to bring back plants that are native to the area. Millions of people live in these dry regions and depend on the land.

The project has already shown positive effects in some countries. In Senegal, trees that were planted produce fruits that are good for people''s health. In Ethiopia, growing trees that are native to the area has helped the soil hold more water. As a result, a large amount of land has recovered. There are two key points to making the project successful. First, local people must take good care of the trees after they are planted. Second, the project creates jobs so that local people can earn more money. This is one of the main goals and helps both the environment and the economy in African countries.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about the Great Green Wall project?',
  '["It is a project that will build a wall that stretches across the African continent.", "It is a project that has a negative impact on the environment in African countries.", "It is a project that can change the condition of the soil in African countries.", "It is a project that brings all African countries together to create a huge forest."]', 2, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How did the area around the Sahara Desert get damaged?',
  '["Both natural events and human activities destroyed the environment.", "Scientists removed the plants from the land for research purposes.", "People stopped farming there, so the land became dry and useless.", "The land was destroyed because nobody lived there for many years."]', 0, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'In the country of Senegal,',
  '["people have planted trees whose fruits can improve their physical condition.", "positive effects have been shown only for a short period of time.", "the planted trees have helped the other crops grow well.", "soil quality has become worse despite efforts to plant trees."]', 0, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one of the key points to making the Great Green Wall project successful?',
  '["Hiring only experts to take care of the trees.", "Getting support for money from non-African countries.", "Bringing resources from outside the African continent.", "Increasing the number of jobs for the local people."]', 3, 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do we learn from the passage?',
  '["Some countries, like Ethiopia, are against the Great Green Wall project.", "The Great Green Wall project includes caring for trees well after planting them.", "It is believed that the Great Green Wall project may not succeed in the end.", "There are almost no people who support the Great Green Wall project at the moment."]', 1, 4
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 9: A New Type of Coffee
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'narrative', 'long_content',
  'A New Type of Coffee

Coffee culture is growing around the world. An American company is trying something new: it makes coffee without using coffee beans. This product is called beanless coffee. The American company is not alone. Other companies in Singapore and the Netherlands are also making beanless coffee, so the industry is expanding.

There are two main ways to make beanless coffee. The American company uses plant seeds and other raw materials to create flavors that are similar to traditional coffee. Another method uses scientific technology in a laboratory to produce beanless coffee that tastes like real coffee beans.

Beanless coffee has some advantages. Traditional coffee production often leads to deforestation, because trees are cut down to grow coffee. Beanless coffee uses less water and fewer forests are cut down. As the price of traditional coffee rises, beanless coffee is expected to become available at a lower price as the market grows. However, there are challenges. A study found that about 70 percent of Canadians would not drink beanless coffee. This suggests that acceptance by the public may be difficult. If beanless coffee replaces traditional coffee, the income of coffee farmers could decrease. The coffee industry is facing significant changes because of these developments.',
  'A New Type of Coffee',
  'A New Type of Coffee

Coffee culture is growing around the world. An American company is trying something new: it makes coffee without using coffee beans. This product is called beanless coffee. The American company is not alone. Other companies in Singapore and the Netherlands are also making beanless coffee, so the industry is expanding.

There are two main ways to make beanless coffee. The American company uses plant seeds and other raw materials to create flavors that are similar to traditional coffee. Another method uses scientific technology in a laboratory to produce beanless coffee that tastes like real coffee beans.

Beanless coffee has some advantages. Traditional coffee production often leads to deforestation, because trees are cut down to grow coffee. Beanless coffee uses less water and fewer forests are cut down. As the price of traditional coffee rises, beanless coffee is expected to become available at a lower price as the market grows. However, there are challenges. A study found that about 70 percent of Canadians would not drink beanless coffee. This suggests that acceptance by the public may be difficult. If beanless coffee replaces traditional coffee, the income of coffee farmers could decrease. The coffee industry is facing significant changes because of these developments.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about the American coffee company?',
  '["It makes coffee from special coffee beans using a unique method.", "It leads the coffee industry in America as a popular coffee producer.", "It is one of several companies in the beanless coffee industry.", "It has offices not only in America but also in two other countries."]', 2, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'To create a taste similar to real coffee beans,',
  '["companies making beanless coffee receive help from other coffee producers.", "the American company takes advantage of many kinds of plant seeds.", "a small amount of oil needs to be added during the production of beanless coffee.", "only the use of scientific technology has been successful until today."]', 1, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'One of the positive features of beanless coffee is that',
  '["it can make water cleaner during its production.", "it helps trees grow faster by adding a powder to water.", "it costs almost nothing for a company to produce.", "it can be more eco-friendly than traditional coffee."]', 3, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one of the challenges that the coffee industry faces?',
  '["The taste of beanless coffee is worse than traditional coffee.", "Coffee farmers'' businesses could get badly damaged.", "Global beanless coffee production might decrease.", "It will take time for traditional coffee to become more popular."]', 1, 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do we learn from the passage?',
  '["It will be possible to get beanless coffee at a lower price than traditional coffee.", "Most people in Canada are likely to choose beanless coffee over traditional coffee.", "Beanless coffee made from raw materials will replace beanless coffee made by scientists.", "Companies producing traditional coffee are trying to make beanless coffee."]', 0, 4
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 10: Trees in Cities
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'narrative', 'long_content',
  'Trees in Cities

Many cities around the world are planting more trees. Researchers have found that trees in urban areas can improve air quality and reduce stress. They also help lower the temperature on hot days by providing shade. However, planting trees in cities is not always easy. There is often limited space, and the soil may be polluted or too hard for roots to grow well.

Some cities have found creative solutions. In one European city, people grow trees in special containers above the ground so that the roots do not need to go deep into the soil. In another city, volunteers take care of young trees for the first few years until they are strong enough to survive on their own. Schools sometimes get involved by adopting a tree and learning about the environment.

Experts say that the type of tree matters. Trees that are native to the area usually survive better and need less water. They also provide a better habitat for local birds and insects. Cities that choose the right trees and take good care of them can enjoy the benefits for many years. The goal is not only to make cities greener but also to improve the health and well-being of the people who live there.',
  'Trees in Cities',
  'Trees in Cities

Many cities around the world are planting more trees. Researchers have found that trees in urban areas can improve air quality and reduce stress. They also help lower the temperature on hot days by providing shade. However, planting trees in cities is not always easy. There is often limited space, and the soil may be polluted or too hard for roots to grow well.

Some cities have found creative solutions. In one European city, people grow trees in special containers above the ground so that the roots do not need to go deep into the soil. In another city, volunteers take care of young trees for the first few years until they are strong enough to survive on their own. Schools sometimes get involved by adopting a tree and learning about the environment.

Experts say that the type of tree matters. Trees that are native to the area usually survive better and need less water. They also provide a better habitat for local birds and insects. Cities that choose the right trees and take good care of them can enjoy the benefits for many years. The goal is not only to make cities greener but also to improve the health and well-being of the people who live there.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What have researchers found about trees in urban areas?',
  '["They take up too much space.", "They can improve air quality and reduce stress.", "They are only useful in winter.", "They attract too many insects."]', 1, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why is planting trees in cities not always easy?',
  '["Trees grow too fast in cities.", "There is often limited space and the soil may be poor.", "People prefer to have more buildings.", "Trees are expensive to buy."]', 1, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do experts say about the type of tree?',
  '["Foreign trees are better for cities.", "Trees that are native to the area usually survive better.", "Only small trees should be planted.", "The type of tree does not matter."]', 1, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one way some cities have solved the problem of limited space?',
  '["They cut down old trees to make room.", "They grow trees in special containers above the ground.", "They stop planting new trees.", "They move the trees to the countryside."]', 1, 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do we learn from the passage?',
  '["Trees in cities are only for decoration.", "Planting the right trees and caring for them can benefit cities and people.", "Volunteers should not take care of trees.", "Native trees need more water than other trees."]', 1, 4
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 11: Local Food
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'narrative', 'long_content',
  'Local Food

The idea of eating local food has become popular in many countries. Local food is food that is grown or produced near where you live. Supporters say it is fresher and often tastes better because it does not travel long distances. It can also help the environment because less fuel is used for transportation. In addition, buying local food can support farmers and businesses in your area.

However, some people point out that local food is not always the best choice for the environment. In cold regions, growing vegetables in heated greenhouses in winter may use more energy than bringing them from warmer countries. So the carbon footprint depends on how and where the food is produced, not only on the distance it travels.

Many communities have found ways to connect people with local food. Farmers'' markets are one example. People can meet the farmers and buy fresh products directly. Some schools have started gardens where students learn to grow vegetables and then use them in school meals. These projects help people understand where their food comes from and make healthier choices. The important thing is to think about both the quality of the food and its impact on the environment.',
  'Local Food',
  'Local Food

The idea of eating local food has become popular in many countries. Local food is food that is grown or produced near where you live. Supporters say it is fresher and often tastes better because it does not travel long distances. It can also help the environment because less fuel is used for transportation. In addition, buying local food can support farmers and businesses in your area.

However, some people point out that local food is not always the best choice for the environment. In cold regions, growing vegetables in heated greenhouses in winter may use more energy than bringing them from warmer countries. So the carbon footprint depends on how and where the food is produced, not only on the distance it travels.

Many communities have found ways to connect people with local food. Farmers'' markets are one example. People can meet the farmers and buy fresh products directly. Some schools have started gardens where students learn to grow vegetables and then use them in school meals. These projects help people understand where their food comes from and make healthier choices. The important thing is to think about both the quality of the food and its impact on the environment.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why do supporters say local food is better?',
  '["It is always cheaper than other food.", "It is fresher and often tastes better because it does not travel far.", "It is grown only in greenhouses.", "It is sold only at school."]', 1, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, when might local food not be the best for the environment?',
  '["When it is sold at farmers'' markets.", "When vegetables are grown in heated greenhouses in cold regions in winter.", "When students grow it at school.", "When it is transported by truck."]', 1, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one way communities connect people with local food?',
  '["By closing supermarkets.", "By organizing farmers'' markets where people can buy directly from farmers.", "By stopping the import of food.", "By building more greenhouses."]', 1, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do some schools do with the vegetables students grow?',
  '["They sell them to farmers.", "They use them in school meals.", "They send them to other countries.", "They throw them away."]', 1, 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do we learn from the passage?',
  '["Local food is always better for the environment.", "We should consider both food quality and its impact on the environment.", "Farmers'' markets are not popular.", "Schools should not grow vegetables."]', 1, 4
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 12: Plastic in the Ocean
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'narrative', 'long_content',
  'Plastic in the Ocean

A huge amount of plastic waste enters the ocean every year. This plastic can harm sea animals and birds. Some animals get trapped in plastic, and others mistake it for food and eat it. Plastic does not break down easily, so it can stay in the ocean for hundreds of years. Scientists have found tiny pieces of plastic, called microplastics, in many sea creatures and even in the water we use.

Where does this plastic come from? A lot of it comes from litter on beaches and from rivers that carry waste from cities to the sea. Fishing nets and other equipment that is lost or thrown away also add to the problem. Once plastic is in the ocean, it is very difficult to remove. Cleaning the ocean is expensive and takes a long time.

Many countries and organizations are trying to reduce plastic pollution. Some have banned single-use plastic bags or straws. Others encourage people to recycle more and to use products made from materials that break down naturally. Scientists are also working on new materials that can replace plastic. The most important step, however, is to produce and use less plastic in the first place. Everyone can help by choosing reusable items and by not littering.',
  'Plastic in the Ocean',
  'Plastic in the Ocean

A huge amount of plastic waste enters the ocean every year. This plastic can harm sea animals and birds. Some animals get trapped in plastic, and others mistake it for food and eat it. Plastic does not break down easily, so it can stay in the ocean for hundreds of years. Scientists have found tiny pieces of plastic, called microplastics, in many sea creatures and even in the water we use.

Where does this plastic come from? A lot of it comes from litter on beaches and from rivers that carry waste from cities to the sea. Fishing nets and other equipment that is lost or thrown away also add to the problem. Once plastic is in the ocean, it is very difficult to remove. Cleaning the ocean is expensive and takes a long time.

Many countries and organizations are trying to reduce plastic pollution. Some have banned single-use plastic bags or straws. Others encourage people to recycle more and to use products made from materials that break down naturally. Scientists are also working on new materials that can replace plastic. The most important step, however, is to produce and use less plastic in the first place. Everyone can help by choosing reusable items and by not littering.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How can plastic in the ocean harm animals?',
  '["It makes the water warmer.", "Some animals get trapped in it or mistake it for food.", "It makes the water too clean.", "It helps fish grow faster."]', 1, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, where does a lot of ocean plastic come from?',
  '["From ships that sink.", "From litter on beaches and from rivers that carry waste from cities.", "From natural materials in the sea.", "From rain."]', 1, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What have some countries done to reduce plastic pollution?',
  '["They have stopped using the ocean.", "They have banned single-use plastic bags or straws.", "They have encouraged people to use more plastic.", "They have removed all plastic from the sea."]', 1, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the passage say is the most important step?',
  '["To clean the ocean as fast as possible.", "To produce and use less plastic in the first place.", "To move to a different country.", "To stop eating fish."]', 1, 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do we learn from the passage?',
  '["Plastic in the ocean is not a problem.", "Everyone can help reduce plastic pollution by using reusable items and not littering.", "Microplastics are good for sea creatures.", "Cleaning the ocean is easy and cheap."]', 1, 4
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- Passage 13: Wind Power
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'narrative', 'long_content',
  'Wind Power

Wind power is one of the fastest-growing sources of renewable energy in the world. Wind turbines use the power of the wind to produce electricity without burning fuel or producing greenhouse gases. Countries with strong winds, such as those in northern Europe, have built many wind farms both on land and at sea. In some places, wind power already provides a large share of the electricity people use.

However, wind power has some drawbacks. Wind does not blow all the time, so wind turbines cannot produce electricity constantly. When there is no wind, other sources of energy are needed. Some people also worry about the noise from wind turbines and the effect they may have on birds. Building and maintaining wind farms can be expensive, especially when they are built in the ocean.

Despite these challenges, many experts believe that wind power will play an important role in the future. It is clean and renewable, and technology is improving. New turbines are quieter and more efficient. Some countries are investing in better ways to store electricity so that it can be used when the wind is not blowing. The goal is to use a mix of different renewable energy sources to meet the world''s needs while reducing damage to the environment.',
  'Wind Power',
  'Wind Power

Wind power is one of the fastest-growing sources of renewable energy in the world. Wind turbines use the power of the wind to produce electricity without burning fuel or producing greenhouse gases. Countries with strong winds, such as those in northern Europe, have built many wind farms both on land and at sea. In some places, wind power already provides a large share of the electricity people use.

However, wind power has some drawbacks. Wind does not blow all the time, so wind turbines cannot produce electricity constantly. When there is no wind, other sources of energy are needed. Some people also worry about the noise from wind turbines and the effect they may have on birds. Building and maintaining wind farms can be expensive, especially when they are built in the ocean.

Despite these challenges, many experts believe that wind power will play an important role in the future. It is clean and renewable, and technology is improving. New turbines are quieter and more efficient. Some countries are investing in better ways to store electricity so that it can be used when the wind is not blowing. The goal is to use a mix of different renewable energy sources to meet the world''s needs while reducing damage to the environment.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about wind power?',
  '["It produces greenhouse gases.", "It is one of the fastest-growing sources of renewable energy.", "It only works in the ocean.", "It is the oldest form of energy."]', 1, 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Why can wind turbines not produce electricity constantly?',
  '["They are too expensive.", "Wind does not blow all the time.", "They are only used in northern Europe.", "They harm birds."]', 1, 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do some people worry about regarding wind turbines?',
  '["They produce too much electricity.", "The noise and the effect they may have on birds.", "They are too small.", "They are only built on land."]', 1, 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What are some countries investing in?',
  '["Ways to stop the wind from blowing.", "Better ways to store electricity for when the wind is not blowing.", "More fossil fuels.", "Larger birds."]', 1, 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do we learn from the passage?',
  '["Wind power will replace all other energy sources.", "Wind power will play an important role and a mix of renewable sources is the goal.", "Wind turbines have no drawbacks.", "Building wind farms is always cheap."]', 1, 4
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
