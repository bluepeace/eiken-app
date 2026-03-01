-- seed_reading_long_fill_2kyu_50.sql
-- 英検2級 長文の語句空所補充 50問（1パッセージ3空所形式）
-- 過去問形式: 説明文、(18)(19)(20)相当の空所3か所・各4肢。content は NOT NULL のため body と同値で指定。

-- ========== 1: A New Approach to Design (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'A New Approach to Design\n\nA British university graduate named Gabriel Kay designed a kettle called Osiris. What makes it unique is that ordinary people can repair it easily. It is difficult to __BLANK__. Unlike these kettles, Osiris can be separated simply by removing two screws at the bottom. Users can replace broken parts or even change the color or design of the kettle.\n\nKay aims to change how people use products. He provides a product that looks good and is also easy to repair. By doing so, he encourages people to __BLANK__. This is how he helps reduce electronic waste. His design was introduced through a program that promotes fixing things and making them last. This program emphasizes the importance of being able to fix things and make them last a long time. __BLANK__, the program supports a future surrounded by eco-friendly products that follow the "reduce, reuse, and recycle" idea.',
  'A New Approach to Design',
  E'A New Approach to Design\n\nA British university graduate named Gabriel Kay designed a kettle called Osiris. What makes it unique is that ordinary people can repair it easily. It is difficult to __BLANK__. Unlike these kettles, Osiris can be separated simply by removing two screws at the bottom. Users can replace broken parts or even change the color or design of the kettle.\n\nKay aims to change how people use products. He provides a product that looks good and is also easy to repair. By doing so, he encourages people to __BLANK__. This is how he helps reduce electronic waste. His design was introduced through a program that promotes fixing things and making them last. This program emphasizes the importance of being able to fix things and make them last a long time. __BLANK__, the program supports a future surrounded by eco-friendly products that follow the "reduce, reuse, and recycle" idea.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["boil water quickly with old electric kettles", "design colorful electric kettles", "take apart most electric kettles at home", "try new electric kettles in shops"]', 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["use the product for a long time", "buy many products one after another", "grow their personal collection of devices", "find devices with more features"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Even so", "In this way", "Otherwise", "What is worse"]', 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 2: A Toy Made from a Spring (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'A Toy Made from a Spring\n\nMany inventions are the result of long experiments. Thomas Edison, for example, tried thousands of materials before he created a practical light bulb. __BLANK__, some of the most popular products in the world were created by chance. The Slinky, a toy made from a spring, is one of them.\n\nRichard James was an engineer who was working on a spring that could keep instruments steady on ships. One day he __BLANK__. The spring did not fall to the floor but moved in an interesting way. He spent the next year developing this into a toy and named it the Slinky. When he first tried to sell it in a store, he was not sure if it would succeed. He was worried that __BLANK__. However, when he demonstrated how the Slinky moved down the stairs, he sold all 400 units in ninety minutes. The Slinky became one of the most successful toys in history.',
  'A Toy Made from a Spring',
  E'A Toy Made from a Spring\n\nMany inventions are the result of long experiments. Thomas Edison, for example, tried thousands of materials before he created a practical light bulb. __BLANK__, some of the most popular products in the world were created by chance. The Slinky, a toy made from a spring, is one of them.\n\nRichard James was an engineer who was working on a spring that could keep instruments steady on ships. One day he __BLANK__. The spring did not fall to the floor but moved in an interesting way. He spent the next year developing this into a toy and named it the Slinky. When he first tried to sell it in a store, he was not sure if it would succeed. He was worried that __BLANK__. However, when he demonstrated how the Slinky moved down the stairs, he sold all 400 units in ninety minutes. The Slinky became one of the most successful toys in history.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "In other words", "On the other hand", "In the same way"]', 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["accidentally dropped it", "took some books", "suddenly heard some noise", "picked up one document"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["people owned one already", "the store did not have space", "people might not come to buy one", "the store would run out of stock"]', 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 3: The Power of Familiarity (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Power of Familiarity\n\nThere is a psychological phenomenon that people tend to like something more when they see or hear it many times. This is sometimes called the mere-exposure effect. For example, you might not like a new song when you first hear it. After hearing it several times in their everyday life, they __BLANK__. This effect is used in advertising to increase sales and popularity.\n\nPsychologist Robert Zajonc did an experiment in which college students looked at pictures of faces many times. The more often they saw a face, the more they liked it. Zajonc also did the same experiment using letters instead of pictures to avoid __BLANK__. The result was the same. Repeated exposure led to a more positive feeling. While this effect is not always negative, if people ignore it, they may not make the best decision. __BLANK__, when people just choose the familiar options again and again, they may narrow their views and miss better opportunities.',
  'The Power of Familiarity',
  E'The Power of Familiarity\n\nThere is a psychological phenomenon that people tend to like something more when they see or hear it many times. This is sometimes called the mere-exposure effect. For example, you might not like a new song when you first hear it. After hearing it several times in their everyday life, they __BLANK__. This effect is used in advertising to increase sales and popularity.\n\nPsychologist Robert Zajonc did an experiment in which college students looked at pictures of faces many times. The more often they saw a face, the more they liked it. Zajonc also did the same experiment using letters instead of pictures to avoid __BLANK__. The result was the same. Repeated exposure led to a more positive feeling. While this effect is not always negative, if people ignore it, they may not make the best decision. __BLANK__, when people just choose the familiar options again and again, they may narrow their views and miss better opportunities.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["can say when they heard the song", "keep some distance from the song", "may buy the song without hesitation", "learn how to play musical instruments"]', 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["the possible influence of people''s expressions", "the negative feelings toward certain letters", "the possible effect of their rooms", "the negative influence of outside noise"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["On the contrary", "Meanwhile", "Fortunately", "Moreover"]', 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 4: The Communication of Elephants (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Communication of Elephants\n\nHuman language is complex, but animals also have their own ways of communicating. Elephants are a good example. They use their ears, trunks, and body positions to send messages. They may seem to move their body parts __BLANK__. In fact, each movement can express emotions or intentions. When elephants feel threatened, they may spread their ears and raise their heads. When they accept another elephant''s authority, they often pull their ears back and put their heads down.\n\n__BLANK__, when they show that they accept the others'' authority, they can avoid conflict and live in harmony with the group. Elephants are also known to care for sick or injured members. Besides body language, elephants use low-frequency sounds that humans can barely hear. These sounds travel much farther than high-pitched ones. With them, they can send messages to others __BLANK__. They use these sounds to warn of danger, call other elephants, or reassure their young.',
  'The Communication of Elephants',
  E'The Communication of Elephants\n\nHuman language is complex, but animals also have their own ways of communicating. Elephants are a good example. They use their ears, trunks, and body positions to send messages. They may seem to move their body parts __BLANK__. In fact, each movement can express emotions or intentions. When elephants feel threatened, they may spread their ears and raise their heads. When they accept another elephant''s authority, they often pull their ears back and put their heads down.\n\n__BLANK__, when they show that they accept the others'' authority, they can avoid conflict and live in harmony with the group. Elephants are also known to care for sick or injured members. Besides body language, elephants use low-frequency sounds that humans can barely hear. These sounds travel much farther than high-pitched ones. With them, they can send messages to others __BLANK__. They use these sounds to warn of danger, call other elephants, or reassure their young.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["just as a fun habit", "for health purposes", "without any intentions", "to express their emotions and intentions"]', 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Disappointingly", "More importantly", "Nevertheless", "By contrast"]', 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["as far as a few kilometers away", "as long as they are in a safe place", "less far than they think", "much deeper in the ground"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 5: Learning from Owls (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Learning from Owls\n\nOwls hunt at night. They have large eyes that can gather more light than human eyes. Another advantage is their ears. An owl''s ears are placed at different heights on its head. This makes the time at which __BLANK__ different. By analyzing this difference, the owl can determine exactly where a small animal is, even in the dark. Owls also fly very quietly. The edges of their feathers have a special design. The special design helps create __BLANK__. This allows owls to approach their prey without being noticed.\n\nResearchers at the University of London have studied the structure of owl feathers. They hope to apply this knowledge to the design of airplanes and other machines. Reducing noise is especially important near airports, where many people are affected by higher noise levels. __BLANK__, many people hope for progress in this technology so that the skies can become quieter in the future.',
  'Learning from Owls',
  E'Learning from Owls\n\nOwls hunt at night. They have large eyes that can gather more light than human eyes. Another advantage is their ears. An owl''s ears are placed at different heights on its head. This makes the time at which __BLANK__ different. By analyzing this difference, the owl can determine exactly where a small animal is, even in the dark. Owls also fly very quietly. The edges of their feathers have a special design. The special design helps create __BLANK__. This allows owls to approach their prey without being noticed.\n\nResearchers at the University of London have studied the structure of owl feathers. They hope to apply this knowledge to the design of airplanes and other machines. Reducing noise is especially important near airports, where many people are affected by higher noise levels. __BLANK__, many people hope for progress in this technology so that the skies can become quieter in the future.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["animals make some noise", "owls sleep in the day", "sound arrives at each ear", "their eye recognizes the light"]', 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["a smooth and silent air movement", "a loud hitting sound in the air", "a strong air movement to fly up", "a color change in their wings"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["In spite of this", "To begin with", "Even so", "Therefore"]', 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 6: Ifugao Rice Fields (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Ifugao Rice Fields\n\nThe Ifugao people live on Luzon Island in the Philippines. They have grown rice on steep mountain slopes for hundreds of years. Due to __BLANK__, they have practiced creative ways of farming. They built stair-like terraces that hold water and soil. These terraces are not only for growing rice but also at the center of their annual events and community life.\n\nThe idea of __BLANK__ is at the center of the Ifugao people''s traditions. They have maintained their terraces by working together and sharing knowledge. In recent years, however, many young people have moved to cities to find work. Some of them cleared forest areas to make their own vegetable fields and took away natural water sources from the rice fields. __BLANK__, a large quantity of the rice fields was damaged because of the lack of workers and water. Efforts are now being made to protect these terraces and pass on the tradition to the next generation.',
  'Ifugao Rice Fields',
  E'Ifugao Rice Fields\n\nThe Ifugao people live on Luzon Island in the Philippines. They have grown rice on steep mountain slopes for hundreds of years. Due to __BLANK__, they have practiced creative ways of farming. They built stair-like terraces that hold water and soil. These terraces are not only for growing rice but also at the center of their annual events and community life.\n\nThe idea of __BLANK__ is at the center of the Ifugao people''s traditions. They have maintained their terraces by working together and sharing knowledge. In recent years, however, many young people have moved to cities to find work. Some of them cleared forest areas to make their own vegetable fields and took away natural water sources from the rice fields. __BLANK__, a large quantity of the rice fields was damaged because of the lack of workers and water. Efforts are now being made to protect these terraces and pass on the tradition to the next generation.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["a lack of workforce", "the variety of fruits they make", "poor farming conditions", "bad weather throughout the year"]', 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["making use of the given environment", "leaving wild animals alone", "singing while working in the fields", "growing rice without using water"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["On the contrary", "To begin with", "In general", "As a consequence"]', 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 7: Urban Green Spaces ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Urban Green Spaces\n\nMany cities are increasing the number of parks and green areas. One reason is that plants help reduce air pollution and lower temperatures in summer. __BLANK__, people who live near parks tend to be more active and report better mental health. City planners are now looking at rooftops and empty lots as places to add greenery.\n\nSome cities have turned old railway lines into elevated parks. __BLANK__, they have created new walking paths that are both useful and beautiful. These projects often attract more visitors and businesses to the area. __BLANK__ is not always easy in dense cities where land is expensive. However, many governments and private groups are working together to find creative solutions.',
  'Urban Green Spaces',
  E'Urban Green Spaces\n\nMany cities are increasing the number of parks and green areas. One reason is that plants help reduce air pollution and lower temperatures in summer. __BLANK__, people who live near parks tend to be more active and report better mental health. City planners are now looking at rooftops and empty lots as places to add greenery.\n\nSome cities have turned old railway lines into elevated parks. __BLANK__, they have created new walking paths that are both useful and beautiful. These projects often attract more visitors and businesses to the area. __BLANK__ is not always easy in dense cities where land is expensive. However, many governments and private groups are working together to find creative solutions.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In addition", "However", "Otherwise", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In this way", "Nevertheless", "On the contrary", "What is worse"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Finding space for new parks", "Reducing traffic", "Building more railways", "Closing old factories"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 8: The History of the Sandwich ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The History of the Sandwich\n\nThe sandwich is one of the most common foods in the world. It is said that the name comes from John Montagu, the fourth Earl of Sandwich, in the 18th century. He was a busy man who enjoyed playing cards. He did not want to leave the table to eat, so he asked his servants to bring him meat between two pieces of bread. __BLANK__, he could eat with one hand while continuing to play. Other players began to order "the same as Sandwich," and the name spread.\n\n__BLANK__, the idea of putting food between bread had already existed in other cultures. In the Middle East, people had been eating flatbread with fillings for a long time. __BLANK__ the sandwich became popular in Europe and later in America, where it took on many new forms. Today, sandwiches are eaten in almost every country and have become a symbol of quick, convenient food.',
  'The History of the Sandwich',
  E'The History of the Sandwich\n\nThe sandwich is one of the most common foods in the world. It is said that the name comes from John Montagu, the fourth Earl of Sandwich, in the 18th century. He was a busy man who enjoyed playing cards. He did not want to leave the table to eat, so he asked his servants to bring him meat between two pieces of bread. __BLANK__, he could eat with one hand while continuing to play. Other players began to order "the same as Sandwich," and the name spread.\n\n__BLANK__, the idea of putting food between bread had already existed in other cultures. In the Middle East, people had been eating flatbread with fillings for a long time. __BLANK__ the sandwich became popular in Europe and later in America, where it took on many new forms. Today, sandwiches are eaten in almost every country and have become a symbol of quick, convenient food.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In this way", "Nevertheless", "Otherwise", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "In fact", "Therefore", "Moreover"]', 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Over time", "At first", "In the same way", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 9: Remote Work ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Remote Work\n\nRemote work has become more common in many countries. Employees can work from home or other places using computers and the Internet. One advantage is that people can save time and money by not commuting. __BLANK__, companies can hire talented people who live in different cities or even different countries. This has changed how many businesses operate.\n\n__BLANK__, remote work can make it harder for team members to communicate and build trust. Some companies have decided to require employees to come to the office at least a few days a week. __BLANK__ is still a topic of debate. Supporters say it increases productivity and satisfaction, while others worry about the loss of face-to-face interaction. The future of work may be a mix of both remote and office-based arrangements.',
  'Remote Work',
  E'Remote Work\n\nRemote work has become more common in many countries. Employees can work from home or other places using computers and the Internet. One advantage is that people can save time and money by not commuting. __BLANK__, companies can hire talented people who live in different cities or even different countries. This has changed how many businesses operate.\n\n__BLANK__, remote work can make it harder for team members to communicate and build trust. Some companies have decided to require employees to come to the office at least a few days a week. __BLANK__ is still a topic of debate. Supporters say it increases productivity and satisfaction, while others worry about the loss of face-to-face interaction. The future of work may be a mix of both remote and office-based arrangements.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In addition", "Nevertheless", "Otherwise", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["On the other hand", "Therefore", "In other words", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Whether remote work is better overall", "How much offices cost", "When the Internet was invented", "Where the first remote job was"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 10: Coral Reefs and Climate ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Coral Reefs and Climate\n\nCoral reefs are home to a huge variety of marine life. They are sometimes called the rainforests of the sea. When ocean temperatures rise, corals experience stress and expel the tiny algae that live inside them. This is known as coral bleaching. __BLANK__, the corals turn white and may die if the water does not cool down in time. Bleaching events have become more frequent in recent decades.\n\n__BLANK__, scientists are trying to find corals that can survive in warmer water. They hope to use these to help restore damaged reefs. __BLANK__ will require not only local action but also global efforts to reduce greenhouse gas emissions. Many countries and organizations are now working together to protect these important ecosystems for future generations.',
  'Coral Reefs and Climate',
  E'Coral Reefs and Climate\n\nCoral reefs are home to a huge variety of marine life. They are sometimes called the rainforests of the sea. When ocean temperatures rise, corals experience stress and expel the tiny algae that live inside them. This is known as coral bleaching. __BLANK__, the corals turn white and may die if the water does not cool down in time. Bleaching events have become more frequent in recent decades.\n\n__BLANK__, scientists are trying to find corals that can survive in warmer water. They hope to use these to help restore damaged reefs. __BLANK__ will require not only local action but also global efforts to reduce greenhouse gas emissions. Many countries and organizations are now working together to protect these important ecosystems for future generations.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "In other words", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In this way", "Therefore", "On the contrary"]', 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Saving coral reefs in the long term", "Building more aquariums", "Studying fish only", "Closing beaches to tourists"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 11: The Printing Press ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Printing Press\n\nJohannes Gutenberg invented the printing press in Europe in the 15th century. Before that, books were copied by hand, which was slow and expensive. With the printing press, many copies of a book could be produced in a short time. __BLANK__, books became more affordable and knowledge spread more quickly. This invention is often seen as one of the most important in history.\n\n__BLANK__, the printing press led to major social and religious changes. Ideas could be shared across regions, and literacy rates began to rise. __BLANK__ is still important today. Although we now have digital media, the principle of sharing information widely continues to shape our world.',
  'The Printing Press',
  E'The Printing Press\n\nJohannes Gutenberg invented the printing press in Europe in the 15th century. Before that, books were copied by hand, which was slow and expensive. With the printing press, many copies of a book could be produced in a short time. __BLANK__, books became more affordable and knowledge spread more quickly. This invention is often seen as one of the most important in history.\n\n__BLANK__, the printing press led to major social and religious changes. Ideas could be shared across regions, and literacy rates began to rise. __BLANK__ is still important today. Although we now have digital media, the principle of sharing information widely continues to shape our world.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "In other words", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "On the contrary", "In this way"]', 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The spread of information", "The cost of paper", "The speed of writing", "The number of libraries"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 12: Antibiotics ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Antibiotics\n\nAntibiotics are medicines that kill or slow the growth of bacteria. They have saved millions of lives since the discovery of penicillin. Before antibiotics, even a small infection could be fatal. __BLANK__, many diseases that were once deadly can now be treated effectively. Doctors use antibiotics to treat pneumonia, skin infections, and many other conditions.\n\n__BLANK__, the overuse of antibiotics has led to a serious problem. Some bacteria have become resistant to common antibiotics. This means that certain infections are becoming harder to treat. __BLANK__ is now a global health priority. Doctors are encouraged to prescribe antibiotics only when necessary, and researchers are working to develop new drugs to fight resistant bacteria.',
  'Antibiotics',
  E'Antibiotics\n\nAntibiotics are medicines that kill or slow the growth of bacteria. They have saved millions of lives since the discovery of penicillin. Before antibiotics, even a small infection could be fatal. __BLANK__, many diseases that were once deadly can now be treated effectively. Doctors use antibiotics to treat pneumonia, skin infections, and many other conditions.\n\n__BLANK__, the overuse of antibiotics has led to a serious problem. Some bacteria have become resistant to common antibiotics. This means that certain infections are becoming harder to treat. __BLANK__ is now a global health priority. Doctors are encouraged to prescribe antibiotics only when necessary, and researchers are working to develop new drugs to fight resistant bacteria.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "In contrast", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "Therefore", "On the other hand", "In this way"]', 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Fighting antibiotic resistance", "Producing more penicillin", "Reducing hospital visits", "Limiting surgery"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 13: Honeybee Decline ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Honeybee Decline\n\nHoneybees play a vital role in agriculture. They pollinate many of the crops that humans rely on for food. In recent years, however, bee populations have been declining in various parts of the world. Scientists have identified several possible causes. __BLANK__, the use of certain pesticides may harm bees. Loss of natural habitat and the spread of diseases have also been linked to the decline.\n\n__BLANK__, some farmers and governments are creating more bee-friendly environments. They are planting flowers and reducing the use of harmful chemicals. __BLANK__ could have serious effects on food production. If bee populations continue to fall, the cost of many fruits and vegetables could rise, and some crops might become harder to grow. Protecting bees is therefore not only an environmental issue but also an economic one.',
  'Honeybee Decline',
  E'Honeybee Decline\n\nHoneybees play a vital role in agriculture. They pollinate many of the crops that humans rely on for food. In recent years, however, bee populations have been declining in various parts of the world. Scientists have identified several possible causes. __BLANK__, the use of certain pesticides may harm bees. Loss of natural habitat and the spread of diseases have also been linked to the decline.\n\n__BLANK__, some farmers and governments are creating more bee-friendly environments. They are planting flowers and reducing the use of harmful chemicals. __BLANK__ could have serious effects on food production. If bee populations continue to fall, the cost of many fruits and vegetables could rise, and some crops might become harder to grow. Protecting bees is therefore not only an environmental issue but also an economic one.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For example", "Therefore", "Moreover", "In other words"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In response", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["A continued decline in bee populations", "An increase in honey production", "A decrease in pesticide use", "A growth in the number of farms"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 14: Sleep and Memory ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Sleep and Memory\n\nSleep is essential for both physical and mental health. Research has shown that sleep plays a key role in how we form and store memories. When we learn something new, our brains need time to process that information. __BLANK__, getting enough sleep after studying can help you remember what you learned. Students who sleep well often perform better on tests than those who stay up all night.\n\n__BLANK__, lack of sleep can affect mood and concentration. People who do not get enough sleep may find it harder to focus and make decisions. __BLANK__ is one reason why experts recommend seven to nine hours of sleep per night for adults. Good sleep habits can improve not only memory but also overall quality of life.',
  'Sleep and Memory',
  E'Sleep and Memory\n\nSleep is essential for both physical and mental health. Research has shown that sleep plays a key role in how we form and store memories. When we learn something new, our brains need time to process that information. __BLANK__, getting enough sleep after studying can help you remember what you learned. Students who sleep well often perform better on tests than those who stay up all night.\n\n__BLANK__, lack of sleep can affect mood and concentration. People who do not get enough sleep may find it harder to focus and make decisions. __BLANK__ is one reason why experts recommend seven to nine hours of sleep per night for adults. Good sleep habits can improve not only memory but also overall quality of life.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For this reason", "However", "In contrast", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "Otherwise", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["This link between sleep and health", "The length of the working day", "The number of students in school", "The cost of medical care"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 15: The Silk Road ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Silk Road\n\nThe Silk Road was an ancient network of trade routes connecting Asia and Europe. Merchants traveled along these routes to exchange goods such as silk, spices, and precious metals. __BLANK__, the Silk Road was not a single road but a series of paths that crossed mountains and deserts. Travel was difficult and could take many months.\n\n__BLANK__, the Silk Road did more than carry goods. It also allowed the exchange of ideas, religions, and technologies between different cultures. __BLANK__ had a lasting impact on the world. Many of the connections between East and West that we see today have their roots in this ancient trade network. The Silk Road is still studied as an important example of how trade can bring people and cultures together.',
  'The Silk Road',
  E'The Silk Road\n\nThe Silk Road was an ancient network of trade routes connecting Asia and Europe. Merchants traveled along these routes to exchange goods such as silk, spices, and precious metals. __BLANK__, the Silk Road was not a single road but a series of paths that crossed mountains and deserts. Travel was difficult and could take many months.\n\n__BLANK__, the Silk Road did more than carry goods. It also allowed the exchange of ideas, religions, and technologies between different cultures. __BLANK__ had a lasting impact on the world. Many of the connections between East and West that we see today have their roots in this ancient trade network. The Silk Road is still studied as an important example of how trade can bring people and cultures together.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In other words", "As a result", "Therefore", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Moreover", "Nevertheless", "On the contrary"]', 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["This exchange of culture and goods", "The difficulty of travel", "The price of silk", "The number of merchants"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 16: Electric Vehicles ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Electric Vehicles\n\nElectric vehicles, or EVs, are becoming more common on roads around the world. Unlike traditional cars that run on gasoline, EVs use batteries to power an electric motor. __BLANK__, they produce no exhaust emissions while driving, which can help reduce air pollution in cities. Many governments are offering incentives to encourage people to buy electric cars.\n\n__BLANK__, the technology is still improving. Early EVs had limited range, but newer models can travel much farther on a single charge. __BLANK__ remains a concern for some drivers. Charging stations are not yet as widespread as gas stations, so long trips may require careful planning. Despite this, the shift toward electric vehicles is expected to continue as battery technology improves and charging networks expand.',
  'Electric Vehicles',
  E'Electric Vehicles\n\nElectric vehicles, or EVs, are becoming more common on roads around the world. Unlike traditional cars that run on gasoline, EVs use batteries to power an electric motor. __BLANK__, they produce no exhaust emissions while driving, which can help reduce air pollution in cities. Many governments are offering incentives to encourage people to buy electric cars.\n\n__BLANK__, the technology is still improving. Early EVs had limited range, but newer models can travel much farther on a single charge. __BLANK__ remains a concern for some drivers. Charging stations are not yet as widespread as gas stations, so long trips may require careful planning. Despite this, the shift toward electric vehicles is expected to continue as battery technology improves and charging networks expand.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "In contrast", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "Otherwise", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The availability of charging stations", "The cost of gasoline", "The speed of older cars", "The design of batteries"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 17: The Olympic Games ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Olympic Games\n\nThe modern Olympic Games bring together athletes from around the world every four years. The event has its roots in ancient Greece, where athletic competitions were held in honor of the gods. __BLANK__, the modern Olympics were revived in the late 19th century with the aim of promoting peace and international understanding through sport. Today, the Games include both summer and winter editions, with thousands of athletes competing in many different sports.\n\n__BLANK__, hosting the Olympics can have both benefits and drawbacks for a city. It can boost tourism and leave behind new stadiums and infrastructure. __BLANK__, the cost of building facilities and organizing the event can be very high, and some host cities have struggled with debt afterward. Despite these challenges, the Olympics remain one of the most watched and celebrated events in the world.',
  'The Olympic Games',
  E'The Olympic Games\n\nThe modern Olympic Games bring together athletes from around the world every four years. The event has its roots in ancient Greece, where athletic competitions were held in honor of the gods. __BLANK__, the modern Olympics were revived in the late 19th century with the aim of promoting peace and international understanding through sport. Today, the Games include both summer and winter editions, with thousands of athletes competing in many different sports.\n\n__BLANK__, hosting the Olympics can have both benefits and drawbacks for a city. It can boost tourism and leave behind new stadiums and infrastructure. __BLANK__, the cost of building facilities and organizing the event can be very high, and some host cities have struggled with debt afterward. Despite these challenges, the Olympics remain one of the most watched and celebrated events in the world.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "Moreover", "In fact", "Therefore"]', 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "On the other hand", "In other words", "As a result"]', 1
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["On the other hand", "In this way", "Moreover", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 18: Plastic Pollution ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Plastic Pollution\n\nPlastic is a useful material that we use in countless products, from packaging to electronics. However, much of the plastic we use is thrown away after a single use. __BLANK__, large amounts of plastic waste end up in oceans and rivers, where they can harm wildlife and take hundreds of years to break down. Scientists have found plastic in the stomachs of fish and even in drinking water.\n\n__BLANK__, many countries and companies are taking action. Some have banned single-use plastic bags, and others are developing alternatives such as biodegradable materials. __BLANK__ will require effort from individuals, businesses, and governments. Reducing plastic use, recycling more, and cleaning up existing waste are all part of the solution. Without such efforts, the problem is likely to grow worse in the coming decades.',
  'Plastic Pollution',
  E'Plastic Pollution\n\nPlastic is a useful material that we use in countless products, from packaging to electronics. However, much of the plastic we use is thrown away after a single use. __BLANK__, large amounts of plastic waste end up in oceans and rivers, where they can harm wildlife and take hundreds of years to break down. Scientists have found plastic in the stomachs of fish and even in drinking water.\n\n__BLANK__, many countries and companies are taking action. Some have banned single-use plastic bags, and others are developing alternatives such as biodegradable materials. __BLANK__ will require effort from individuals, businesses, and governments. Reducing plastic use, recycling more, and cleaning up existing waste are all part of the solution. Without such efforts, the problem is likely to grow worse in the coming decades.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "In other words", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In response", "Nevertheless", "On the contrary", "Therefore"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Addressing this problem", "Producing more plastic", "Building more landfills", "Ignoring the issue"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 19: Social Media and News ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Social Media and News\n\nMany people now get their news from social media rather than from newspapers or television. News stories can spread quickly online, and users can share and comment on them easily. __BLANK__, not everything that appears on social media is accurate. False or misleading information can spread just as fast as real news, which can make it difficult to know what to believe.\n\n__BLANK__, some platforms have started to label or limit posts that may contain false information. Educators are also teaching students how to check sources and think critically about what they read. __BLANK__ is a skill that everyone needs in the digital age. Learning to distinguish between reliable and unreliable sources can help people make better decisions and participate more responsibly in public discussions.',
  'Social Media and News',
  E'Social Media and News\n\nMany people now get their news from social media rather than from newspapers or television. News stories can spread quickly online, and users can share and comment on them easily. __BLANK__, not everything that appears on social media is accurate. False or misleading information can spread just as fast as real news, which can make it difficult to know what to believe.\n\n__BLANK__, some platforms have started to label or limit posts that may contain false information. Educators are also teaching students how to check sources and think critically about what they read. __BLANK__ is a skill that everyone needs in the digital age. Learning to distinguish between reliable and unreliable sources can help people make better decisions and participate more responsibly in public discussions.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "Therefore", "Moreover", "In this way"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In response", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Media literacy", "Using social media daily", "Watching television", "Reading newspapers only"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 20: Volcanoes ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Volcanoes\n\nVolcanoes are openings in the Earth''s surface through which molten rock, ash, and gas can escape from deep underground. They can be found on land and under the ocean. __BLANK__, volcanic eruptions have shaped the landscape in many parts of the world, creating mountains, islands, and fertile soil. At the same time, eruptions can be dangerous, destroying homes and affecting air travel.\n\n__BLANK__, scientists monitor active volcanoes using instruments that measure earthquakes, gas emissions, and ground movement. This helps them warn people before an eruption. __BLANK__ is still difficult to predict exactly when a volcano will erupt. Despite advances in technology, nature can still surprise us. Understanding volcanoes better can help communities prepare and stay safe.',
  'Volcanoes',
  E'Volcanoes\n\nVolcanoes are openings in the Earth''s surface through which molten rock, ash, and gas can escape from deep underground. They can be found on land and under the ocean. __BLANK__, volcanic eruptions have shaped the landscape in many parts of the world, creating mountains, islands, and fertile soil. At the same time, eruptions can be dangerous, destroying homes and affecting air travel.\n\n__BLANK__, scientists monitor active volcanoes using instruments that measure earthquakes, gas emissions, and ground movement. This helps them warn people before an eruption. __BLANK__ is still difficult to predict exactly when a volcano will erupt. Despite advances in technology, nature can still surprise us. Understanding volcanoes better can help communities prepare and stay safe.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Over time", "However", "Therefore", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["To reduce the risk", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Predicting eruptions", "Building near volcanoes", "Stopping eruptions", "Ignoring warnings"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 21: The Water Cycle ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Water Cycle\n\nWater on Earth is constantly moving in a cycle. The sun heats water in oceans, lakes, and rivers, causing it to evaporate and rise into the air. __BLANK__, this water vapor forms clouds. When the clouds become heavy enough, the water falls back to the ground as rain or snow. This process is essential for life, as it provides fresh water to plants, animals, and people.\n\n__BLANK__, human activities can affect the water cycle. Cutting down forests and paving over land can change how water flows and is absorbed. __BLANK__ is important for managing floods, droughts, and water quality. Scientists and engineers work to understand and protect this cycle so that future generations will have enough clean water.',
  'The Water Cycle',
  E'The Water Cycle\n\nWater on Earth is constantly moving in a cycle. The sun heats water in oceans, lakes, and rivers, causing it to evaporate and rise into the air. __BLANK__, this water vapor forms clouds. When the clouds become heavy enough, the water falls back to the ground as rain or snow. This process is essential for life, as it provides fresh water to plants, animals, and people.\n\n__BLANK__, human activities can affect the water cycle. Cutting down forests and paving over land can change how water flows and is absorbed. __BLANK__ is important for managing floods, droughts, and water quality. Scientists and engineers work to understand and protect this cycle so that future generations will have enough clean water.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As it cools", "However", "Therefore", "In other words"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Moreover", "Nevertheless", "In this way"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Understanding the water cycle", "Building more dams", "Stopping rainfall", "Removing clouds"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 22: The History of Chocolate ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The History of Chocolate\n\nChocolate comes from the cacao tree, which grew naturally in Central and South America. Ancient peoples there used cacao beans to make a bitter drink that was often used in religious ceremonies. __BLANK__, when Europeans arrived in the Americas, they brought cacao back to Europe, where sugar was added to make it sweeter. Over time, chocolate became a popular treat enjoyed around the world.\n\n__BLANK__, chocolate is used in countless products, from candy bars to cakes and hot drinks. The chocolate industry supports millions of farmers in tropical countries. __BLANK__ has become an important issue. Some companies now work to ensure that cacao farmers receive fair prices and that farming methods do not harm the environment. This has led to labels such as "fair trade" and "organic" on many chocolate products.',
  'The History of Chocolate',
  E'The History of Chocolate\n\nChocolate comes from the cacao tree, which grew naturally in Central and South America. Ancient peoples there used cacao beans to make a bitter drink that was often used in religious ceremonies. __BLANK__, when Europeans arrived in the Americas, they brought cacao back to Europe, where sugar was added to make it sweeter. Over time, chocolate became a popular treat enjoyed around the world.\n\n__BLANK__, chocolate is used in countless products, from candy bars to cakes and hot drinks. The chocolate industry supports millions of farmers in tropical countries. __BLANK__ has become an important issue. Some companies now work to ensure that cacao farmers receive fair prices and that farming methods do not harm the environment. This has led to labels such as "fair trade" and "organic" on many chocolate products.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Later", "However", "Therefore", "In contrast"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Today", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Sustainable and fair chocolate production", "The taste of bitter chocolate", "The number of candy bars", "The history of Europe"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 23: Robot Assistants ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Robot Assistants\n\nRobots are increasingly being used to assist humans in various settings. In hospitals, robots can help deliver supplies and allow doctors to perform surgery from a distance. In factories, they can carry out repetitive or dangerous tasks. __BLANK__, some people worry that robots will replace too many workers and cause job losses. Others argue that robots will create new kinds of jobs and make existing work safer and more efficient.\n\n__BLANK__, robots are being developed to help care for the elderly and people with disabilities. These robots can remind users to take medicine, help with simple tasks, and provide companionship. __BLANK__ will likely continue to grow. As technology improves, we will need to decide how to use robots in ways that benefit society while addressing concerns about privacy, safety, and employment.',
  'Robot Assistants',
  E'Robot Assistants\n\nRobots are increasingly being used to assist humans in various settings. In hospitals, robots can help deliver supplies and allow doctors to perform surgery from a distance. In factories, they can carry out repetitive or dangerous tasks. __BLANK__, some people worry that robots will replace too many workers and cause job losses. Others argue that robots will create new kinds of jobs and make existing work safer and more efficient.\n\n__BLANK__, robots are being developed to help care for the elderly and people with disabilities. These robots can remind users to take medicine, help with simple tasks, and provide companionship. __BLANK__ will likely continue to grow. As technology improves, we will need to decide how to use robots in ways that benefit society while addressing concerns about privacy, safety, and employment.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "Therefore", "Moreover", "In this way"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The use of robots in daily life", "The cost of hospitals", "The number of factories", "The age of workers"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 24: Bird Migration ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Bird Migration\n\nMany bird species travel long distances each year in search of food and suitable nesting sites. This seasonal movement is called migration. Some birds fly thousands of kilometers, often following the same routes year after year. __BLANK__, they may use the sun, stars, Earth''s magnetic field, or landmarks to find their way. Scientists are still learning exactly how different species navigate so accurately.\n\n__BLANK__, migration is becoming more dangerous for birds. Cities, buildings, and communication towers can confuse or harm them. Loss of habitat at both ends of their journey also poses a threat. __BLANK__ can help protect migrating birds. Turning off unnecessary lights at night during migration season and preserving wetlands and forests are steps that governments and individuals can take to support these remarkable travelers.',
  'Bird Migration',
  E'Bird Migration\n\nMany bird species travel long distances each year in search of food and suitable nesting sites. This seasonal movement is called migration. Some birds fly thousands of kilometers, often following the same routes year after year. __BLANK__, they may use the sun, stars, Earth''s magnetic field, or landmarks to find their way. Scientists are still learning exactly how different species navigate so accurately.\n\n__BLANK__, migration is becoming more dangerous for birds. Cities, buildings, and communication towers can confuse or harm them. Loss of habitat at both ends of their journey also poses a threat. __BLANK__ can help protect migrating birds. Turning off unnecessary lights at night during migration season and preserving wetlands and forests are steps that governments and individuals can take to support these remarkable travelers.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["To do this", "However", "Therefore", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Unfortunately", "Moreover", "Nevertheless", "In this way"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Simple measures", "Building more towers", "Stopping all travel", "Ignoring the routes"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 25: The Importance of Breakfast ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Importance of Breakfast\n\nBreakfast is often called the most important meal of the day. After a night of sleep, the body has gone many hours without food. __BLANK__, eating a healthy breakfast can provide energy and help people concentrate better at school or work. Studies have suggested that students who eat breakfast tend to perform better academically than those who skip it.\n\n__BLANK__, what you eat for breakfast matters. A meal that includes protein, whole grains, and fruits or vegetables can keep you full longer and support better health. __BLANK__ is a common habit in busy modern life. Making time for breakfast, even something simple, can be a positive step toward better energy and focus throughout the day.',
  'The Importance of Breakfast',
  E'The Importance of Breakfast\n\nBreakfast is often called the most important meal of the day. After a night of sleep, the body has gone many hours without food. __BLANK__, eating a healthy breakfast can provide energy and help people concentrate better at school or work. Studies have suggested that students who eat breakfast tend to perform better academically than those who skip it.\n\n__BLANK__, what you eat for breakfast matters. A meal that includes protein, whole grains, and fruits or vegetables can keep you full longer and support better health. __BLANK__ is a common habit in busy modern life. Making time for breakfast, even something simple, can be a positive step toward better energy and focus throughout the day.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For this reason", "However", "In contrast", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "Otherwise", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Skipping breakfast", "Eating late at night", "Choosing healthy food", "Drinking coffee only"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 26: The Amazon Rainforest ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Amazon Rainforest\n\nThe Amazon rainforest is the largest tropical rainforest on Earth. It is home to millions of species of plants, animals, and insects, many of which are found nowhere else. The forest also produces a large amount of the world''s oxygen and stores huge quantities of carbon. __BLANK__, the Amazon is sometimes called the "lungs of the Earth."\n\n__BLANK__, the Amazon is under threat. Deforestation for farming, logging, and mining has destroyed large areas of the forest. This not only harms wildlife but can also affect rainfall patterns and contribute to climate change. __BLANK__ is essential for the planet. Many organizations and governments are working to protect the Amazon and support sustainable ways for local people to make a living without destroying the forest.',
  'The Amazon Rainforest',
  E'The Amazon Rainforest\n\nThe Amazon rainforest is the largest tropical rainforest on Earth. It is home to millions of species of plants, animals, and insects, many of which are found nowhere else. The forest also produces a large amount of the world''s oxygen and stores huge quantities of carbon. __BLANK__, the Amazon is sometimes called the "lungs of the Earth."\n\n__BLANK__, the Amazon is under threat. Deforestation for farming, logging, and mining has destroyed large areas of the forest. This not only harms wildlife but can also affect rainfall patterns and contribute to climate change. __BLANK__ is essential for the planet. Many organizations and governments are working to protect the Amazon and support sustainable ways for local people to make a living without destroying the forest.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For this reason", "However", "In contrast", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Unfortunately", "Moreover", "Nevertheless", "Therefore"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Protecting the Amazon", "Building more roads", "Increasing mining", "Clearing more land"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 27: The Invention of the Telephone ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Invention of the Telephone\n\nAlexander Graham Bell is often credited with inventing the telephone in the 19th century. The telephone allowed people to speak to each other over long distances using electrical signals. __BLANK__, communication that had once required letters or face-to-face meetings could happen in minutes. The invention changed business, government, and daily life.\n\n__BLANK__, the telephone has evolved dramatically. From rotary dials to push buttons to mobile phones, the technology has become faster, smaller, and more powerful. __BLANK__ continues today. Smartphones now allow people not only to talk but also to send messages, use the internet, and access countless apps. The basic idea of connecting people at a distance remains at the heart of modern communication.',
  'The Invention of the Telephone',
  E'The Invention of the Telephone\n\nAlexander Graham Bell is often credited with inventing the telephone in the 19th century. The telephone allowed people to speak to each other over long distances using electrical signals. __BLANK__, communication that had once required letters or face-to-face meetings could happen in minutes. The invention changed business, government, and daily life.\n\n__BLANK__, the telephone has evolved dramatically. From rotary dials to push buttons to mobile phones, the technology has become faster, smaller, and more powerful. __BLANK__ continues today. Smartphones now allow people not only to talk but also to send messages, use the internet, and access countless apps. The basic idea of connecting people at a distance remains at the heart of modern communication.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "In other words", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Since then", "Nevertheless", "On the contrary", "In this way"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["This evolution", "The cost of calls", "The number of letters", "The size of phones"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 28: Renewable Energy ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Renewable Energy\n\nRenewable energy comes from sources that are naturally replenished, such as sunlight, wind, and water. Unlike fossil fuels, these sources do not run out and produce little or no greenhouse gas emissions when used. __BLANK__, solar panels and wind turbines have become more common in many countries. Governments and companies are investing in renewable energy to reduce dependence on coal and oil.\n\n__BLANK__, there are challenges. Solar and wind power depend on weather conditions, so energy storage and backup systems are needed when the sun is not shining or the wind is not blowing. __BLANK__ is a key goal for many nations. Expanding renewable energy while making it reliable and affordable will be important for addressing climate change and meeting the world''s growing energy needs.',
  'Renewable Energy',
  E'Renewable Energy\n\nRenewable energy comes from sources that are naturally replenished, such as sunlight, wind, and water. Unlike fossil fuels, these sources do not run out and produce little or no greenhouse gas emissions when used. __BLANK__, solar panels and wind turbines have become more common in many countries. Governments and companies are investing in renewable energy to reduce dependence on coal and oil.\n\n__BLANK__, there are challenges. Solar and wind power depend on weather conditions, so energy storage and backup systems are needed when the sun is not shining or the wind is not blowing. __BLANK__ is a key goal for many nations. Expanding renewable energy while making it reliable and affordable will be important for addressing climate change and meeting the world''s growing energy needs.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "In contrast", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "Moreover", "On the other hand", "Therefore"]', 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Expanding renewable energy", "Using more fossil fuels", "Reducing electricity use only", "Ignoring climate change"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 29: The Benefits of Bilingualism ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Benefits of Bilingualism\n\nPeople who speak two or more languages are said to be bilingual or multilingual. Research has shown that learning and using more than one language can have cognitive benefits. __BLANK__, some studies suggest that bilingual individuals may be better at certain tasks that require focus and switching between different types of information. Knowing another language can also improve memory and delay some age-related decline in mental function.\n\n__BLANK__, being bilingual opens up cultural and professional opportunities. It allows people to communicate with a wider range of people and to access literature, media, and ideas in different languages. __BLANK__ is increasingly valued in the global job market. Many employers seek workers who can communicate in multiple languages. For these reasons, learning a second language is often encouraged from an early age.',
  'The Benefits of Bilingualism',
  E'The Benefits of Bilingualism\n\nPeople who speak two or more languages are said to be bilingual or multilingual. Research has shown that learning and using more than one language can have cognitive benefits. __BLANK__, some studies suggest that bilingual individuals may be better at certain tasks that require focus and switching between different types of information. Knowing another language can also improve memory and delay some age-related decline in mental function.\n\n__BLANK__, being bilingual opens up cultural and professional opportunities. It allows people to communicate with a wider range of people and to access literature, media, and ideas in different languages. __BLANK__ is increasingly valued in the global job market. Many employers seek workers who can communicate in multiple languages. For these reasons, learning a second language is often encouraged from an early age.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For example", "However", "Therefore", "In other words"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Bilingualism", "Speaking quickly", "Using only one language", "Ignoring other cultures"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 30: The Great Wall of China ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Great Wall of China\n\nThe Great Wall of China is one of the most famous structures in the world. It was built over many centuries to protect China from invasions from the north. Different sections were constructed by different dynasties, using materials such as stone, brick, and earth. __BLANK__, the wall is not a single continuous structure but a series of walls and fortifications that stretch for thousands of kilometers.\n\n__BLANK__, the Great Wall has become a major tourist attraction. Millions of people visit it each year to walk along its paths and enjoy the surrounding scenery. __BLANK__ is an ongoing effort. Weather, tourism, and time have damaged some sections, and conservationists work to repair and preserve the wall for future generations. The Great Wall remains a powerful symbol of Chinese history and human achievement.',
  'The Great Wall of China',
  E'The Great Wall of China\n\nThe Great Wall of China is one of the most famous structures in the world. It was built over many centuries to protect China from invasions from the north. Different sections were constructed by different dynasties, using materials such as stone, brick, and earth. __BLANK__, the wall is not a single continuous structure but a series of walls and fortifications that stretch for thousands of kilometers.\n\n__BLANK__, the Great Wall has become a major tourist attraction. Millions of people visit it each year to walk along its paths and enjoy the surrounding scenery. __BLANK__ is an ongoing effort. Weather, tourism, and time have damaged some sections, and conservationists work to repair and preserve the wall for future generations. The Great Wall remains a powerful symbol of Chinese history and human achievement.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In fact", "However", "Therefore", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Today", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Preserving the wall", "Building new sections", "Closing it to tourists", "Ignoring damage"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 31: The Industrial Revolution ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Industrial Revolution\n\nThe Industrial Revolution began in Britain in the 18th century and later spread to other countries. It was a period when new machines and factories replaced much of the work that had once been done by hand. __BLANK__, goods could be produced faster and in larger quantities than ever before. Textiles, iron, and steam power were at the center of these changes.\n\n__BLANK__, the Industrial Revolution brought major social changes. Many people moved from the countryside to cities to work in factories. Living and working conditions were often difficult, and child labor was common. __BLANK__ of this period still shape our world today. Modern manufacturing, transportation, and urbanization all have their roots in the Industrial Revolution. Understanding this history helps us see how technology and society have evolved together.',
  'The Industrial Revolution',
  E'The Industrial Revolution\n\nThe Industrial Revolution began in Britain in the 18th century and later spread to other countries. It was a period when new machines and factories replaced much of the work that had once been done by hand. __BLANK__, goods could be produced faster and in larger quantities than ever before. Textiles, iron, and steam power were at the center of these changes.\n\n__BLANK__, the Industrial Revolution brought major social changes. Many people moved from the countryside to cities to work in factories. Living and working conditions were often difficult, and child labor was common. __BLANK__ of this period still shape our world today. Modern manufacturing, transportation, and urbanization all have their roots in the Industrial Revolution. Understanding this history helps us see how technology and society have evolved together.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "In other words", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "On the contrary", "At the same time"]', 3
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The effects", "The machines", "The cities", "The children"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 32: The Human Brain ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Human Brain\n\nThe human brain is one of the most complex organs in the body. It controls our thoughts, emotions, movements, and many bodily functions. The brain contains billions of nerve cells that communicate through electrical and chemical signals. __BLANK__, scientists are still discovering how different regions of the brain work together. Advances in technology have allowed researchers to observe brain activity in ways that were once impossible.\n\n__BLANK__, the brain can change and adapt throughout life. This ability is known as plasticity. When we learn something new or recover from an injury, the brain can form new connections and reorganize itself. __BLANK__ is important for education and medicine. Understanding how the brain learns and heals can help us develop better teaching methods and treatments for brain-related conditions.',
  'The Human Brain',
  E'The Human Brain\n\nThe human brain is one of the most complex organs in the body. It controls our thoughts, emotions, movements, and many bodily functions. The brain contains billions of nerve cells that communicate through electrical and chemical signals. __BLANK__, scientists are still discovering how different regions of the brain work together. Advances in technology have allowed researchers to observe brain activity in ways that were once impossible.\n\n__BLANK__, the brain can change and adapt throughout life. This ability is known as plasticity. When we learn something new or recover from an injury, the brain can form new connections and reorganize itself. __BLANK__ is important for education and medicine. Understanding how the brain learns and heals can help us develop better teaching methods and treatments for brain-related conditions.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Nevertheless", "Moreover", "However", "Therefore"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "On the other hand", "In this way"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["This understanding", "The size of the brain", "The number of cells", "The speed of signals"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 33: The History of the Internet ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The History of the Internet\n\nThe Internet began as a project by the United States military and universities in the 1960s. The goal was to create a network that could keep working even if part of it was damaged. __BLANK__, messages could be sent in small pieces that could find alternative routes if one path was blocked. This system eventually grew into the global network we use today.\n\n__BLANK__, the Internet has changed how we communicate, work, shop, and learn. Email, social media, and video calls have made it possible to connect with people around the world instantly. __BLANK__ continues to evolve. New technologies such as artificial intelligence and the Internet of Things are expanding what we can do online. At the same time, issues like privacy, security, and access for everyone remain important challenges for the future.',
  'The History of the Internet',
  E'The History of the Internet\n\nThe Internet began as a project by the United States military and universities in the 1960s. The goal was to create a network that could keep working even if part of it was damaged. __BLANK__, messages could be sent in small pieces that could find alternative routes if one path was blocked. This system eventually grew into the global network we use today.\n\n__BLANK__, the Internet has changed how we communicate, work, shop, and learn. Email, social media, and video calls have made it possible to connect with people around the world instantly. __BLANK__ continues to evolve. New technologies such as artificial intelligence and the Internet of Things are expanding what we can do online. At the same time, issues like privacy, security, and access for everyone remain important challenges for the future.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In this way", "However", "Therefore", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Today", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The Internet", "The military", "Email", "Privacy"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 34: Endangered Species ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Endangered Species\n\nMany species of animals and plants are in danger of disappearing from the wild. This can happen when their habitat is destroyed, when they are overhunted, or when climate change affects their environment. __BLANK__, the giant panda was once critically endangered, but conservation efforts in China have helped increase its population. Such success stories show that action can make a difference.\n\n__BLANK__, saving endangered species often requires international cooperation. Animals like elephants and tigers cross national borders, so countries must work together to protect them. __BLANK__ is one tool used to protect species. Laws and agreements can restrict hunting and trade and set aside land for wildlife. Without these efforts, many of the world''s most iconic species could be lost forever.',
  'Endangered Species',
  E'Endangered Species\n\nMany species of animals and plants are in danger of disappearing from the wild. This can happen when their habitat is destroyed, when they are overhunted, or when climate change affects their environment. __BLANK__, the giant panda was once critically endangered, but conservation efforts in China have helped increase its population. Such success stories show that action can make a difference.\n\n__BLANK__, saving endangered species often requires international cooperation. Animals like elephants and tigers cross national borders, so countries must work together to protect them. __BLANK__ is one tool used to protect species. Laws and agreements can restrict hunting and trade and set aside land for wildlife. Without these efforts, many of the world''s most iconic species could be lost forever.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For example", "However", "Therefore", "In other words"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "On the contrary", "At the same time"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Legal protection", "Hunting more animals", "Destroying habitats", "Ignoring borders"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 35: The Benefits of Exercise ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Benefits of Exercise\n\nRegular physical activity is one of the best things you can do for your health. Exercise strengthens the heart, muscles, and bones, and it can help maintain a healthy weight. __BLANK__, exercise has been linked to better mental health. It can reduce stress, improve mood, and help people sleep better. Many doctors recommend at least 30 minutes of moderate activity most days of the week.\n\n__BLANK__, exercise does not have to mean going to a gym. Walking, cycling, swimming, and even gardening can all count as physical activity. __BLANK__ is to find something you enjoy and do it regularly. Whether you prefer team sports or solo activities, the key is to stay active. Making exercise a habit can lead to a longer, healthier life.',
  'The Benefits of Exercise',
  E'The Benefits of Exercise\n\nRegular physical activity is one of the best things you can do for your health. Exercise strengthens the heart, muscles, and bones, and it can help maintain a healthy weight. __BLANK__, exercise has been linked to better mental health. It can reduce stress, improve mood, and help people sleep better. Many doctors recommend at least 30 minutes of moderate activity most days of the week.\n\n__BLANK__, exercise does not have to mean going to a gym. Walking, cycling, swimming, and even gardening can all count as physical activity. __BLANK__ is to find something you enjoy and do it regularly. Whether you prefer team sports or solo activities, the key is to stay active. Making exercise a habit can lead to a longer, healthier life.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "However", "Therefore", "In contrast"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "On the contrary", "In this way"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The key", "The problem", "The cost", "The time"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 36: The Northern Lights ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Northern Lights\n\nThe northern lights, also known as the aurora borealis, are a natural light display that appears in the sky in high-latitude regions. They are caused when charged particles from the sun enter Earth''s atmosphere and collide with gases such as oxygen and nitrogen. __BLANK__, these collisions produce the green, red, and purple colors that we see. The lights are most often visible in winter when the nights are long and the sky is dark.\n\n__BLANK__, the northern lights have fascinated people for centuries. In the past, some cultures believed they were spirits or signs from the gods. Today, they attract tourists from around the world. __BLANK__ is best in places like Norway, Iceland, and Canada, where the conditions for viewing are often ideal. Scientists continue to study the aurora to learn more about the sun and Earth''s magnetic field.',
  'The Northern Lights',
  E'The Northern Lights\n\nThe northern lights, also known as the aurora borealis, are a natural light display that appears in the sky in high-latitude regions. They are caused when charged particles from the sun enter Earth''s atmosphere and collide with gases such as oxygen and nitrogen. __BLANK__, these collisions produce the green, red, and purple colors that we see. The lights are most often visible in winter when the nights are long and the sky is dark.\n\n__BLANK__, the northern lights have fascinated people for centuries. In the past, some cultures believed they were spirits or signs from the gods. Today, they attract tourists from around the world. __BLANK__ is best in places like Norway, Iceland, and Canada, where the conditions for viewing are often ideal. Scientists continue to study the aurora to learn more about the sun and Earth''s magnetic field.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "In other words", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Throughout history", "Nevertheless", "On the contrary", "Therefore"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Viewing the aurora", "Studying the sun only", "Ignoring the lights", "Staying indoors"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 37: The Rise of E-Books ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Rise of E-Books\n\nE-books, or electronic books, have become increasingly popular over the past two decades. Readers can store hundreds of books on a single device and download new titles instantly. __BLANK__, e-books have made reading more convenient for people who travel or have limited space. Many libraries now offer e-books that members can borrow online.\n\n__BLANK__, printed books have not disappeared. Some readers prefer the feel of paper and the experience of turning pages. Bookstores and publishers continue to produce and sell physical books. __BLANK__ is likely to continue. Both formats have their advantages, and the publishing industry is learning to serve readers who prefer one, the other, or both. What matters most is that people keep reading, whether on a screen or on paper.',
  'The Rise of E-Books',
  E'The Rise of E-Books\n\nE-books, or electronic books, have become increasingly popular over the past two decades. Readers can store hundreds of books on a single device and download new titles instantly. __BLANK__, e-books have made reading more convenient for people who travel or have limited space. Many libraries now offer e-books that members can borrow online.\n\n__BLANK__, printed books have not disappeared. Some readers prefer the feel of paper and the experience of turning pages. Bookstores and publishers continue to produce and sell physical books. __BLANK__ is likely to continue. Both formats have their advantages, and the publishing industry is learning to serve readers who prefer one, the other, or both. What matters most is that people keep reading, whether on a screen or on paper.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "In contrast", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "Moreover", "On the other hand", "Therefore"]', 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["This coexistence of formats", "The end of bookstores", "The cost of devices", "The number of libraries"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 38: The Mediterranean Diet ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Mediterranean Diet\n\nThe Mediterranean diet is based on the traditional eating habits of people who live in countries around the Mediterranean Sea. It emphasizes fruits, vegetables, whole grains, olive oil, fish, and nuts, with less red meat and processed food. __BLANK__, this way of eating has been linked to lower rates of heart disease and longer life expectancy in several studies. Many health experts recommend it as a balanced and sustainable approach to nutrition.\n\n__BLANK__, the Mediterranean diet is not only about what you eat but also about how you eat. In Mediterranean cultures, meals are often shared with family and friends, and eating is seen as a social activity. __BLANK__ can be a positive step for many people. It encourages whole foods and healthy fats while allowing flexibility and enjoyment. Adopting even some of its principles may improve both physical health and overall well-being.',
  'The Mediterranean Diet',
  E'The Mediterranean Diet\n\nThe Mediterranean diet is based on the traditional eating habits of people who live in countries around the Mediterranean Sea. It emphasizes fruits, vegetables, whole grains, olive oil, fish, and nuts, with less red meat and processed food. __BLANK__, this way of eating has been linked to lower rates of heart disease and longer life expectancy in several studies. Many health experts recommend it as a balanced and sustainable approach to nutrition.\n\n__BLANK__, the Mediterranean diet is not only about what you eat but also about how you eat. In Mediterranean cultures, meals are often shared with family and friends, and eating is seen as a social activity. __BLANK__ can be a positive step for many people. It encourages whole foods and healthy fats while allowing flexibility and enjoyment. Adopting even some of its principles may improve both physical health and overall well-being.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Research has shown", "However", "Therefore", "In other words"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "On the contrary", "At the same time"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Following this diet", "Eating more meat", "Avoiding social meals", "Ignoring nutrition"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 39: Space Exploration ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Space Exploration\n\nHumans have been exploring space since the mid-20th century. The first satellite, the first human in space, and the first moon landing were all major milestones. __BLANK__, space missions have provided valuable data about Earth, the solar system, and the universe. Satellites now support weather forecasting, communication, and navigation in daily life.\n\n__BLANK__, space exploration is expensive and risky. Sending humans and equipment beyond Earth requires advanced technology and careful planning. __BLANK__ remains a goal for many space agencies and private companies. Mars, the moon, and beyond may one day be within reach. Whether for science, resources, or inspiration, space exploration continues to capture the imagination of people around the world.',
  'Space Exploration',
  E'Space Exploration\n\nHumans have been exploring space since the mid-20th century. The first satellite, the first human in space, and the first moon landing were all major milestones. __BLANK__, space missions have provided valuable data about Earth, the solar system, and the universe. Satellites now support weather forecasting, communication, and navigation in daily life.\n\n__BLANK__, space exploration is expensive and risky. Sending humans and equipment beyond Earth requires advanced technology and careful planning. __BLANK__ remains a goal for many space agencies and private companies. Mars, the moon, and beyond may one day be within reach. Whether for science, resources, or inspiration, space exploration continues to capture the imagination of people around the world.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Over the decades", "However", "Therefore", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "Moreover", "On the other hand", "In this way"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Further exploration", "Stopping all missions", "Reducing satellites only", "Ignoring Mars"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 40: The Role of Museums ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Role of Museums\n\nMuseums collect, preserve, and display objects of artistic, cultural, historical, or scientific importance. They give the public a chance to see and learn about things they might never encounter otherwise. __BLANK__, museums offer educational programs for schools and families, helping people of all ages understand the world and its history. They are often seen as guardians of our shared heritage.\n\n__BLANK__, museums have had to adapt to changing times. Many now use technology to create virtual tours and online exhibitions, especially after the growth of digital access. __BLANK__ is still at the heart of what museums do. By protecting and sharing collections, they help us remember the past, understand the present, and imagine the future. Supporting museums helps ensure that this valuable resource remains available for generations to come.',
  'The Role of Museums',
  E'The Role of Museums\n\nMuseums collect, preserve, and display objects of artistic, cultural, historical, or scientific importance. They give the public a chance to see and learn about things they might never encounter otherwise. __BLANK__, museums offer educational programs for schools and families, helping people of all ages understand the world and its history. They are often seen as guardians of our shared heritage.\n\n__BLANK__, museums have had to adapt to changing times. Many now use technology to create virtual tours and online exhibitions, especially after the growth of digital access. __BLANK__ is still at the heart of what museums do. By protecting and sharing collections, they help us remember the past, understand the present, and imagine the future. Supporting museums helps ensure that this valuable resource remains available for generations to come.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "However", "Therefore", "In contrast"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In recent years", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Preservation and education", "Selling more tickets", "Closing exhibitions", "Ignoring technology"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 41: The Importance of Wetlands ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Importance of Wetlands\n\nWetlands are areas where water covers the soil or is present near the surface for at least part of the year. They include marshes, swamps, and bogs. Wetlands provide habitat for many species of plants and animals. __BLANK__, they act as natural filters, improving water quality by trapping pollutants and absorbing excess nutrients. They also help reduce flooding by absorbing heavy rainfall.\n\n__BLANK__, wetlands have often been drained or filled in for agriculture and development. This has led to the loss of many wetland areas around the world. __BLANK__ is now recognized as essential. Governments and conservation groups work to protect and restore wetlands. Doing so not only benefits wildlife but also helps communities by reducing flood damage and maintaining clean water supplies.',
  'The Importance of Wetlands',
  E'The Importance of Wetlands\n\nWetlands are areas where water covers the soil or is present near the surface for at least part of the year. They include marshes, swamps, and bogs. Wetlands provide habitat for many species of plants and animals. __BLANK__, they act as natural filters, improving water quality by trapping pollutants and absorbing excess nutrients. They also help reduce flooding by absorbing heavy rainfall.\n\n__BLANK__, wetlands have often been drained or filled in for agriculture and development. This has led to the loss of many wetland areas around the world. __BLANK__ is now recognized as essential. Governments and conservation groups work to protect and restore wetlands. Doing so not only benefits wildlife but also helps communities by reducing flood damage and maintaining clean water supplies.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "However", "Therefore", "In contrast"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Unfortunately", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Wetland conservation", "Draining more land", "Building on marshes", "Ignoring water quality"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 42: The Story of Coffee ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Story of Coffee\n\nCoffee is one of the most popular drinks in the world. It is made from the roasted seeds of the coffee plant, which grows in tropical regions. According to legend, the energizing effect of coffee was first discovered by a goat herder who noticed his animals became more active after eating certain berries. __BLANK__, coffee spread from Africa and the Middle East to Europe and eventually around the globe.\n\n__BLANK__, coffee is a major export for many developing countries. Millions of farmers depend on it for their income. __BLANK__ has become an important issue in the industry. Fair trade and sustainable farming practices aim to ensure that growers receive fair prices and that production does not harm the environment. As demand for coffee continues to grow, balancing productivity with sustainability will remain a key challenge.',
  'The Story of Coffee',
  E'The Story of Coffee\n\nCoffee is one of the most popular drinks in the world. It is made from the roasted seeds of the coffee plant, which grows in tropical regions. According to legend, the energizing effect of coffee was first discovered by a goat herder who noticed his animals became more active after eating certain berries. __BLANK__, coffee spread from Africa and the Middle East to Europe and eventually around the globe.\n\n__BLANK__, coffee is a major export for many developing countries. Millions of farmers depend on it for their income. __BLANK__ has become an important issue in the industry. Fair trade and sustainable farming practices aim to ensure that growers receive fair prices and that production does not harm the environment. As demand for coffee continues to grow, balancing productivity with sustainability will remain a key challenge.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["From there", "However", "Therefore", "In other words"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Today", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Sustainability", "The taste of coffee", "The number of cups", "The legend"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 43: Artificial Intelligence in Medicine ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'Artificial Intelligence in Medicine\n\nArtificial intelligence, or AI, is increasingly being used in healthcare. AI systems can analyze medical images, suggest diagnoses, and help identify patterns in patient data. __BLANK__, some AI tools can detect certain diseases from scans with accuracy that matches or exceeds that of human experts. This could lead to earlier detection and better outcomes for patients.\n\n__BLANK__, the use of AI in medicine raises important questions. Who is responsible if an AI system makes a mistake? How can we protect patient privacy when data is used to train AI? __BLANK__ will be important as AI becomes more common in hospitals and clinics. Doctors, policymakers, and the public will need to work together to ensure that AI is used in ways that are safe, fair, and beneficial for everyone.',
  'Artificial Intelligence in Medicine',
  E'Artificial Intelligence in Medicine\n\nArtificial intelligence, or AI, is increasingly being used in healthcare. AI systems can analyze medical images, suggest diagnoses, and help identify patterns in patient data. __BLANK__, some AI tools can detect certain diseases from scans with accuracy that matches or exceeds that of human experts. This could lead to earlier detection and better outcomes for patients.\n\n__BLANK__, the use of AI in medicine raises important questions. Who is responsible if an AI system makes a mistake? How can we protect patient privacy when data is used to train AI? __BLANK__ will be important as AI becomes more common in hospitals and clinics. Doctors, policymakers, and the public will need to work together to ensure that AI is used in ways that are safe, fair, and beneficial for everyone.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For example", "However", "Therefore", "In contrast"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "Moreover", "On the other hand", "At the same time"]', 2
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Addressing these questions", "Ignoring mistakes", "Reducing the use of scans", "Limiting patient data"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 44: The Dinosaur Extinction ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Dinosaur Extinction\n\nDinosaurs ruled the Earth for millions of years, but they disappeared about 66 million years ago. The most widely accepted theory is that a large asteroid struck the planet, causing massive fires, tsunamis, and a cloud of dust that blocked the sun. __BLANK__, plants died, and the food chain collapsed. Without enough food and sunlight, the dinosaurs and many other species could not survive.\n\n__BLANK__, not all life was lost. Some small animals, including early mammals, survived and eventually diversified. __BLANK__ has given scientists a better understanding of this event. By studying rocks and fossils from that time, researchers have found evidence that supports the asteroid theory. Understanding past extinctions can also help us think about how to protect biodiversity today.',
  'The Dinosaur Extinction',
  E'The Dinosaur Extinction\n\nDinosaurs ruled the Earth for millions of years, but they disappeared about 66 million years ago. The most widely accepted theory is that a large asteroid struck the planet, causing massive fires, tsunamis, and a cloud of dust that blocked the sun. __BLANK__, plants died, and the food chain collapsed. Without enough food and sunlight, the dinosaurs and many other species could not survive.\n\n__BLANK__, not all life was lost. Some small animals, including early mammals, survived and eventually diversified. __BLANK__ has given scientists a better understanding of this event. By studying rocks and fossils from that time, researchers have found evidence that supports the asteroid theory. Understanding past extinctions can also help us think about how to protect biodiversity today.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "Moreover", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "Moreover", "On the contrary", "However"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Research", "The asteroid", "The dinosaurs", "The sun"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 45: The Benefits of Reading ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Benefits of Reading\n\nReading is a fundamental skill that opens the door to learning and imagination. When we read, we encounter new ideas, vocabulary, and ways of thinking. __BLANK__, regular reading has been linked to improved concentration, better writing skills, and stronger analytical thinking. It can also reduce stress and provide a sense of escape and enjoyment.\n\n__BLANK__, reading does not have to mean long novels. Magazines, articles, and even comic books can all contribute to literacy and knowledge. __BLANK__ is to make reading a regular habit. Whether you prefer fiction or nonfiction, finding time to read each day can have lasting benefits for your mind and well-being. Libraries and digital platforms make it easier than ever to access a wide variety of reading material.',
  'The Benefits of Reading',
  E'The Benefits of Reading\n\nReading is a fundamental skill that opens the door to learning and imagination. When we read, we encounter new ideas, vocabulary, and ways of thinking. __BLANK__, regular reading has been linked to improved concentration, better writing skills, and stronger analytical thinking. It can also reduce stress and provide a sense of escape and enjoyment.\n\n__BLANK__, reading does not have to mean long novels. Magazines, articles, and even comic books can all contribute to literacy and knowledge. __BLANK__ is to make reading a regular habit. Whether you prefer fiction or nonfiction, finding time to read each day can have lasting benefits for your mind and well-being. Libraries and digital platforms make it easier than ever to access a wide variety of reading material.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Research suggests", "However", "Therefore", "In other words"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "On the contrary", "At the same time"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The key", "The problem", "The cost", "The type of book"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 46: The History of Television ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The History of Television\n\nTelevision was first developed in the early 20th century, but it did not become common in homes until after World War II. At first, there were only a few channels, and programs were broadcast in black and white. __BLANK__, television quickly became a central part of family life. People gathered around the set to watch news, sports, and entertainment together.\n\n__BLANK__, television has changed dramatically. Color broadcasting, cable, satellite, and now streaming services have expanded choices and changed how we watch. __BLANK__ continues to evolve. Many people now watch shows on demand on their phones or computers rather than at a fixed time. Despite these changes, television in its various forms remains one of the most influential media for information and entertainment.',
  'The History of Television',
  E'The History of Television\n\nTelevision was first developed in the early 20th century, but it did not become common in homes until after World War II. At first, there were only a few channels, and programs were broadcast in black and white. __BLANK__, television quickly became a central part of family life. People gathered around the set to watch news, sports, and entertainment together.\n\n__BLANK__, television has changed dramatically. Color broadcasting, cable, satellite, and now streaming services have expanded choices and changed how we watch. __BLANK__ continues to evolve. Many people now watch shows on demand on their phones or computers rather than at a fixed time. Despite these changes, television in its various forms remains one of the most influential media for information and entertainment.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Before long", "However", "Therefore", "In contrast"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Since then", "Nevertheless", "On the contrary", "As a result"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The way we watch", "The number of families", "The size of the set", "The end of radio"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 47: The Benefits of Teamwork ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Benefits of Teamwork\n\nWorking in a team is a common experience in school, sports, and the workplace. When people collaborate, they can combine different skills and ideas to achieve goals that might be difficult to reach alone. __BLANK__, teams can accomplish more in less time when tasks are shared effectively. Teamwork also helps people learn from one another and develop communication and leadership skills.\n\n__BLANK__, teamwork is not always easy. Different personalities and opinions can sometimes lead to conflict. __BLANK__ is important for success. Listening to others, respecting different views, and focusing on shared goals can help teams overcome challenges and work together productively. Whether in a classroom project or a company project, good teamwork often leads to better results and a more positive experience for everyone involved.',
  'The Benefits of Teamwork',
  E'The Benefits of Teamwork\n\nWorking in a team is a common experience in school, sports, and the workplace. When people collaborate, they can combine different skills and ideas to achieve goals that might be difficult to reach alone. __BLANK__, teams can accomplish more in less time when tasks are shared effectively. Teamwork also helps people learn from one another and develop communication and leadership skills.\n\n__BLANK__, teamwork is not always easy. Different personalities and opinions can sometimes lead to conflict. __BLANK__ is important for success. Listening to others, respecting different views, and focusing on shared goals can help teams overcome challenges and work together productively. Whether in a classroom project or a company project, good teamwork often leads to better results and a more positive experience for everyone involved.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "However", "Therefore", "In other words"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "Moreover", "On the contrary", "At the same time"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Effective communication", "Working alone always", "Ignoring opinions", "Avoiding goals"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 48: The Water Crisis ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Water Crisis\n\nAlthough water covers much of the Earth''s surface, only a small fraction of it is fresh water suitable for drinking and farming. Population growth, pollution, and climate change are putting increasing pressure on this limited resource. __BLANK__, many regions already face shortages, and conflicts over water have occurred in some parts of the world. Ensuring that everyone has access to clean water is one of the major challenges of the 21st century.\n\n__BLANK__, there are ways to address the problem. Improving irrigation efficiency, fixing leaky pipes, and reusing treated wastewater can reduce waste. __BLANK__ is also vital. Education and technology can help communities use water more wisely. Governments, businesses, and individuals all have a role to play in protecting and managing water resources for current and future generations.',
  'The Water Crisis',
  E'The Water Crisis\n\nAlthough water covers much of the Earth''s surface, only a small fraction of it is fresh water suitable for drinking and farming. Population growth, pollution, and climate change are putting increasing pressure on this limited resource. __BLANK__, many regions already face shortages, and conflicts over water have occurred in some parts of the world. Ensuring that everyone has access to clean water is one of the major challenges of the 21st century.\n\n__BLANK__, there are ways to address the problem. Improving irrigation efficiency, fixing leaky pipes, and reusing treated wastewater can reduce waste. __BLANK__ is also vital. Education and technology can help communities use water more wisely. Governments, businesses, and individuals all have a role to play in protecting and managing water resources for current and future generations.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "Moreover", "For instance"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "Moreover", "On the contrary", "At the same time"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Conservation", "Using more water", "Building more dams only", "Ignoring shortages"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 49: The Invention of the Wheel ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Invention of the Wheel\n\nThe wheel is one of the oldest and most important inventions in human history. It was first used thousands of years ago, probably for making pottery, and later for transport. __BLANK__, the wheel made it possible to move heavy loads with less effort. Carts and wagons allowed people to trade goods over longer distances and build larger structures.\n\n__BLANK__, the wheel remains essential today. Cars, bicycles, and trains all depend on it. So do many machines in factories and offices. __BLANK__ is hard to overstate. From ancient carts to modern vehicles and machinery, the wheel has been at the center of human progress. It is a simple idea that has had an enormous and lasting impact on how we live.',
  'The Invention of the Wheel',
  E'The Invention of the Wheel\n\nThe wheel is one of the oldest and most important inventions in human history. It was first used thousands of years ago, probably for making pottery, and later for transport. __BLANK__, the wheel made it possible to move heavy loads with less effort. Carts and wagons allowed people to trade goods over longer distances and build larger structures.\n\n__BLANK__, the wheel remains essential today. Cars, bicycles, and trains all depend on it. So do many machines in factories and offices. __BLANK__ is hard to overstate. From ancient carts to modern vehicles and machinery, the wheel has been at the center of human progress. It is a simple idea that has had an enormous and lasting impact on how we live.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "In other words", "For example"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Today", "Nevertheless", "On the contrary", "In this way"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Its importance", "Its size", "Its cost", "Its age"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 50: The Future of Cities ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '2級', 'explanation', 'long_fill',
  E'The Future of Cities\n\nMore than half of the world''s population now lives in cities, and this proportion is expected to grow. Cities offer jobs, education, and cultural opportunities, but they also face challenges such as traffic, pollution, and housing shortages. __BLANK__, many city planners are turning to technology and new design ideas. Smart cities use data and digital systems to manage traffic, save energy, and improve public services.\n\n__BLANK__, green spaces and sustainable building are becoming priorities. Parks, rooftop gardens, and energy-efficient buildings can make cities more livable and reduce their environmental impact. __BLANK__ will require cooperation between governments, businesses, and citizens. By planning wisely and investing in infrastructure, cities can become more efficient, equitable, and enjoyable places to live. The choices we make today will shape the urban world of tomorrow.',
  'The Future of Cities',
  E'The Future of Cities\n\nMore than half of the world''s population now lives in cities, and this proportion is expected to grow. Cities offer jobs, education, and cultural opportunities, but they also face challenges such as traffic, pollution, and housing shortages. __BLANK__, many city planners are turning to technology and new design ideas. Smart cities use data and digital systems to manage traffic, save energy, and improve public services.\n\n__BLANK__, green spaces and sustainable building are becoming priorities. Parks, rooftop gardens, and energy-efficient buildings can make cities more livable and reduce their environmental impact. __BLANK__ will require cooperation between governments, businesses, and citizens. By planning wisely and investing in infrastructure, cities can become more efficient, equitable, and enjoyable places to live. The choices we make today will shape the urban world of tomorrow.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In response", "However", "Therefore", "In other words"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "On the contrary", "At the same time"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Building better cities", "Leaving cities", "Ignoring technology", "Reducing the population"]', 0
FROM public.reading_passages WHERE level = '2級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

