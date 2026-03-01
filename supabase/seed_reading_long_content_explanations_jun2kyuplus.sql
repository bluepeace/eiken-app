-- seed_reading_long_content_explanations_jun2kyuplus.sql
-- 長文の内容一致（準2級プラス）の解説を reading_passage_questions.explanation に反映
-- 038 マイグレーションおよび seed_reading_long_content_jun2kyuplus_50.sql 実行後に実行

UPDATE reading_passage_questions q
SET explanation = '本文 "a professional tennis player who graduated from our high school" より、Heidi は Harvey と同じ Eagle Lake High School の卒業生です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Speech at school festival'
  AND q.question_text = 'What is true about Heidi Collins?';

UPDATE reading_passage_questions q
SET explanation = '"You already told us that you were thinking of talking about your life as a professional athlete." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Speech at school festival'
  AND q.question_text = 'Heidi told Harvey that she would talk about';

UPDATE reading_passage_questions q
SET explanation = '"If possible, we would also like to take pictures of you with students." より、当日の予定の一つとして生徒との写真撮影が含まれています。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Speech at school festival'
  AND q.question_text = 'What will Heidi do on the day of the event?';

UPDATE reading_passage_questions q
SET explanation = '"I am pleased to inform you that your essay about ''life goals'' has won first prize in the high school category." が手紙の主な目的です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Writing contest'
  AND q.question_text = 'Why did Jacob Francis send an e-mail to Maria Stone?';

UPDATE reading_passage_questions q
SET explanation = '"We believe that your view of life could positively impact other high school students and adults." が選ばれた理由の一つです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Writing contest'
  AND q.question_text = 'One of the reasons Maria Stone''s essay was chosen is that';

UPDATE reading_passage_questions q
SET explanation = '"We would like to ask you to read your essay as a speech at an upcoming city event next month." が依頼内容です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Writing contest'
  AND q.question_text = 'What did Jacob Francis ask Maria Stone to do?';

UPDATE reading_passage_questions q
SET explanation = '"We understand that... you are staying for an interview test at a university near us." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'About your stay at our hotel'
  AND q.question_text = 'Why is Bella Patterson staying at the Twin Riverside Hotel?';

UPDATE reading_passage_questions q
SET explanation = '"there is a space in the hotel for guests to use for study or work" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'About your stay at our hotel'
  AND q.question_text = 'What is true about the Twin Riverside Hotel?';

UPDATE reading_passage_questions q
SET explanation = '"Cancellation is not possible through our website. Cancellation is only accepted by phone or e-mail." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'About your stay at our hotel'
  AND q.question_text = 'If Bella wants to cancel her reservation,';

UPDATE reading_passage_questions q
SET explanation = '"We would like to invite you to write a short article for our June issue." が手紙の目的です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Request for an article'
  AND q.question_text = 'Why did Emma Walsh write to Dr. Chen?';

UPDATE reading_passage_questions q
SET explanation = '"We would like you to explain your main findings and suggest what people can do in their daily lives to support urban green spaces." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Request for an article'
  AND q.question_text = 'What does Emma ask Dr. Chen to include in the article?';

UPDATE reading_passage_questions q
SET explanation = '"The deadline for the first draft is April 15." が期限です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Request for an article'
  AND q.question_text = 'By when should Dr. Chen send his first draft?';

UPDATE reading_passage_questions q
SET explanation = '"Thank you for taking part in our beach cleanup event on May 5." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Thank you – Beach cleanup'
  AND q.question_text = 'What did David do on May 5?';

UPDATE reading_passage_questions q
SET explanation = '"This time we will focus on planting native plants near the beach to prevent soil from washing away." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Thank you – Beach cleanup'
  AND q.question_text = 'What will the June 15 event focus on?';

UPDATE reading_passage_questions q
SET explanation = '"If you would like to join again, please reply to this e-mail by June 1." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Thank you – Beach cleanup'
  AND q.question_text = 'What does Lisa ask David to do if he wants to join the June event?';

UPDATE reading_passage_questions q
SET explanation = '"Thank you for applying for our summer internship and for attending the interview last week." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Internship offer'
  AND q.question_text = 'What is true about Yuki Tanaka?';

