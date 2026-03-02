-- seed_reading_long_fill_jun1kyu_additions.sql
-- 英検準1級 長文の語句空所補充 追加51問（17パッセージ×3空所）
-- seed_reading_long_fill_jun1kyu_50.sql 実行後に実行
-- 参照: docs/レベルチェック準1級_長文空所.md

-- ========== 18: The Role of Museums in Society ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Role of Museums in Society\n\nMuseums have long served as guardians of cultural heritage, preserving artifacts and artworks for future generations. In recent decades, their role has expanded beyond mere preservation. Many museums now prioritize education and public engagement, offering programs designed to make their collections accessible to diverse audiences. __BLANK__, debates have arisen about whether museums should return objects acquired during the colonial era to their countries of origin.\n\nProponents of repatriation argue that such items were often taken without consent and that they hold deep cultural significance for the communities from which they came. Opponents point to the resources that major museums can provide for conservation and research. __BLANK__, some institutions have begun to negotiate returns or long-term loans. The question of who owns cultural heritage is unlikely to be resolved easily. __BLANK__, museums will continue to play a central role in how societies understand and value their past.',
  'The Role of Museums in Society',
  E'The Role of Museums in Society\n\nMuseums have long served as guardians of cultural heritage, preserving artifacts and artworks for future generations. In recent decades, their role has expanded beyond mere preservation. Many museums now prioritize education and public engagement, offering programs designed to make their collections accessible to diverse audiences. __BLANK__, debates have arisen about whether museums should return objects acquired during the colonial era to their countries of origin.\n\nProponents of repatriation argue that such items were often taken without consent and that they hold deep cultural significance for the communities from which they came. Opponents point to the resources that major museums can provide for conservation and research. __BLANK__, some institutions have begun to negotiate returns or long-term loans. The question of who owns cultural heritage is unlikely to be resolved easily. __BLANK__, museums will continue to play a central role in how societies understand and value their past.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In addition", "Therefore"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Consequently", "Similarly", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 19: The Decline of Bee Populations ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Decline of Bee Populations\n\nBees are essential pollinators, responsible for the reproduction of many crops and wild plants. In recent years, however, bee populations have declined sharply in many parts of the world. Scientists have identified several factors contributing to this decline, including pesticide use, habitat loss, and the spread of parasites and diseases. __BLANK__, climate change may be altering the timing of flowering, creating mismatches between when bees are active and when plants need pollination.\n\nThe economic implications are significant. A substantial proportion of global food production depends on insect pollination. __BLANK__, efforts to protect bees have gained momentum. Some farmers have reduced pesticide use or adopted practices that provide habitat for pollinators. Urban beekeeping has also grown in popularity. __BLANK__, reversing the decline will require coordinated action across agriculture, urban planning, and environmental policy.',
  'The Decline of Bee Populations',
  E'The Decline of Bee Populations\n\nBees are essential pollinators, responsible for the reproduction of many crops and wild plants. In recent years, however, bee populations have declined sharply in many parts of the world. Scientists have identified several factors contributing to this decline, including pesticide use, habitat loss, and the spread of parasites and diseases. __BLANK__, climate change may be altering the timing of flowering, creating mismatches between when bees are active and when plants need pollination.\n\nThe economic implications are significant. A substantial proportion of global food production depends on insect pollination. __BLANK__, efforts to protect bees have gained momentum. Some farmers have reduced pesticide use or adopted practices that provide habitat for pollinators. Urban beekeeping has also grown in popularity. __BLANK__, reversing the decline will require coordinated action across agriculture, urban planning, and environmental policy.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In contrast", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Consequently", "Similarly", "In addition"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 20: The Spread of Misinformation ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Spread of Misinformation\n\nFalse or misleading information has always existed, but the internet and social media have dramatically increased the speed and scale at which it can spread. Misinformation can influence public opinion, affect elections, and even endanger health when it concerns medical topics. __BLANK__, researchers have found that false stories often spread faster than true ones, in part because they tend to be more novel and emotionally charged.\n\nEfforts to combat misinformation have taken various forms. Fact-checking organizations work to verify claims and correct the record. Some platforms have introduced labels or reduced the visibility of content flagged as false. __BLANK__, these measures have drawn criticism from those who worry about censorship and the concentration of power in the hands of a few companies. There is no simple solution to the problem of misinformation. __BLANK__, media literacy and critical thinking remain essential skills for navigating the modern information landscape.',
  'The Spread of Misinformation',
  E'The Spread of Misinformation\n\nFalse or misleading information has always existed, but the internet and social media have dramatically increased the speed and scale at which it can spread. Misinformation can influence public opinion, affect elections, and even endanger health when it concerns medical topics. __BLANK__, researchers have found that false stories often spread faster than true ones, in part because they tend to be more novel and emotionally charged.\n\nEfforts to combat misinformation have taken various forms. Fact-checking organizations work to verify claims and correct the record. Some platforms have introduced labels or reduced the visibility of content flagged as false. __BLANK__, these measures have drawn criticism from those who worry about censorship and the concentration of power in the hands of a few companies. There is no simple solution to the problem of misinformation. __BLANK__, media literacy and critical thinking remain essential skills for navigating the modern information landscape.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In fact", "In contrast"]', 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Therefore", "Similarly", "Consequently"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 21: The Women''s Suffrage Movement ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_fill',
  E'The Women''s Suffrage Movement\n\nThe campaign for women''s right to vote was one of the most significant social movements of the late nineteenth and early twentieth centuries. In Britain, suffragettes employed tactics ranging from peaceful lobbying to civil disobedience and hunger strikes. Their efforts drew widespread attention, though not always sympathetic. __BLANK__, the movement faced fierce opposition from those who argued that women were unsuited for political participation.\n\nNew Zealand became the first country to grant women the vote in 1893. Other nations followed gradually. In the United States, the Nineteenth Amendment was ratified in 1920, after decades of activism. __BLANK__, the suffrage movement laid the groundwork for broader campaigns for gender equality that continue today. The right to vote was a crucial step, but it did not immediately eliminate discrimination in other areas of life. __BLANK__, the suffragettes'' determination and sacrifice remain an inspiration to those fighting for justice and equality.',
  'The Women''s Suffrage Movement',
  E'The Women''s Suffrage Movement\n\nThe campaign for women''s right to vote was one of the most significant social movements of the late nineteenth and early twentieth centuries. In Britain, suffragettes employed tactics ranging from peaceful lobbying to civil disobedience and hunger strikes. Their efforts drew widespread attention, though not always sympathetic. __BLANK__, the movement faced fierce opposition from those who argued that women were unsuited for political participation.\n\nNew Zealand became the first country to grant women the vote in 1893. Other nations followed gradually. In the United States, the Nineteenth Amendment was ratified in 1920, after decades of activism. __BLANK__, the suffrage movement laid the groundwork for broader campaigns for gender equality that continue today. The right to vote was a crucial step, but it did not immediately eliminate discrimination in other areas of life. __BLANK__, the suffragettes'' determination and sacrifice remain an inspiration to those fighting for justice and equality.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In addition", "Therefore"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "However", "Consequently", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Today", "Instead", "Similarly", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 22: The Future of Artificial Intelligence ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Future of Artificial Intelligence\n\nArtificial intelligence has already transformed many industries, from healthcare to finance to transportation. Machine learning algorithms can now perform tasks that once seemed uniquely human, such as recognizing faces, translating languages, and playing complex games. __BLANK__, the rapid pace of development has raised concerns about job displacement, privacy, and the potential for AI to be used in harmful ways.\n\nEthicists and policymakers have begun to grapple with these issues. Some advocate for regulations that would ensure AI systems are transparent and accountable. __BLANK__, there is debate about whether highly advanced AI could eventually pose existential risks to humanity. While such scenarios remain speculative, they have prompted serious discussion among researchers. __BLANK__, the direction that AI development takes will depend not only on technological possibilities but also on the choices that societies make about how to govern and deploy these powerful tools.',
  'The Future of Artificial Intelligence',
  E'The Future of Artificial Intelligence\n\nArtificial intelligence has already transformed many industries, from healthcare to finance to transportation. Machine learning algorithms can now perform tasks that once seemed uniquely human, such as recognizing faces, translating languages, and playing complex games. __BLANK__, the rapid pace of development has raised concerns about job displacement, privacy, and the potential for AI to be used in harmful ways.\n\nEthicists and policymakers have begun to grapple with these issues. Some advocate for regulations that would ensure AI systems are transparent and accountable. __BLANK__, there is debate about whether highly advanced AI could eventually pose existential risks to humanity. While such scenarios remain speculative, they have prompted serious discussion among researchers. __BLANK__, the direction that AI development takes will depend not only on technological possibilities but also on the choices that societies make about how to govern and deploy these powerful tools.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In contrast", "Therefore"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "However", "Consequently", "Similarly"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Therefore", "In other words", "Instead"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 23: The Impact of Tourism on Local Communities ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Impact of Tourism on Local Communities\n\nTourism can bring significant economic benefits to destinations, creating jobs and supporting local businesses. Visitors spend money on accommodation, food, and activities, and governments often invest in infrastructure to attract them. __BLANK__, the growth of tourism has also led to problems. Overtourism in cities like Venice and Barcelona has sparked protests from residents who complain of overcrowding, rising rents, and the loss of local character.\n\nSome destinations have responded by limiting visitor numbers or imposing fees. Others have promoted "responsible tourism" that aims to minimize environmental and social impact. __BLANK__, the COVID-19 pandemic forced a sudden halt to international travel, giving some communities a chance to reassess their dependence on tourism. The recovery has been uneven, with some regions struggling to attract visitors while others have seen a rapid return. __BLANK__, balancing the economic benefits of tourism with the well-being of local communities remains a pressing challenge for many popular destinations.',
  'The Impact of Tourism on Local Communities',
  E'The Impact of Tourism on Local Communities\n\nTourism can bring significant economic benefits to destinations, creating jobs and supporting local businesses. Visitors spend money on accommodation, food, and activities, and governments often invest in infrastructure to attract them. __BLANK__, the growth of tourism has also led to problems. Overtourism in cities like Venice and Barcelona has sparked protests from residents who complain of overcrowding, rising rents, and the loss of local character.\n\nSome destinations have responded by limiting visitor numbers or imposing fees. Others have promoted "responsible tourism" that aims to minimize environmental and social impact. __BLANK__, the COVID-19 pandemic forced a sudden halt to international travel, giving some communities a chance to reassess their dependence on tourism. The recovery has been uneven, with some regions struggling to attract visitors while others have seen a rapid return. __BLANK__, balancing the economic benefits of tourism with the well-being of local communities remains a pressing challenge for many popular destinations.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "However", "Therefore", "Similarly"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "Nevertheless", "Consequently", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 24: The Origins of Human Language ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Origins of Human Language\n\nHow and when human language first emerged remains one of the great mysteries of science. Unlike written records, spoken language leaves no direct trace in the archaeological record. Researchers have proposed various theories, ranging from the idea that language evolved gradually from animal communication to the hypothesis that it appeared suddenly as a result of a genetic mutation. __BLANK__, evidence from genetics, archaeology, and the study of other primates has begun to shed light on the question.\n\nSome scholars argue that the capacity for language may have developed as early as two million years ago, alongside the expansion of the human brain. Others place its emergence much more recently, perhaps within the last 100,000 years. __BLANK__, the diversity of the world''s languages suggests that once the capacity for language existed, it spread and diversified rapidly. The question of language origins may never be fully answered. __BLANK__, the search for answers continues to reveal fascinating insights into what makes humans unique.',
  'The Origins of Human Language',
  E'The Origins of Human Language\n\nHow and when human language first emerged remains one of the great mysteries of science. Unlike written records, spoken language leaves no direct trace in the archaeological record. Researchers have proposed various theories, ranging from the idea that language evolved gradually from animal communication to the hypothesis that it appeared suddenly as a result of a genetic mutation. __BLANK__, evidence from genetics, archaeology, and the study of other primates has begun to shed light on the question.\n\nSome scholars argue that the capacity for language may have developed as early as two million years ago, alongside the expansion of the human brain. Others place its emergence much more recently, perhaps within the last 100,000 years. __BLANK__, the diversity of the world''s languages suggests that once the capacity for language existed, it spread and diversified rapidly. The question of language origins may never be fully answered. __BLANK__, the search for answers continues to reveal fascinating insights into what makes humans unique.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Nevertheless", "Moreover", "Therefore", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Moreover", "However", "Consequently", "Similarly"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 25: The Ethics of Animal Testing ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Ethics of Animal Testing\n\nAnimal testing has long been used in medical and pharmaceutical research, as well as in the development of cosmetics and other consumer products. Proponents argue that it has led to life-saving treatments and that alternatives are not yet sufficient for all types of research. __BLANK__, critics contend that subjecting animals to pain and distress is morally wrong, regardless of the potential benefits to humans.\n\nIn recent decades, the development of cell cultures, computer models, and other non-animal methods has reduced the need for some forms of animal testing. Several countries have banned cosmetic testing on animals. __BLANK__, animal testing remains widespread in biomedical research, where regulations typically require evidence of safety before human trials can begin. The debate reflects deeper questions about the moral status of animals and the extent of human obligations toward other species. __BLANK__, finding a balance between scientific progress and animal welfare will require ongoing dialogue and innovation.',
  'The Ethics of Animal Testing',
  E'The Ethics of Animal Testing\n\nAnimal testing has long been used in medical and pharmaceutical research, as well as in the development of cosmetics and other consumer products. Proponents argue that it has led to life-saving treatments and that alternatives are not yet sufficient for all types of research. __BLANK__, critics contend that subjecting animals to pain and distress is morally wrong, regardless of the potential benefits to humans.\n\nIn recent decades, the development of cell cultures, computer models, and other non-animal methods has reduced the need for some forms of animal testing. Several countries have banned cosmetic testing on animals. __BLANK__, animal testing remains widespread in biomedical research, where regulations typically require evidence of safety before human trials can begin. The debate reflects deeper questions about the moral status of animals and the extent of human obligations toward other species. __BLANK__, finding a balance between scientific progress and animal welfare will require ongoing dialogue and innovation.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In addition", "Therefore"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Consequently", "Similarly", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 26: The Rise of Podcasting ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Rise of Podcasting\n\nPodcasting has grown from a niche hobby into a major form of media consumption. The format allows listeners to choose from an enormous variety of content, from news and education to comedy and true crime. Unlike traditional radio, podcasts can be listened to at any time, making them well-suited to commutes and other activities. __BLANK__, the relatively low cost of production has enabled independent creators to reach global audiences without the support of large media organizations.\n\nMajor platforms and streaming services have invested heavily in podcasting, acquiring popular shows and developing exclusive content. __BLANK__, the advertising model that supports many podcasts has raised questions about the influence of sponsors on content. Some listeners prefer subscription-based or listener-supported shows that avoid traditional ads. __BLANK__, podcasting has become an integral part of the media landscape, offering both opportunities for creators and new choices for audiences.',
  'The Rise of Podcasting',
  E'The Rise of Podcasting\n\nPodcasting has grown from a niche hobby into a major form of media consumption. The format allows listeners to choose from an enormous variety of content, from news and education to comedy and true crime. Unlike traditional radio, podcasts can be listened to at any time, making them well-suited to commutes and other activities. __BLANK__, the relatively low cost of production has enabled independent creators to reach global audiences without the support of large media organizations.\n\nMajor platforms and streaming services have invested heavily in podcasting, acquiring popular shows and developing exclusive content. __BLANK__, the advertising model that supports many podcasts has raised questions about the influence of sponsors on content. Some listeners prefer subscription-based or listener-supported shows that avoid traditional ads. __BLANK__, podcasting has become an integral part of the media landscape, offering both opportunities for creators and new choices for audiences.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In contrast", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Consequently", "Similarly", "In addition"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 27: Climate Change and Migration ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'Climate Change and Migration\n\nRising sea levels, droughts, and extreme weather events are increasingly forcing people to leave their homes. While the term "climate refugee" is not yet formally recognized in international law, the link between environmental change and migration is becoming impossible to ignore. Low-lying island nations face existential threats, and farmers in drought-prone regions may find it impossible to sustain their livelihoods. __BLANK__, climate-related displacement often overlaps with other drivers of migration, such as conflict and economic hardship.\n\nPredicting exactly how many people will be displaced by climate change is difficult. Estimates range from tens of millions to over a billion by the end of the century. __BLANK__, some countries have begun to consider how to accommodate those forced to move. The Pacific nation of Kiribati has purchased land in Fiji as a potential future home for its population. __BLANK__, addressing climate-related migration will require not only adaptation measures but also a fundamental commitment to reducing greenhouse gas emissions.',
  'Climate Change and Migration',
  E'Climate Change and Migration\n\nRising sea levels, droughts, and extreme weather events are increasingly forcing people to leave their homes. While the term "climate refugee" is not yet formally recognized in international law, the link between environmental change and migration is becoming impossible to ignore. Low-lying island nations face existential threats, and farmers in drought-prone regions may find it impossible to sustain their livelihoods. __BLANK__, climate-related displacement often overlaps with other drivers of migration, such as conflict and economic hardship.\n\nPredicting exactly how many people will be displaced by climate change is difficult. Estimates range from tens of millions to over a billion by the end of the century. __BLANK__, some countries have begun to consider how to accommodate those forced to move. The Pacific nation of Kiribati has purchased land in Fiji as a potential future home for its population. __BLANK__, addressing climate-related migration will require not only adaptation measures but also a fundamental commitment to reducing greenhouse gas emissions.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In addition", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Nevertheless", "Consequently", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 28: The History of Vaccination ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_fill',
  E'The History of Vaccination\n\nEdward Jenner''s experiments with cowpox in the late eighteenth century are often credited with launching the field of vaccination. He observed that milkmaids who had contracted cowpox seemed immune to smallpox, and he successfully tested the idea that exposure to the milder disease could protect against the deadlier one. __BLANK__, vaccination has saved countless lives and led to the eradication of smallpox, one of humanity''s greatest achievements in public health.\n\nSince Jenner''s time, vaccines have been developed for dozens of diseases. The process typically takes years and involves rigorous testing for safety and effectiveness. __BLANK__, the rapid development of COVID-19 vaccines demonstrated that, when resources and urgency align, the timeline can be compressed. Vaccine hesitancy has emerged as a significant challenge, with misinformation and distrust contributing to lower vaccination rates in some communities. __BLANK__, the scientific consensus remains clear: vaccination is one of the most effective tools for preventing infectious disease.',
  'The History of Vaccination',
  E'The History of Vaccination\n\nEdward Jenner''s experiments with cowpox in the late eighteenth century are often credited with launching the field of vaccination. He observed that milkmaids who had contracted cowpox seemed immune to smallpox, and he successfully tested the idea that exposure to the milder disease could protect against the deadlier one. __BLANK__, vaccination has saved countless lives and led to the eradication of smallpox, one of humanity''s greatest achievements in public health.\n\nSince Jenner''s time, vaccines have been developed for dozens of diseases. The process typically takes years and involves rigorous testing for safety and effectiveness. __BLANK__, the rapid development of COVID-19 vaccines demonstrated that, when resources and urgency align, the timeline can be compressed. Vaccine hesitancy has emerged as a significant challenge, with misinformation and distrust contributing to lower vaccination rates in some communities. __BLANK__, the scientific consensus remains clear: vaccination is one of the most effective tools for preventing infectious disease.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["From there", "Nevertheless", "In contrast", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Moreover", "Consequently", "Similarly"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 29: The Psychology of Fear ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Psychology of Fear\n\nFear is a fundamental emotion that evolved to protect us from danger. When we perceive a threat, our bodies respond with a cascade of physiological changes: increased heart rate, heightened alertness, and the release of stress hormones. This "fight or flight" response can be life-saving in genuine emergencies. __BLANK__, in modern life, we often experience fear in response to threats that are not immediately physical, such as financial worries or social rejection.\n\nChronic fear and anxiety can have serious health consequences, including increased risk of heart disease and weakened immune function. __BLANK__, understanding how fear works can help people manage anxiety more effectively. Techniques such as cognitive behavioral therapy aim to change the thought patterns that fuel excessive fear. Exposure therapy gradually desensitizes people to feared situations. __BLANK__, while fear will always be part of the human experience, we can learn to respond to it in ways that support rather than undermine our well-being.',
  'The Psychology of Fear',
  E'The Psychology of Fear\n\nFear is a fundamental emotion that evolved to protect us from danger. When we perceive a threat, our bodies respond with a cascade of physiological changes: increased heart rate, heightened alertness, and the release of stress hormones. This "fight or flight" response can be life-saving in genuine emergencies. __BLANK__, in modern life, we often experience fear in response to threats that are not immediately physical, such as financial worries or social rejection.\n\nChronic fear and anxiety can have serious health consequences, including increased risk of heart disease and weakened immune function. __BLANK__, understanding how fear works can help people manage anxiety more effectively. Techniques such as cognitive behavioral therapy aim to change the thought patterns that fuel excessive fear. Exposure therapy gradually desensitizes people to feared situations. __BLANK__, while fear will always be part of the human experience, we can learn to respond to it in ways that support rather than undermine our well-being.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "However", "Therefore", "Similarly"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "Moreover", "Consequently", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 30: The Global Water Crisis ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Global Water Crisis\n\nAccess to clean, safe water is essential for human health and development, yet billions of people around the world lack it. In some regions, water scarcity is driven by physical shortage; in others, the problem is contamination or inadequate infrastructure. Climate change is expected to worsen the situation in many areas, altering rainfall patterns and increasing the frequency of droughts. __BLANK__, competition for water resources can fuel conflict between communities and nations.\n\nEfforts to address the water crisis have included investments in wells, pipelines, and water treatment facilities. Conservation and more efficient agricultural practices can also reduce demand. __BLANK__, progress has been uneven, and funding often falls short of what is needed. The United Nations has recognized access to water and sanitation as a human right. __BLANK__, realizing that right for all will require sustained commitment from governments, international organizations, and the private sector.',
  'The Global Water Crisis',
  E'The Global Water Crisis\n\nAccess to clean, safe water is essential for human health and development, yet billions of people around the world lack it. In some regions, water scarcity is driven by physical shortage; in others, the problem is contamination or inadequate infrastructure. Climate change is expected to worsen the situation in many areas, altering rainfall patterns and increasing the frequency of droughts. __BLANK__, competition for water resources can fuel conflict between communities and nations.\n\nEfforts to address the water crisis have included investments in wells, pipelines, and water treatment facilities. Conservation and more efficient agricultural practices can also reduce demand. __BLANK__, progress has been uneven, and funding often falls short of what is needed. The United Nations has recognized access to water and sanitation as a human right. __BLANK__, realizing that right for all will require sustained commitment from governments, international organizations, and the private sector.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In addition", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Consequently", "Similarly", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 31: The Evolution of the Book ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'narrative', 'long_fill',
  E'The Evolution of the Book\n\nThe form of the book has changed dramatically over the centuries. Ancient texts were written on scrolls of papyrus or parchment. The codex, with its bound pages, emerged around the first century and eventually replaced the scroll. The invention of the printing press made books more affordable and widely available. __BLANK__, the digital revolution has introduced e-books and audiobooks, challenging the dominance of the physical book.\n\nSome have predicted the death of the printed book, but sales have remained surprisingly resilient. Many readers prefer the tactile experience of holding a physical volume. __BLANK__, e-books offer conveniences such as adjustable font sizes and the ability to carry hundreds of titles on a single device. Libraries and publishers have adapted to serve both preferences. __BLANK__, the book in its various forms continues to be a vital medium for the transmission of knowledge and the pleasure of reading.',
  'The Evolution of the Book',
  E'The Evolution of the Book\n\nThe form of the book has changed dramatically over the centuries. Ancient texts were written on scrolls of papyrus or parchment. The codex, with its bound pages, emerged around the first century and eventually replaced the scroll. The invention of the printing press made books more affordable and widely available. __BLANK__, the digital revolution has introduced e-books and audiobooks, challenging the dominance of the physical book.\n\nSome have predicted the death of the printed book, but sales have remained surprisingly resilient. Many readers prefer the tactile experience of holding a physical volume. __BLANK__, e-books offer conveniences such as adjustable font sizes and the ability to carry hundreds of titles on a single device. Libraries and publishers have adapted to serve both preferences. __BLANK__, the book in its various forms continues to be a vital medium for the transmission of knowledge and the pleasure of reading.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "Today", "In contrast"]', 2
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Moreover", "Consequently", "Similarly"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 32: The Benefits of Meditation ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Benefits of Meditation\n\nMeditation has been practiced for thousands of years in various religious and philosophical traditions. In recent decades, it has gained widespread acceptance in the West as a secular practice for improving mental and physical well-being. Research has shown that regular meditation can reduce stress, improve attention, and even produce measurable changes in brain structure. __BLANK__, meditation is not a quick fix; developing a consistent practice typically requires time and patience.\n\nDifferent forms of meditation emphasize different techniques. Mindfulness meditation focuses on observing thoughts and sensations without judgment. Other practices involve concentrating on a single object, such as the breath or a mantra. __BLANK__, the common element is the cultivation of present-moment awareness. Many people find that meditation helps them respond more skillfully to difficult emotions and situations. __BLANK__, as interest in meditation grows, it has been integrated into schools, workplaces, and healthcare settings as a tool for promoting resilience and well-being.',
  'The Benefits of Meditation',
  E'The Benefits of Meditation\n\nMeditation has been practiced for thousands of years in various religious and philosophical traditions. In recent decades, it has gained widespread acceptance in the West as a secular practice for improving mental and physical well-being. Research has shown that regular meditation can reduce stress, improve attention, and even produce measurable changes in brain structure. __BLANK__, meditation is not a quick fix; developing a consistent practice typically requires time and patience.\n\nDifferent forms of meditation emphasize different techniques. Mindfulness meditation focuses on observing thoughts and sensations without judgment. Other practices involve concentrating on a single object, such as the breath or a mantra. __BLANK__, the common element is the cultivation of present-moment awareness. Many people find that meditation helps them respond more skillfully to difficult emotions and situations. __BLANK__, as interest in meditation grows, it has been integrated into schools, workplaces, and healthcare settings as a tool for promoting resilience and well-being.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "However", "Therefore", "Similarly"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["Nevertheless", "Moreover", "Consequently", "In contrast"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Today", "Instead", "Similarly", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 33: The Rise of Plant-Based Diets ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Rise of Plant-Based Diets\n\nInterest in plant-based eating has surged in recent years, driven by concerns about health, animal welfare, and the environmental impact of meat production. Livestock farming is a major source of greenhouse gas emissions and requires vast amounts of land and water. __BLANK__, a growing body of research suggests that diets rich in plant foods may reduce the risk of heart disease, certain cancers, and other conditions.\n\nThe food industry has responded with an array of plant-based products, from meat alternatives to dairy-free options. Some of these products are highly processed, raising questions about whether they are healthier than the foods they replace. __BLANK__, for many people, they offer a convenient way to reduce meat consumption. The shift toward plant-based eating is unlikely to be uniform; cultural traditions and personal preferences will continue to shape dietary choices. __BLANK__, the trend reflects a broader awareness of the connections between food, health, and the environment.',
  'The Rise of Plant-Based Diets',
  E'The Rise of Plant-Based Diets\n\nInterest in plant-based eating has surged in recent years, driven by concerns about health, animal welfare, and the environmental impact of meat production. Livestock farming is a major source of greenhouse gas emissions and requires vast amounts of land and water. __BLANK__, a growing body of research suggests that diets rich in plant foods may reduce the risk of heart disease, certain cancers, and other conditions.\n\nThe food industry has responded with an array of plant-based products, from meat alternatives to dairy-free options. Some of these products are highly processed, raising questions about whether they are healthier than the foods they replace. __BLANK__, for many people, they offer a convenient way to reduce meat consumption. The shift toward plant-based eating is unlikely to be uniform; cultural traditions and personal preferences will continue to shape dietary choices. __BLANK__, the trend reflects a broader awareness of the connections between food, health, and the environment.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Moreover", "Nevertheless", "In addition", "Therefore"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Consequently", "Similarly", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 1
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;

