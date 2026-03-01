-- seed_reading_long_content_explanations_1kyu.sql
-- 長文の内容一致（1級）の解説を reading_passage_questions.explanation に反映
-- 038 マイグレーションおよび seed_reading_long_content_1kyu_50.sql 実行後に実行

-- Passage 1: The Speed of Cultural Change
UPDATE reading_passage_questions q
SET explanation = '第1段落の "In recent decades, however, fieldwork and historical analysis have challenged this assumption. Scholars now recognize that cultural traits can spread rapidly when conditions favor them" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Speed of Cultural Change'
  AND q.question_text = 'According to the first paragraph, what has challenged the traditional view of cultural change?';

UPDATE reading_passage_questions q
SET explanation = '"One defense of the gradualist view has been that the archaeological and historical record is incomplete. Small-scale or short-lived changes may leave little trace" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Speed of Cultural Change'
  AND q.question_text = 'What is one defense of the gradualist view mentioned in the passage?';

UPDATE reading_passage_questions q
SET explanation = '"Historian Susan Reynolds has argued that the Norman Conquest of England in 1066 brought about a relatively swift transformation in law, landholding, and language at the elite level" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Speed of Cultural Change'
  AND q.question_text = 'What does the passage say about Susan Reynolds''s argument?';

UPDATE reading_passage_questions q
SET explanation = '"Economists and sociologists have used the term ''cultural lag'' to describe the delay between the adoption of a new technology and the adjustment of social norms and institutions to it" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Speed of Cultural Change'
  AND q.question_text = 'According to the passage, what is "cultural lag"?';

UPDATE reading_passage_questions q
SET explanation = '"Similarly, the introduction of the horse to the Americas... altered the way of life of many Indigenous peoples within a few decades. Such examples suggest that under the right circumstances, cultural change can be both rapid and profound" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Speed of Cultural Change'
  AND q.question_text = 'The example of the introduction of the horse to the Americas illustrates that';

-- Passage 2: The Minoan Civilization
UPDATE reading_passage_questions q
SET explanation = '"Early excavations... led scholars to portray Minoan society as peaceful, prosperous, and dominated by a priestly or royal elite" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Minoan Civilization'
  AND q.question_text = 'Early excavations of Knossos indicated that';

UPDATE reading_passage_questions q
SET explanation = '"Archaeologist Jan Driessen and others have argued that the ''palaces'' may have served multiple functions—political, economic, and religious—and that power was perhaps more distributed among regional centres than Evans assumed" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Minoan Civilization'
  AND q.question_text = 'What have Jan Driessen and others argued about the Minoan palaces?';

UPDATE reading_passage_questions q
SET explanation = '"the discovery of writing systems—Linear A remains undeciphered—has highlighted how much we still do not know about Minoan governance and belief" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Minoan Civilization'
  AND q.question_text = 'According to the passage, what has the discovery of Linear A highlighted?';

UPDATE reading_passage_questions q
SET explanation = '"The collapse of Minoan civilization remains a subject of debate. The eruption of the Thera volcano... is often cited as a contributing factor... Invasion by Mycenaean Greeks from the mainland may have delivered a final blow" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Minoan Civilization'
  AND q.question_text = 'What does the passage say about the collapse of Minoan civilization?';

UPDATE reading_passage_questions q
SET explanation = '"Understanding the Minoans thus continues to require a balance between the evidence at hand and the recognition that new discoveries can fundamentally alter our interpretation of the past" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Minoan Civilization'
  AND q.question_text = 'The author of the passage suggests that';

-- Passage 3: Algorithmic Bias
UPDATE reading_passage_questions q
SET explanation = '第1段落の "facial recognition software has been shown to misidentify people of colour more often than white people, and where algorithms used to screen job applicants have inadvertently favoured candidates who mirror the demographics of historically successful employees" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Algorithmic Bias'
  AND q.question_text = 'In the first paragraph, the author illustrates the problem of algorithmic bias by mentioning cases where';

UPDATE reading_passage_questions q
SET explanation = '"ethicists point out that the avatars they create may not accurately reflect the personality or wishes of the deceased, and that consent—whether the deceased would have agreed to such use of their data—is frequently unclear" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Algorithmic Bias'
  AND q.question_text = 'What is one concern the author cites with regard to companies in the "digital afterlife" industry?';

