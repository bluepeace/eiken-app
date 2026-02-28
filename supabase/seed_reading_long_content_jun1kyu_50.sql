-- seed_reading_long_content_jun1kyu_50.sql
-- 英検準1級 長文の内容一致選択 50問（10パッセージ×5問）
-- 本番形式：1題目 約400語・3問／2題目 約500語・4問。本シードは練習用に各パッセージ5問・約400〜500語。
-- 038 以降のマイグレーション実行後に実行

-- ========== Passage 1: The Franklin Expedition (history / mystery) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_content',
  'The Franklin Expedition

In 1845, two British naval ships, the Erebus and the Terror, set sail under the command of Sir John Franklin in search of the Northwest Passage, a sea route through the Arctic that would connect the Atlantic and Pacific Oceans. The expedition carried 129 men and was equipped with steam engines and several years'' worth of supplies. Despite these advantages, neither the ships nor any member of the crew was ever seen again by Europeans. The disappearance of the Franklin Expedition became one of the greatest mysteries in the history of exploration.

Search parties were sent out over the following decade, and evidence gradually came to light. In 1859, a note was discovered on King William Island. Dated April 1848, it stated that the ships had become trapped in ice and that Franklin had died in June 1847. The surviving crew had abandoned the vessels and set out on foot toward the mainland. The note also mentioned that the men had been suffering from illness and that there was no sign of rescue. Later investigations revealed that many of the crew had died from lead poisoning, likely caused by the solder used to seal the tins that held their food. Starvation and extreme cold would have worsened their condition.

Modern research has continued to add to our understanding. In 2014 and 2016, the wrecks of the Erebus and the Terror were finally located on the seabed. Scientists and historians have argued that the expedition''s failure was due to a combination of factors: inadequate knowledge of Arctic conditions, reliance on outdated maps, and the harsh reality that nineteenth-century technology was simply not equal to the challenge of the Northwest Passage. The Franklin Expedition remains a symbol of both human ambition and the limits of what was possible in an era before modern navigation and climate science.',
  'The Franklin Expedition',
  'The Franklin Expedition

In 1845, two British naval ships, the Erebus and the Terror, set sail under the command of Sir John Franklin in search of the Northwest Passage, a sea route through the Arctic that would connect the Atlantic and Pacific Oceans. The expedition carried 129 men and was equipped with steam engines and several years'' worth of supplies. Despite these advantages, neither the ships nor any member of the crew was ever seen again by Europeans. The disappearance of the Franklin Expedition became one of the greatest mysteries in the history of exploration.

Search parties were sent out over the following decade, and evidence gradually came to light. In 1859, a note was discovered on King William Island. Dated April 1848, it stated that the ships had become trapped in ice and that Franklin had died in June 1847. The surviving crew had abandoned the vessels and set out on foot toward the mainland. The note also mentioned that the men had been suffering from illness and that there was no sign of rescue. Later investigations revealed that many of the crew had died from lead poisoning, likely caused by the solder used to seal the tins that held their food. Starvation and extreme cold would have worsened their condition.

Modern research has continued to add to our understanding. In 2014 and 2016, the wrecks of the Erebus and the Terror were finally located on the seabed. Scientists and historians have argued that the expedition''s failure was due to a combination of factors: inadequate knowledge of Arctic conditions, reliance on outdated maps, and the harsh reality that nineteenth-century technology was simply not equal to the challenge of the Northwest Passage. The Franklin Expedition remains a symbol of both human ambition and the limits of what was possible in an era before modern navigation and climate science.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, what was the goal of the Franklin Expedition?',
  '["To discover a new route connecting the Atlantic and Pacific through the Arctic.", "To establish a British naval base in the Arctic.", "To rescue an earlier expedition that had gone missing.", "To test new steam engines in extreme cold."]', 0, 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did the note discovered in 1859 reveal?',
  '["Franklin had ordered the crew to sail back to Britain.", "The ships had become trapped in ice and Franklin had died; the crew had abandoned the vessels.", "The crew had found the Northwest Passage but could not return.", "Search parties had already reached the island before the note was written."]', 1, 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, what is one cause of the crew''s deaths that was identified by later investigations?',
  '["Lack of drinking water.", "Lead poisoning from the solder in food tins.", "Attacks by wildlife.", "Fighting among the crew."]', 1, 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the author of the passage say about the discovery of the shipwrecks?',
  '["They were found in the 1850s by the same search party that found the note.", "The Erebus and the Terror were located on the seabed in 2014 and 2016.", "The wrecks proved that the crew had reached the Pacific Ocean.", "Scientists concluded that the ships had been destroyed by fire."]', 1, 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the final paragraph, why do scientists and historians believe the expedition failed?',
  '["The crew refused to follow Franklin''s orders.", "A combination of inadequate Arctic knowledge, outdated maps, and technology that was not equal to the challenge.", "The British government had not provided enough funding.", "The Northwest Passage had already been claimed by another nation."]', 1, 4
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 2: Sleep and Memory (science / health) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_content',
  'Sleep and Memory

For decades, researchers have sought to understand the relationship between sleep and memory. It is now widely accepted that sleep plays a crucial role in consolidating what we learn during the day. When we sleep, the brain does not simply shut down; it actively processes and organizes information, transferring it from short-term to long-term storage. Studies have shown that people who sleep after learning new material retain it better than those who stay awake for the same period. This effect has been observed in a variety of tasks, from memorizing word lists to learning motor skills such as playing a musical instrument.

