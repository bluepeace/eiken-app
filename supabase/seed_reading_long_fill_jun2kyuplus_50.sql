-- seed_reading_long_fill_jun2kyuplus_50.sql
-- 英検準2級プラス 長文の語句空所補充 50問（1パッセージ3空所形式）
-- 過去問形式: 説明文のみ、(18)(19)(20)相当の空所3か所・各4肢。content は NOT NULL のため body と同値で指定。

-- ========== 1: Olive Oil (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Olive Oil\n\nSpain is the world''s largest producer of olive oil. The country faces __BLANK__ in the areas where olives are grown. Climate change has made it harder for farmers to get good results. As a result, the amount of olive oil produced there has gone down.\n\n__BLANK__, the price of olive oil in the country rose rapidly in 2022. Many people started to buy cheaper oils instead. Sales of olive oil dropped. Still, in Spain olive oil is important for __BLANK__. Losing olive oil could mean Spanish people lose a big part of their daily eating habits.',
  'Olive Oil',
  E'Olive Oil\n\nSpain is the world''s largest producer of olive oil. The country faces __BLANK__ in the areas where olives are grown. Climate change has made it harder for farmers to get good results. As a result, the amount of olive oil produced there has gone down.\n\n__BLANK__, the price of olive oil in the country rose rapidly in 2022. Many people started to buy cheaper oils instead. Sales of olive oil dropped. Still, in Spain olive oil is important for __BLANK__. Losing olive oil could mean Spanish people lose a big part of their daily eating habits.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["a decreasing number of workers", "a poor working environment", "a problem of a shortage of rain", "increasing demands for olives"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In the same way", "Nevertheless", "Because of that", "That is"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["the country''s food culture", "the climate in Spain", "job opportunities for local people", "the people''s interest in farms"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 2: A Straw for Clean Water (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'A Straw for Clean Water\n\nIn some parts of Africa, many people get sick because of dirty water. A special straw was made to help them drink safer water. __BLANK__, the straw was first designed for use in such areas. When you suck water through it, a filter inside removes small materials and bacteria.\n\nThe water that comes out is __BLANK__. One straw can clean about 4,000 liters of water. Such products have also been used in other countries when disasters happen. In Thailand and Ecuador, for example, they __BLANK__ when people lost access to safe drinking water.',
  'A Straw for Clean Water',
  E'A Straw for Clean Water\n\nIn some parts of Africa, many people get sick because of dirty water. A special straw was made to help them drink safer water. __BLANK__, the straw was first designed for use in such areas. When you suck water through it, a filter inside removes small materials and bacteria.\n\nThe water that comes out is __BLANK__. One straw can clean about 4,000 liters of water. Such products have also been used in other countries when disasters happen. In Thailand and Ecuador, for example, they __BLANK__ when people lost access to safe drinking water.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["On the other hand", "Moreover", "To be sure", "Therefore"]', 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["clean enough for people to drink", "clear but dangerous to drink", "bad for people''s health", "dirty and harmful to humans"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["worked as helpful tools", "caused environmental problems", "damaged natural water", "turned out to be expensive"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 3: Weather Balloons (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Weather Balloons\n\nWeather balloons are used to collect data about wind, temperature, and air pressure. This information is used for weather forecasts and for studying climate change. When __BLANK__, the collected data is immediately sent back to the ground.\n\nA balloon usually flies for about two hours and can go very high. When the balloon rises higher and higher, it expands little by little. __BLANK__, it grows big enough to be broken. Then it falls with a parachute. The idea of using balloons for weather started with a French scientist in the late 1800s. His experiments with weather balloons __BLANK__. He learned a lot about the atmosphere that surrounds the earth.',
  'Weather Balloons',
  E'Weather Balloons\n\nWeather balloons are used to collect data about wind, temperature, and air pressure. This information is used for weather forecasts and for studying climate change. When __BLANK__, the collected data is immediately sent back to the ground.\n\nA balloon usually flies for about two hours and can go very high. When the balloon rises higher and higher, it expands little by little. __BLANK__, it grows big enough to be broken. Then it falls with a parachute. The idea of using balloons for weather started with a French scientist in the late 1800s. His experiments with weather balloons __BLANK__. He learned a lot about the atmosphere that surrounds the earth.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["the balloon is prepared", "the balloon is in the air", "the machine is repaired", "the machine is in the sea"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["On the other hand", "In particular", "If not", "Eventually"]', 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["proved to be a great success", "led people to stop using them", "failed to understand the planet", "helped him visit many countries"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 4: The Big Apple (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'A Special Name for New York City\n\nMany cities have nicknames. "The Big Apple" is one of the most famous names for New York City. It is believed that people __BLANK__ about a hundred years ago. There are several stories about where the name came from.\n\nOne story says it started at horse racing tracks in the 1920s. Prize money was sometimes called "big apples." A newspaper writer used the name in an article. Then, __BLANK__ helped the name spread widely. Later, New York musicians also used it. In the late 1900s, New York City had a negative image because of crime. __BLANK__, a campaign was started to improve the image and attract tourists. A large apple drawing was used with the nickname to create a more positive image.',
  'A Special Name for New York City',
  E'A Special Name for New York City\n\nMany cities have nicknames. "The Big Apple" is one of the most famous names for New York City. It is believed that people __BLANK__ about a hundred years ago. There are several stories about where the name came from.\n\nOne story says it started at horse racing tracks in the 1920s. Prize money was sometimes called "big apples." A newspaper writer used the name in an article. Then, __BLANK__ helped the name spread widely. Later, New York musicians also used it. In the late 1900s, New York City had a negative image because of crime. __BLANK__, a campaign was started to improve the image and attract tourists. A large apple drawing was used with the nickname to create a more positive image.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["worked as farmers", "came to live in the city", "started using the name", "moved to another city"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["a large amount of money", "the influence of music", "some famous restaurants", "rich horse racers"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Even so", "In the same way", "Despite the fact", "Therefore"]', 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 5: The Decreasing Number of Frogs (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'The Decreasing Number of Frogs\n\nMany animals, including frogs, are in danger of disappearing from the planet. Experts point to three major problems: climate change, diseases, and loss of homes. These problems are very much connected to __BLANK__. This is why scientists are worried about people''s impact on frogs and are trying to draw people''s attention to them.\n\nClimate change is one of the biggest challenges. Rising temperatures and longer dry periods make it harder for frogs to find water. In addition, climate change can create new diseases that can be very dangerous for frogs. __BLANK__, one problem can lead to more problems and make the situation even worse for the animal.\n\nSome groups are working to increase frog populations. In Switzerland, one type of frog was decreasing because it lost its habitat. In order to handle the situation, organizations spent many years __BLANK__ in the area. As a result, the species'' population increased greatly.',
  'The Decreasing Number of Frogs',
  E'The Decreasing Number of Frogs\n\nMany animals, including frogs, are in danger of disappearing from the planet. Experts point to three major problems: climate change, diseases, and loss of homes. These problems are very much connected to __BLANK__. This is why scientists are worried about people''s impact on frogs and are trying to draw people''s attention to them.\n\nClimate change is one of the biggest challenges. Rising temperatures and longer dry periods make it harder for frogs to find water. In addition, climate change can create new diseases that can be very dangerous for frogs. __BLANK__, one problem can lead to more problems and make the situation even worse for the animal.\n\nSome groups are working to increase frog populations. In Switzerland, one type of frog was decreasing because it lost its habitat. In order to handle the situation, organizations spent many years __BLANK__ in the area. As a result, the species'' population increased greatly.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["human activities", "water pollution", "natural disasters", "the development of medicine"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Besides", "In other words", "At first", "On the contrary"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["building new ponds", "catching their food", "watching them closely", "wasting more water"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 6: A Long River with No Bridges (過去問風) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'A Long River with No Bridges\n\nThe Amazon River is the second-longest river in the world. It stretches over 6,000 kilometers and runs through at least three countries in South America. More than thirty million people live along it. Many large rivers around the world have bridges built over them. __BLANK__, there are no bridges on the Amazon River. Therefore, people have to find other ways to cross it, such as by boat.\n\nThere are several reasons for this. One is that boats and ferries have been used for a long time. Another reason is that __BLANK__ building bridges. For example, the soil along the river is too soft to build bridges. Also, the water level and width of the river change a lot during the year. Some people hope that bridges will be built in the future. However, a number of problems have to be handled in order to do so. Moreover, building bridges __BLANK__. If the bridges have little positive impact on the economy, the countries may face financial loss.',
  'A Long River with No Bridges',
  E'A Long River with No Bridges\n\nThe Amazon River is the second-longest river in the world. It stretches over 6,000 kilometers and runs through at least three countries in South America. More than thirty million people live along it. Many large rivers around the world have bridges built over them. __BLANK__, there are no bridges on the Amazon River. Therefore, people have to find other ways to cross it, such as by boat.\n\nThere are several reasons for this. One is that boats and ferries have been used for a long time. Another reason is that __BLANK__ building bridges. For example, the soil along the river is too soft to build bridges. Also, the water level and width of the river change a lot during the year. Some people hope that bridges will be built in the future. However, a number of problems have to be handled in order to do so. Moreover, building bridges __BLANK__. If the bridges have little positive impact on the economy, the countries may face financial loss.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In addition", "First", "As a result", "On the other hand"]', 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["many local people are not interested in", "many animals will lose their homes by", "the conditions are not suitable for", "the beautiful scenery will be destroyed by"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["needs a lot of money", "helps to clean the river", "reduces the crime rate", "increases the number of visitors"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 7: Solar Panels ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Solar Panels\n\nSolar panels turn sunlight into electricity. They are used on the roofs of homes and on large farms in sunny areas. __BLANK__, they do not produce gases that harm the environment. Many countries are encouraging people to use them.\n\n__BLANK__, the cost of solar panels has gone down over the years. More families can now afford them. In some places, people can sell extra electricity back to the power company. __BLANK__ is one reason why solar power is becoming more popular. People want to use energy that does not damage the earth.',
  'Solar Panels',
  E'Solar Panels\n\nSolar panels turn sunlight into electricity. They are used on the roofs of homes and on large farms in sunny areas. __BLANK__, they do not produce gases that harm the environment. Many countries are encouraging people to use them.\n\n__BLANK__, the cost of solar panels has gone down over the years. More families can now afford them. In some places, people can sell extra electricity back to the power company. __BLANK__ is one reason why solar power is becoming more popular. People want to use energy that does not damage the earth.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "For example", "In addition", "Therefore"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["At first", "In other words", "Nevertheless", "Because of that"]', 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The high cost", "Concern for the environment", "Lack of sunlight", "Old technology"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 8: Honeybees ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Honeybees\n\nHoneybees play an important role in growing many kinds of fruits and vegetables. They carry pollen from one flower to another. __BLANK__, many crops would not produce food. In recent years, however, the number of honeybees has been falling in several countries.\n\nScientists are still studying the reasons. Some say it is due to __BLANK__. Certain chemicals used on farms may be harmful to bees. Changes in weather and loss of places where bees can live are also possible causes. __BLANK__, some farmers and governments are creating areas with more flowers and fewer chemicals. Protecting bees is now seen as important for both nature and agriculture.',
  'Honeybees',
  E'Honeybees\n\nHoneybees play an important role in growing many kinds of fruits and vegetables. They carry pollen from one flower to another. __BLANK__, many crops would not produce food. In recent years, however, the number of honeybees has been falling in several countries.\n\nScientists are still studying the reasons. Some say it is due to __BLANK__. Certain chemicals used on farms may be harmful to bees. Changes in weather and loss of places where bees can live are also possible causes. __BLANK__, some farmers and governments are creating areas with more flowers and fewer chemicals. Protecting bees is now seen as important for both nature and agriculture.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Without them", "With them", "Besides", "For example"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["the growth of forests", "pesticides and other factors", "the price of honey", "the number of beekeepers"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Nevertheless", "In other words", "As a result", "On the contrary"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 9: The History of Coffee ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'The History of Coffee\n\nCoffee is one of the most popular drinks in the world. It is said that coffee was first used in Africa hundreds of years ago. People there noticed that __BLANK__ after eating the red fruit of a certain plant. Later, the drink spread to the Middle East and then to Europe.\n\nIn the 1600s, coffee houses became popular in England. Men would meet there to talk about business and news. __BLANK__, coffee was sometimes called "the drink of the thinkers." Today, coffee is grown in many countries near the equator. __BLANK__ has made it possible for people everywhere to enjoy coffee every day.',
  'The History of Coffee',
  E'The History of Coffee\n\nCoffee is one of the most popular drinks in the world. It is said that coffee was first used in Africa hundreds of years ago. People there noticed that __BLANK__ after eating the red fruit of a certain plant. Later, the drink spread to the Middle East and then to Europe.\n\nIn the 1600s, coffee houses became popular in England. Men would meet there to talk about business and news. __BLANK__, coffee was sometimes called "the drink of the thinkers." Today, coffee is grown in many countries near the equator. __BLANK__ has made it possible for people everywhere to enjoy coffee every day.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["they felt more awake", "they became very sleepy", "they lost their appetite", "they got sick"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "For this reason", "At first", "On the other hand"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Local farming", "Global trade", "Strict laws", "Old traditions"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 10: Japanese Gardens ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Japanese Gardens\n\nJapanese gardens are known for their simple and natural beauty. They often use rocks, water, and plants in a balanced way. __BLANK__ is an important idea in these gardens. Designers try to create a peaceful space that feels close to nature.\n\nMany traditional gardens have a path for visitors to walk along. __BLANK__, you can see the garden from different angles. Some gardens are built around a pond or a small stream. Water is used to represent __BLANK__. For these reasons, Japanese gardens attract many visitors from around the world every year.',
  'Japanese Gardens',
  E'Japanese Gardens\n\nJapanese gardens are known for their simple and natural beauty. They often use rocks, water, and plants in a balanced way. __BLANK__ is an important idea in these gardens. Designers try to create a peaceful space that feels close to nature.\n\nMany traditional gardens have a path for visitors to walk along. __BLANK__, you can see the garden from different angles. Some gardens are built around a pond or a small stream. Water is used to represent __BLANK__. For these reasons, Japanese gardens attract many visitors from around the world every year.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Speed", "Harmony", "Noise", "Competition"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In this way", "Therefore", "At first"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["fire and danger", "peace and calm", "wind and storm", "noise and crowd"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 11: Sleep and Health ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Sleep and Health\n\nGetting enough sleep is important for both the body and the mind. When we sleep, our body repairs itself and our brain organizes what we learned during the day. __BLANK__, people who do not sleep well may have trouble remembering things or staying focused.\n\nExperts say that teenagers need about eight to ten hours of sleep each night. __BLANK__, many young people use smartphones or computers until late. The light from these devices can make it harder to fall asleep. __BLANK__ is one of the main reasons why sleep problems are increasing among young people today.',
  'Sleep and Health',
  E'Sleep and Health\n\nGetting enough sleep is important for both the body and the mind. When we sleep, our body repairs itself and our brain organizes what we learned during the day. __BLANK__, people who do not sleep well may have trouble remembering things or staying focused.\n\nExperts say that teenagers need about eight to ten hours of sleep each night. __BLANK__, many young people use smartphones or computers until late. The light from these devices can make it harder to fall asleep. __BLANK__ is one of the main reasons why sleep problems are increasing among young people today.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For example", "Therefore", "On the other hand", "At first"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In other words", "Because of that", "Besides"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Lack of exercise", "Use of electronic devices at night", "Healthy food", "Early school start"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 12: Volcanoes ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Volcanoes\n\nA volcano is a mountain that can send out hot rock, gas, and ash from deep inside the earth. There are many volcanoes around the Pacific Ocean. __BLANK__ this area is sometimes called the "Ring of Fire." Scientists study volcanoes to understand when they might erupt.\n\nWhen a volcano erupts, it can cause great damage. __BLANK__, people who live nearby may have to leave their homes. Ash can cover farms and make it hard to breathe. __BLANK__ has helped us predict some eruptions and save lives. Today, many countries work together to watch active volcanoes.',
  'Volcanoes',
  E'Volcanoes\n\nA volcano is a mountain that can send out hot rock, gas, and ash from deep inside the earth. There are many volcanoes around the Pacific Ocean. __BLANK__ this area is sometimes called the "Ring of Fire." Scientists study volcanoes to understand when they might erupt.\n\nWhen a volcano erupts, it can cause great damage. __BLANK__, people who live nearby may have to leave their homes. Ash can cover farms and make it hard to breathe. __BLANK__ has helped us predict some eruptions and save lives. Today, many countries work together to watch active volcanoes.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Because of", "In addition to", "Instead of", "In spite of"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["For example", "Therefore", "Nevertheless", "That is"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Modern technology", "Old traditions", "Lack of interest", "Beautiful scenery"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 13: Chocolate ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Chocolate\n\nChocolate is made from the seeds of the cacao tree. This tree grows in hot, rainy areas near the equator. __BLANK__, countries in Africa and South America are among the largest producers of cacao. Making chocolate requires several steps: the seeds are first dried and then roasted.\n\nIn the past, chocolate was mainly drunk as a bitter drink. __BLANK__, people in Europe began to add sugar and milk. This made chocolate sweeter and more popular. Today, __BLANK__ is one of the biggest chocolate-consuming countries in the world. Many people enjoy it as a snack or a gift.',
  'Chocolate',
  E'Chocolate\n\nChocolate is made from the seeds of the cacao tree. This tree grows in hot, rainy areas near the equator. __BLANK__, countries in Africa and South America are among the largest producers of cacao. Making chocolate requires several steps: the seeds are first dried and then roasted.\n\nIn the past, chocolate was mainly drunk as a bitter drink. __BLANK__, people in Europe began to add sugar and milk. This made chocolate sweeter and more popular. Today, __BLANK__ is one of the biggest chocolate-consuming countries in the world. Many people enjoy it as a snack or a gift.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For this reason", "On the other hand", "At first", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Later", "Besides", "In other words", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Japan", "Brazil", "Egypt", "Canada"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 14: Bicycles ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Bicycles\n\nBicycles are used by millions of people around the world. They do not need fuel and do not produce harmful gases. __BLANK__, riding a bicycle is good for your health. It strengthens your heart and muscles. In some cities, the number of people who cycle to work has been increasing.\n\n__BLANK__, many cities have started to build more bicycle lanes. This makes cycling safer and more convenient. In places like Amsterdam and Copenhagen, __BLANK__ is a normal part of daily life. People use bicycles for shopping, going to work, and even taking children to school.',
  'Bicycles',
  E'Bicycles\n\nBicycles are used by millions of people around the world. They do not need fuel and do not produce harmful gases. __BLANK__, riding a bicycle is good for your health. It strengthens your heart and muscles. In some cities, the number of people who cycle to work has been increasing.\n\n__BLANK__, many cities have started to build more bicycle lanes. This makes cycling safer and more convenient. In places like Amsterdam and Copenhagen, __BLANK__ is a normal part of daily life. People use bicycles for shopping, going to work, and even taking children to school.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "In addition", "Nevertheless", "On the contrary"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Because of that", "At first", "In other words", "For example"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["driving", "cycling", "walking", "flying"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 15: The Great Wall of China ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'The Great Wall of China\n\nThe Great Wall of China is one of the most famous structures in the world. It was built over many centuries to protect China from invaders from the north. __BLANK__, it is not a single wall but many walls connected together. The total length is over 20,000 kilometers.\n\n__BLANK__, millions of tourists visit the Great Wall every year. Some parts have been repaired so that people can walk on them safely. __BLANK__ was one of the main reasons for building the wall. Rulers wanted to keep their land safe from enemy attacks. Today, the wall is seen as a symbol of Chinese history and culture.',
  'The Great Wall of China',
  E'The Great Wall of China\n\nThe Great Wall of China is one of the most famous structures in the world. It was built over many centuries to protect China from invaders from the north. __BLANK__, it is not a single wall but many walls connected together. The total length is over 20,000 kilometers.\n\n__BLANK__, millions of tourists visit the Great Wall every year. Some parts have been repaired so that people can walk on them safely. __BLANK__ was one of the main reasons for building the wall. Rulers wanted to keep their land safe from enemy attacks. Today, the wall is seen as a symbol of Chinese history and culture.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "In fact", "Therefore", "Besides"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Today", "At first", "Nevertheless", "In other words"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Tourism", "Defense", "Trade", "Religion"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 16: Recycling ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Recycling\n\nRecycling means turning used materials into new products. Paper, plastic, glass, and metal can often be recycled. __BLANK__, we can reduce the amount of waste that goes to landfills. It also helps save natural resources because we do not need to use as many new materials.\n\n__BLANK__, many towns and cities have set up recycling programs. People separate their trash into different bins. __BLANK__ is important for recycling to work well. When people put the wrong materials in the wrong bin, it can make the process more difficult and expensive.',
  'Recycling',
  E'Recycling\n\nRecycling means turning used materials into new products. Paper, plastic, glass, and metal can often be recycled. __BLANK__, we can reduce the amount of waste that goes to landfills. It also helps save natural resources because we do not need to use as many new materials.\n\n__BLANK__, many towns and cities have set up recycling programs. People separate their trash into different bins. __BLANK__ is important for recycling to work well. When people put the wrong materials in the wrong bin, it can make the process more difficult and expensive.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["By recycling", "Without recycling", "Besides", "However"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Therefore", "Nevertheless", "At first", "In other words"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Proper sorting", "Cheap products", "New technology", "Old habits"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 17: The Internet ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'The Internet\n\nThe Internet has changed how we communicate, work, and learn. We can send messages and share information with people around the world in seconds. __BLANK__, students can now take online courses from universities in other countries. This was almost impossible before the Internet.\n\n__BLANK__, we need to be careful about what we see and share online. Not all information on the Internet is true or safe. __BLANK__ is a growing problem, especially for young people. Parents and schools are trying to teach children how to use the Internet in a safe and responsible way.',
  'The Internet',
  E'The Internet\n\nThe Internet has changed how we communicate, work, and learn. We can send messages and share information with people around the world in seconds. __BLANK__, students can now take online courses from universities in other countries. This was almost impossible before the Internet.\n\n__BLANK__, we need to be careful about what we see and share online. Not all information on the Internet is true or safe. __BLANK__ is a growing problem, especially for young people. Parents and schools are trying to teach children how to use the Internet in a safe and responsible way.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For example", "Nevertheless", "Therefore", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "In addition", "That is", "Because of that"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Online safety", "Slow connection", "High cost", "Lack of devices"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 18: Penguins ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Penguins\n\nPenguins are birds that cannot fly. They live mostly in the Southern Hemisphere, especially in Antarctica. Their wings have become flippers, which help them __BLANK__ very well. Some penguins can stay underwater for more than 20 minutes.\n\nPenguins often live in large groups. __BLANK__, they can keep warm and protect themselves from the cold wind. They also work together to protect their eggs and chicks from predators. __BLANK__ is a serious threat to penguins. As the ice melts, they lose the places where they rest and raise their young. Scientists are studying how to help penguins adapt to these changes.',
  'Penguins',
  E'Penguins\n\nPenguins are birds that cannot fly. They live mostly in the Southern Hemisphere, especially in Antarctica. Their wings have become flippers, which help them __BLANK__ very well. Some penguins can stay underwater for more than 20 minutes.\n\nPenguins often live in large groups. __BLANK__, they can keep warm and protect themselves from the cold wind. They also work together to protect their eggs and chicks from predators. __BLANK__ is a serious threat to penguins. As the ice melts, they lose the places where they rest and raise their young. Scientists are studying how to help penguins adapt to these changes.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["fly", "run", "swim", "jump"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In this way", "Nevertheless", "Therefore", "On the other hand"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Climate change", "Lack of food", "Too many tourists", "Loud noise"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 19: Libraries ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Libraries\n\nLibraries have been important places for learning for a long time. People can borrow books, use computers, and study in a quiet space. __BLANK__, many libraries now offer e-books and online resources. You can borrow a digital book without going to the building.\n\n__BLANK__, libraries hold events such as story time for children and talks by writers. These activities help bring the community together. __BLANK__ is still at the heart of what libraries do. They give people free access to information and knowledge, which is important for a healthy society.',
  'Libraries',
  E'Libraries\n\nLibraries have been important places for learning for a long time. People can borrow books, use computers, and study in a quiet space. __BLANK__, many libraries now offer e-books and online resources. You can borrow a digital book without going to the building.\n\n__BLANK__, libraries hold events such as story time for children and talks by writers. These activities help bring the community together. __BLANK__ is still at the heart of what libraries do. They give people free access to information and knowledge, which is important for a healthy society.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "In addition", "Therefore", "Nevertheless"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Besides", "In other words", "At first", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Making money", "Sharing knowledge", "Selling books", "Building more buildings"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 20: Rainforests ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Rainforests\n\nRainforests are home to more than half of the world''s plant and animal species. They also produce a large amount of the oxygen we breathe. __BLANK__, rainforests are often called the "lungs of the earth." Yet every year, a huge area of rainforest is cut down for farming or building.\n\n__BLANK__, many species lose their homes and some may disappear forever. The loss of trees also affects the climate. __BLANK__ is one of the main causes of rainforest destruction. People clear the land to grow crops or to raise cattle. Some countries and organizations are now working to protect these important forests.',
  'Rainforests',
  E'Rainforests\n\nRainforests are home to more than half of the world''s plant and animal species. They also produce a large amount of the oxygen we breathe. __BLANK__, rainforests are often called the "lungs of the earth." Yet every year, a huge area of rainforest is cut down for farming or building.\n\n__BLANK__, many species lose their homes and some may disappear forever. The loss of trees also affects the climate. __BLANK__ is one of the main causes of rainforest destruction. People clear the land to grow crops or to raise cattle. Some countries and organizations are now working to protect these important forests.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For this reason", "However", "Besides", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["As a result", "In other words", "At first", "On the other hand"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Deforestation for agriculture", "Lack of rain", "Too many tourists", "Cold weather"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 21: The Moon ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'The Moon\n\nThe Moon is the Earth''s only natural satellite. It goes around the Earth about once every 27 days. __BLANK__, we see different shapes of the Moon from the Earth. These are called the phases of the Moon. The Moon does not produce its own light; it reflects light from the Sun.\n\nIn 1969, humans first landed on the Moon. __BLANK__, many countries have sent spacecraft to study it. Scientists want to learn more about how the Moon was formed. __BLANK__ is still a dream for many people. Some nations are planning to send astronauts to the Moon again in the coming years.',
  'The Moon',
  E'The Moon\n\nThe Moon is the Earth''s only natural satellite. It goes around the Earth about once every 27 days. __BLANK__, we see different shapes of the Moon from the Earth. These are called the phases of the Moon. The Moon does not produce its own light; it reflects light from the Sun.\n\nIn 1969, humans first landed on the Moon. __BLANK__, many countries have sent spacecraft to study it. Scientists want to learn more about how the Moon was formed. __BLANK__ is still a dream for many people. Some nations are planning to send astronauts to the Moon again in the coming years.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Because of its position", "In spite of that", "Besides", "However"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Since then", "At first", "Nevertheless", "In other words"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Living on the Moon", "Ignoring the Moon", "Destroying the Moon", "Selling the Moon"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 22: Street Food ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Street Food\n\nStreet food is food that is sold on the street or in markets. It is popular in many countries, especially in Asia. __BLANK__, you can find stalls selling noodles, rice dishes, and snacks. Street food is often cheap and quick, so it is popular with workers and students.\n\n__BLANK__, some cities have become famous for their street food. Bangkok and Tokyo are two examples. Tourists often include street food in their travel plans. __BLANK__ is important for street food to be safe. Vendors need to keep their food at the right temperature and use clean water. Many cities are now training street food sellers in food safety.',
  'Street Food',
  E'Street Food\n\nStreet food is food that is sold on the street or in markets. It is popular in many countries, especially in Asia. __BLANK__, you can find stalls selling noodles, rice dishes, and snacks. Street food is often cheap and quick, so it is popular with workers and students.\n\n__BLANK__, some cities have become famous for their street food. Bangkok and Tokyo are two examples. Tourists often include street food in their travel plans. __BLANK__ is important for street food to be safe. Vendors need to keep their food at the right temperature and use clean water. Many cities are now training street food sellers in food safety.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For example", "Therefore", "Nevertheless", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In addition", "In other words", "At first", "Because of that"]', 3
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["High price", "Food hygiene", "Beautiful packaging", "Loud music"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 23: Wind Power ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Wind Power\n\nWind power is a form of clean energy. Large turbines catch the wind and turn it into electricity. __BLANK__, wind does not run out and does not produce harmful gases. Many countries are building more wind farms, especially in coastal or open areas where the wind is strong.\n\n__BLANK__, some people worry that wind turbines can harm birds or spoil the view. Researchers are working on ways to make turbines safer for wildlife. __BLANK__ has made wind power more efficient. New turbines can produce more electricity than older ones. The cost of wind energy has also gone down in recent years.',
  'Wind Power',
  E'Wind Power\n\nWind power is a form of clean energy. Large turbines catch the wind and turn it into electricity. __BLANK__, wind does not run out and does not produce harmful gases. Many countries are building more wind farms, especially in coastal or open areas where the wind is strong.\n\n__BLANK__, some people worry that wind turbines can harm birds or spoil the view. Researchers are working on ways to make turbines safer for wildlife. __BLANK__ has made wind power more efficient. New turbines can produce more electricity than older ones. The cost of wind energy has also gone down in recent years.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "Therefore", "Besides", "Nevertheless"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In other words", "On the other hand", "Because of that"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Old technology", "Better design", "Lack of wind", "High cost"]', 1
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 24: The Olympic Games ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'The Olympic Games\n\nThe Olympic Games are a major international sports event. They are held every four years, with the Summer and Winter Games taking turns. __BLANK__, athletes from around the world compete in many different sports. The Games are meant to promote peace and friendship among nations.\n\n__BLANK__, the modern Olympic Games started in Athens in 1896. A Frenchman named Pierre de Coubertin had the idea to bring back the ancient Greek tradition. __BLANK__ is an important part of the Olympics. The flame is lit in Greece and carried to the host city, where it burns until the Games end.',
  'The Olympic Games',
  E'The Olympic Games\n\nThe Olympic Games are a major international sports event. They are held every four years, with the Summer and Winter Games taking turns. __BLANK__, athletes from around the world compete in many different sports. The Games are meant to promote peace and friendship among nations.\n\n__BLANK__, the modern Olympic Games started in Athens in 1896. A Frenchman named Pierre de Coubertin had the idea to bring back the ancient Greek tradition. __BLANK__ is an important part of the Olympics. The flame is lit in Greece and carried to the host city, where it burns until the Games end.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["At the Games", "Besides", "However", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In 1896", "Nevertheless", "In other words", "On the other hand"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The Olympic flame", "The medal design", "The host city", "The ticket price"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 25: Coral Reefs ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Coral Reefs\n\nCoral reefs are often called the "rainforests of the sea." They are home to thousands of kinds of fish and other sea life. __BLANK__, reefs protect coastlines from strong waves. They are also important for fishing and tourism in many countries.\n\n__BLANK__, coral reefs are in danger. Warmer ocean temperatures cause coral to turn white and die. This is called coral bleaching. __BLANK__ is one way to help. When we reduce the gases that warm the planet, we can slow down the damage to reefs. Many scientists and governments are working on this problem.',
  'Coral Reefs',
  E'Coral Reefs\n\nCoral reefs are often called the "rainforests of the sea." They are home to thousands of kinds of fish and other sea life. __BLANK__, reefs protect coastlines from strong waves. They are also important for fishing and tourism in many countries.\n\n__BLANK__, coral reefs are in danger. Warmer ocean temperatures cause coral to turn white and die. This is called coral bleaching. __BLANK__ is one way to help. When we reduce the gases that warm the planet, we can slow down the damage to reefs. Many scientists and governments are working on this problem.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In addition", "However", "Nevertheless", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Today", "Nevertheless", "In other words", "Because of that"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Fighting climate change", "Building more reefs", "Catching more fish", "Ignoring the problem"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 26: Museums ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Museums\n\nMuseums keep and display objects of art, history, and science. People visit them to learn and to enjoy. __BLANK__, many museums now use technology such as videos and touch screens. This helps visitors understand the exhibits better.\n\n__BLANK__, some museums offer free entry on certain days. They want everyone to have a chance to learn. __BLANK__ is what museums aim to do. They preserve important items from the past and from different cultures so that future generations can see and study them.',
  'Museums',
  E'Museums\n\nMuseums keep and display objects of art, history, and science. People visit them to learn and to enjoy. __BLANK__, many museums now use technology such as videos and touch screens. This helps visitors understand the exhibits better.\n\n__BLANK__, some museums offer free entry on certain days. They want everyone to have a chance to learn. __BLANK__ is what museums aim to do. They preserve important items from the past and from different cultures so that future generations can see and study them.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Today", "However", "Nevertheless", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In addition", "In other words", "On the contrary", "At first"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Preservation", "Destruction", "Sale", "Competition"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 27: Elephants ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Elephants\n\nElephants are the largest land animals. They live in Africa and Asia. Elephants have very good memories. __BLANK__, they can remember other elephants and places for many years. They also live in family groups led by older females.\n\n__BLANK__, elephants are in danger. Some people hunt them for their ivory tusks. Others destroy the forests where elephants live. __BLANK__ is one way to protect them. Laws against hunting and the sale of ivory have been passed in many countries. There are also reserves where elephants can live safely.',
  'Elephants',
  E'Elephants\n\nElephants are the largest land animals. They live in Africa and Asia. Elephants have very good memories. __BLANK__, they can remember other elephants and places for many years. They also live in family groups led by older females.\n\n__BLANK__, elephants are in danger. Some people hunt them for their ivory tusks. Others destroy the forests where elephants live. __BLANK__ is one way to protect them. Laws against hunting and the sale of ivory have been passed in many countries. There are also reserves where elephants can live safely.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["It is said that", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In other words", "Unfortunately", "Because of that"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Conservation", "Hunting", "Selling ivory", "Building cities"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 28: Sign Language ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Sign Language\n\nSign language is a way of communicating using hand movements, facial expressions, and body language. It is used by many people who are deaf or hard of hearing. __BLANK__, there is not just one sign language. Different countries have their own sign languages, such as American Sign Language and Japanese Sign Language.\n\n__BLANK__, sign language has its own grammar and vocabulary. It is not simply a word-for-word translation of spoken language. __BLANK__ is growing. More schools and workplaces are offering sign language classes. This helps everyone communicate better and makes society more inclusive.',
  'Sign Language',
  E'Sign Language\n\nSign language is a way of communicating using hand movements, facial expressions, and body language. It is used by many people who are deaf or hard of hearing. __BLANK__, there is not just one sign language. Different countries have their own sign languages, such as American Sign Language and Japanese Sign Language.\n\n__BLANK__, sign language has its own grammar and vocabulary. It is not simply a word-for-word translation of spoken language. __BLANK__ is growing. More schools and workplaces are offering sign language classes. This helps everyone communicate better and makes society more inclusive.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "Therefore", "In addition", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In fact", "Besides", "On the other hand", "Because of that"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Interest in sign language", "Lack of teachers", "High cost", "Old technology"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 29: Plastic Bags ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Plastic Bags\n\nPlastic bags are light and strong. For a long time, shops gave them to customers for free. __BLANK__, plastic bags can take hundreds of years to break down. They often end up in the ocean and harm sea animals.\n\n__BLANK__, many countries have started to charge for plastic bags or ban them. Shoppers are encouraged to bring their own bags. __BLANK__ is a good alternative. Reusable bags made of cloth or other materials can be used many times. This helps reduce waste and protect the environment.',
  'Plastic Bags',
  E'Plastic Bags\n\nPlastic bags are light and strong. For a long time, shops gave them to customers for free. __BLANK__, plastic bags can take hundreds of years to break down. They often end up in the ocean and harm sea animals.\n\n__BLANK__, many countries have started to charge for plastic bags or ban them. Shoppers are encouraged to bring their own bags. __BLANK__ is a good alternative. Reusable bags made of cloth or other materials can be used many times. This helps reduce waste and protect the environment.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "Therefore", "In addition", "Besides"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Because of that", "Nevertheless", "In other words", "At first"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Using reusable bags", "Making more plastic", "Throwing away more", "Ignoring the problem"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 30: The History of Writing ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'The History of Writing\n\nWriting is one of the most important inventions in human history. It allowed people to record information and pass it on to others. __BLANK__, the earliest writing was used for counting goods and keeping records. Later, people began to write stories and laws.\n\n__BLANK__, writing systems developed in different ways in different places. The Egyptians used hieroglyphics. In Mesopotamia, people pressed marks into clay. __BLANK__ has changed how we write. Today, we type on computers and phones more than we write by hand. Yet the need to record and share ideas remains the same.',
  'The History of Writing',
  E'The History of Writing\n\nWriting is one of the most important inventions in human history. It allowed people to record information and pass it on to others. __BLANK__, the earliest writing was used for counting goods and keeping records. Later, people began to write stories and laws.\n\n__BLANK__, writing systems developed in different ways in different places. The Egyptians used hieroglyphics. In Mesopotamia, people pressed marks into clay. __BLANK__ has changed how we write. Today, we type on computers and phones more than we write by hand. Yet the need to record and share ideas remains the same.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["At first", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Over time", "In other words", "Besides", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Technology", "Weather", "Food", "Sports"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 31: Camels ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Camels\n\nCamels are well known for their ability to live in deserts. They can go for a long time without water. __BLANK__, they store fat in their humps. When the fat is used, it produces water inside the body. Their broad feet help them walk on sand without sinking.\n\n__BLANK__, people in desert regions have used camels for thousands of years. They carry goods and people across long distances. __BLANK__ is still important in some countries. Camels are used in races and festivals. They are also raised for their milk and meat.',
  'Camels',
  E'Camels\n\nCamels are well known for their ability to live in deserts. They can go for a long time without water. __BLANK__, they store fat in their humps. When the fat is used, it produces water inside the body. Their broad feet help them walk on sand without sinking.\n\n__BLANK__, people in desert regions have used camels for thousands of years. They carry goods and people across long distances. __BLANK__ is still important in some countries. Camels are used in races and festivals. They are also raised for their milk and meat.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In addition", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["For a long time", "Nevertheless", "In other words", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Camel culture", "Ocean travel", "Snow sports", "Forest life"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 32: Tea ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Tea\n\nTea is one of the most popular drinks in the world. It is made from the leaves of the tea plant. __BLANK__, China and India are the largest producers. Tea was first drunk in China thousands of years ago. It later spread to Japan, Europe, and other parts of the world.\n\n__BLANK__, there are many kinds of tea. Green tea, black tea, and oolong tea come from the same plant but are processed differently. __BLANK__ is an important part of daily life in many countries. In Japan, the tea ceremony is a traditional art. In Britain, many people enjoy afternoon tea with sandwiches and cakes.',
  'Tea',
  E'Tea\n\nTea is one of the most popular drinks in the world. It is made from the leaves of the tea plant. __BLANK__, China and India are the largest producers. Tea was first drunk in China thousands of years ago. It later spread to Japan, Europe, and other parts of the world.\n\n__BLANK__, there are many kinds of tea. Green tea, black tea, and oolong tea come from the same plant but are processed differently. __BLANK__ is an important part of daily life in many countries. In Japan, the tea ceremony is a traditional art. In Britain, many people enjoy afternoon tea with sandwiches and cakes.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Today", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In addition", "In other words", "On the contrary", "At first"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Drinking tea", "Growing rice", "Making cars", "Building ships"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 33: The Arctic ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'The Arctic\n\nThe Arctic is the area around the North Pole. It is covered by ice and snow for most of the year. __BLANK__, polar bears, seals, and walruses live there. They depend on sea ice for hunting and resting.\n\n__BLANK__, the Arctic ice is melting faster than before. This is linked to rising temperatures. __BLANK__ is affecting the Arctic. When the ice shrinks, animals find it harder to find food. Some indigenous people who live in the Arctic also face challenges because their way of life is tied to the ice and the animals.',
  'The Arctic',
  E'The Arctic\n\nThe Arctic is the area around the North Pole. It is covered by ice and snow for most of the year. __BLANK__, polar bears, seals, and walruses live there. They depend on sea ice for hunting and resting.\n\n__BLANK__, the Arctic ice is melting faster than before. This is linked to rising temperatures. __BLANK__ is affecting the Arctic. When the ice shrinks, animals find it harder to find food. Some indigenous people who live in the Arctic also face challenges because their way of life is tied to the ice and the animals.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Many animals", "Few plants", "However", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Today", "Nevertheless", "In other words", "At first"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Climate change", "Lack of snow", "Too many tourists", "Old traditions"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 34: Newspapers ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Newspapers\n\nNewspapers have been a main source of news for a long time. People read them to learn about events in their town and the world. __BLANK__, many people now get their news online. They read articles on websites or on their phones.\n\n__BLANK__, some newspapers have closed or reduced their size. It is harder for them to make money from advertising. __BLANK__ is still valued. Good reporters work to check facts and present balanced stories. Whether on paper or online, reliable news is important for democracy.',
  'Newspapers',
  E'Newspapers\n\nNewspapers have been a main source of news for a long time. People read them to learn about events in their town and the world. __BLANK__, many people now get their news online. They read articles on websites or on their phones.\n\n__BLANK__, some newspapers have closed or reduced their size. It is harder for them to make money from advertising. __BLANK__ is still valued. Good reporters work to check facts and present balanced stories. Whether on paper or online, reliable news is important for democracy.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "Therefore", "In addition", "Besides"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Because of that", "Nevertheless", "In other words", "At first"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Quality journalism", "Cheap paper", "Loud headlines", "Few readers"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 35: Robots ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Robots\n\nRobots are machines that can do tasks automatically. They are used in factories to build cars and electronics. __BLANK__, they can work for long hours without getting tired. This can make production faster and sometimes cheaper.\n\n__BLANK__, robots are now used in other areas too. Some help in hospitals or clean offices. Others are used in space exploration. __BLANK__ is a question that many people ask. Will robots take over jobs from humans? Experts say that while some jobs may change, new jobs will also be created. Learning to work with robots may become an important skill.',
  'Robots',
  E'Robots\n\nRobots are machines that can do tasks automatically. They are used in factories to build cars and electronics. __BLANK__, they can work for long hours without getting tired. This can make production faster and sometimes cheaper.\n\n__BLANK__, robots are now used in other areas too. Some help in hospitals or clean offices. Others are used in space exploration. __BLANK__ is a question that many people ask. Will robots take over jobs from humans? Experts say that while some jobs may change, new jobs will also be created. Learning to work with robots may become an important skill.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In addition", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Today", "Nevertheless", "In other words", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The future of work", "The cost of robots", "The size of factories", "The speed of cars"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 36: Compost ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Compost\n\nCompost is decayed organic matter that is used to improve soil. Food scraps, leaves, and grass can be turned into compost. __BLANK__, compost adds nutrients to the soil. Plants grow better and we need less chemical fertilizer.\n\n__BLANK__, making compost at home reduces the amount of waste that goes to landfills. Many families keep a small bin for fruit and vegetable peels. __BLANK__ is a simple way to start. Put organic waste in a container, keep it moist, and over time it will turn into rich compost for your garden.',
  'Compost',
  E'Compost\n\nCompost is decayed organic matter that is used to improve soil. Food scraps, leaves, and grass can be turned into compost. __BLANK__, compost adds nutrients to the soil. Plants grow better and we need less chemical fertilizer.\n\n__BLANK__, making compost at home reduces the amount of waste that goes to landfills. Many families keep a small bin for fruit and vegetable peels. __BLANK__ is a simple way to start. Put organic waste in a container, keep it moist, and over time it will turn into rich compost for your garden.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["When added to soil", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In addition", "In other words", "On the contrary", "At first"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Home composting", "Buying fertilizer", "Throwing away waste", "Using more plastic"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 37: The Silk Road ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'The Silk Road\n\nThe Silk Road was an ancient network of trade routes. It connected China with the Middle East and Europe. __BLANK__, silk, spices, and other goods were carried along these routes. Ideas and cultures also spread through the same paths.\n\n__BLANK__, the Silk Road was not a single road. It was a series of routes that crossed deserts and mountains. __BLANK__ is a modern plan to build better roads and railways between Asia and Europe. It is named after the old Silk Road and aims to increase trade and cooperation between countries.',
  'The Silk Road',
  E'The Silk Road\n\nThe Silk Road was an ancient network of trade routes. It connected China with the Middle East and Europe. __BLANK__, silk, spices, and other goods were carried along these routes. Ideas and cultures also spread through the same paths.\n\n__BLANK__, the Silk Road was not a single road. It was a series of routes that crossed deserts and mountains. __BLANK__ is a modern plan to build better roads and railways between Asia and Europe. It is named after the old Silk Road and aims to increase trade and cooperation between countries.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Along these routes", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In fact", "Besides", "On the other hand", "Because of that"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["The Belt and Road Initiative", "The Olympic Games", "The Internet", "The United Nations"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 38: Migratory Birds ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Migratory Birds\n\nMany birds fly long distances every year. They move from one region to another with the seasons. __BLANK__, they can find more food and better weather. Some birds travel thousands of kilometers between their summer and winter homes.\n\n__BLANK__, these birds face many dangers. They may lose their resting places when wetlands are destroyed. Bright city lights can confuse them at night. __BLANK__ is important for their survival. Countries along their routes are working together to protect stopover sites and reduce threats.',
  'Migratory Birds',
  E'Migratory Birds\n\nMany birds fly long distances every year. They move from one region to another with the seasons. __BLANK__, they can find more food and better weather. Some birds travel thousands of kilometers between their summer and winter homes.\n\n__BLANK__, these birds face many dangers. They may lose their resting places when wetlands are destroyed. Bright city lights can confuse them at night. __BLANK__ is important for their survival. Countries along their routes are working together to protect stopover sites and reduce threats.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In this way", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Unfortunately", "In other words", "Besides", "Because of that"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["International cooperation", "Building more cities", "Cutting down trees", "Using more lights"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 39: Vaccines ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Vaccines\n\nVaccines help our bodies fight diseases. They train the immune system to recognize and attack harmful germs. __BLANK__, vaccines have saved millions of lives. Diseases like smallpox have been eliminated thanks to vaccination.\n\n__BLANK__, some people are still not vaccinated. In some areas, it is hard to get vaccines. In others, people may be afraid of side effects. __BLANK__ is important so that enough people are protected. When many people are vaccinated, the disease spreads less easily and even those who cannot be vaccinated are safer.',
  'Vaccines',
  E'Vaccines\n\nVaccines help our bodies fight diseases. They train the immune system to recognize and attack harmful germs. __BLANK__, vaccines have saved millions of lives. Diseases like smallpox have been eliminated thanks to vaccination.\n\n__BLANK__, some people are still not vaccinated. In some areas, it is hard to get vaccines. In others, people may be afraid of side effects. __BLANK__ is important so that enough people are protected. When many people are vaccinated, the disease spreads less easily and even those who cannot be vaccinated are safer.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Over the years", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In other words", "Unfortunately", "Because of that"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Herd immunity", "Lack of medicine", "Old diseases", "High cost"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 40: Traditional Festivals ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Traditional Festivals\n\nTraditional festivals are celebrated in many countries. They often have a long history and are linked to the seasons or to religion. __BLANK__, people wear special clothes, eat special food, and take part in ceremonies. Festivals help bring communities together.\n\n__BLANK__, some festivals have become popular with tourists. Visitors come from other countries to see the events. __BLANK__ is a concern in some places. Too many tourists can change the character of a festival. Still, many communities work to keep their traditions alive while welcoming visitors.',
  'Traditional Festivals',
  E'Traditional Festivals\n\nTraditional festivals are celebrated in many countries. They often have a long history and are linked to the seasons or to religion. __BLANK__, people wear special clothes, eat special food, and take part in ceremonies. Festivals help bring communities together.\n\n__BLANK__, some festivals have become popular with tourists. Visitors come from other countries to see the events. __BLANK__ is a concern in some places. Too many tourists can change the character of a festival. Still, many communities work to keep their traditions alive while welcoming visitors.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["At these events", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Today", "Nevertheless", "In other words", "At first"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Overtourism", "Lack of interest", "Bad weather", "High cost"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 41: Water Cycle ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'The Water Cycle\n\nWater on Earth moves in a continuous cycle. The sun heats water in the ocean and other bodies of water. __BLANK__, the water rises as vapor and forms clouds. When the clouds cool, the vapor turns back into drops of water and falls as rain or snow.\n\n__BLANK__, this cycle has been going on for billions of years. All living things depend on it. __BLANK__ can affect the water cycle. When we pollute rivers or use too much groundwater, we can harm the balance. Protecting clean water sources is important for everyone.',
  'The Water Cycle',
  E'The Water Cycle\n\nWater on Earth moves in a continuous cycle. The sun heats water in the ocean and other bodies of water. __BLANK__, the water rises as vapor and forms clouds. When the clouds cool, the vapor turns back into drops of water and falls as rain or snow.\n\n__BLANK__, this cycle has been going on for billions of years. All living things depend on it. __BLANK__ can affect the water cycle. When we pollute rivers or use too much groundwater, we can harm the balance. Protecting clean water sources is important for everyone.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["As a result", "However", "Nevertheless", "Besides"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In fact", "Therefore", "On the other hand", "Because of that"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Human activity", "The moon", "Cold weather", "High mountains"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 42: E-books ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'E-books\n\nE-books are books that you read on a screen. You can store hundreds of them on a single device. __BLANK__, you can carry a whole library in your pocket. E-books have become very popular, especially for people who travel or commute.\n\n__BLANK__, some readers still prefer paper books. They like the feel of turning pages. __BLANK__ is one advantage of e-books. You can change the size of the text and often look up words quickly. For students and researchers, this can make reading easier.',
  'E-books',
  E'E-books\n\nE-books are books that you read on a screen. You can store hundreds of them on a single device. __BLANK__, you can carry a whole library in your pocket. E-books have become very popular, especially for people who travel or commute.\n\n__BLANK__, some readers still prefer paper books. They like the feel of turning pages. __BLANK__ is one advantage of e-books. You can change the size of the text and often look up words quickly. For students and researchers, this can make reading easier.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In this way", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In other words", "Besides", "Because of that"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Adjustable text", "Heavy weight", "High price", "Lack of choice"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 43: The Sahara Desert ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'The Sahara Desert\n\nThe Sahara is the world''s largest hot desert. It stretches across much of North Africa. __BLANK__, the temperature can rise above 50 degrees Celsius during the day. At night, it can drop to near freezing. Few plants and animals can survive in such conditions.\n\n__BLANK__, people have lived in and around the Sahara for thousands of years. They have adapted to the harsh environment. __BLANK__ is a major challenge. There is very little rain, so finding and saving water is essential. Some communities use traditional methods to collect and store water.',
  'The Sahara Desert',
  E'The Sahara Desert\n\nThe Sahara is the world''s largest hot desert. It stretches across much of North Africa. __BLANK__, the temperature can rise above 50 degrees Celsius during the day. At night, it can drop to near freezing. Few plants and animals can survive in such conditions.\n\n__BLANK__, people have lived in and around the Sahara for thousands of years. They have adapted to the harsh environment. __BLANK__ is a major challenge. There is very little rain, so finding and saving water is essential. Some communities use traditional methods to collect and store water.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In the daytime", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In other words", "Yet", "Because of that"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Water scarcity", "Too much rain", "Cold weather", "Lack of sand"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 44: Street Art ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Street Art\n\nStreet art is art that is created in public places. It can be murals, graffiti, or sculptures. __BLANK__, street art can make a city more colorful and interesting. Some cities have become famous for their street art and attract many visitors.\n\n__BLANK__, there is debate about whether all street art is legal. In some places, artists need permission to paint on walls. __BLANK__ has grown in recent years. Cities like Berlin and Melbourne have areas where street art is encouraged. Artists from around the world come to leave their work there.',
  'Street Art',
  E'Street Art\n\nStreet art is art that is created in public places. It can be murals, graffiti, or sculptures. __BLANK__, street art can make a city more colorful and interesting. Some cities have become famous for their street art and attract many visitors.\n\n__BLANK__, there is debate about whether all street art is legal. In some places, artists need permission to paint on walls. __BLANK__ has grown in recent years. Cities like Berlin and Melbourne have areas where street art is encouraged. Artists from around the world come to leave their work there.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In this way", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In other words", "However", "Because of that"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Interest in street art", "Lack of space", "Strict laws", "Old buildings"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 45: Honey ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Honey\n\nHoney is made by honeybees from the nectar of flowers. It has been used as food and medicine for thousands of years. __BLANK__, honey does not spoil easily. Ancient pots of honey have been found that are still edible.\n\n__BLANK__, honey has a unique taste that depends on the flowers the bees visited. Lavender honey and clover honey taste different. __BLANK__ is important for bees and for us. Without enough flowers and safe places to live, bee populations can decline. Then less honey is produced and fewer crops are pollinated.',
  'Honey',
  E'Honey\n\nHoney is made by honeybees from the nectar of flowers. It has been used as food and medicine for thousands of years. __BLANK__, honey does not spoil easily. Ancient pots of honey have been found that are still edible.\n\n__BLANK__, honey has a unique taste that depends on the flowers the bees visited. Lavender honey and clover honey taste different. __BLANK__ is important for bees and for us. Without enough flowers and safe places to live, bee populations can decline. Then less honey is produced and fewer crops are pollinated.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Interestingly", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In addition", "In other words", "On the contrary", "At first"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Protecting bee habitat", "Eating more honey", "Building more hives", "Growing fewer flowers"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 46: Time Zones ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Time Zones\n\nThe Earth is divided into time zones. As the Earth rotates, different parts of the world have day or night at different times. __BLANK__, when it is noon in London, it is already evening in Tokyo. Travelers who cross many time zones often feel jet lag.\n\n__BLANK__, time zones were not always used. Before the 1800s, each town set its clock by the sun. __BLANK__ made time zones necessary. When trains began to run between cities, people needed a standard time so that schedules could be planned. Today, most countries use a system of time zones based on longitude.',
  'Time Zones',
  E'Time Zones\n\nThe Earth is divided into time zones. As the Earth rotates, different parts of the world have day or night at different times. __BLANK__, when it is noon in London, it is already evening in Tokyo. Travelers who cross many time zones often feel jet lag.\n\n__BLANK__, time zones were not always used. Before the 1800s, each town set its clock by the sun. __BLANK__ made time zones necessary. When trains began to run between cities, people needed a standard time so that schedules could be planned. Today, most countries use a system of time zones based on longitude.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["For example", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In the past", "Nevertheless", "In other words", "Because of that"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Railway travel", "Ship travel", "Walking", "Television"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 47: Coral Bleaching ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Coral Bleaching\n\nCoral reefs are made up of tiny animals that live together with algae. The algae give the coral its color and much of its food. __BLANK__, when the water gets too warm, the coral pushes out the algae. The coral then turns white. This is called coral bleaching.\n\n__BLANK__, bleached coral is not dead at first. If the water cools down in time, the algae can return. __BLANK__ is a major cause of bleaching. As the ocean warms, bleaching events happen more often. Scientists are trying to find ways to help coral survive in warmer waters.',
  'Coral Bleaching',
  E'Coral Bleaching\n\nCoral reefs are made up of tiny animals that live together with algae. The algae give the coral its color and much of its food. __BLANK__, when the water gets too warm, the coral pushes out the algae. The coral then turns white. This is called coral bleaching.\n\n__BLANK__, bleached coral is not dead at first. If the water cools down in time, the algae can return. __BLANK__ is a major cause of bleaching. As the ocean warms, bleaching events happen more often. Scientists are trying to find ways to help coral survive in warmer waters.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["However", "Therefore", "In addition", "Besides"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "In other words", "Therefore", "Because of that"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Rising ocean temperature", "Lack of fish", "Too many divers", "Cold weather"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 48: Public Transport ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Public Transport\n\nBuses, trains, and subways are forms of public transport. They carry many people at once. __BLANK__, they can reduce traffic and pollution compared with everyone driving alone. Many cities are encouraging people to use public transport more.\n\n__BLANK__, good public transport can be expensive to build and maintain. Governments need to invest in tracks, stations, and vehicles. __BLANK__ is one benefit for passengers. They can read, work, or rest during the journey instead of focusing on driving. In crowded cities, public transport is often the fastest way to get around.',
  'Public Transport',
  E'Public Transport\n\nBuses, trains, and subways are forms of public transport. They carry many people at once. __BLANK__, they can reduce traffic and pollution compared with everyone driving alone. Many cities are encouraging people to use public transport more.\n\n__BLANK__, good public transport can be expensive to build and maintain. Governments need to invest in tracks, stations, and vehicles. __BLANK__ is one benefit for passengers. They can read, work, or rest during the journey instead of focusing on driving. In crowded cities, public transport is often the fastest way to get around.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In this way", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In other words", "However", "Because of that"]', 2
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Free time during the trip", "High cost", "Lack of seats", "Slow speed"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 49: Spices ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Spices\n\nSpices are parts of plants used to add flavor to food. They have been traded for thousands of years. __BLANK__, spices were so valuable that they were sometimes used as money. In the past, finding a sea route to the spice-producing regions was a major goal for explorers.\n\n__BLANK__, spices were also used to preserve food before refrigeration existed. Salt, pepper, and other spices helped keep meat and fish from spoiling. __BLANK__ has made spices more available. Today we can buy spices from around the world in local stores. Cooking with different spices is a way to try flavors from many cultures.',
  'Spices',
  E'Spices\n\nSpices are parts of plants used to add flavor to food. They have been traded for thousands of years. __BLANK__, spices were so valuable that they were sometimes used as money. In the past, finding a sea route to the spice-producing regions was a major goal for explorers.\n\n__BLANK__, spices were also used to preserve food before refrigeration existed. Salt, pepper, and other spices helped keep meat and fish from spoiling. __BLANK__ has made spices more available. Today we can buy spices from around the world in local stores. Cooking with different spices is a way to try flavors from many cultures.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["At one time", "However", "Therefore", "Nevertheless"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["In addition", "In other words", "On the contrary", "At first"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Global trade", "Local farming", "Lack of ships", "Old recipes"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 50: Endangered Languages ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準2級プラス', 'explanation', 'long_fill',
  E'Endangered Languages\n\nThere are thousands of languages in the world. Yet many of them are in danger of disappearing. __BLANK__, when the last speakers of a language die, the language is lost forever. It is estimated that about half of the world''s languages could disappear by the end of this century.\n\n__BLANK__, languages are often lost when younger people switch to a more widely spoken language. They may do this for work or education. __BLANK__ is one way to help. Recording native speakers and teaching the language in schools can keep it alive. Some communities are now working to revive their traditional languages.',
  'Endangered Languages',
  E'Endangered Languages\n\nThere are thousands of languages in the world. Yet many of them are in danger of disappearing. __BLANK__, when the last speakers of a language die, the language is lost forever. It is estimated that about half of the world''s languages could disappear by the end of this century.\n\n__BLANK__, languages are often lost when younger people switch to a more widely spoken language. They may do this for work or education. __BLANK__ is one way to help. Recording native speakers and teaching the language in schools can keep it alive. Some communities are now working to revive their traditional languages.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Unfortunately", "Therefore", "In addition", "Besides"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Often", "Nevertheless", "In other words", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Language revitalization", "Learning English only", "Closing schools", "Ignoring tradition"]', 0
FROM public.reading_passages WHERE level = '準2級プラス' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