UPDATE reading_passage_questions q
SET explanation = '"Please confirm your acceptance by September 10. You will need to sign the attached agreement and send it back by e-mail." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Internship offer'
  AND q.question_text = 'What does Yuki need to do by September 10?';

UPDATE reading_passage_questions q
SET explanation = '"On your first day, please come to the main office... We will give you an orientation and introduce you to the team." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Internship offer'
  AND q.question_text = 'What will happen on Yuki''s first day?';

UPDATE reading_passage_questions q
SET explanation = '"the Arctic has been warming more than twice as fast as the world average" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Polar Bears'
  AND q.question_text = 'What is true about global warming in the Arctic?';

UPDATE reading_passage_questions q
SET explanation = '"They usually live on ice and catch animals there." および陸にいると "they try to eat things like berries, but they lose weight quickly" より、氷上で獲物を捕ることが重要です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Polar Bears'
  AND q.question_text = 'Ice is important for polar bears because';

UPDATE reading_passage_questions q
SET explanation = '"Some of them rested to save energy, but most tried to find food." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Polar Bears'
  AND q.question_text = 'During the study of polar bears in summer, most polar bears';

UPDATE reading_passage_questions q
SET explanation = '"Studies suggest that polar bears could struggle to exist until 2100 if greenhouse gases are not reduced." および "In some areas, polar bears may not survive beyond 2030." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Polar Bears'
  AND q.question_text = 'What could happen if greenhouse gases are not reduced?';

UPDATE reading_passage_questions q
SET explanation = '陸では "they try to eat things like berries, but they lose weight quickly" とあり、氷上で獲物を取れないと体重が減るという内容が本文の学びです。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Polar Bears'
  AND q.question_text = 'What do we learn from the passage?';

UPDATE reading_passage_questions q
SET explanation = '"The project aims to improve the condition of the soil, help farmers grow more crops, boost economies, and improve the quality of life for local people." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'A Big Project in Africa'
  AND q.question_text = 'What is true about the Great Green Wall project?';

UPDATE reading_passage_questions q
SET explanation = '"The area... has been damaged by climate change, terrible weather events, and human activities such as repeated farming." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'A Big Project in Africa'
  AND q.question_text = 'How did the area around the Sahara Desert get damaged?';

UPDATE reading_passage_questions q
SET explanation = '"In Senegal, trees that were planted produce fruits that are good for people''s health." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'A Big Project in Africa'
  AND q.question_text = 'In the country of Senegal,';

UPDATE reading_passage_questions q
SET explanation = '"Second, the project creates jobs so that local people can earn more money. This is one of the main goals" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'A Big Project in Africa'
  AND q.question_text = 'What is one of the key points to making the Great Green Wall project successful?';

UPDATE reading_passage_questions q
SET explanation = '"First, local people must take good care of the trees after they are planted." が成功の鍵の一つとして述べられています。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'A Big Project in Africa'
  AND q.question_text = 'What do we learn from the passage?';

UPDATE reading_passage_questions q
SET explanation = '"The American company is not alone. Other companies in Singapore and the Netherlands are also making beanless coffee" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'A New Type of Coffee'
  AND q.question_text = 'What is true about the American coffee company?';

UPDATE reading_passage_questions q
SET explanation = '"The American company uses plant seeds and other raw materials to create flavors that are similar to traditional coffee." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'A New Type of Coffee'
  AND q.question_text = 'To create a taste similar to real coffee beans,';

UPDATE reading_passage_questions q
SET explanation = '"Traditional coffee production often leads to deforestation... Beanless coffee uses less water and fewer forests are cut down." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'A New Type of Coffee'
  AND q.question_text = 'One of the positive features of beanless coffee is that';

UPDATE reading_passage_questions q
SET explanation = '"If beanless coffee replaces traditional coffee, the income of coffee farmers could decrease." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'A New Type of Coffee'
  AND q.question_text = 'What is one of the challenges that the coffee industry faces?';

UPDATE reading_passage_questions q
SET explanation = '"As the price of traditional coffee rises, beanless coffee is expected to become available at a lower price as the market grows." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'A New Type of Coffee'
  AND q.question_text = 'What do we learn from the passage?';

UPDATE reading_passage_questions q
SET explanation = '"Researchers have found that trees in urban areas can improve air quality and reduce stress." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Trees in Cities'
  AND q.question_text = 'What have researchers found about trees in urban areas?';

