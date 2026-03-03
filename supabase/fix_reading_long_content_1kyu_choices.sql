-- fix_reading_long_content_1kyu_choices.sql
-- 1級長文内容一致の選択肢を修正：正解と誤答の文字量・説得力を均一化し、
-- 内容を理解しないと正解できないようにする
-- seed_reading_long_content_1kyu_50.sql 実行後に実行

-- Passage 1: The Speed of Cultural Change
UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Early twentieth-century ethnography confirmed that cultures evolve slowly and that customs are passed down with only incremental modification.",
  "Fieldwork and historical analysis have shown that cultural traits can spread rapidly under favorable conditions.",
  "Scholars now believe that customs and technologies never change and that cultural diffusion always takes millennia.",
  "The spread of agriculture and writing systems has been shown to occur only over many generations with no exceptions."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Speed of Cultural Change' AND rpq.order_num = 0;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "All cultural change is rapid and leaves clear traces in the archaeological record.",
  "The archaeological and historical record is incomplete, so small-scale changes may leave little trace.",
  "The Norman Conquest had no effect on England and peasant life changed faster than elite life.",
  "Proponents of punctuated change argue that the historical record is complete and unambiguous."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Speed of Cultural Change' AND rpq.order_num = 1;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "She argued that the Norman Conquest had no effect on law, landholding, or language at any level.",
  "She argued that the Norman Conquest brought about a relatively swift transformation in law, landholding, and language at the elite level.",
  "She argued that peasant life changed faster than elite life and that the Conquest had no lasting impact.",
  "She rejected the idea of punctuated cultural change and defended the gradualist view exclusively."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Speed of Cultural Change' AND rpq.order_num = 2;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "The delay between the adoption of a new technology and the adjustment of social norms and institutions to it.",
  "The speed at which technology spreads compared to the speed at which beliefs and institutions change.",
  "The resistance of deeply held beliefs to change when new technologies are introduced into a society.",
  "The rapid spread of religious ideas and cultural practices following contact between societies."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Speed of Cultural Change' AND rpq.order_num = 3;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "cultural change always takes millennia and cannot occur within a few decades under any circumstances.",
  "under the right circumstances, cultural change can be both rapid and profound.",
  "Indigenous peoples did not adopt new technologies and European settlers did not change their way of life.",
  "the introduction of the horse had no effect on the Americas and cultural diffusion is always gradual."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Speed of Cultural Change' AND rpq.order_num = 4;

-- Passage 2: The Minoan Civilization
UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Minoan society was highly militaristic and focused primarily on warfare and fortifications.",
  "Minoan society was peaceful, prosperous, and dominated by a priestly or royal elite.",
  "The Minoans had no writing system and the palaces were used only for religious ceremonies.",
  "Early excavations indicated that the palaces served multiple political and economic functions from the start."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Minoan Civilization' AND rpq.order_num = 0;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "They were used only for storage and had no political or religious function whatsoever.",
  "The palaces may have served multiple functions and power was perhaps more distributed than Evans assumed.",
  "They were built after the Thera eruption and had no connection to regional centres.",
  "Evans was correct that power was centralized and the palaces served a single administrative purpose."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Minoan Civilization' AND rpq.order_num = 1;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "That the Minoans had no writing system and that Evans was correct about Minoan governance.",
  "How much we still do not know about Minoan governance and belief.",
  "That Evans was correct about everything and that Linear A has now been fully deciphered.",
  "That the Minoans spoke Greek and that we have a complete understanding of their belief systems."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Minoan Civilization' AND rpq.order_num = 2;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "It is fully explained by the Thera eruption and there is no longer any debate among scholars.",
  "The eruption of Thera and possible invasion by Mycenaean Greeks are often cited; the collapse remains a subject of debate.",
  "It was caused only by internal conflict and had no connection to external factors or natural disasters.",
  "It had no effect on later Greek culture and the Minoan legacy was completely forgotten."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Minoan Civilization' AND rpq.order_num = 3;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "new discoveries can fundamentally alter our interpretation of the Minoan past.",
  "Evans''s view of the Minoans has been fully confirmed and Linear A has now been deciphered.",
  "The Minoans had no influence on later Greece and the legend of the Minotaur has no connection to Knossos.",
  "Archaeological evidence is complete and no new discoveries will change our understanding of the Minoans."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Minoan Civilization' AND rpq.order_num = 4;