One of the key mechanisms thought to underlie this process is the replay of neural patterns during sleep. During certain stages of sleep, the brain appears to "replay" the same patterns of activity that occurred while the person was awake and learning. This replay is believed to strengthen the connections between neurons, making memories more stable and easier to recall later. Some researchers have suggested that dreams may be a by-product of this consolidation process, as the brain weaves together fragments of recent experiences with older memories.

The implications of this research extend beyond academic performance. Lack of sleep has been linked to poorer decision-making, increased risk of accidents, and a higher likelihood of developing certain health problems. In contrast, getting adequate sleep—typically seven to nine hours for adults—is associated with better emotional regulation and a stronger immune system. Despite this evidence, modern lifestyles often prioritize work and screen time over rest. Experts argue that recognizing sleep as a fundamental component of learning and health, rather than time that could be spent on other activities, could lead to significant improvements in both individual well-being and societal productivity.',
  'Sleep and Memory',
  'Sleep and Memory

For decades, researchers have sought to understand the relationship between sleep and memory. It is now widely accepted that sleep plays a crucial role in consolidating what we learn during the day. When we sleep, the brain does not simply shut down; it actively processes and organizes information, transferring it from short-term to long-term storage. Studies have shown that people who sleep after learning new material retain it better than those who stay awake for the same period. This effect has been observed in a variety of tasks, from memorizing word lists to learning motor skills such as playing a musical instrument.

One of the key mechanisms thought to underlie this process is the replay of neural patterns during sleep. During certain stages of sleep, the brain appears to "replay" the same patterns of activity that occurred while the person was awake and learning. This replay is believed to strengthen the connections between neurons, making memories more stable and easier to recall later. Some researchers have suggested that dreams may be a by-product of this consolidation process, as the brain weaves together fragments of recent experiences with older memories.

The implications of this research extend beyond academic performance. Lack of sleep has been linked to poorer decision-making, increased risk of accidents, and a higher likelihood of developing certain health problems. In contrast, getting adequate sleep—typically seven to nine hours for adults—is associated with better emotional regulation and a stronger immune system. Despite this evidence, modern lifestyles often prioritize work and screen time over rest. Experts argue that recognizing sleep as a fundamental component of learning and health, rather than time that could be spent on other activities, could lead to significant improvements in both individual well-being and societal productivity.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, what do studies show about sleep and learning?',
  '["People who stay awake after learning retain information better.", "People who sleep after learning new material retain it better than those who stay awake.", "Sleep has no effect on memory for motor skills.", "Only children benefit from sleep after learning."]', 1, 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one mechanism that is thought to help consolidate memory during sleep?',
  '["The brain stops processing information entirely.", "The replay of neural patterns that occurred during learning.", "The body produces more of a certain hormone only when awake.", "Dreams erase unimportant memories to make room for new ones."]', 1, 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What have some researchers suggested about dreams?',
  '["They are unrelated to memory.", "They may be a by-product of the brain''s consolidation process.", "They occur only when we have not learned anything new.", "They prevent the transfer of information to long-term storage."]', 1, 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, lack of sleep has been linked to',
  '["improved decision-making and a stronger immune system.", "poorer decision-making, increased risk of accidents, and a higher likelihood of certain health problems.", "better emotional regulation.", "longer retention of motor skills."]', 1, 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do experts argue in the final paragraph?',
  '["Sleep should be reduced to increase productivity.", "Recognizing sleep as a fundamental component of learning and health could lead to improvements in well-being and productivity.", "Screen time is more important than sleep for learning.", "Adults need less than seven hours of sleep."]', 1, 4
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 3: Women in Computing (history / society) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_content',
  'Women in Computing

The role of women in the early development of computing is often overlooked, yet from the mid-nineteenth century onward, women were central to the growth of mathematical and computational work. When the United States government conducted its census in the late 1800s, it employed hundreds of women as "computers" to perform the tedious calculations required to process data. These jobs were seen as suitable for women in part because they were repetitive and paid less than positions held by men, despite demanding accuracy and concentration. By the time of the Second World War, the need for large-scale calculation had increased dramatically. Women were recruited to compute ballistic tables, crack codes, and support the development of early electronic machines.

At organizations such as the National Advisory Committee for Aeronautics, or NACA—the predecessor to NASA—women were hired as human computers well into the twentieth century. They carried out the complex calculations needed for aircraft design and, later, for space missions. Historian Mar Hicks has argued that the work was often classified as low-skill "women''s work" even though it required advanced mathematical training. When electronic computers began to replace human computers, many of the women who had done this work were not promoted into the new roles of programmer or engineer; instead, the field became increasingly dominated by men. The transition to machine computation was thus not only technological but also deeply gendered.

Today, efforts are being made to acknowledge the contributions of women such as Katherine Johnson, whose calculations were essential to the first manned space flights. Nevertheless, the technology industry continues to struggle with diversity. Understanding the history of how women were pushed to the margins as computing became more prestigious and better paid is essential for addressing the inequalities that persist in the present.',
  'Women in Computing',
  'Women in Computing

The role of women in the early development of computing is often overlooked, yet from the mid-nineteenth century onward, women were central to the growth of mathematical and computational work. When the United States government conducted its census in the late 1800s, it employed hundreds of women as "computers" to perform the tedious calculations required to process data. These jobs were seen as suitable for women in part because they were repetitive and paid less than positions held by men, despite demanding accuracy and concentration. By the time of the Second World War, the need for large-scale calculation had increased dramatically. Women were recruited to compute ballistic tables, crack codes, and support the development of early electronic machines.

