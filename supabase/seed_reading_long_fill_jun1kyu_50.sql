-- seed_reading_long_fill_jun1kyu_50.sql
-- 英検準1級 長文の語句空所補充 51問（17パッセージ×3空所）
-- 過去問形式: 250〜300語の説明文・評論文、各3空所・4肢選択
-- 028 以降のマイグレーション実行後に実行
-- 参照: docs/レベルチェック準1級_長文空所.md

-- ========== 1: The Benefits of Bilingualism ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Benefits of Bilingualism\n\nResearch has consistently shown that speaking more than one language offers cognitive advantages beyond simple communication. Bilingual individuals often demonstrate better executive function, including improved attention control and task-switching abilities. __BLANK__, studies suggest that learning a second language can delay the onset of age-related cognitive decline.\n\nSome researchers argue that the constant need to suppress one language while using another strengthens the brain''s control systems. __BLANK__, the benefits extend to academic performance. Bilingual children have been found to outperform monolingual peers in certain problem-solving tasks. Critics point out that early bilingualism may temporarily slow vocabulary development in each language. __BLANK__, the long-term advantages appear to outweigh these initial challenges, making bilingual education a valuable investment for many families.',
  'The Benefits of Bilingualism',
  E'The Benefits of Bilingualism\n\nResearch has consistently shown that speaking more than one language offers cognitive advantages beyond simple communication. Bilingual individuals often demonstrate better executive function, including improved attention control and task-switching abilities. __BLANK__, studies suggest that learning a second language can delay the onset of age-related cognitive decline.\n\nSome researchers argue that the constant need to suppress one language while using another strengthens the brain''s control systems. __BLANK__, the benefits extend to academic performance. Bilingual children have been found to outperform monolingual peers in certain problem-solving tasks. Critics point out that early bilingualism may temporarily slow vocabulary development in each language. __BLANK__, the long-term advantages appear to outweigh these initial challenges, making bilingual education a valuable investment for many families.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In contrast", "Moreover", "Nevertheless", "For instance"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["As a result", "Instead", "In other words", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Therefore", "However", "Similarly", "Consequently"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 2: The History of Tea ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_fill',
  E'The History of Tea\n\nTea has been consumed for thousands of years, with its origins traced to ancient China. According to legend, the Emperor Shen Nong discovered tea when leaves from a wild tree fell into his boiling water. __BLANK__, tea spread along trade routes to Japan, where it became central to Zen Buddhist ceremonies. By the seventeenth century, European traders had introduced tea to the West.\n\nIn Britain, tea initially remained a luxury for the wealthy. __BLANK__, the British East India Company began promoting tea consumption, and by the mid-1700s it had become a staple in households across the country. The custom of adding milk to tea is thought to have developed partly to prevent fine china cups from cracking when hot tea was poured. __BLANK__, tea continues to be one of the most widely consumed beverages in the world, with millions of cups drunk daily.',
  'The History of Tea',
  E'The History of Tea\n\nTea has been consumed for thousands of years, with its origins traced to ancient China. According to legend, the Emperor Shen Nong discovered tea when leaves from a wild tree fell into his boiling water. __BLANK__, tea spread along trade routes to Japan, where it became central to Zen Buddhist ceremonies. By the seventeenth century, European traders had introduced tea to the West.\n\nIn Britain, tea initially remained a luxury for the wealthy. __BLANK__, the British East India Company began promoting tea consumption, and by the mid-1700s it had become a staple in households across the country. The custom of adding milk to tea is thought to have developed partly to prevent fine china cups from cracking when hot tea was poured. __BLANK__, tea continues to be one of the most widely consumed beverages in the world, with millions of cups drunk daily.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["From there", "In return", "Even so", "For example"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "Consequently", "In contrast", "On the other hand"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Today", "Instead", "Moreover", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 3: Urban Green Spaces ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'Urban Green Spaces\n\nAs cities grow denser, the importance of parks and green spaces becomes increasingly clear. Research has shown that access to nature improves both physical and mental health. People who live near parks tend to exercise more and report lower levels of stress. __BLANK__, urban greenery helps reduce air pollution and moderate temperatures during heat waves.\n\nDespite these benefits, many cities struggle to preserve or expand green areas. Land is expensive, and developers often pressure local governments to allow housing or commercial construction. __BLANK__, some cities have adopted innovative solutions, such as rooftop gardens and vertical forests integrated into new buildings. These approaches allow nature to coexist with urban development. __BLANK__, the challenge of balancing growth with environmental quality remains one of the defining issues for twenty-first-century cities.',
  'Urban Green Spaces',
  E'Urban Green Spaces\n\nAs cities grow denser, the importance of parks and green spaces becomes increasingly clear. Research has shown that access to nature improves both physical and mental health. People who live near parks tend to exercise more and report lower levels of stress. __BLANK__, urban greenery helps reduce air pollution and moderate temperatures during heat waves.\n\nDespite these benefits, many cities struggle to preserve or expand green areas. Land is expensive, and developers often pressure local governments to allow housing or commercial construction. __BLANK__, some cities have adopted innovative solutions, such as rooftop gardens and vertical forests integrated into new buildings. These approaches allow nature to coexist with urban development. __BLANK__, the challenge of balancing growth with environmental quality remains one of the defining issues for twenty-first-century cities.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In addition", "Instead", "Nevertheless", "For instance"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Therefore", "Similarly", "Consequently"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "In other words", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 4: The Rise of Remote Work ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Rise of Remote Work\n\nThe shift toward remote work, accelerated by the pandemic, has fundamentally altered how many companies operate. Employees report greater flexibility and often higher job satisfaction when allowed to work from home. __BLANK__, employers have discovered that productivity can remain high or even improve when workers are not required to commute daily.\n\nThis change has not been without challenges. Some managers worry that remote work makes it harder to build team cohesion and company culture. __BLANK__, the lack of face-to-face interaction may disadvantage newer employees who benefit from informal learning. Hybrid models, which combine office and remote work, have emerged as a popular compromise. __BLANK__, the long-term impact of these changes on urban economies, transportation, and the structure of the workplace remains to be seen.',
  'The Rise of Remote Work',
  E'The Rise of Remote Work\n\nThe shift toward remote work, accelerated by the pandemic, has fundamentally altered how many companies operate. Employees report greater flexibility and often higher job satisfaction when allowed to work from home. __BLANK__, employers have discovered that productivity can remain high or even improve when workers are not required to commute daily.\n\nThis change has not been without challenges. Some managers worry that remote work makes it harder to build team cohesion and company culture. __BLANK__, the lack of face-to-face interaction may disadvantage newer employees who benefit from informal learning. Hybrid models, which combine office and remote work, have emerged as a popular compromise. __BLANK__, the long-term impact of these changes on urban economies, transportation, and the structure of the workplace remains to be seen.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In contrast", "For example"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Similarly", "Consequently", "In addition", "On the other hand"]', 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Therefore", "In fact", "Instead"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 5: The Mystery of Sleep ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Mystery of Sleep\n\nScientists have long sought to understand why we sleep. While it is clear that sleep is essential for survival, its exact functions remain partly mysterious. One widely accepted theory holds that sleep allows the brain to consolidate memories and clear out metabolic waste. __BLANK__, studies have shown that sleep deprivation impairs learning, decision-making, and immune function.\n\nDifferent stages of sleep appear to serve different purposes. Deep sleep is associated with physical restoration, while REM sleep seems crucial for processing emotions and forming long-term memories. __BLANK__, the reason why some animals sleep very little while others sleep for most of the day is not fully understood. Evolutionary pressures may have shaped sleep patterns in ways that vary by species. __BLANK__, research continues to reveal the complex role that sleep plays in maintaining both mental and physical health.',
  'The Mystery of Sleep',
  E'The Mystery of Sleep\n\nScientists have long sought to understand why we sleep. While it is clear that sleep is essential for survival, its exact functions remain partly mysterious. One widely accepted theory holds that sleep allows the brain to consolidate memories and clear out metabolic waste. __BLANK__, studies have shown that sleep deprivation impairs learning, decision-making, and immune function.\n\nDifferent stages of sleep appear to serve different purposes. Deep sleep is associated with physical restoration, while REM sleep seems crucial for processing emotions and forming long-term memories. __BLANK__, the reason why some animals sleep very little while others sleep for most of the day is not fully understood. Evolutionary pressures may have shaped sleep patterns in ways that vary by species. __BLANK__, research continues to reveal the complex role that sleep plays in maintaining both mental and physical health.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In fact", "Nevertheless", "Instead", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "However", "Therefore", "Consequently"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Similarly", "In other words", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 6: The Invention of the Printing Press ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_fill',
  E'The Invention of the Printing Press\n\nJohannes Gutenberg''s invention of the movable-type printing press in the mid-fifteenth century is often described as one of the most important developments in human history. Before this innovation, books had to be copied by hand, making them rare and expensive. __BLANK__, the printing press allowed for the mass production of texts, dramatically reducing costs and increasing access to knowledge.\n\nThe impact extended far beyond the world of books. The spread of printed materials contributed to the Protestant Reformation, as religious texts could now reach a wider audience. Scientific ideas circulated more freely, accelerating the pace of discovery. __BLANK__, some historians argue that the printing press laid the groundwork for the modern concept of the individual, as people could form their own opinions based on private reading. __BLANK__, it is difficult to overstate the influence of this technology on the course of Western civilization.',
  'The Invention of the Printing Press',
  E'The Invention of the Printing Press\n\nJohannes Gutenberg''s invention of the movable-type printing press in the mid-fifteenth century is often described as one of the most important developments in human history. Before this innovation, books had to be copied by hand, making them rare and expensive. __BLANK__, the printing press allowed for the mass production of texts, dramatically reducing costs and increasing access to knowledge.\n\nThe impact extended far beyond the world of books. The spread of printed materials contributed to the Protestant Reformation, as religious texts could now reach a wider audience. Scientific ideas circulated more freely, accelerating the pace of discovery. __BLANK__, some historians argue that the printing press laid the groundwork for the modern concept of the individual, as people could form their own opinions based on private reading. __BLANK__, it is difficult to overstate the influence of this technology on the course of Western civilization.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["In contrast", "Nevertheless", "By contrast", "As a result"]', 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Instead", "However", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Indeed", "Similarly", "Consequently", "On the other hand"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 7: Plastic Pollution in the Oceans ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'Plastic Pollution in the Oceans\n\nPlastic waste has become one of the most pressing environmental challenges of our time. Millions of tons of plastic enter the world''s oceans each year, where it persists for centuries and harms marine life. Animals often mistake plastic for food, leading to injury or death. __BLANK__, plastic breaks down into microplastics that enter the food chain and may pose risks to human health.\n\nEfforts to address the problem have taken various forms. Some countries have banned single-use plastic bags, while others have invested in improved recycling infrastructure. __BLANK__, technological innovations such as biodegradable plastics and ocean cleanup systems offer hope for the future. Critics argue that these solutions are insufficient without a fundamental reduction in plastic production. __BLANK__, the scale of the problem demands coordinated action at both the national and international levels.',
  'Plastic Pollution in the Oceans',
  E'Plastic Pollution in the Oceans\n\nPlastic waste has become one of the most pressing environmental challenges of our time. Millions of tons of plastic enter the world''s oceans each year, where it persists for centuries and harms marine life. Animals often mistake plastic for food, leading to injury or death. __BLANK__, plastic breaks down into microplastics that enter the food chain and may pose risks to human health.\n\nEfforts to address the problem have taken various forms. Some countries have banned single-use plastic bags, while others have invested in improved recycling infrastructure. __BLANK__, technological innovations such as biodegradable plastics and ocean cleanup systems offer hope for the future. Critics argue that these solutions are insufficient without a fundamental reduction in plastic production. __BLANK__, the scale of the problem demands coordinated action at both the national and international levels.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In contrast", "For instance"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Similarly", "Therefore", "In addition"]', 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Consequently", "In other words", "Instead"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 8: The Origins of Jazz ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_fill',
  E'The Origins of Jazz\n\nJazz emerged in the late nineteenth and early twentieth centuries in New Orleans, a city where African, Caribbean, and European musical traditions converged. The genre combined elements of blues, ragtime, and brass band music. __BLANK__, jazz spread up the Mississippi River to Chicago and New York, where it evolved into new styles and gained national and international audiences.\n\nEarly jazz was largely improvisational, with musicians creating melodies on the spot within a shared harmonic structure. This emphasis on spontaneity distinguished it from the more formal European classical tradition. __BLANK__, jazz became associated with the Roaring Twenties and the cultural changes of that era. Despite periods of decline in popularity, jazz has continued to influence countless other genres, from rock to hip-hop. __BLANK__, it remains a vital and evolving art form that reflects the complexity of American cultural history.',
  'The Origins of Jazz',
  E'The Origins of Jazz\n\nJazz emerged in the late nineteenth and early twentieth centuries in New Orleans, a city where African, Caribbean, and European musical traditions converged. The genre combined elements of blues, ragtime, and brass band music. __BLANK__, jazz spread up the Mississippi River to Chicago and New York, where it evolved into new styles and gained national and international audiences.\n\nEarly jazz was largely improvisational, with musicians creating melodies on the spot within a shared harmonic structure. This emphasis on spontaneity distinguished it from the more formal European classical tradition. __BLANK__, jazz became associated with the Roaring Twenties and the cultural changes of that era. Despite periods of decline in popularity, jazz has continued to influence countless other genres, from rock to hip-hop. __BLANK__, it remains a vital and evolving art form that reflects the complexity of American cultural history.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["From there", "Nevertheless", "In contrast", "Instead"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Consequently", "However", "Similarly"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Today", "Therefore", "In other words", "On the contrary"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 9: The Psychology of Procrastination ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Psychology of Procrastination\n\nProcrastination is a common behavior that affects people across ages and professions. Psychologists have identified several factors that contribute to it, including fear of failure, perfectionism, and difficulty with self-regulation. Tasks that feel overwhelming or unpleasant are particularly likely to be postponed. __BLANK__, procrastination is not simply a matter of poor time management; it often has deeper emotional roots.\n\nResearch suggests that procrastinators may be more sensitive to short-term mood repair than to long-term goals. Avoiding an unpleasant task provides immediate relief, even though it increases future stress. __BLANK__, breaking tasks into smaller steps and setting specific deadlines can help reduce procrastination. Some studies have found that self-compassion, rather than self-criticism, is more effective in motivating change. __BLANK__, understanding the psychological mechanisms behind procrastination can help individuals develop more effective strategies for managing their time and achieving their goals.',
  'The Psychology of Procrastination',
  E'The Psychology of Procrastination\n\nProcrastination is a common behavior that affects people across ages and professions. Psychologists have identified several factors that contribute to it, including fear of failure, perfectionism, and difficulty with self-regulation. Tasks that feel overwhelming or unpleasant are particularly likely to be postponed. __BLANK__, procrastination is not simply a matter of poor time management; it often has deeper emotional roots.\n\nResearch suggests that procrastinators may be more sensitive to short-term mood repair than to long-term goals. Avoiding an unpleasant task provides immediate relief, even though it increases future stress. __BLANK__, breaking tasks into smaller steps and setting specific deadlines can help reduce procrastination. Some studies have found that self-compassion, rather than self-criticism, is more effective in motivating change. __BLANK__, understanding the psychological mechanisms behind procrastination can help individuals develop more effective strategies for managing their time and achieving their goals.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In fact", "In contrast"]', 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Therefore", "Similarly", "Consequently"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "In other words"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 10: The Discovery of Penicillin ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_fill',
  E'The Discovery of Penicillin\n\nAlexander Fleming''s discovery of penicillin in 1928 is often cited as one of the greatest accidents in the history of science. Fleming noticed that a mold had contaminated one of his bacterial cultures and that the bacteria surrounding the mold had died. __BLANK__, he identified the mold as Penicillium and recognized its potential as an antibiotic. It would take more than a decade, however, before penicillin could be produced in quantities sufficient for medical use.\n\nHoward Florey and Ernst Chain at Oxford University led the effort to purify and mass-produce the drug. Their work proved critical during World War II, when penicillin saved countless lives by treating infected wounds. __BLANK__, the development of penicillin marked the beginning of the antibiotic era, transforming the treatment of infectious diseases. __BLANK__, the overuse of antibiotics has led to the emergence of resistant bacteria, reminding us that scientific advances often come with new challenges.',
  'The Discovery of Penicillin',
  E'The Discovery of Penicillin\n\nAlexander Fleming''s discovery of penicillin in 1928 is often cited as one of the greatest accidents in the history of science. Fleming noticed that a mold had contaminated one of his bacterial cultures and that the bacteria surrounding the mold had died. __BLANK__, he identified the mold as Penicillium and recognized its potential as an antibiotic. It would take more than a decade, however, before penicillin could be produced in quantities sufficient for medical use.\n\nHoward Florey and Ernst Chain at Oxford University led the effort to purify and mass-produce the drug. Their work proved critical during World War II, when penicillin saved countless lives by treating infected wounds. __BLANK__, the development of penicillin marked the beginning of the antibiotic era, transforming the treatment of infectious diseases. __BLANK__, the overuse of antibiotics has led to the emergence of resistant bacteria, reminding us that scientific advances often come with new challenges.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Nevertheless", "Consequently", "Subsequently", "In contrast"]', 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Therefore", "However", "Similarly"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Today", "Instead", "In addition", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 11: The Impact of Social Media on News ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Impact of Social Media on News\n\nSocial media has fundamentally changed how people consume and share news. Stories can spread rapidly across platforms, often reaching millions of users within hours. This has enabled ordinary citizens to report on events as they unfold and has given voice to perspectives that might otherwise be overlooked. __BLANK__, the speed and reach of social media have also created challenges. Misinformation can spread as quickly as accurate reporting, and the line between news and opinion has become increasingly blurred.\n\nTraditional news organizations have had to adapt to this new landscape. Many now maintain active social media presences and prioritize content that is likely to be shared. __BLANK__, concerns about "echo chambers" and "filter bubbles" have grown, as algorithms may show users content that reinforces their existing views. The question of how to ensure both the freedom of information and the reliability of news in the digital age remains unresolved. __BLANK__, the relationship between social media and journalism will continue to evolve in the years ahead.',
  'The Impact of Social Media on News',
  E'The Impact of Social Media on News\n\nSocial media has fundamentally changed how people consume and share news. Stories can spread rapidly across platforms, often reaching millions of users within hours. This has enabled ordinary citizens to report on events as they unfold and has given voice to perspectives that might otherwise be overlooked. __BLANK__, the speed and reach of social media have also created challenges. Misinformation can spread as quickly as accurate reporting, and the line between news and opinion has become increasingly blurred.\n\nTraditional news organizations have had to adapt to this new landscape. Many now maintain active social media presences and prioritize content that is likely to be shared. __BLANK__, concerns about "echo chambers" and "filter bubbles" have grown, as algorithms may show users content that reinforces their existing views. The question of how to ensure both the freedom of information and the reliability of news in the digital age remains unresolved. __BLANK__, the relationship between social media and journalism will continue to evolve in the years ahead.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "However", "Therefore", "Similarly"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In addition", "Consequently", "In contrast"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 12: The Great Migration of Monarch Butterflies ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Great Migration of Monarch Butterflies\n\nEvery year, millions of monarch butterflies undertake one of the most remarkable migrations in the animal kingdom. Those that breed in North America travel thousands of kilometers to overwinter in Mexico, where they cluster in fir forests. __BLANK__, the precise mechanisms that allow these insects to navigate such long distances remain poorly understood. Scientists believe that they use a combination of the sun''s position and the Earth''s magnetic field.\n\nThe migration is threatened by habitat loss, climate change, and the decline of milkweed, the plant on which monarch caterpillars exclusively feed. Conservation efforts have focused on planting milkweed along migration routes and protecting overwintering sites. __BLANK__, the monarch population has declined significantly in recent decades, leading some to call for its designation as an endangered species. __BLANK__, the survival of this iconic migration depends on coordinated action across international borders.',
  'The Great Migration of Monarch Butterflies',
  E'The Great Migration of Monarch Butterflies\n\nEvery year, millions of monarch butterflies undertake one of the most remarkable migrations in the animal kingdom. Those that breed in North America travel thousands of kilometers to overwinter in Mexico, where they cluster in fir forests. __BLANK__, the precise mechanisms that allow these insects to navigate such long distances remain poorly understood. Scientists believe that they use a combination of the sun''s position and the Earth''s magnetic field.\n\nThe migration is threatened by habitat loss, climate change, and the decline of milkweed, the plant on which monarch caterpillars exclusively feed. Conservation efforts have focused on planting milkweed along migration routes and protecting overwintering sites. __BLANK__, the monarch population has declined significantly in recent decades, leading some to call for its designation as an endangered species. __BLANK__, the survival of this iconic migration depends on coordinated action across international borders.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Nevertheless", "Moreover", "Therefore", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Consequently", "Similarly", "In addition"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Therefore", "In other words", "For instance"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 13: The Industrial Revolution ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_fill',
  E'The Industrial Revolution\n\nThe Industrial Revolution, which began in Britain in the late eighteenth century, transformed society in ways that are still felt today. The shift from hand production to machines led to unprecedented economic growth and the rise of factory-based manufacturing. __BLANK__, it also brought about significant social change. People moved from rural areas to cities in search of work, leading to rapid urbanization and the emergence of a new working class.\n\nLiving and working conditions in early industrial cities were often harsh. Long hours, low wages, and dangerous machinery were common. __BLANK__, the period also saw the growth of labor movements and the eventual introduction of reforms aimed at improving workers'' lives. Child labor, once widespread, was gradually restricted. __BLANK__, the Industrial Revolution laid the foundation for the modern world, with its mix of technological progress and ongoing debates about the distribution of its benefits.',
  'The Industrial Revolution',
  E'The Industrial Revolution\n\nThe Industrial Revolution, which began in Britain in the late eighteenth century, transformed society in ways that are still felt today. The shift from hand production to machines led to unprecedented economic growth and the rise of factory-based manufacturing. __BLANK__, it also brought about significant social change. People moved from rural areas to cities in search of work, leading to rapid urbanization and the emergence of a new working class.\n\nLiving and working conditions in early industrial cities were often harsh. Long hours, low wages, and dangerous machinery were common. __BLANK__, the period also saw the growth of labor movements and the eventual introduction of reforms aimed at improving workers'' lives. Child labor, once widespread, was gradually restricted. __BLANK__, the Industrial Revolution laid the foundation for the modern world, with its mix of technological progress and ongoing debates about the distribution of its benefits.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "However", "Therefore"]', 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Yet", "Consequently", "In contrast", "Similarly"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["In the end", "Instead", "Moreover", "For example"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 14: The Benefits of Exercise for Mental Health ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Benefits of Exercise for Mental Health\n\nPhysical exercise is widely recognized for its benefits to physical health, but its impact on mental well-being is equally significant. Regular exercise has been shown to reduce symptoms of depression and anxiety, often as effectively as medication in mild to moderate cases. __BLANK__, exercise promotes the release of endorphins, chemicals that can improve mood and reduce stress.\n\nResearch suggests that even moderate activity, such as walking, can have positive effects. The benefits appear to be both immediate and long-term. __BLANK__, the social aspects of group exercise or team sports can provide additional mental health benefits through increased social connection. Despite this evidence, many people with mental health challenges find it difficult to maintain an exercise routine. __BLANK__, health professionals increasingly recommend physical activity as part of a comprehensive approach to mental health care.',
  'The Benefits of Exercise for Mental Health',
  E'The Benefits of Exercise for Mental Health\n\nPhysical exercise is widely recognized for its benefits to physical health, but its impact on mental well-being is equally significant. Regular exercise has been shown to reduce symptoms of depression and anxiety, often as effectively as medication in mild to moderate cases. __BLANK__, exercise promotes the release of endorphins, chemicals that can improve mood and reduce stress.\n\nResearch suggests that even moderate activity, such as walking, can have positive effects. The benefits appear to be both immediate and long-term. __BLANK__, the social aspects of group exercise or team sports can provide additional mental health benefits through increased social connection. Despite this evidence, many people with mental health challenges find it difficult to maintain an exercise routine. __BLANK__, health professionals increasingly recommend physical activity as part of a comprehensive approach to mental health care.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In contrast", "Instead"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Therefore", "In addition", "Consequently"]', 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Similarly", "As a result"]', 3
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 15: The Rise of Electric Vehicles ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Rise of Electric Vehicles\n\nElectric vehicles (EVs) have moved from a niche market to the mainstream in many countries. Concerns about climate change and advances in battery technology have driven this shift. Governments have offered incentives to encourage adoption, and major automakers have committed to phasing out internal combustion engines. __BLANK__, the transition to electric mobility faces significant obstacles. Charging infrastructure remains uneven, and the high upfront cost of EVs puts them out of reach for many consumers.\n\nBattery production also raises environmental questions. Mining for lithium and other materials can have serious ecological impacts. __BLANK__, the overall carbon footprint of an EV over its lifetime is typically lower than that of a conventional car, especially in regions where electricity comes from renewable sources. The pace of the transition will depend on continued technological progress and policy support. __BLANK__, electric vehicles are likely to play an increasingly central role in the future of transportation.',
  'The Rise of Electric Vehicles',
  E'The Rise of Electric Vehicles\n\nElectric vehicles (EVs) have moved from a niche market to the mainstream in many countries. Concerns about climate change and advances in battery technology have driven this shift. Governments have offered incentives to encourage adoption, and major automakers have committed to phasing out internal combustion engines. __BLANK__, the transition to electric mobility faces significant obstacles. Charging infrastructure remains uneven, and the high upfront cost of EVs puts them out of reach for many consumers.\n\nBattery production also raises environmental questions. Mining for lithium and other materials can have serious ecological impacts. __BLANK__, the overall carbon footprint of an EV over its lifetime is typically lower than that of a conventional car, especially in regions where electricity comes from renewable sources. The pace of the transition will depend on continued technological progress and policy support. __BLANK__, electric vehicles are likely to play an increasingly central role in the future of transportation.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Nevertheless", "Moreover", "Therefore", "Similarly"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Consequently", "In addition", "Instead"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Therefore", "In other words", "For instance"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 16: The Art of the Renaissance ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_fill',
  E'The Art of the Renaissance\n\nThe Renaissance, which began in Italy in the fourteenth century, marked a profound shift in European art and culture. Artists began to move away from the stylized forms of the Middle Ages toward a more naturalistic representation of the human body and the natural world. __BLANK__, they drew inspiration from the art and literature of ancient Greece and Rome, which were being rediscovered and studied with new enthusiasm.\n\nPatronage by wealthy families and the Church played a crucial role in supporting artists such as Leonardo da Vinci, Michelangelo, and Raphael. These masters combined technical skill with intellectual ambition, often working across multiple disciplines. __BLANK__, the Renaissance spread northward, influencing artists in Flanders, Germany, and beyond. The period''s emphasis on human potential and individual achievement continues to shape Western ideas about art and creativity. __BLANK__, the Renaissance remains one of the most influential periods in the history of art.',
  'The Art of the Renaissance',
  E'The Art of the Renaissance\n\nThe Renaissance, which began in Italy in the fourteenth century, marked a profound shift in European art and culture. Artists began to move away from the stylized forms of the Middle Ages toward a more naturalistic representation of the human body and the natural world. __BLANK__, they drew inspiration from the art and literature of ancient Greece and Rome, which were being rediscovered and studied with new enthusiasm.\n\nPatronage by wealthy families and the Church played a crucial role in supporting artists such as Leonardo da Vinci, Michelangelo, and Raphael. These masters combined technical skill with intellectual ambition, often working across multiple disciplines. __BLANK__, the Renaissance spread northward, influencing artists in Flanders, Germany, and beyond. The period''s emphasis on human potential and individual achievement continues to shape Western ideas about art and creativity. __BLANK__, the Renaissance remains one of the most influential periods in the history of art.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In addition", "Therefore"]', 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "From there", "Consequently", "In contrast"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Today", "Instead", "Similarly", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 17: The Science of Happiness ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Science of Happiness\n\nPositive psychology, a field that emerged in the late twentieth century, has sought to understand what makes people happy and how happiness can be cultivated. Research has identified several factors associated with well-being, including strong social relationships, a sense of purpose, and the ability to find meaning in daily activities. __BLANK__, material wealth beyond a certain point has been found to have diminishing returns for happiness.\n\nStudies suggest that certain practices can boost well-being. Expressing gratitude, for example, has been linked to improved mood and life satisfaction. Acts of kindness toward others can also enhance the giver''s sense of happiness. __BLANK__, the relationship between happiness and health is bidirectional: happier people tend to be healthier, and good health contributes to happiness. Critics argue that the focus on individual happiness may overlook broader social and economic factors. __BLANK__, the science of happiness has provided valuable insights into the conditions that support human flourishing.',
  'The Science of Happiness',
  E'The Science of Happiness\n\nPositive psychology, a field that emerged in the late twentieth century, has sought to understand what makes people happy and how happiness can be cultivated. Research has identified several factors associated with well-being, including strong social relationships, a sense of purpose, and the ability to find meaning in daily activities. __BLANK__, material wealth beyond a certain point has been found to have diminishing returns for happiness.\n\nStudies suggest that certain practices can boost well-being. Expressing gratitude, for example, has been linked to improved mood and life satisfaction. Acts of kindness toward others can also enhance the giver''s sense of happiness. __BLANK__, the relationship between happiness and health is bidirectional: happier people tend to be healthier, and good health contributes to happiness. Critics argue that the focus on individual happiness may overlook broader social and economic factors. __BLANK__, the science of happiness has provided valuable insights into the conditions that support human flourishing.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "However", "Therefore", "Similarly"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "In addition", "Consequently", "In contrast"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