-- Passage 3: Algorithmic Bias
UPDATE public.reading_passage_questions rpq
SET choices = '[
  "algorithms have eliminated all bias and the data used to train systems are always unbiased.",
  "facial recognition has misidentified people of colour more often, and job-screening algorithms have favoured candidates who mirror historically successful demographics.",
  "companies have refused to use algorithms in hiring and facial recognition is never used in policing.",
  "the problem has been solved through transparency and oversight and bias is no longer a concern."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Algorithmic Bias' AND rpq.order_num = 0;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "They do not use enough data and the avatars they create are always accurate reflections of the deceased.",
  "The avatars they create may not accurately reflect the personality of the deceased, and consent is frequently unclear.",
  "They charge too little and they only serve the poor, making digital immortality accessible to everyone.",
  "The consent of the deceased is always clearly obtained and there are no ethical issues with the technology."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Algorithmic Bias' AND rpq.order_num = 1;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Because programmers intend to discriminate and algorithms are not used in hiring or lending decisions.",
  "Because the data used to train the systems reflect past discrimination or underrepresentation.",
  "Because facial recognition is never used and algorithms are always audited for fairness before deployment.",
  "Because the institutions that use algorithms have eliminated all bias from their data and practices."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Algorithmic Bias' AND rpq.order_num = 2;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Keeping all algorithms secret and avoiding any external oversight or auditing of their logic.",
  "Transparency and oversight, such as auditing algorithms for fairness.",
  "Using only small amounts of data and avoiding the use of algorithms in high-stakes decisions entirely.",
  "Technical fixes alone are sufficient and broader social change is not necessary to address bias."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Algorithmic Bias' AND rpq.order_num = 3;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "technical fixes alone are sufficient and algorithmic bias is no longer a concern.",
  "others caution that technical fixes are insufficient without broader social change.",
  "the digital afterlife industry has no ethical issues and consent is always clear.",
  "the debate is confined to computer science and has no implications for law, ethics, or policy."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Algorithmic Bias' AND rpq.order_num = 4;

-- Passage 4: The Byzantine Empire and the West
UPDATE public.reading_passage_questions rpq
SET choices = '[
  "They had no influence on Europe and maintained no contact with the Latin-speaking West.",
  "They were not merely inheritors of Roman tradition but actively shaped the development of Europe and the Mediterranean.",
  "They spoke only Latin and had no distinct cultural identity from the Roman Empire.",
  "They were merely inheritors of Roman tradition and did not transmit Greek or Roman learning to the West."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Byzantine Empire and the West' AND rpq.order_num = 0;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "They used a fragmented feudal system like Western Europe and had no centralized administration.",
  "They relied on a sophisticated bureaucracy, a professional army, and a network of provinces administered from Constantinople.",
  "They had no army and did not collect taxes, relying instead on voluntary contributions from provinces.",
  "They abandoned the use of Greek and adopted Latin as their primary language of administration."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Byzantine Empire and the West' AND rpq.order_num = 1;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Because they avoided all contact with other cultures and refused to adopt new military technologies.",
  "Due in part to their ability to assimilate and adapt.",
  "Because the West never attacked them and they faced no external threats from Persians or Arabs.",
  "Because they had no enemies and maintained a policy of complete isolation from the Mediterranean."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Byzantine Empire and the West' AND rpq.order_num = 2;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "It had no effect on the West and Greek scholars did not flee to Western Europe.",
  "It is often cited as a turning point that pushed Greek scholars and texts westward, contributing to the Renaissance.",
  "It occurred in 1204 and was caused by the Persians rather than the Ottoman Turks.",
  "It marked the beginning of Byzantine expansion and the empire''s influence increased after 1453."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Byzantine Empire and the West' AND rpq.order_num = 3;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "The Byzantines had no cultural impact and contact with the West was minimal throughout their history.",
  "The Byzantines actively shaped Europe through the transmission of learning and constant contact with the West.",
  "Byzantium and the West had no contact and the empire had no influence on the civilization that followed.",
  "The Byzantine Empire did not last long and its fall had no consequences for European development."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Byzantine Empire and the West' AND rpq.order_num = 4;