At organizations such as the National Advisory Committee for Aeronautics, or NACA—the predecessor to NASA—women were hired as human computers well into the twentieth century. They carried out the complex calculations needed for aircraft design and, later, for space missions. Historian Mar Hicks has argued that the work was often classified as low-skill "women''s work" even though it required advanced mathematical training. When electronic computers began to replace human computers, many of the women who had done this work were not promoted into the new roles of programmer or engineer; instead, the field became increasingly dominated by men. The transition to machine computation was thus not only technological but also deeply gendered.

Today, efforts are being made to acknowledge the contributions of women such as Katherine Johnson, whose calculations were essential to the first manned space flights. Nevertheless, the technology industry continues to struggle with diversity. Understanding the history of how women were pushed to the margins as computing became more prestigious and better paid is essential for addressing the inequalities that persist in the present.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, why were computing jobs in the late 1800s seen as suitable for women?',
  '["They required little accuracy.", "They were repetitive and paid less than men''s positions, despite demanding accuracy and concentration.", "Women had better mathematical training than men at the time.", "The government preferred to hire only women for census work."]', 1, 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the passage say about the work of women at NACA?',
  '["They were only employed after NASA was established.", "They carried out complex calculations for aircraft design and space missions.", "They were promoted to programmers when electronic computers were introduced.", "They refused to work on ballistic tables."]', 1, 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to Mar Hicks, how was the work of human computers often classified?',
  '["As high-skill work that deserved high pay.", "As low-skill ''women''s work'' even though it required advanced mathematical training.", "As work that only men could perform.", "As work that was not essential to space missions."]', 1, 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What happened when electronic computers began to replace human computers?',
  '["Women were promoted into the new roles of programmer or engineer.", "The field became increasingly dominated by men.", "NACA stopped hiring women entirely.", "Katherine Johnson was put in charge of all calculations."]', 1, 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The author of the passage suggests that',
  '["the technology industry has achieved full diversity.", "understanding how women were pushed to the margins as computing became more prestigious is essential for addressing present inequalities.", "electronic computers were developed mainly by women.", "NACA paid women more than men for the same work."]', 1, 4
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 4: Animal Migration (nature / science) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_content',
  'Animal Migration

Every year, billions of animals travel long distances in search of food, breeding grounds, or more favorable climates. This phenomenon, known as migration, is one of the most remarkable behaviors in the natural world. Birds, mammals, fish, and even insects undertake journeys that can span thousands of kilometres. Scientists have long sought to understand how these animals navigate with such precision. Research has revealed that different species rely on a variety of cues, including the position of the sun and stars, the Earth''s magnetic field, landmarks, and even smells carried by the wind.

The monarch butterfly provides a striking example. Each autumn, millions of monarchs in North America fly south to spend the winter in Mexico. No single butterfly completes the round trip; instead, the migration is achieved over several generations. The butterflies that arrive in Mexico have never been there before, yet they find the same forests that their ancestors used. How they do this remains partly a mystery, though it is believed that a combination of genetic programming and environmental signals, such as day length and temperature, plays a role. In recent years, the monarch population has declined sharply, partly due to the loss of milkweed—the only plant on which monarch caterpillars feed—and the use of pesticides in agricultural areas.

Marine animals also migrate on a grand scale. Humpback whales travel from polar feeding grounds to warmer waters to breed and give birth. Sea turtles return to the very beaches where they were born to lay their eggs. Scientists have suggested that these animals may use the Earth''s magnetic field to orient themselves, as the field varies in predictable ways across the globe. Understanding migration is not only a scientific challenge but also a conservation priority. Many migratory species are threatened by habitat loss, climate change, and human-made obstacles such as dams and roads. Protecting the routes and stopover sites that these animals depend on is essential if we are to preserve one of nature''s most extraordinary phenomena.',
  'Animal Migration',
  'Animal Migration

Every year, billions of animals travel long distances in search of food, breeding grounds, or more favorable climates. This phenomenon, known as migration, is one of the most remarkable behaviors in the natural world. Birds, mammals, fish, and even insects undertake journeys that can span thousands of kilometres. Scientists have long sought to understand how these animals navigate with such precision. Research has revealed that different species rely on a variety of cues, including the position of the sun and stars, the Earth''s magnetic field, landmarks, and even smells carried by the wind.

The monarch butterfly provides a striking example. Each autumn, millions of monarchs in North America fly south to spend the winter in Mexico. No single butterfly completes the round trip; instead, the migration is achieved over several generations. The butterflies that arrive in Mexico have never been there before, yet they find the same forests that their ancestors used. How they do this remains partly a mystery, though it is believed that a combination of genetic programming and environmental signals, such as day length and temperature, plays a role. In recent years, the monarch population has declined sharply, partly due to the loss of milkweed—the only plant on which monarch caterpillars feed—and the use of pesticides in agricultural areas.

Marine animals also migrate on a grand scale. Humpback whales travel from polar feeding grounds to warmer waters to breed and give birth. Sea turtles return to the very beaches where they were born to lay their eggs. Scientists have suggested that these animals may use the Earth''s magnetic field to orient themselves, as the field varies in predictable ways across the globe. Understanding migration is not only a scientific challenge but also a conservation priority. Many migratory species are threatened by habitat loss, climate change, and human-made obstacles such as dams and roads. Protecting the routes and stopover sites that these animals depend on is essential if we are to preserve one of nature''s most extraordinary phenomena.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, how do migrating animals navigate?',
  '["They rely only on landmarks.", "Different species use a variety of cues, including the sun, stars, the Earth''s magnetic field, landmarks, and smells.", "They follow other animals that have made the journey before.", "Scientists have found that they use only the magnetic field."]', 1, 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is true about the monarch butterfly migration?',
  '["A single butterfly completes the round trip each year.", "The migration is achieved over several generations; butterflies that arrive in Mexico have never been there before.", "Monarchs migrate only in spring.", "Monarchs feed on a wide variety of plants during migration."]', 1, 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, why has the monarch population declined in recent years?',
  '["Because they have lost the ability to navigate.", "Partly due to the loss of milkweed and the use of pesticides.", "Because they no longer migrate to Mexico.", "Because of colder winters in North America."]', 1, 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What have scientists suggested about marine animals such as sea turtles?',
  '["They do not migrate.", "They may use the Earth''s magnetic field to orient themselves.", "They never return to the same beach twice.", "They migrate only in the Pacific Ocean."]', 1, 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The author of the passage argues that',
  '["migration is no longer affected by human activity.", "protecting the routes and stopover sites that migratory animals depend on is essential for preserving the phenomenon.", "marine animals do not need conservation.", "monarch butterflies will soon become extinct."]', 1, 4
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 5: Urban Green Spaces (environment / society) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_content',
  'Urban Green Spaces