UPDATE reading_passage_questions q
SET explanation = '"they often arise because the data used to train the systems reflect past discrimination or underrepresentation. If the data are biased, the algorithm will learn and perpetuate that bias" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Algorithmic Bias'
  AND q.question_text = 'According to the passage, why do biased outcomes often arise in algorithms?';

UPDATE reading_passage_questions q
SET explanation = '"Some researchers argue that transparency and oversight can mitigate algorithmic bias. Requiring that certain high-stakes algorithms be audited for fairness, or that their logic be explainable" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Algorithmic Bias'
  AND q.question_text = 'What do some researchers argue can mitigate algorithmic bias?';

UPDATE reading_passage_questions q
SET explanation = '"Others caution that technical fixes are insufficient without broader social change; if the underlying data and the institutions that use them remain biased, even a ''fair'' algorithm may produce unfair outcomes" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Algorithmic Bias'
  AND q.question_text = 'The author of the passage implies that';

-- Passage 4: The Byzantine Empire and the West
UPDATE reading_passage_questions q
SET explanation = '"Historian Judith Herrin has argued that the Byzantines were not merely the inheritors of Roman tradition but actively shaped the development of Europe and the Mediterranean" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Byzantine Empire and the West'
  AND q.question_text = 'What does Judith Herrin believe about the Byzantines?';

UPDATE reading_passage_questions q
SET explanation = '"One thing that we learn about the way the Byzantines ruled their territory is that they relied on a sophisticated bureaucracy, a professional army, and a network of provinces administered from Constantinople" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Byzantine Empire and the West'
  AND q.question_text = 'What is one thing that we learn about the way the Byzantines ruled their territory?';

UPDATE reading_passage_questions q
SET explanation = '"Historian Jonathan Harris has suggested that the Byzantines'' survival for so long was due in part to their ability to assimilate and adapt" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Byzantine Empire and the West'
  AND q.question_text = 'According to Jonathan Harris, why did the Byzantines survive for so long?';

UPDATE reading_passage_questions q
SET explanation = '"The fall of Constantinople to the Ottomans in 1453 is often cited as a turning point that pushed Greek scholars and texts westward, contributing to the Renaissance" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Byzantine Empire and the West'
  AND q.question_text = 'What does the passage say about the fall of Constantinople in 1453?';

UPDATE reading_passage_questions q
SET explanation = 'Herrin の主張 "actively shaped the development of Europe and the Mediterranean" および "contact between the two was constant" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Byzantine Empire and the West'
  AND q.question_text = 'Which of the following would Herrin most likely agree with?';

-- Passage 5: Confession and the Justice System
UPDATE reading_passage_questions q
SET explanation = '"One reason that clearance rates may not be an accurate measure of police competence is that the nature of crime has changed: a shift... to offences involving strangers or firearms can make cases harder to solve" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Confession and the Justice System'
  AND q.question_text = 'What is one reason that clearance rates may not be an accurate measure of police competence?';

UPDATE reading_passage_questions q
SET explanation = '"Some researchers have suggested that high clearance rates in the 1960s may have been achieved in part through methods that would not be acceptable today" および "The implication is that the justice system in earlier decades may have been more willing to tolerate practices that violated suspects'' rights" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Confession and the Justice System'
  AND q.question_text = 'What does the author of the passage imply about the justice system in earlier decades?';

UPDATE reading_passage_questions q
SET explanation = '"such reforms were intended to protect the rights of suspects and reduce the risk of false confessions" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Confession and the Justice System'
  AND q.question_text = 'According to the passage, what was the purpose of reforms governing interrogations?';

UPDATE reading_passage_questions q
SET explanation = '"It is possible that the decline in clearance rates has had the effect of undermining public confidence in law enforcement and reducing the deterrent effect of the criminal justice system" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Confession and the Justice System'
  AND q.question_text = 'It is possible that the decline in clearance rates has had the effect of';