-- Passage 5: Confession and the Justice System
UPDATE public.reading_passage_questions rpq
SET choices = '[
  "The criteria for solving a case have not changed and the nature of crime has remained constant over time.",
  "The nature of crime has changed; offences involving strangers or firearms can make cases harder to solve.",
  "Police have become less competent and fewer crimes are committed today than in previous decades.",
  "Clearance rates have increased and domestic violence cases are now easier to solve than ever before."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Confession and the Justice System' AND rpq.order_num = 0;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "It was always fair and stricter interrogation rules had no effect on the ability to obtain confessions.",
  "It may have been more willing to tolerate practices that violated suspects'' rights in order to secure convictions.",
  "Stricter interrogation rules had no effect and clearance rates were lower in the 1960s than they are today.",
  "The justice system never violated suspects'' rights and all confessions were obtained through ethical means."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Confession and the Justice System' AND rpq.order_num = 1;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "To increase clearance rates and make it easier for police to obtain confessions through prolonged questioning.",
  "To protect the rights of suspects and reduce the risk of false confessions.",
  "To make it easier to obtain confessions and to eliminate the right to legal counsel during interrogations.",
  "To ensure that all suspects would confess and to reduce the number of cases that went to trial."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Confession and the Justice System' AND rpq.order_num = 2;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "increasing the number of police officers and making all cases easier to solve through forensic technology.",
  "undermining public confidence in law enforcement and reducing the deterrent effect of the criminal justice system.",
  "making all cases easier to solve and eliminating the need for confessions in criminal prosecutions.",
  "strengthening the rights of the accused and ensuring that no suspect is ever wrongfully convicted."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Confession and the Justice System' AND rpq.order_num = 3;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "There is full consensus on the causes and all scholars agree that police competence has declined.",
  "There is no consensus on whether reforms have produced a fairer system at the cost of fewer solved cases.",
  "The debate has ended and it is clear that the reforms of the past decades have had no effect on clearance rates.",
  "All scholars agree that the decline in clearance rates is due solely to a decline in investigative effectiveness."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Confession and the Justice System' AND rpq.order_num = 4;

-- Passage 6: Napoleon and the Napoleonic Code
UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Only through military conquest and by imposing French law on conquered territories without any legal reform.",
  "In part through the creation of a unified legal code.",
  "By abolishing all laws and restoring the patchwork of regional and ecclesiastical courts that existed before.",
  "By restoring the nobility and ensuring that hereditary privileges were maintained throughout Europe."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Napoleon and the Napoleonic Code' AND rpq.order_num = 0;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Regional laws and feudal privileges, with ecclesiastical courts retaining their authority.",
  "Equality before the law, property rights, and the abolition of hereditary nobility.",
  "Ecclesiastical courts and the restoration of serfdom throughout France and its territories.",
  "The maintenance of hereditary nobility and the preservation of regional legal differences."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Napoleon and the Napoleonic Code' AND rpq.order_num = 1;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "To celebrate a military victory and to demonstrate Napoleon''s power over conquered territories.",
  "To emphasize that the code was a French achievement, rooted in Enlightenment ideals.",
  "Because Napoleon had no other capital and Paris was the only suitable location for such a ceremony.",
  "To please the nobility and to signal that the Revolution''s achievements would be reversed."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Napoleon and the Napoleonic Code' AND rpq.order_num = 2;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "He wanted only to be seen as a military leader and had no interest in legal reform or the code.",
  "He wanted to be seen as a lawgiver and reformer, not only as a military leader.",
  "He wanted to abolish the code and restore the legal system that existed before the Revolution.",
  "He had no interest in law and the promulgation ceremony was held against his wishes."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Napoleon and the Napoleonic Code' AND rpq.order_num = 3;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "had no critics and was universally praised for advancing equality in all areas of society.",
  "placed women and children under the authority of husbands and fathers, and reinstated slavery in colonies.",
  "abolished all inequality and ensured that workers had full rights to form associations.",
  "was never applied outside France and had no influence on civil law in other regions."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Napoleon and the Napoleonic Code' AND rpq.order_num = 4;