As cities have grown denser and more built-up, the value of green spaces—parks, gardens, tree-lined streets, and natural reserves within urban areas—has become increasingly clear. Research has shown that access to nature in cities is associated with better physical and mental health. People who live near parks tend to exercise more, report lower levels of stress, and may even live longer. Children who grow up with access to green space have been found to have a lower risk of developing certain mental health conditions. Beyond individual well-being, green spaces can reduce the "urban heat island" effect, in which cities become significantly warmer than the surrounding countryside because of the concentration of concrete and asphalt. Trees and vegetation provide shade and release moisture into the air, cooling their surroundings.

Despite these benefits, the distribution of green space in cities is often unequal. Wealthier neighborhoods frequently have more and better-maintained parks than poorer ones. This inequality has led to calls for "green justice"—the idea that all urban residents, regardless of income or background, should have fair access to nature. Some cities have responded by planting trees in underserved areas, converting vacant lots into community gardens, and designing new developments to include mandatory green space. In addition, there is growing interest in "green infrastructure," such as green roofs and rain gardens, which can absorb stormwater, reduce flooding, and provide habitat for wildlife while also making the urban environment more pleasant for people.

Critics sometimes argue that maintaining green space is expensive or that land in cities could be used more profitably for housing or commerce. However, studies have suggested that property values tend to rise near well-kept parks and that the health and productivity benefits of green space can translate into economic gains for the city as a whole. As the world becomes more urbanized, the question of how to integrate nature into cities is likely to remain a central challenge for planners and policymakers.',
  'Urban Green Spaces',
  'Urban Green Spaces

As cities have grown denser and more built-up, the value of green spaces—parks, gardens, tree-lined streets, and natural reserves within urban areas—has become increasingly clear. Research has shown that access to nature in cities is associated with better physical and mental health. People who live near parks tend to exercise more, report lower levels of stress, and may even live longer. Children who grow up with access to green space have been found to have a lower risk of developing certain mental health conditions. Beyond individual well-being, green spaces can reduce the "urban heat island" effect, in which cities become significantly warmer than the surrounding countryside because of the concentration of concrete and asphalt. Trees and vegetation provide shade and release moisture into the air, cooling their surroundings.

Despite these benefits, the distribution of green space in cities is often unequal. Wealthier neighborhoods frequently have more and better-maintained parks than poorer ones. This inequality has led to calls for "green justice"—the idea that all urban residents, regardless of income or background, should have fair access to nature. Some cities have responded by planting trees in underserved areas, converting vacant lots into community gardens, and designing new developments to include mandatory green space. In addition, there is growing interest in "green infrastructure," such as green roofs and rain gardens, which can absorb stormwater, reduce flooding, and provide habitat for wildlife while also making the urban environment more pleasant for people.

Critics sometimes argue that maintaining green space is expensive or that land in cities could be used more profitably for housing or commerce. However, studies have suggested that property values tend to rise near well-kept parks and that the health and productivity benefits of green space can translate into economic gains for the city as a whole. As the world becomes more urbanized, the question of how to integrate nature into cities is likely to remain a central challenge for planners and policymakers.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, what is one benefit of urban green spaces?',
  '["They make cities warmer.", "Access to nature in cities is associated with better physical and mental health.", "They reduce the amount of rainfall.", "They are only beneficial for children."]', 1, 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is the "urban heat island" effect?',
  '["Cities become cooler than the countryside.", "Cities become significantly warmer than the surrounding countryside because of concrete and asphalt.", "Parks make cities too cold in winter.", "Green spaces absorb too much heat."]', 1, 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the passage say about the distribution of green space?',
  '["It is equal in all neighborhoods.", "Wealthier neighborhoods frequently have more and better-maintained parks than poorer ones.", "Poorer neighborhoods have more parks.", "Green space is only found in the suburbs."]', 1, 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, what is "green justice"?',
  '["The idea that parks should be closed to the public.", "The idea that all urban residents should have fair access to nature.", "A policy that bans cars from parks.", "A type of court that handles environmental crimes."]', 1, 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do studies suggest about property values and green space?',
  '["Property values fall near parks.", "Property values tend to rise near well-kept parks.", "Green space has no effect on property values.", "Only commercial property benefits from green space."]', 1, 4
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 6: The Invention of the Telephone (history / technology) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_content',
  'The Invention of the Telephone

The invention of the telephone is often credited to Alexander Graham Bell, who was granted a US patent for the device in 1876. Bell was not, however, the only person working on the idea of transmitting speech electrically. Elisha Gray, an American inventor, had developed a similar device and applied for a patent on the same day as Bell. The question of who arrived first—and whether Bell had access to Gray''s ideas—has been debated by historians. What is certain is that Bell''s demonstration of the telephone, in which he famously spoke the words "Mr. Watson, come here—I want to see you" to his assistant in another room, captured the public imagination and secured his place in history.