UPDATE reading_passage_questions q
SET explanation = '"There is often limited space, and the soil may be polluted or too hard for roots to grow well." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Trees in Cities'
  AND q.question_text = 'Why is planting trees in cities not always easy?';

UPDATE reading_passage_questions q
SET explanation = '"Trees that are native to the area usually survive better and need less water." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Trees in Cities'
  AND q.question_text = 'What do experts say about the type of tree?';

UPDATE reading_passage_questions q
SET explanation = '"In one European city, people grow trees in special containers above the ground so that the roots do not need to go deep into the soil." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Trees in Cities'
  AND q.question_text = 'What is one way some cities have solved the problem of limited space?';

UPDATE reading_passage_questions q
SET explanation = '"Cities that choose the right trees and take good care of them can enjoy the benefits for many years" および "improve the health and well-being of the people who live there" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Trees in Cities'
  AND q.question_text = 'What do we learn from the passage?';

UPDATE reading_passage_questions q
SET explanation = '"Supporters say it is fresher and often tastes better because it does not travel long distances." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Local Food'
  AND q.question_text = 'Why do supporters say local food is better?';

UPDATE reading_passage_questions q
SET explanation = '"In cold regions, growing vegetables in heated greenhouses in winter may use more energy than bringing them from warmer countries." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Local Food'
  AND q.question_text = 'According to the passage, when might local food not be the best for the environment?';

UPDATE reading_passage_questions q
SET explanation = '"Farmers'' markets are one example. People can meet the farmers and buy fresh products directly." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Local Food'
  AND q.question_text = 'What is one way communities connect people with local food?';

UPDATE reading_passage_questions q
SET explanation = '"Some schools have started gardens where students learn to grow vegetables and then use them in school meals." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Local Food'
  AND q.question_text = 'What do some schools do with the vegetables students grow?';

UPDATE reading_passage_questions q
SET explanation = '"The important thing is to think about both the quality of the food and its impact on the environment." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Local Food'
  AND q.question_text = 'What do we learn from the passage?';

UPDATE reading_passage_questions q
SET explanation = '"Some animals get trapped in plastic, and others mistake it for food and eat it." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Plastic in the Ocean'
  AND q.question_text = 'How can plastic in the ocean harm animals?';

UPDATE reading_passage_questions q
SET explanation = '"A lot of it comes from litter on beaches and from rivers that carry waste from cities to the sea." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Plastic in the Ocean'
  AND q.question_text = 'According to the passage, where does a lot of ocean plastic come from?';

UPDATE reading_passage_questions q
SET explanation = '"Some have banned single-use plastic bags or straws." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Plastic in the Ocean'
  AND q.question_text = 'What have some countries done to reduce plastic pollution?';

UPDATE reading_passage_questions q
SET explanation = '"The most important step, however, is to produce and use less plastic in the first place." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Plastic in the Ocean'
  AND q.question_text = 'What does the passage say is the most important step?';

UPDATE reading_passage_questions q
SET explanation = '"Everyone can help by choosing reusable items and by not littering." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Plastic in the Ocean'
  AND q.question_text = 'What do we learn from the passage?';

UPDATE reading_passage_questions q
SET explanation = '"Wind power is one of the fastest-growing sources of renewable energy in the world." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Wind Power'
  AND q.question_text = 'What is true about wind power?';

UPDATE reading_passage_questions q
SET explanation = '"Wind does not blow all the time, so wind turbines cannot produce electricity constantly." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Wind Power'
  AND q.question_text = 'Why can wind turbines not produce electricity constantly?';

UPDATE reading_passage_questions q
SET explanation = '"Some people also worry about the noise from wind turbines and the effect they may have on birds." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Wind Power'
  AND q.question_text = 'What do some people worry about regarding wind turbines?';

UPDATE reading_passage_questions q
SET explanation = '"Some countries are investing in better ways to store electricity so that it can be used when the wind is not blowing." が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Wind Power'
  AND q.question_text = 'What are some countries investing in?';

UPDATE reading_passage_questions q
SET explanation = '"many experts believe that wind power will play an important role in the future" および "The goal is to use a mix of different renewable energy sources" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準2級プラス' AND p.passage_type = 'long_content'
  AND p.title = 'Wind Power'
  AND q.question_text = 'What do we learn from the passage?';