-- Passage 7: Climate and Civilization
UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Scholars no longer believe climate mattered and all ancient collapses are now attributed only to political factors.",
  "Improved methods have allowed a more nuanced picture: climate acts as one factor among many.",
  "All ancient collapses are now attributed only to climate and environmental factors are seen as determining outcomes.",
  "No new data are available and early twentieth-century views have been fully confirmed by recent research."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Climate and Civilization' AND rpq.order_num = 0;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Climate had no effect on the Akkadian Empire and only the Maya were affected by drought.",
  "A prolonged drought contributed to the collapse of the Akkadian Empire and to upheavals in the Nile and Indus Valleys.",
  "All societies in affected regions collapsed and none were able to adapt to changing rainfall patterns.",
  "Only nomadic societies were vulnerable and intensive agriculture was unaffected by climate shifts."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Climate and Civilization' AND rpq.order_num = 1;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "environmental stress has no effect on civilization and the Maya had no political problems.",
  "environmental stress can accelerate decline when it coincides with warfare, overpopulation, or political fragmentation.",
  "climate never affects human societies and the Maya collapse was caused solely by external invasion.",
  "all societies adapt successfully to environmental change and the Maya are an exception that proves the rule."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Climate and Civilization' AND rpq.order_num = 2;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "They are always accurate and past societies were more resilient than modern ones.",
  "They can be misleading; modern technology and institutions may allow for adaptation that was not possible in the past.",
  "Past societies were more resilient and current warming poses no threat to global stability.",
  "Current warming is not a threat and analogies between past and present are essential for policy-making."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Climate and Civilization' AND rpq.order_num = 3;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Nomadic societies that had no dependence on agriculture or fixed settlements.",
  "Societies that had become dependent on intensive agriculture.",
  "Industrial societies with diversified economies and advanced technology.",
  "Societies with no agriculture that relied entirely on hunting and gathering."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Climate and Civilization' AND rpq.order_num = 4;

-- Passage 8: The Placebo Effect
UPDATE public.reading_passage_questions rpq
SET choices = '[
  "They work only for pain and anxiety and have no effect on other conditions.",
  "They can produce measurable physiological changes, including release of endorphins and changes in brain activity.",
  "They have no effect and the placebo response is entirely imagined by patients.",
  "They work only when patients are deceived and are never effective when patients know they are receiving placebos."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Placebo Effect' AND rpq.order_num = 0;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Antidepressants have no placebo component and the difference between drug and placebo is always significant.",
  "Much of the benefit attributed to antidepressants may be due to the placebo effect.",
  "Placebos never work and clinical trials are always well designed and their results accurately reported.",
  "The placebo effect has been fully explained and there is no need for greater scrutiny of trial design."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Placebo Effect' AND rpq.order_num = 1;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Placebos are too expensive and doctors never use them in clinical practice.",
  "Withholding effective treatment from patients in a control group may be unethical when a proven therapy exists.",
  "Placebos work too well and may make it unnecessary to develop new drugs for many conditions.",
  "Doctors never use placebos and the concern applies only to research settings, not clinical practice."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Placebo Effect' AND rpq.order_num = 2;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "By deceiving patients about whether they are receiving an active drug or a placebo.",
  "By creating positive expectations and using rituals of care.",
  "By never prescribing placebos and avoiding any form of expectation or suggestion.",
  "By avoiding examinations and minimizing the time spent with patients during consultations."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Placebo Effect' AND rpq.order_num = 3;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "is only psychological and has no physiological basis or measurable effects.",
  "challenges simple distinctions between mind and body and between authentic and inauthentic healing.",
  "has been fully explained and there is no debate over its nature or ethical implications.",
  "should never be studied because it complicates the evaluation of which treatments truly work."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Placebo Effect' AND rpq.order_num = 4;