The early telephone was a simple device. Sound waves caused a diaphragm to vibrate, and these vibrations were converted into an electrical signal that could be sent along a wire. At the other end, the process was reversed: the electrical signal was converted back into sound. The quality was poor and the range was limited, but the potential was clear. Within a few years, Bell had co-founded the Bell Telephone Company, and telephone networks began to spread across the United States and later to other countries. The telegraph had already allowed rapid communication over long distances using Morse code; the telephone made it possible for people to hear each other''s voices in real time, which was a profound social and economic change.

The development of the telephone did not end with Bell. Thomas Edison and others improved the transmitter and receiver, and the invention of the switchboard made it possible to connect many users to a single network. Over the following century, the telephone evolved from a luxury for the few to a necessity for millions. Today, the principles of converting sound into electrical signals and back again underlie not only traditional telephony but also the internet, radio, and countless other technologies. The story of the telephone is thus not only one of a single inventor but of a series of innovations that together transformed how humans communicate.',
  'The Invention of the Telephone',
  'The Invention of the Telephone

The invention of the telephone is often credited to Alexander Graham Bell, who was granted a US patent for the device in 1876. Bell was not, however, the only person working on the idea of transmitting speech electrically. Elisha Gray, an American inventor, had developed a similar device and applied for a patent on the same day as Bell. The question of who arrived first—and whether Bell had access to Gray''s ideas—has been debated by historians. What is certain is that Bell''s demonstration of the telephone, in which he famously spoke the words "Mr. Watson, come here—I want to see you" to his assistant in another room, captured the public imagination and secured his place in history.

The early telephone was a simple device. Sound waves caused a diaphragm to vibrate, and these vibrations were converted into an electrical signal that could be sent along a wire. At the other end, the process was reversed: the electrical signal was converted back into sound. The quality was poor and the range was limited, but the potential was clear. Within a few years, Bell had co-founded the Bell Telephone Company, and telephone networks began to spread across the United States and later to other countries. The telegraph had already allowed rapid communication over long distances using Morse code; the telephone made it possible for people to hear each other''s voices in real time, which was a profound social and economic change.

The development of the telephone did not end with Bell. Thomas Edison and others improved the transmitter and receiver, and the invention of the switchboard made it possible to connect many users to a single network. Over the following century, the telephone evolved from a luxury for the few to a necessity for millions. Today, the principles of converting sound into electrical signals and back again underlie not only traditional telephony but also the internet, radio, and countless other technologies. The story of the telephone is thus not only one of a single inventor but of a series of innovations that together transformed how humans communicate.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, what is true about Bell and Gray?',
  '["Gray was granted the patent before Bell.", "Both applied for a patent on the same day; who arrived first has been debated.", "Bell admitted that he had used Gray''s ideas.", "Gray never built a working telephone."]', 1, 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How did the early telephone work?',
  '["Sound waves caused a diaphragm to vibrate; vibrations were converted into an electrical signal and sent along a wire.", "It used Morse code to send messages.", "It could only transmit written messages.", "It did not use wires."]', 0, 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, what was the main difference between the telegraph and the telephone?',
  '["The telegraph was faster.", "The telephone made it possible for people to hear each other''s voices in real time.", "The telegraph was cheaper.", "The telephone could not be used over long distances."]', 1, 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the passage say about the invention of the switchboard?',
  '["It was invented by Bell.", "It made it possible to connect many users to a single network.", "It replaced the telephone.", "It was only used in Europe."]', 1, 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The author of the passage concludes that',
  '["Bell was the only person who contributed to the telephone.", "the story of the telephone is one of a series of innovations that together transformed how humans communicate.", "the telephone was never as important as the telegraph.", "Edison invented the telephone."]', 1, 4
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 7: Emotions and Decision-Making (psychology) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_content',
  'Emotions and Decision-Making

For much of the twentieth century, economists and psychologists tended to assume that human beings make decisions in a rational way, weighing the costs and benefits of each option before choosing the one that maximizes their gain. In recent decades, however, research has increasingly shown that emotions play a central role in decision-making. Fear, anger, hope, and even subtle moods can sway the choices people make, often without their being aware of it. Studies have found that people who are in a positive mood may take more risks, while those who are anxious may avoid risks even when the rational choice would be to take them. Emotions can also affect how we perceive and remember information: we are more likely to remember events that aroused strong feelings and to give greater weight to recent or vivid experiences than to cold statistics.

One area where this has important implications is the justice system. Anger and a desire for revenge can influence both the public''s demand for harsh punishment and the decisions of judges and juries. At the same time, empathy for a defendant or a victim can pull in the opposite direction. Some legal scholars have argued that the law should take account of these emotional influences by, for example, allowing "cooling-off" periods before certain decisions are made or by structuring trials in ways that reduce the impact of emotionally charged testimony. The goal is not to eliminate emotion from the process but to ensure that decisions are as fair and consistent as possible.

In the world of business and finance, the influence of emotion is equally significant. Investors may hold on to losing stocks because they cannot bear to "realize" a loss, or they may rush to buy when everyone else is buying, driven by fear of missing out. Understanding these tendencies has given rise to the field of behavioral economics, which seeks to design policies and products that account for how people actually behave—often irrationally—rather than how they would behave if they were perfectly rational. Recognizing the role of emotion in decision-making does not mean that we are helpless against it; it can help us design better institutions and make more informed choices ourselves.',
  'Emotions and Decision-Making',
  'Emotions and Decision-Making

