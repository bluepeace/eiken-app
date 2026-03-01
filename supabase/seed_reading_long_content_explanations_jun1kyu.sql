-- seed_reading_long_content_explanations_jun1kyu.sql
-- 長文の内容一致（準1級）の解説を reading_passage_questions.explanation に反映
-- 038 マイグレーションおよび seed_reading_long_content_jun1kyu_50.sql 実行後に実行

-- Passage 1: The Franklin Expedition
UPDATE reading_passage_questions q
SET explanation = '第1段落の "in search of the Northwest Passage, a sea route through the Arctic that would connect the Atlantic and Pacific Oceans" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Franklin Expedition'
  AND q.question_text = 'According to the first paragraph, what was the goal of the Franklin Expedition?';

UPDATE reading_passage_questions q
SET explanation = '第2段落の "In 1859, a note was discovered... It stated that the ships had become trapped in ice and that Franklin had died in June 1847. The surviving crew had abandoned the vessels and set out on foot" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Franklin Expedition'
  AND q.question_text = 'What did the note discovered in 1859 reveal?';

UPDATE reading_passage_questions q
SET explanation = '"Later investigations revealed that many of the crew had died from lead poisoning, likely caused by the solder used to seal the tins that held their food" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Franklin Expedition'
  AND q.question_text = 'According to the passage, what is one cause of the crew''s deaths that was identified by later investigations?';

UPDATE reading_passage_questions q
SET explanation = '"In 2014 and 2016, the wrecks of the Erebus and the Terror were finally located on the seabed" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Franklin Expedition'
  AND q.question_text = 'What does the author of the passage say about the discovery of the shipwrecks?';

UPDATE reading_passage_questions q
SET explanation = '"Scientists and historians have argued that the expedition''s failure was due to a combination of factors: inadequate knowledge of Arctic conditions, reliance on outdated maps, and the harsh reality that nineteenth-century technology was simply not equal to the challenge" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Franklin Expedition'
  AND q.question_text = 'According to the final paragraph, why do scientists and historians believe the expedition failed?';

-- Passage 2: Sleep and Memory
UPDATE reading_passage_questions q
SET explanation = '"Studies have shown that people who sleep after learning new material retain it better than those who stay awake for the same period" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Sleep and Memory'
  AND q.question_text = 'According to the first paragraph, what do studies show about sleep and learning?';

UPDATE reading_passage_questions q
SET explanation = '"One of the key mechanisms... is the replay of neural patterns during sleep" および "the brain appears to ''replay'' the same patterns of activity that occurred while the person was awake and learning" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Sleep and Memory'
  AND q.question_text = 'What is one mechanism that is thought to help consolidate memory during sleep?';

UPDATE reading_passage_questions q
SET explanation = '"Some researchers have suggested that dreams may be a by-product of this consolidation process" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Sleep and Memory'
  AND q.question_text = 'What have some researchers suggested about dreams?';

UPDATE reading_passage_questions q
SET explanation = '"Lack of sleep has been linked to poorer decision-making, increased risk of accidents, and a higher likelihood of developing certain health problems" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Sleep and Memory'
  AND q.question_text = 'According to the passage, lack of sleep has been linked to';

UPDATE reading_passage_questions q
SET explanation = '"Experts argue that recognizing sleep as a fundamental component of learning and health... could lead to significant improvements in both individual well-being and societal productivity" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Sleep and Memory'
  AND q.question_text = 'What do experts argue in the final paragraph?';

-- Passage 3: Women in Computing
UPDATE reading_passage_questions q
SET explanation = '"These jobs were seen as suitable for women in part because they were repetitive and paid less than positions held by men, despite demanding accuracy and concentration" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Women in Computing'
  AND q.question_text = 'According to the first paragraph, why were computing jobs in the late 1800s seen as suitable for women?';

UPDATE reading_passage_questions q
SET explanation = '"They carried out the complex calculations needed for aircraft design and, later, for space missions" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Women in Computing'
  AND q.question_text = 'What does the passage say about the work of women at NACA?';

UPDATE reading_passage_questions q
SET explanation = '"Historian Mar Hicks has argued that the work was often classified as low-skill ''women''s work'' even though it required advanced mathematical training" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Women in Computing'
  AND q.question_text = 'According to Mar Hicks, how was the work of human computers often classified?';

UPDATE reading_passage_questions q
SET explanation = '"many of the women who had done this work were not promoted into the new roles of programmer or engineer; instead, the field became increasingly dominated by men" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Women in Computing'
  AND q.question_text = 'What happened when electronic computers began to replace human computers?';

UPDATE reading_passage_questions q
SET explanation = '"Understanding the history of how women were pushed to the margins as computing became more prestigious and better paid is essential for addressing the inequalities that persist in the present" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Women in Computing'
  AND q.question_text = 'The author of the passage suggests that';