-- Passage 9: Literacy and Power
UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Literacy always empowers the poor and has never reinforced existing hierarchies in any society.",
  "The relationship between literacy and power is more complex; writing was initially the preserve of elites.",
  "Literacy has never reinforced hierarchies and access to education has always been equal across class and gender.",
  "Access to education has always been equal and the spread of literacy has never been contested by those in power."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Literacy and Power' AND rpq.order_num = 0;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Governments never promoted literacy and enslaved people were always taught to read in the Americas.",
  "In some cases governments promoted literacy to integrate populations; in others, literacy was suppressed, as under slavery.",
  "Literacy was never restricted and all governments encouraged the spread of reading and writing to all populations.",
  "Enslaved people were always taught to read and literacy was never used as an instrument of control."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Literacy and Power' AND rpq.order_num = 1;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "Literacy had no role in the Reformation and only elites could read during that period.",
  "The ability of ordinary people to read and interpret texts was a crucial factor in the Reformation and in later political revolutions.",
  "Only elites could read during the Reformation and literacy was never a tool for resistance or political change.",
  "Literacy was never a tool for resistance and was always used only to reinforce the power of rulers and priests."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Literacy and Power' AND rpq.order_num = 2;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "only an instrument of control and never a tool for resistance or political change.",
  "either an instrument of control or a tool for resistance, depending on access and use.",
  "only a tool for resistance and never used to reinforce the power of elites or governments.",
  "neither control nor resistance and literacy has no connection to power in any society."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Literacy and Power' AND rpq.order_num = 3;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "offers a simple lesson that literacy always liberates and empowers those who acquire it.",
  "offers no simple lesson—only a reminder that the distribution of knowledge has always been contested.",
  "proves that literacy always liberates and that the same technology cannot be used both to liberate and to dominate.",
  "has no relevance today and digital literacy raises no questions about inequality or political manipulation."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'Literacy and Power' AND rpq.order_num = 4;

-- Passage 10: The Printing Revolution
UPDATE public.reading_passage_questions rpq
SET choices = '[
  "It only speeded up book production and had no effect on how knowledge was produced or disseminated.",
  "It fundamentally altered the way knowledge was produced, stored, and disseminated.",
  "It had no effect on science and was used only by the Church for religious texts.",
  "It prevented the spread of ideas and made it harder for researchers to build on the work of others."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Printing Revolution' AND rpq.order_num = 0;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "It had no importance for science and prevented researchers from sharing their findings.",
  "It allowed researchers to build on and correct the work of others with a shared reference point.",
  "It prevented the spread of ideas and made it impossible for readers in different places to refer to the same text.",
  "It was only important for religion and had no connection to the rise of modern science."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Printing Revolution' AND rpq.order_num = 1;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "It never used the press and had no response to the spread of vernacular Bibles or Protestant tracts.",
  "Initially it used the press for indulgences and orthodox texts; later it responded with censorship and the Index of Forbidden Books.",
  "It encouraged vernacular Bibles from the start and never attempted to censor or control the spread of printed works.",
  "It had no response to Protestant tracts and the Reformation had no connection to the printing press."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Printing Revolution' AND rpq.order_num = 2;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "It was not significant and the Church controlled the press completely throughout the period.",
  "The press enabled reformers to reach a mass audience and to coordinate across regions.",
  "The Church controlled the press completely and reformers had no access to printing technology.",
  "Printing had no effect on the Reformation and the two emerged in the same period only by coincidence."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Printing Revolution' AND rpq.order_num = 3;

UPDATE public.reading_passage_questions rpq
SET choices = '[
  "printing had no effect on science and the scientific revolution occurred before the invention of the press.",
  "the ability to publish and compare findings was essential to the development of modern knowledge.",
  "science existed only before printing and the press had no connection to the rise of modern science.",
  "only the Church supported science and reformers had no interest in scientific publication."
]'::jsonb
FROM public.reading_passages rp
WHERE rpq.passage_id = rp.id AND rp.level = '1級' AND rp.passage_type = 'long_content'
  AND rp.title = 'The Printing Revolution' AND rpq.order_num = 4;