For much of the twentieth century, economists and psychologists tended to assume that human beings make decisions in a rational way, weighing the costs and benefits of each option before choosing the one that maximizes their gain. In recent decades, however, research has increasingly shown that emotions play a central role in decision-making. Fear, anger, hope, and even subtle moods can sway the choices people make, often without their being aware of it. Studies have found that people who are in a positive mood may take more risks, while those who are anxious may avoid risks even when the rational choice would be to take them. Emotions can also affect how we perceive and remember information: we are more likely to remember events that aroused strong feelings and to give greater weight to recent or vivid experiences than to cold statistics.

One area where this has important implications is the justice system. Anger and a desire for revenge can influence both the public''s demand for harsh punishment and the decisions of judges and juries. At the same time, empathy for a defendant or a victim can pull in the opposite direction. Some legal scholars have argued that the law should take account of these emotional influences by, for example, allowing "cooling-off" periods before certain decisions are made or by structuring trials in ways that reduce the impact of emotionally charged testimony. The goal is not to eliminate emotion from the process but to ensure that decisions are as fair and consistent as possible.

In the world of business and finance, the influence of emotion is equally significant. Investors may hold on to losing stocks because they cannot bear to "realize" a loss, or they may rush to buy when everyone else is buying, driven by fear of missing out. Understanding these tendencies has given rise to the field of behavioral economics, which seeks to design policies and products that account for how people actually behave—often irrationally—rather than how they would behave if they were perfectly rational. Recognizing the role of emotion in decision-making does not mean that we are helpless against it; it can help us design better institutions and make more informed choices ourselves.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, what was the traditional assumption about how people make decisions?',
  '["Emotions always determine choices.", "People make decisions in a rational way, weighing costs and benefits.", "People never consider costs and benefits.", "Mood has no effect on risk-taking."]', 1, 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What have studies found about people in a positive mood?',
  '["They avoid all risks.", "They may take more risks.", "They make more rational decisions than others.", "They remember only statistics."]', 1, 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, how can emotions affect the justice system?',
  '["They have no effect.", "Anger and a desire for revenge can influence the demand for harsh punishment and the decisions of judges and juries.", "Judges are not affected by emotion.", "Only defendants experience emotion."]', 1, 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What have some legal scholars argued?',
  '["Emotion should be completely eliminated from trials.", "The law should take account of emotional influences, for example by allowing cooling-off periods.", "Juries should never hear emotionally charged testimony.", "Judges should never show empathy."]', 1, 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the final paragraph, what is behavioral economics?',
  '["A field that assumes people are perfectly rational.", "A field that seeks to design policies and products that account for how people actually behave.", "A field that studies only stock markets.", "A field that ignores emotion entirely."]', 1, 4
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 8: Antibiotic Resistance (medicine / science) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_content',
  'Antibiotic Resistance

The discovery of antibiotics in the twentieth century transformed medicine. Infections that had once been fatal could suddenly be treated with a simple course of drugs. Surgeons could perform operations that would previously have been too risky because of the threat of infection. Yet the very success of antibiotics has led to a new and growing problem: antibiotic resistance. When bacteria are exposed to an antibiotic, most of them may die, but a few may survive because they happen to carry a genetic mutation that allows them to resist the drug. If these survivors multiply, the next generation of bacteria will be more resistant. Over time, overuse and misuse of antibiotics—such as taking them for viral infections, against which they are useless, or failing to complete a full course of treatment—have accelerated this process. Today, many bacteria that were once easily controlled have become resistant to one or more antibiotics, and some infections are again difficult or impossible to treat.

The World Health Organization has described antibiotic resistance as one of the greatest threats to global health. In some countries, common infections such as pneumonia or urinary tract infections are increasingly caused by resistant bacteria, leading to longer illnesses, more hospital stays, and higher death rates. The problem is not limited to human medicine. Antibiotics are widely used in agriculture to promote growth and prevent disease in livestock. This use can also encourage the development of resistant bacteria, which may then be transmitted to humans through food or the environment. Efforts to reduce unnecessary use of antibiotics in both human and animal health are therefore seen as essential.

Researchers are working on new antibiotics and alternative treatments, but development is slow and expensive. In the meantime, doctors are urged to prescribe antibiotics only when necessary, and patients are advised to use them exactly as directed. Public health campaigns have also emphasized the importance of basic hygiene, such as handwashing, and vaccination, which can prevent some infections from occurring in the first place. Addressing antibiotic resistance will require cooperation among governments, health care providers, the pharmaceutical industry, and the public. Without such efforts, the world may face a future in which many of the medical advances of the past century are gradually undone.',
  'Antibiotic Resistance',
  'Antibiotic Resistance

The discovery of antibiotics in the twentieth century transformed medicine. Infections that had once been fatal could suddenly be treated with a simple course of drugs. Surgeons could perform operations that would previously have been too risky because of the threat of infection. Yet the very success of antibiotics has led to a new and growing problem: antibiotic resistance. When bacteria are exposed to an antibiotic, most of them may die, but a few may survive because they happen to carry a genetic mutation that allows them to resist the drug. If these survivors multiply, the next generation of bacteria will be more resistant. Over time, overuse and misuse of antibiotics—such as taking them for viral infections, against which they are useless, or failing to complete a full course of treatment—have accelerated this process. Today, many bacteria that were once easily controlled have become resistant to one or more antibiotics, and some infections are again difficult or impossible to treat.