-- Passage 4: Animal Migration
UPDATE reading_passage_questions q
SET explanation = '"Research has revealed that different species rely on a variety of cues, including the position of the sun and stars, the Earth''s magnetic field, landmarks, and even smells carried by the wind" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Animal Migration'
  AND q.question_text = 'According to the first paragraph, how do migrating animals navigate?';

UPDATE reading_passage_questions q
SET explanation = '"No single butterfly completes the round trip; instead, the migration is achieved over several generations. The butterflies that arrive in Mexico have never been there before" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Animal Migration'
  AND q.question_text = 'What is true about the monarch butterfly migration?';

UPDATE reading_passage_questions q
SET explanation = '"the monarch population has declined sharply, partly due to the loss of milkweed—the only plant on which monarch caterpillars feed—and the use of pesticides in agricultural areas" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Animal Migration'
  AND q.question_text = 'According to the passage, why has the monarch population declined in recent years?';

UPDATE reading_passage_questions q
SET explanation = '"Scientists have suggested that these animals may use the Earth''s magnetic field to orient themselves" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Animal Migration'
  AND q.question_text = 'What have scientists suggested about marine animals such as sea turtles?';

UPDATE reading_passage_questions q
SET explanation = '"Protecting the routes and stopover sites that these animals depend on is essential if we are to preserve one of nature''s most extraordinary phenomena" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Animal Migration'
  AND q.question_text = 'The author of the passage argues that';

-- Passage 5: Urban Green Spaces
UPDATE reading_passage_questions q
SET explanation = '"Research has shown that access to nature in cities is associated with better physical and mental health" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Urban Green Spaces'
  AND q.question_text = 'According to the first paragraph, what is one benefit of urban green spaces?';

UPDATE reading_passage_questions q
SET explanation = '"the ''urban heat island'' effect, in which cities become significantly warmer than the surrounding countryside because of the concentration of concrete and asphalt" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Urban Green Spaces'
  AND q.question_text = 'What is the "urban heat island" effect?';

UPDATE reading_passage_questions q
SET explanation = '"Wealthier neighborhoods frequently have more and better-maintained parks than poorer ones" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Urban Green Spaces'
  AND q.question_text = 'What does the passage say about the distribution of green space?';

UPDATE reading_passage_questions q
SET explanation = '"calls for ''green justice''—the idea that all urban residents, regardless of income or background, should have fair access to nature" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Urban Green Spaces'
  AND q.question_text = 'According to the passage, what is "green justice"?';

UPDATE reading_passage_questions q
SET explanation = '"studies have suggested that property values tend to rise near well-kept parks" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Urban Green Spaces'
  AND q.question_text = 'What do studies suggest about property values and green space?';

-- Passage 6: The Invention of the Telephone
UPDATE reading_passage_questions q
SET explanation = '"Elisha Gray... had developed a similar device and applied for a patent on the same day as Bell. The question of who arrived first—and whether Bell had access to Gray''s ideas—has been debated by historians" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Invention of the Telephone'
  AND q.question_text = 'According to the first paragraph, what is true about Bell and Gray?';

UPDATE reading_passage_questions q
SET explanation = '"Sound waves caused a diaphragm to vibrate, and these vibrations were converted into an electrical signal that could be sent along a wire" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Invention of the Telephone'
  AND q.question_text = 'How did the early telephone work?';

UPDATE reading_passage_questions q
SET explanation = '"the telephone made it possible for people to hear each other''s voices in real time, which was a profound social and economic change" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Invention of the Telephone'
  AND q.question_text = 'According to the passage, what was the main difference between the telegraph and the telephone?';

UPDATE reading_passage_questions q
SET explanation = '"the invention of the switchboard made it possible to connect many users to a single network" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Invention of the Telephone'
  AND q.question_text = 'What does the passage say about the invention of the switchboard?';

UPDATE reading_passage_questions q
SET explanation = '"The story of the telephone is thus not only one of a single inventor but of a series of innovations that together transformed how humans communicate" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Invention of the Telephone'
  AND q.question_text = 'The author of the passage concludes that';

-- Passage 7: Emotions and Decision-Making
UPDATE reading_passage_questions q
SET explanation = '"economists and psychologists tended to assume that human beings make decisions in a rational way, weighing the costs and benefits of each option" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Emotions and Decision-Making'
  AND q.question_text = 'According to the first paragraph, what was the traditional assumption about how people make decisions?';

UPDATE reading_passage_questions q
SET explanation = '"Studies have found that people who are in a positive mood may take more risks" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Emotions and Decision-Making'
  AND q.question_text = 'What have studies found about people in a positive mood?';

UPDATE reading_passage_questions q
SET explanation = '"Anger and a desire for revenge can influence both the public''s demand for harsh punishment and the decisions of judges and juries" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Emotions and Decision-Making'
  AND q.question_text = 'According to the passage, how can emotions affect the justice system?';