-- ========== 34: The Mystery of Animal Migration ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '準1級', 'expository', 'long_fill',
  E'The Mystery of Animal Migration\n\nEvery year, countless species undertake remarkable journeys across land, sea, and sky. Salmon swim thousands of kilometers from the ocean back to the streams where they were born. Arctic terns fly from pole to pole. Sea turtles navigate across entire oceans to return to the beaches where they hatched. __BLANK__, scientists are still unraveling how these animals find their way with such precision.\n\nResearch suggests that migrants use a variety of cues, including the sun, stars, Earth''s magnetic field, and even smells. Some species may inherit a kind of internal map, while others learn routes from experienced travelers. __BLANK__, human activities such as light pollution, habitat destruction, and climate change are disrupting migration patterns. Protecting migration routes requires international cooperation, as many species cross national borders. __BLANK__, the study of animal migration continues to reveal both the astonishing capabilities of other species and the impact of human actions on the natural world.',
  'The Mystery of Animal Migration',
  E'The Mystery of Animal Migration\n\nEvery year, countless species undertake remarkable journeys across land, sea, and sky. Salmon swim thousands of kilometers from the ocean back to the streams where they were born. Arctic terns fly from pole to pole. Sea turtles navigate across entire oceans to return to the beaches where they hatched. __BLANK__, scientists are still unraveling how these animals find their way with such precision.\n\nResearch suggests that migrants use a variety of cues, including the sun, stars, Earth''s magnetic field, and even smells. Some species may inherit a kind of internal map, while others learn routes from experienced travelers. __BLANK__, human activities such as light pollution, habitat destruction, and climate change are disrupting migration patterns. Protecting migration routes requires international cooperation, as many species cross national borders. __BLANK__, the study of animal migration continues to reveal both the astonishing capabilities of other species and the impact of human actions on the natural world.'
);
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 0, '["Nevertheless", "Moreover", "Therefore", "In contrast"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 1, '["However", "Moreover", "Consequently", "Similarly"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_blanks (passage_id, blank_index, choices, correct_index)
SELECT id, 2, '["Yet", "Moreover", "Instead", "As a result"]', 0
FROM public.reading_passages WHERE level = '準1級' AND passage_type = 'long_fill' ORDER BY id DESC LIMIT 1;