The World Health Organization has described antibiotic resistance as one of the greatest threats to global health. In some countries, common infections such as pneumonia or urinary tract infections are increasingly caused by resistant bacteria, leading to longer illnesses, more hospital stays, and higher death rates. The problem is not limited to human medicine. Antibiotics are widely used in agriculture to promote growth and prevent disease in livestock. This use can also encourage the development of resistant bacteria, which may then be transmitted to humans through food or the environment. Efforts to reduce unnecessary use of antibiotics in both human and animal health are therefore seen as essential.

Researchers are working on new antibiotics and alternative treatments, but development is slow and expensive. In the meantime, doctors are urged to prescribe antibiotics only when necessary, and patients are advised to use them exactly as directed. Public health campaigns have also emphasized the importance of basic hygiene, such as handwashing, and vaccination, which can prevent some infections from occurring in the first place. Addressing antibiotic resistance will require cooperation among governments, health care providers, the pharmaceutical industry, and the public. Without such efforts, the world may face a future in which many of the medical advances of the past century are gradually undone.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, how does antibiotic resistance develop?',
  '["All bacteria die when exposed to antibiotics.", "A few bacteria may survive due to a genetic mutation; if they multiply, the next generation is more resistant.", "Antibiotics become stronger over time.", "Only viral infections cause resistance."]', 1, 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the passage say about the overuse of antibiotics?',
  '["It has no effect on resistance.", "Overuse and misuse, such as taking them for viral infections or failing to complete treatment, have accelerated resistance.", "It only affects animals.", "It has been eliminated by the WHO."]', 1, 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, why is antibiotic use in agriculture a concern?',
  '["It has no effect on human health.", "It can encourage resistant bacteria that may be transmitted to humans through food or the environment.", "Farm animals do not get infections.", "Antibiotics are not used in agriculture."]', 1, 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the passage say about the development of new antibiotics?',
  '["It is quick and cheap.", "Development is slow and expensive.", "No new antibiotics are needed.", "Only the pharmaceutical industry is involved."]', 1, 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The author of the passage suggests that addressing antibiotic resistance will require',
  '["only government action.", "cooperation among governments, health care providers, the pharmaceutical industry, and the public.", "stopping all use of antibiotics.", "focusing only on human medicine."]', 1, 4
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 9: The Dust Bowl (US history / environment) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_content',
  'The Dust Bowl

During the 1930s, a severe environmental and economic disaster struck the Great Plains of the United States. A combination of drought, poor farming practices, and strong winds led to massive dust storms that stripped the soil from millions of acres of land. The region affected—including parts of Kansas, Oklahoma, Texas, Colorado, and New Mexico—became known as the Dust Bowl. Crops failed, livestock died, and thousands of families were forced to leave their homes in search of work and a better life. Many migrated to California, where they hoped to find jobs in agriculture, but they often faced poverty, discrimination, and difficult living conditions. The novelist John Steinbeck later depicted their plight in The Grapes of Wrath, which brought the suffering of "Okies" and other migrants to national attention.

The causes of the Dust Bowl were both natural and human-made. The Plains had experienced periods of drought before, but in the early twentieth century, farmers had plowed up vast areas of native grassland to grow wheat. When rainfall was adequate, the soil produced abundant harvests. When the drought came, however, the exposed soil had nothing to hold it in place. The wind did the rest. Huge clouds of dust blackened the sky, buried fences and machinery, and caused respiratory illnesses among people and animals. The federal government eventually responded with programs to promote soil conservation, including planting trees as windbreaks and teaching farmers methods to prevent erosion. These efforts helped to stabilize the land, though recovery took many years.

The Dust Bowl is often remembered as a symbol of the Great Depression, a period of economic hardship that affected the entire nation. It also left a lasting impact on American agriculture and environmental policy. The experience demonstrated that the land could be damaged by short-term profit-seeking and that restoring it required long-term commitment. Today, the lessons of the Dust Bowl are still cited in discussions about sustainable farming, climate change, and the need to balance economic development with the protection of natural resources.',
  'The Dust Bowl',
  'The Dust Bowl

During the 1930s, a severe environmental and economic disaster struck the Great Plains of the United States. A combination of drought, poor farming practices, and strong winds led to massive dust storms that stripped the soil from millions of acres of land. The region affected—including parts of Kansas, Oklahoma, Texas, Colorado, and New Mexico—became known as the Dust Bowl. Crops failed, livestock died, and thousands of families were forced to leave their homes in search of work and a better life. Many migrated to California, where they hoped to find jobs in agriculture, but they often faced poverty, discrimination, and difficult living conditions. The novelist John Steinbeck later depicted their plight in The Grapes of Wrath, which brought the suffering of "Okies" and other migrants to national attention.

The causes of the Dust Bowl were both natural and human-made. The Plains had experienced periods of drought before, but in the early twentieth century, farmers had plowed up vast areas of native grassland to grow wheat. When rainfall was adequate, the soil produced abundant harvests. When the drought came, however, the exposed soil had nothing to hold it in place. The wind did the rest. Huge clouds of dust blackened the sky, buried fences and machinery, and caused respiratory illnesses among people and animals. The federal government eventually responded with programs to promote soil conservation, including planting trees as windbreaks and teaching farmers methods to prevent erosion. These efforts helped to stabilize the land, though recovery took many years.