UPDATE reading_passage_questions q
SET explanation = '"Some legal scholars have argued that the law should take account of these emotional influences by, for example, allowing ''cooling-off'' periods before certain decisions are made" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Emotions and Decision-Making'
  AND q.question_text = 'What have some legal scholars argued?';

UPDATE reading_passage_questions q
SET explanation = '"the field of behavioral economics, which seeks to design policies and products that account for how people actually behave—often irrationally—rather than how they would behave if they were perfectly rational" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Emotions and Decision-Making'
  AND q.question_text = 'According to the final paragraph, what is behavioral economics?';

-- Passage 8: Antibiotic Resistance
UPDATE reading_passage_questions q
SET explanation = '"a few may survive because they happen to carry a genetic mutation that allows them to resist the drug. If these survivors multiply, the next generation of bacteria will be more resistant" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Antibiotic Resistance'
  AND q.question_text = 'According to the first paragraph, how does antibiotic resistance develop?';

UPDATE reading_passage_questions q
SET explanation = '"overuse and misuse of antibiotics—such as taking them for viral infections, against which they are useless, or failing to complete a full course of treatment—have accelerated this process" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Antibiotic Resistance'
  AND q.question_text = 'What does the passage say about the overuse of antibiotics?';

UPDATE reading_passage_questions q
SET explanation = '"This use can also encourage the development of resistant bacteria, which may then be transmitted to humans through food or the environment" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Antibiotic Resistance'
  AND q.question_text = 'According to the passage, why is antibiotic use in agriculture a concern?';

UPDATE reading_passage_questions q
SET explanation = '"Researchers are working on new antibiotics and alternative treatments, but development is slow and expensive" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Antibiotic Resistance'
  AND q.question_text = 'What does the passage say about the development of new antibiotics?';

UPDATE reading_passage_questions q
SET explanation = '"Addressing antibiotic resistance will require cooperation among governments, health care providers, the pharmaceutical industry, and the public" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Antibiotic Resistance'
  AND q.question_text = 'The author of the passage suggests that addressing antibiotic resistance will require';

-- Passage 9: The Dust Bowl
UPDATE reading_passage_questions q
SET explanation = '"thousands of families were forced to leave their homes in search of work and a better life" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Dust Bowl'
  AND q.question_text = 'According to the first paragraph, what happened to many families during the Dust Bowl?';

UPDATE reading_passage_questions q
SET explanation = '"The novelist John Steinbeck later depicted their plight in The Grapes of Wrath" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Dust Bowl'
  AND q.question_text = 'What does the passage say about John Steinbeck?';

UPDATE reading_passage_questions q
SET explanation = '"farmers had plowed up vast areas of native grassland to grow wheat. When the drought came, however, the exposed soil had nothing to hold it in place" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Dust Bowl'
  AND q.question_text = 'According to the passage, what was one cause of the Dust Bowl?';

UPDATE reading_passage_questions q
SET explanation = '"The federal government eventually responded with programs to promote soil conservation, including planting trees as windbreaks and teaching farmers methods to prevent erosion" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Dust Bowl'
  AND q.question_text = 'How did the federal government respond to the Dust Bowl?';

UPDATE reading_passage_questions q
SET explanation = '"The experience demonstrated that the land could be damaged by short-term profit-seeking and that restoring it required long-term commitment" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Dust Bowl'
  AND q.question_text = 'The author of the passage suggests that the Dust Bowl demonstrated that';

-- Passage 10: Plant Communication
UPDATE reading_passage_questions q
SET explanation = '"it may release volatile chemicals into the air. Neighboring plants can detect these chemicals and respond by producing their own defensive compounds" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Plant Communication'
  AND q.question_text = 'According to the first paragraph, how can a plant "warn" others when it is attacked by insects?';

UPDATE reading_passage_questions q
SET explanation = '"The fungi attach to the roots of plants and extend a network of fine threads through the soil, creating what some scientists have called the ''Wood Wide Web.'' Through this network, plants can exchange nutrients and chemical signals" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Plant Communication'
  AND q.question_text = 'What is the "Wood Wide Web" mentioned in the passage?';

UPDATE reading_passage_questions q
SET explanation = '"Studies have suggested that older, larger trees may ''share'' carbon with younger or shaded trees" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Plant Communication'
  AND q.question_text = 'What have studies suggested about older trees and younger trees?';

UPDATE reading_passage_questions q
SET explanation = '"Critics point out that the word ''communication'' implies intent and awareness, and that we do not know whether plants are conscious in any meaningful sense" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Plant Communication'
  AND q.question_text = 'According to the passage, what do critics point out about the word "communication"?';

UPDATE reading_passage_questions q
SET explanation = '"Understanding these mechanisms may have practical benefits: for example, it could lead to new ways of protecting crops from pests without relying solely on pesticides" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '準1級' AND p.passage_type = 'long_content'
  AND p.title = 'Plant Communication'
  AND q.question_text = 'The author of the passage suggests that understanding plant communication could lead to';