UPDATE reading_passage_questions q
SET explanation = '"there is no consensus on whether the reforms of the past decades have produced a fairer system at the cost of fewer solved cases" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Confession and the Justice System'
  AND q.question_text = 'What does the passage say about the debate over clearance rates?';

-- Passage 6: Napoleon and the Napoleonic Code
UPDATE reading_passage_questions q
SET explanation = '"Historian Robert Holtman has argued that Napoleon ensured the survival and spread of revolutionary principles in part through the creation of a unified legal code" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Napoleon and the Napoleonic Code'
  AND q.question_text = 'According to Robert Holtman, how did Napoleon ensure the spread of revolutionary principles?';

UPDATE reading_passage_questions q
SET explanation = '"The Napoleonic Code... replaced this with a single, secular body of law that emphasized equality before the law, property rights, and the abolition of hereditary nobility" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Napoleon and the Napoleonic Code'
  AND q.question_text = 'What did the Napoleonic Code emphasize?';

UPDATE reading_passage_questions q
SET explanation = '"According to historian Fiona Campbell, the fact that the ceremony to promulgate the code was held in Paris rather than in a conquered capital was intended to emphasize that the code was a French achievement, rooted in Enlightenment ideals" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Napoleon and the Napoleonic Code'
  AND q.question_text = 'According to Fiona Campbell, why was the ceremony to promulgate the code held in Paris?';

UPDATE reading_passage_questions q
SET explanation = '"Campbell has suggested that this choice reflected Napoleon''s desire to be seen as a lawgiver and reformer, not only as a military leader" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Napoleon and the Napoleonic Code'
  AND q.question_text = 'What does Campbell suggest about Napoleon''s desire?';

UPDATE reading_passage_questions q
SET explanation = '"It placed women and children under the authority of husbands and fathers... and reinstated slavery in French colonies" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Napoleon and the Napoleonic Code'
  AND q.question_text = 'The author of the passage points out that the Napoleonic Code';

-- Passage 7: Climate and Civilization
UPDATE reading_passage_questions q
SET explanation = '"In recent years, improved methods... have allowed researchers to reconstruct past climates with greater precision. The result has been a more nuanced picture: climate has often acted as one factor among many" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Climate and Civilization'
  AND q.question_text = 'According to the first paragraph, what has changed in recent years regarding the study of climate and civilization?';

UPDATE reading_passage_questions q
SET explanation = '"Archaeologist Harvey Weiss has argued that a prolonged drought in the late third millennium BCE contributed to the collapse of the Akkadian Empire in Mesopotamia and to upheavals in the Nile Valley and the Indus Valley" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Climate and Civilization'
  AND q.question_text = 'What does Harvey Weiss argue?';

UPDATE reading_passage_questions q
SET explanation = '"The example of the Maya illustrates that environmental stress can accelerate decline when it coincides with warfare, overpopulation, or political fragmentation" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Climate and Civilization'
  AND q.question_text = 'The example of the Maya illustrates that';

UPDATE reading_passage_questions q
SET explanation = '"Critics caution that analogies between past and present can be misleading—modern technology and institutions may allow for adaptation that was not possible in the past" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Climate and Civilization'
  AND q.question_text = 'What do critics caution about analogies between past and present climate change?';

UPDATE reading_passage_questions q
SET explanation = '"Weiss suggests that societies that had become dependent on intensive agriculture were particularly vulnerable when rainfall patterns shifted" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Climate and Civilization'
  AND q.question_text = 'According to Weiss, which societies were particularly vulnerable to drought?';

-- Passage 8: The Placebo Effect
UPDATE reading_passage_questions q
SET explanation = '"studies have shown that placebos can produce measurable physiological changes, including the release of endorphins, changes in brain activity, and even alterations in immune response" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Placebo Effect'
  AND q.question_text = 'According to the passage, what have recent studies shown about placebos?';

UPDATE reading_passage_questions q
SET explanation = '"Psychologist Irving Kirsch has argued that much of the benefit attributed to antidepressant medication may be due to the placebo effect" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Placebo Effect'
  AND q.question_text = 'What does Irving Kirsch argue?';