The Dust Bowl is often remembered as a symbol of the Great Depression, a period of economic hardship that affected the entire nation. It also left a lasting impact on American agriculture and environmental policy. The experience demonstrated that the land could be damaged by short-term profit-seeking and that restoring it required long-term commitment. Today, the lessons of the Dust Bowl are still cited in discussions about sustainable farming, climate change, and the need to balance economic development with the protection of natural resources.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, what happened to many families during the Dust Bowl?',
  '["They stayed on their farms and prospered.", "They were forced to leave their homes in search of work and a better life.", "They moved to the East Coast.", "They received large payments from the government."]', 1, 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the passage say about John Steinbeck?',
  '["He was a farmer in Oklahoma.", "He depicted the plight of the migrants in The Grapes of Wrath.", "He worked for the federal government.", "He caused the Dust Bowl."]', 1, 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, what was one cause of the Dust Bowl?',
  '["Farmers had plowed up vast areas of native grassland; when drought came, the exposed soil had nothing to hold it in place.", "The government had banned farming.", "There was too much rainfall.", "Farmers had planted too many trees."]', 0, 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'How did the federal government respond to the Dust Bowl?',
  '["It did not respond.", "With programs to promote soil conservation, including planting trees and teaching farmers to prevent erosion.", "By moving all farmers to California.", "By banning wheat farming."]', 1, 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The author of the passage suggests that the Dust Bowl demonstrated that',
  '["farming was not important.", "the land could be damaged by short-term profit-seeking and that restoring it required long-term commitment.", "the government was not needed.", "California had the best soil."]', 1, 4
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 10: Plant Communication (science) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_content',
  'Plant Communication

Plants have long been thought of as passive organisms that simply grow, absorb nutrients, and react to light and water. In recent years, however, research has revealed that plants can communicate with each other and with other organisms in surprisingly sophisticated ways. They do not have nervous systems like animals, but they can send and receive signals using chemicals, sound, and even electrical impulses. When a plant is attacked by insects, for example, it may release volatile chemicals into the air. Neighboring plants can detect these chemicals and respond by producing their own defensive compounds, making their leaves less palatable or attractive to the insects. In this way, one plant can "warn" others of danger.

Below ground, communication is equally complex. Many plants form partnerships with fungi that live in the soil. The fungi attach to the roots of plants and extend a network of fine threads through the soil, creating what some scientists have called the "Wood Wide Web." Through this network, plants can exchange nutrients and chemical signals with one another. Studies have suggested that older, larger trees may "share" carbon with younger or shaded trees, and that plants can distinguish between the roots of their own species and those of others, sometimes favoring their "relatives" when distributing resources. These findings have led some researchers to argue that plants exhibit a form of intelligence, or at least a capacity for complex behavior that goes beyond simple reflexes.

Not everyone agrees with this interpretation. Critics point out that the word "communication" implies intent and awareness, and that we do not know whether plants are conscious in any meaningful sense. What we can say is that plants have evolved a variety of mechanisms that allow them to respond to their environment and to interact with other organisms in ways that increase their chances of survival. Understanding these mechanisms may have practical benefits: for example, it could lead to new ways of protecting crops from pests without relying solely on pesticides, or to a deeper appreciation of the hidden social lives of the organisms that form the base of most terrestrial ecosystems.',
  'Plant Communication',
  'Plant Communication

Plants have long been thought of as passive organisms that simply grow, absorb nutrients, and react to light and water. In recent years, however, research has revealed that plants can communicate with each other and with other organisms in surprisingly sophisticated ways. They do not have nervous systems like animals, but they can send and receive signals using chemicals, sound, and even electrical impulses. When a plant is attacked by insects, for example, it may release volatile chemicals into the air. Neighboring plants can detect these chemicals and respond by producing their own defensive compounds, making their leaves less palatable or attractive to the insects. In this way, one plant can "warn" others of danger.

Below ground, communication is equally complex. Many plants form partnerships with fungi that live in the soil. The fungi attach to the roots of plants and extend a network of fine threads through the soil, creating what some scientists have called the "Wood Wide Web." Through this network, plants can exchange nutrients and chemical signals with one another. Studies have suggested that older, larger trees may "share" carbon with younger or shaded trees, and that plants can distinguish between the roots of their own species and those of others, sometimes favoring their "relatives" when distributing resources. These findings have led some researchers to argue that plants exhibit a form of intelligence, or at least a capacity for complex behavior that goes beyond simple reflexes.

Not everyone agrees with this interpretation. Critics point out that the word "communication" implies intent and awareness, and that we do not know whether plants are conscious in any meaningful sense. What we can say is that plants have evolved a variety of mechanisms that allow them to respond to their environment and to interact with other organisms in ways that increase their chances of survival. Understanding these mechanisms may have practical benefits: for example, it could lead to new ways of protecting crops from pests without relying solely on pesticides, or to a deeper appreciation of the hidden social lives of the organisms that form the base of most terrestrial ecosystems.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, how can a plant "warn" others when it is attacked by insects?',
  '["It makes a loud sound.", "It may release volatile chemicals; neighboring plants detect them and produce defensive compounds.", "It moves its leaves.", "It grows faster."]', 1, 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is the "Wood Wide Web" mentioned in the passage?',
  '["A type of insect.", "A network of fungal threads in the soil through which plants can exchange nutrients and signals.", "A kind of tree.", "A type of pesticide."]', 1, 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What have studies suggested about older trees and younger trees?',
  '["They compete for all resources.", "Older, larger trees may ''share'' carbon with younger or shaded trees.", "Younger trees always grow faster.", "They cannot communicate."]', 1, 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, what do critics point out about the word "communication"?',
  '["It has no meaning in science.", "It implies intent and awareness, and we do not know whether plants are conscious.", "Plants do not use chemicals.", "Only animals can communicate."]', 1, 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The author of the passage suggests that understanding plant communication could lead to',
  '["the end of agriculture.", "new ways of protecting crops from pests without relying solely on pesticides.", "proof that plants are conscious.", "the elimination of fungi."]', 1, 4
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