UPDATE reading_passage_questions q
SET explanation = '"One concern that ethicists cite with regard to the use of placebos in medicine is that withholding effective treatment from patients in a control group may be unethical when a proven therapy exists" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Placebo Effect'
  AND q.question_text = 'What is one concern that ethicists cite with regard to the use of placebos?';

UPDATE reading_passage_questions q
SET explanation = '"Some researchers have suggested that doctors could harness the placebo effect ethically by creating positive expectations and by using rituals of care" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Placebo Effect'
  AND q.question_text = 'According to the passage, how could doctors harness the placebo effect ethically?';

UPDATE reading_passage_questions q
SET explanation = '"The placebo effect thus challenges simple distinctions between mind and body and between ''authentic'' and ''inauthentic'' healing" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Placebo Effect'
  AND q.question_text = 'The author of the passage suggests that the placebo effect';

-- Passage 9: Literacy and Power
UPDATE reading_passage_questions q
SET explanation = '"Historians and sociologists have shown, however, that the relationship between literacy and power is more complex. In many societies, writing was initially the preserve of elites" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Literacy and Power'
  AND q.question_text = 'According to the first paragraph, what have historians and sociologists shown about literacy?';

UPDATE reading_passage_questions q
SET explanation = '"In some cases, governments promoted literacy in order to integrate populations... In other cases, literacy was suppressed or restricted—for example, under slavery in the Americas, where teaching enslaved people to read was often illegal" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Literacy and Power'
  AND q.question_text = 'What is one thing that we learn about the way literacy was used in different contexts?';

UPDATE reading_passage_questions q
SET explanation = '"The historian Carlo Ginzburg has argued that the ability of ordinary people to read and interpret texts for themselves was a crucial factor in the Reformation and in later political revolutions" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Literacy and Power'
  AND q.question_text = 'What does Carlo Ginzburg argue?';

UPDATE reading_passage_questions q
SET explanation = '"Ginzburg''s interpretation suggests that literacy could serve either as an instrument of control or as a tool for resistance, depending on who had access to it and how it was used" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Literacy and Power'
  AND q.question_text = 'According to Ginzburg''s interpretation, literacy could serve as';

UPDATE reading_passage_questions q
SET explanation = '"The history of literacy thus offers no simple lesson—only a reminder that the distribution of knowledge and the power to communicate have always been contested" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'Literacy and Power'
  AND q.question_text = 'The author of the passage concludes that the history of literacy';

-- Passage 10: The Printing Revolution
UPDATE reading_passage_questions q
SET explanation = '"Historian Elizabeth Eisenstein has argued that the printing press did not merely speed up the production of books but fundamentally altered the way knowledge was produced, stored, and disseminated" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Printing Revolution'
  AND q.question_text = 'What does Elizabeth Eisenstein argue about the printing press?';

UPDATE reading_passage_questions q
SET explanation = '"Eisenstein suggests that this ''fixity'' of the printed word was a precondition for the rise of modern science, as it allowed researchers to build on and correct the work of others with a shared reference point" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Printing Revolution'
  AND q.question_text = 'According to Eisenstein, why was the "fixity" of the printed word important for science?';

UPDATE reading_passage_questions q
SET explanation = '"Initially, the Church used the press to produce indulgences, liturgical texts, and anti-heretical pamphlets... The Church responded with censorship, the Index of Forbidden Books, and the promotion of orthodox works" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Printing Revolution'
  AND q.question_text = 'What is one thing that we learn about the way the Catholic Church responded to printing?';

UPDATE reading_passage_questions q
SET explanation = '"According to historian Andrew Pettegree, the fact that the Reformation and the printing press emerged in the same period was no coincidence: the press enabled reformers to reach a mass audience and to coordinate across regions" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Printing Revolution'
  AND q.question_text = 'According to Andrew Pettegree, why was the coincidence of the Reformation and the printing press significant?';

UPDATE reading_passage_questions q
SET explanation = '"The example of the scientific revolution illustrates that the ability to publish and compare findings was essential to the development of modern knowledge" が根拠です。'
FROM reading_passages p
WHERE q.passage_id = p.id AND p.level = '1級' AND p.passage_type = 'long_content'
  AND p.title = 'The Printing Revolution'
  AND q.question_text = 'The example of the scientific revolution illustrates that';
