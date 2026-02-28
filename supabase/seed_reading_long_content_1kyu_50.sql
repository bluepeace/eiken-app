-- seed_reading_long_content_1kyu_50.sql
-- 英検1級 長文の内容一致選択 50問（10パッセージ×5問）
-- 本番形式：問題文A 約500語・3問／問題文B 約800語・4問。本シードは練習用に各パッセージ5問・約500語。
-- 038 以降のマイグレーション実行後に実行

-- ========== Passage 1: The Speed of Cultural Change (science / society) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '1級', 'expository', 'long_content',
  'The Speed of Cultural Change

Anthropologists have long debated whether cultural change occurs gradually, over many generations, or in sudden bursts following contact between societies or major environmental shifts. The traditional view, influenced by early twentieth-century ethnography, held that cultures evolve slowly and that customs, languages, and technologies are passed down with only incremental modification. In recent decades, however, fieldwork and historical analysis have challenged this assumption. Scholars now recognize that cultural traits can spread rapidly when conditions favor them—for example, when a more efficient tool or a more successful strategy is observed and adopted by neighbouring groups. The spread of agriculture, the adoption of writing systems, and the diffusion of religious ideas have often occurred over centuries rather than millennia, and in some cases over just a few generations.

One defense of the gradualist view has been that the archaeological and historical record is incomplete. Small-scale or short-lived changes may leave little trace, giving the impression that shifts were abrupt when in fact they were preceded by a long period of experimentation. Nevertheless, proponents of "punctuated" cultural change point to well-documented cases. Historian Susan Reynolds has argued that the Norman Conquest of England in 1066 brought about a relatively swift transformation in law, landholding, and language at the elite level, even if peasant life changed more slowly. Similarly, the introduction of the horse to the Americas by European settlers altered the way of life of many Indigenous peoples within a few decades. Such examples suggest that under the right circumstances, cultural change can be both rapid and profound.

A further complication is that not all elements of a culture change at the same rate. Technology may spread quickly while deeply held beliefs resist change. Economists and sociologists have used the term "cultural lag" to describe the delay between the adoption of a new technology and the adjustment of social norms and institutions to it. The rise of the internet, for instance, has forced societies to grapple with questions of privacy, intellectual property, and the nature of community that were not fully anticipated when the technology first spread. Understanding the pace of cultural change thus requires attention not only to the diffusion of innovations but also to the resistance and adaptation that characterize human societies.',
  'The Speed of Cultural Change',
  'The Speed of Cultural Change

Anthropologists have long debated whether cultural change occurs gradually, over many generations, or in sudden bursts following contact between societies or major environmental shifts. The traditional view, influenced by early twentieth-century ethnography, held that cultures evolve slowly and that customs, languages, and technologies are passed down with only incremental modification. In recent decades, however, fieldwork and historical analysis have challenged this assumption. Scholars now recognize that cultural traits can spread rapidly when conditions favor them—for example, when a more efficient tool or a more successful strategy is observed and adopted by neighbouring groups. The spread of agriculture, the adoption of writing systems, and the diffusion of religious ideas have often occurred over centuries rather than millennia, and in some cases over just a few generations.

One defense of the gradualist view has been that the archaeological and historical record is incomplete. Small-scale or short-lived changes may leave little trace, giving the impression that shifts were abrupt when in fact they were preceded by a long period of experimentation. Nevertheless, proponents of "punctuated" cultural change point to well-documented cases. Historian Susan Reynolds has argued that the Norman Conquest of England in 1066 brought about a relatively swift transformation in law, landholding, and language at the elite level, even if peasant life changed more slowly. Similarly, the introduction of the horse to the Americas by European settlers altered the way of life of many Indigenous peoples within a few decades. Such examples suggest that under the right circumstances, cultural change can be both rapid and profound.

A further complication is that not all elements of a culture change at the same rate. Technology may spread quickly while deeply held beliefs resist change. Economists and sociologists have used the term "cultural lag" to describe the delay between the adoption of a new technology and the adjustment of social norms and institutions to it. The rise of the internet, for instance, has forced societies to grapple with questions of privacy, intellectual property, and the nature of community that were not fully anticipated when the technology first spread. Understanding the pace of cultural change thus requires attention not only to the diffusion of innovations but also to the resistance and adaptation that characterize human societies.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, what has challenged the traditional view of cultural change?',
  '["Early twentieth-century ethnography confirmed that cultures evolve slowly.", "Fieldwork and historical analysis have shown that cultural traits can spread rapidly under favorable conditions.", "Scholars now believe that customs never change.", "The spread of agriculture has been shown to take millennia."]', 1, 0
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one defense of the gradualist view mentioned in the passage?',
  '["All cultural change is rapid.", "The archaeological and historical record is incomplete, so small-scale changes may leave little trace.", "The Norman Conquest had no effect on England.", "Technology always changes faster than beliefs."]', 1, 1
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the passage say about Susan Reynolds''s argument?',
  '["She argued that the Norman Conquest had no effect on law or language.", "She argued that the Norman Conquest brought about a relatively swift transformation in law, landholding, and language at the elite level.", "She argued that peasant life changed faster than elite life.", "She rejected the idea of punctuated cultural change."]', 1, 2
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, what is "cultural lag"?',
  '["The delay between the adoption of a new technology and the adjustment of social norms and institutions to it.", "The speed at which technology spreads.", "The resistance of technology to change.", "The rapid spread of beliefs."]', 0, 3
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The example of the introduction of the horse to the Americas illustrates that',
  '["cultural change always takes millennia.", "under the right circumstances, cultural change can be both rapid and profound.", "Indigenous peoples did not adopt new technologies.", "European settlers did not change their way of life."]', 1, 4
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 2: The Minoan Civilization (archaeology / history) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '1級', 'narrative', 'long_content',
  'The Minoan Civilization

The Minoan civilization, which flourished on the island of Crete from approximately 2700 to 1450 BCE, was one of the first advanced societies in the Aegean. Early excavations in the late nineteenth and early twentieth centuries, particularly at the palace complex of Knossos under Sir Arthur Evans, led scholars to portray Minoan society as peaceful, prosperous, and dominated by a priestly or royal elite. The absence of obvious fortifications and the presence of elaborate frescoes, storage facilities, and ritual spaces suggested a culture focused on trade, religion, and administration rather than warfare. This view held sway for much of the twentieth century.

In recent decades, however, new excavations and reinterpretations of existing evidence have complicated the picture. Archaeologist Jan Driessen and others have argued that the "palaces" may have served multiple functions—political, economic, and religious—and that power was perhaps more distributed among regional centres than Evans assumed. Evidence of destruction and rebuilding at several sites has also raised questions about whether the Minoans faced internal conflict or external threats. Furthermore, the discovery of writing systems—Linear A remains undeciphered—has highlighted how much we still do not know about Minoan governance and belief. Some researchers now suggest that the Minoans may have been more militaristic or socially stratified than the early, optimistic view allowed.

The collapse of Minoan civilization remains a subject of debate. The eruption of the Thera volcano in the mid-second millennium BCE is often cited as a contributing factor, possibly causing tsunamis, ash fall, and economic disruption. Invasion by Mycenaean Greeks from the mainland may have delivered a final blow. What is clear is that the Minoan legacy influenced later Greek culture, from myth—the legend of the Minotaur and the labyrinth may reflect distant memories of Knossos—to architectural and artistic techniques. Understanding the Minoans thus continues to require a balance between the evidence at hand and the recognition that new discoveries can fundamentally alter our interpretation of the past.',
  'The Minoan Civilization',
  'The Minoan Civilization

The Minoan civilization, which flourished on the island of Crete from approximately 2700 to 1450 BCE, was one of the first advanced societies in the Aegean. Early excavations in the late nineteenth and early twentieth centuries, particularly at the palace complex of Knossos under Sir Arthur Evans, led scholars to portray Minoan society as peaceful, prosperous, and dominated by a priestly or royal elite. The absence of obvious fortifications and the presence of elaborate frescoes, storage facilities, and ritual spaces suggested a culture focused on trade, religion, and administration rather than warfare. This view held sway for much of the twentieth century.

In recent decades, however, new excavations and reinterpretations of existing evidence have complicated the picture. Archaeologist Jan Driessen and others have argued that the "palaces" may have served multiple functions—political, economic, and religious—and that power was perhaps more distributed among regional centres than Evans assumed. Evidence of destruction and rebuilding at several sites has also raised questions about whether the Minoans faced internal conflict or external threats. Furthermore, the discovery of writing systems—Linear A remains undeciphered—has highlighted how much we still do not know about Minoan governance and belief. Some researchers now suggest that the Minoans may have been more militaristic or socially stratified than the early, optimistic view allowed.

The collapse of Minoan civilization remains a subject of debate. The eruption of the Thera volcano in the mid-second millennium BCE is often cited as a contributing factor, possibly causing tsunamis, ash fall, and economic disruption. Invasion by Mycenaean Greeks from the mainland may have delivered a final blow. What is clear is that the Minoan legacy influenced later Greek culture, from myth—the legend of the Minotaur and the labyrinth may reflect distant memories of Knossos—to architectural and artistic techniques. Understanding the Minoans thus continues to require a balance between the evidence at hand and the recognition that new discoveries can fundamentally alter our interpretation of the past.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Early excavations of Knossos indicated that',
  '["Minoan society was highly militaristic.", "Minoan society was peaceful, prosperous, and dominated by a priestly or royal elite.", "The Minoans had no writing system.", "The palaces were used only for religion."]', 1, 0
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What have Jan Driessen and others argued about the Minoan palaces?',
  '["They were used only for storage.", "The palaces may have served multiple functions and power was perhaps more distributed than Evans assumed.", "They were built after the Thera eruption.", "They had no religious function."]', 1, 1
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, what has the discovery of Linear A highlighted?',
  '["That the Minoans had no writing system.", "How much we still do not know about Minoan governance and belief.", "That Evans was correct about everything.", "That the Minoans spoke Greek."]', 1, 2
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the passage say about the collapse of Minoan civilization?',
  '["It is fully explained by the Thera eruption.", "The eruption of Thera and possible invasion by Mycenaean Greeks are often cited; the collapse remains a subject of debate.", "It was caused only by internal conflict.", "It had no effect on later Greek culture."]', 1, 3
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The author of the passage suggests that',
  '["new discoveries can fundamentally alter our interpretation of the Minoan past.", "Evans''s view of the Minoans has been fully confirmed.", "Linear A has now been deciphered.", "The Minoans had no influence on later Greece."]', 0, 4
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 3: Algorithmic Bias (technology / society) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '1級', 'expository', 'long_content',
  'Algorithmic Bias

As algorithms increasingly influence hiring, lending, policing, and other high-stakes decisions, concerns have grown about "algorithmic bias"—the tendency for automated systems to reproduce or amplify existing inequalities. In the first paragraph, the author of the passage illustrates the problem by mentioning cases where facial recognition software has been shown to misidentify people of colour more often than white people, and where algorithms used to screen job applicants have inadvertently favoured candidates who mirror the demographics of historically successful employees. Such outcomes are not necessarily the result of malicious intent; they often arise because the data used to train the systems reflect past discrimination or underrepresentation. If the data are biased, the algorithm will learn and perpetuate that bias.

Critics of the "digital afterlife" industry have raised analogous concerns. Companies that use artificial intelligence to create avatars of the deceased from their digital footprints may market the product as a comfort to the bereaved. Nevertheless, ethicists point out that the avatars they create may not accurately reflect the personality or wishes of the deceased, and that consent—whether the deceased would have agreed to such use of their data—is frequently unclear. Moreover, the cost of such services can make "digital immortality" an exclusive privilege for the wealthy. These concerns suggest that the benefits of new technologies must be weighed against the risk of entrenching inequality or violating the autonomy and dignity of individuals.

Some researchers argue that transparency and oversight can mitigate algorithmic bias. Requiring that certain high-stakes algorithms be audited for fairness, or that their logic be explainable to those affected by their decisions, could reduce harm. Others caution that technical fixes are insufficient without broader social change; if the underlying data and the institutions that use them remain biased, even a "fair" algorithm may produce unfair outcomes. The debate thus extends beyond computer science into law, ethics, and policy, and will likely shape how societies govern the use of artificial intelligence in the decades to come.',
  'Algorithmic Bias',
  'Algorithmic Bias

As algorithms increasingly influence hiring, lending, policing, and other high-stakes decisions, concerns have grown about "algorithmic bias"—the tendency for automated systems to reproduce or amplify existing inequalities. In the first paragraph, the author of the passage illustrates the problem by mentioning cases where facial recognition software has been shown to misidentify people of colour more often than white people, and where algorithms used to screen job applicants have inadvertently favoured candidates who mirror the demographics of historically successful employees. Such outcomes are not necessarily the result of malicious intent; they often arise because the data used to train the systems reflect past discrimination or underrepresentation. If the data are biased, the algorithm will learn and perpetuate that bias.

Critics of the "digital afterlife" industry have raised analogous concerns. Companies that use artificial intelligence to create avatars of the deceased from their digital footprints may market the product as a comfort to the bereaved. Nevertheless, ethicists point out that the avatars they create may not accurately reflect the personality or wishes of the deceased, and that consent—whether the deceased would have agreed to such use of their data—is frequently unclear. Moreover, the cost of such services can make "digital immortality" an exclusive privilege for the wealthy. These concerns suggest that the benefits of new technologies must be weighed against the risk of entrenching inequality or violating the autonomy and dignity of individuals.

Some researchers argue that transparency and oversight can mitigate algorithmic bias. Requiring that certain high-stakes algorithms be audited for fairness, or that their logic be explainable to those affected by their decisions, could reduce harm. Others caution that technical fixes are insufficient without broader social change; if the underlying data and the institutions that use them remain biased, even a "fair" algorithm may produce unfair outcomes. The debate thus extends beyond computer science into law, ethics, and policy, and will likely shape how societies govern the use of artificial intelligence in the decades to come.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'In the first paragraph, the author illustrates the problem of algorithmic bias by mentioning cases where',
  '["algorithms have eliminated all bias.", "facial recognition has misidentified people of colour more often, and job-screening algorithms have favoured candidates who mirror historically successful demographics.", "companies have refused to use algorithms.", "the data used to train systems are always unbiased."]', 1, 0
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one concern the author cites with regard to companies in the "digital afterlife" industry?',
  '["They do not use enough data.", "The avatars they create may not accurately reflect the personality of the deceased, and consent is frequently unclear.", "They charge too little.", "They only serve the poor."]', 1, 1
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, why do biased outcomes often arise in algorithms?',
  '["Because programmers intend to discriminate.", "Because the data used to train the systems reflect past discrimination or underrepresentation.", "Because algorithms are not used in hiring.", "Because facial recognition is never used."]', 1, 2
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do some researchers argue can mitigate algorithmic bias?',
  '["Keeping all algorithms secret.", "Transparency and oversight, such as auditing algorithms for fairness.", "Using only small amounts of data.", "Avoiding the use of algorithms entirely."]', 1, 3
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The author of the passage implies that',
  '["technical fixes alone are sufficient.", "others caution that technical fixes are insufficient without broader social change.", "algorithmic bias is no longer a concern.", "the digital afterlife industry has no ethical issues."]', 1, 4
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 4: The Byzantine Empire and the West (history) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '1級', 'narrative', 'long_content',
  'The Byzantine Empire and the West

The Byzantine Empire, the eastern continuation of the Roman Empire after the fall of Rome in the fifth century, maintained a distinct political and cultural identity for nearly a thousand years. Historian Judith Herrin has argued that the Byzantines were not merely the inheritors of Roman tradition but actively shaped the development of Europe and the Mediterranean. Through trade, diplomacy, and military campaigns, Byzantium preserved and transmitted Greek and Roman learning, legal codes, and artistic techniques. The empire''s use of Greek as its primary language and its adherence to Orthodox Christianity set it apart from the Latin-speaking, Catholic West, yet contact between the two was constant—sometimes cooperative, often hostile.

One thing that we learn about the way the Byzantines ruled their territory is that they relied on a sophisticated bureaucracy, a professional army, and a network of provinces administered from Constantinople. Unlike the fragmented feudal systems that emerged in Western Europe, the Byzantine state maintained a centralized tax system and a standing army, which allowed it to respond to external threats and internal unrest with relative efficiency. Nevertheless, the empire faced repeated challenges: Persian and Arab invasions, the Crusades—which in 1204 saw Western knights sack Constantinople—and the gradual expansion of the Ottoman Turks. Historian Jonathan Harris has suggested that the Byzantines'' survival for so long was due in part to their ability to assimilate and adapt, whether by adopting new military technologies or by forming strategic marriages and alliances.

The fall of Constantinople to the Ottomans in 1453 is often cited as a turning point that pushed Greek scholars and texts westward, contributing to the Renaissance. Thus, even in its decline, Byzantium left a lasting imprint on the civilization that followed.',
  'The Byzantine Empire and the West',
  'The Byzantine Empire and the West

The Byzantine Empire, the eastern continuation of the Roman Empire after the fall of Rome in the fifth century, maintained a distinct political and cultural identity for nearly a thousand years. Historian Judith Herrin has argued that the Byzantines were not merely the inheritors of Roman tradition but actively shaped the development of Europe and the Mediterranean. Through trade, diplomacy, and military campaigns, Byzantium preserved and transmitted Greek and Roman learning, legal codes, and artistic techniques. The empire''s use of Greek as its primary language and its adherence to Orthodox Christianity set it apart from the Latin-speaking, Catholic West, yet contact between the two was constant—sometimes cooperative, often hostile.

One thing that we learn about the way the Byzantines ruled their territory is that they relied on a sophisticated bureaucracy, a professional army, and a network of provinces administered from Constantinople. Unlike the fragmented feudal systems that emerged in Western Europe, the Byzantine state maintained a centralized tax system and a standing army, which allowed it to respond to external threats and internal unrest with relative efficiency. Nevertheless, the empire faced repeated challenges: Persian and Arab invasions, the Crusades—which in 1204 saw Western knights sack Constantinople—and the gradual expansion of the Ottoman Turks. Historian Jonathan Harris has suggested that the Byzantines'' survival for so long was due in part to their ability to assimilate and adapt, whether by adopting new military technologies or by forming strategic marriages and alliances.

The fall of Constantinople to the Ottomans in 1453 is often cited as a turning point that pushed Greek scholars and texts westward, contributing to the Renaissance. Thus, even in its decline, Byzantium left a lasting imprint on the civilization that followed.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Judith Herrin believe about the Byzantines?',
  '["They had no influence on Europe.", "They were not merely inheritors of Roman tradition but actively shaped the development of Europe and the Mediterranean.", "They spoke only Latin.", "They had no contact with the West."]', 1, 0
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one thing that we learn about the way the Byzantines ruled their territory?',
  '["They used a fragmented feudal system like Western Europe.", "They relied on a sophisticated bureaucracy, a professional army, and a network of provinces administered from Constantinople.", "They had no army.", "They did not collect taxes."]', 1, 1
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to Jonathan Harris, why did the Byzantines survive for so long?',
  '["Because they avoided all contact with other cultures.", "Due in part to their ability to assimilate and adapt.", "Because the West never attacked them.", "Because they had no enemies."]', 1, 2
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the passage say about the fall of Constantinople in 1453?',
  '["It had no effect on the West.", "It is often cited as a turning point that pushed Greek scholars and texts westward, contributing to the Renaissance.", "It occurred in 1204.", "It was caused by the Persians."]', 1, 3
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'Which of the following would Herrin most likely agree with?',
  '["The Byzantines had no cultural impact.", "The Byzantines actively shaped Europe through the transmission of learning and constant contact with the West.", "Byzantium and the West had no contact.", "The Byzantine Empire did not last long."]', 1, 4
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 5: Confession and the Justice System (criminology) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '1級', 'expository', 'long_content',
  'Confession and the Justice System

In many jurisdictions, the proportion of criminal cases that are "cleared" by arrest and prosecution has declined over the past half century. Scholars have offered several explanations for this trend. One reason that clearance rates may not be an accurate measure of police competence is that the nature of crime has changed: a shift from offences in which the suspect is often known to the victim—such as domestic violence or disputes among acquaintances—to offences involving strangers or firearms can make cases harder to solve, regardless of police effort. In such circumstances, lower clearance rates may reflect the difficulty of the cases rather than a decline in investigative effectiveness.

Some researchers have suggested that high clearance rates in the 1960s may have been achieved in part through methods that would not be acceptable today. The introduction of stricter rules governing interrogations—including the right to remain silent and the right to legal counsel—reduced the ability of authorities to obtain confessions through prolonged or coercive questioning. While such reforms were intended to protect the rights of suspects and reduce the risk of false confessions, they may also have made it harder for police to secure convictions in cases that depended on admissions of guilt. The implication is that the justice system in earlier decades may have been more willing to tolerate practices that violated suspects'' rights in order to secure convictions.

It is possible that the decline in clearance rates has had the effect of undermining public confidence in law enforcement and reducing the deterrent effect of the criminal justice system. When a large proportion of offences go unsolved, potential offenders may perceive a lower risk of being caught, and victims may feel that reporting crime is futile. Some police departments have responded by investing in forensic technology, community outreach, and specialized units. Nevertheless, the debate over how to balance the rights of the accused with the demand for effective law enforcement continues, and there is no consensus on whether the reforms of the past decades have produced a fairer system at the cost of fewer solved cases, or whether other factors are primarily responsible for the decline in clearance rates.',
  'Confession and the Justice System',
  'Confession and the Justice System

In many jurisdictions, the proportion of criminal cases that are "cleared" by arrest and prosecution has declined over the past half century. Scholars have offered several explanations for this trend. One reason that clearance rates may not be an accurate measure of police competence is that the nature of crime has changed: a shift from offences in which the suspect is often known to the victim—such as domestic violence or disputes among acquaintances—to offences involving strangers or firearms can make cases harder to solve, regardless of police effort. In such circumstances, lower clearance rates may reflect the difficulty of the cases rather than a decline in investigative effectiveness.

Some researchers have suggested that high clearance rates in the 1960s may have been achieved in part through methods that would not be acceptable today. The introduction of stricter rules governing interrogations—including the right to remain silent and the right to legal counsel—reduced the ability of authorities to obtain confessions through prolonged or coercive questioning. While such reforms were intended to protect the rights of suspects and reduce the risk of false confessions, they may also have made it harder for police to secure convictions in cases that depended on admissions of guilt. The implication is that the justice system in earlier decades may have been more willing to tolerate practices that violated suspects'' rights in order to secure convictions.

It is possible that the decline in clearance rates has had the effect of undermining public confidence in law enforcement and reducing the deterrent effect of the criminal justice system. When a large proportion of offences go unsolved, potential offenders may perceive a lower risk of being caught, and victims may feel that reporting crime is futile. Some police departments have responded by investing in forensic technology, community outreach, and specialized units. Nevertheless, the debate over how to balance the rights of the accused with the demand for effective law enforcement continues, and there is no consensus on whether the reforms of the past decades have produced a fairer system at the cost of fewer solved cases, or whether other factors are primarily responsible for the decline in clearance rates.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one reason that clearance rates may not be an accurate measure of police competence?',
  '["The criteria for solving a case have not changed.", "The nature of crime has changed; offences involving strangers or firearms can make cases harder to solve.", "Police have become less competent.", "Fewer crimes are committed today."]', 1, 0
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the author of the passage imply about the justice system in earlier decades?',
  '["It was always fair.", "It is possible that law enforcement personnel were violating the rights of suspects in order to solve crimes.", "Stricter interrogation rules had no effect.", "Clearance rates were lower in the 1960s."]', 1, 1
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, what was the purpose of reforms governing interrogations?',
  '["To increase clearance rates.", "To protect the rights of suspects and reduce the risk of false confessions.", "To make it easier to obtain confessions.", "To eliminate the right to legal counsel."]', 1, 2
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'It is possible that the decline in clearance rates has had the effect of',
  '["increasing the number of police officers.", "undermining public confidence in law enforcement and reducing the deterrent effect of the criminal justice system.", "making all cases easier to solve.", "eliminating the need for confessions."]', 1, 3
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does the passage say about the debate over clearance rates?',
  '["There is full consensus on the causes.", "There is no consensus on whether reforms have produced a fairer system at the cost of fewer solved cases.", "The debate has ended.", "All scholars agree that police competence has declined."]', 1, 4
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 6: Napoleon and the Napoleonic Code (history) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '1級', 'narrative', 'long_content',
  'Napoleon and the Napoleonic Code

Napoleon Bonaparte rose to power in France in the aftermath of the Revolution, and his legacy extends far beyond his military campaigns. Historian Robert Holtman has argued that Napoleon ensured the survival and spread of revolutionary principles in part through the creation of a unified legal code. Before the Revolution, France had been a patchwork of regional laws, feudal privileges, and ecclesiastical courts. The Napoleonic Code, promulgated in 1804, replaced this with a single, secular body of law that emphasized equality before the law, property rights, and the abolition of hereditary nobility. Napoleon ensured that the code would influence Europe and beyond by imposing it in the territories he conquered and by encouraging its adoption by allied or reformed states. In this way, the code became one of the most influential legal documents in modern history, shaping civil law in much of Europe, Latin America, and parts of Asia and Africa.

Initially, Napoleon presented himself as the defender of the Revolution; later, he crowned himself emperor and restored elements of hierarchy and dynastic rule. Nevertheless, the code itself retained many of the Revolution''s key achievements: it confirmed the end of serfdom, established the right to choose one''s profession, and enshrined the principle that law should be written and applied uniformly. According to historian Fiona Campbell, the fact that the ceremony to promulgate the code was held in Paris rather than in a conquered capital was intended to emphasize that the code was a French achievement, rooted in Enlightenment ideals, rather than merely an instrument of conquest. Campbell has suggested that this choice reflected Napoleon''s desire to be seen as a lawgiver and reformer, not only as a military leader.

The code was not without its critics. It placed women and children under the authority of husbands and fathers, restricted the rights of workers to form associations, and reinstated slavery in French colonies after it had been abolished during the Revolution. Thus, the Napoleonic Code embodies both the progressive and the authoritarian tendencies of its era. Understanding it requires attention to the ways in which legal reform can advance certain freedoms while reinforcing other forms of inequality.',
  'Napoleon and the Napoleonic Code',
  'Napoleon and the Napoleonic Code

Napoleon Bonaparte rose to power in France in the aftermath of the Revolution, and his legacy extends far beyond his military campaigns. Historian Robert Holtman has argued that Napoleon ensured the survival and spread of revolutionary principles in part through the creation of a unified legal code. Before the Revolution, France had been a patchwork of regional laws, feudal privileges, and ecclesiastical courts. The Napoleonic Code, promulgated in 1804, replaced this with a single, secular body of law that emphasized equality before the law, property rights, and the abolition of hereditary nobility. Napoleon ensured that the code would influence Europe and beyond by imposing it in the territories he conquered and by encouraging its adoption by allied or reformed states. In this way, the code became one of the most influential legal documents in modern history, shaping civil law in much of Europe, Latin America, and parts of Asia and Africa.

Initially, Napoleon presented himself as the defender of the Revolution; later, he crowned himself emperor and restored elements of hierarchy and dynastic rule. Nevertheless, the code itself retained many of the Revolution''s key achievements: it confirmed the end of serfdom, established the right to choose one''s profession, and enshrined the principle that law should be written and applied uniformly. According to historian Fiona Campbell, the fact that the ceremony to promulgate the code was held in Paris rather than in a conquered capital was intended to emphasize that the code was a French achievement, rooted in Enlightenment ideals, rather than merely an instrument of conquest. Campbell has suggested that this choice reflected Napoleon''s desire to be seen as a lawgiver and reformer, not only as a military leader.

The code was not without its critics. It placed women and children under the authority of husbands and fathers, restricted the rights of workers to form associations, and reinstated slavery in French colonies after it had been abolished during the Revolution. Thus, the Napoleonic Code embodies both the progressive and the authoritarian tendencies of its era. Understanding it requires attention to the ways in which legal reform can advance certain freedoms while reinforcing other forms of inequality.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to Robert Holtman, how did Napoleon ensure the spread of revolutionary principles?',
  '["Only through military conquest.", "In part through the creation of a unified legal code.", "By abolishing all laws.", "By restoring the nobility."]', 1, 0
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What did the Napoleonic Code emphasize?',
  '["Regional laws and feudal privileges.", "Equality before the law, property rights, and the abolition of hereditary nobility.", "Ecclesiastical courts.", "The restoration of serfdom."]', 1, 1
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to Fiona Campbell, why was the ceremony to promulgate the code held in Paris?',
  '["To celebrate a military victory.", "To emphasize that the code was a French achievement, rooted in Enlightenment ideals.", "Because Napoleon had no other capital.", "To please the nobility."]', 1, 2
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Campbell suggest about Napoleon''s desire?',
  '["He wanted only to be seen as a military leader.", "He wanted to be seen as a lawgiver and reformer, not only as a military leader.", "He wanted to abolish the code.", "He had no interest in law."]', 1, 3
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The author of the passage points out that the Napoleonic Code',
  '["had no critics.", "placed women and children under the authority of husbands and fathers, and reinstated slavery in colonies.", "abolished all inequality.", "was never applied outside France."]', 1, 4
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 7: Climate and Civilization (environment / history) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '1級', 'expository', 'long_content',
  'Climate and Civilization

The role of climate in the rise and fall of civilizations has long fascinated historians and scientists. Early twentieth-century scholars sometimes attributed the decline of ancient societies primarily to climatic shifts—droughts, cooling, or flooding—suggesting that environmental change could overwhelm human adaptation. In recent years, improved methods of dating and the availability of data from ice cores, tree rings, and sediment layers have allowed researchers to reconstruct past climates with greater precision. The result has been a more nuanced picture: climate has often acted as one factor among many, interacting with political instability, resource management, and economic systems rather than determining outcomes on its own.

Archaeologist Harvey Weiss has argued that a prolonged drought in the late third millennium BCE contributed to the collapse of the Akkadian Empire in Mesopotamia and to upheavals in the Nile Valley and the Indus Valley. Weiss suggests that societies that had become dependent on intensive agriculture were particularly vulnerable when rainfall patterns shifted. Nevertheless, not all societies in affected regions collapsed; some adapted by shifting to different crops, migrating, or developing new forms of storage and trade. The example of the Maya illustrates that environmental stress can accelerate decline when it coincides with warfare, overpopulation, or political fragmentation. Thus, the relationship between climate and civilization is not one of simple cause and effect but of interaction between environmental pressures and human choices.

Today, the study of past climate and society is often cited in discussions of contemporary climate change. If ancient civilizations could be destabilized by shifts that were small by modern standards, the argument runs, then current warming and extreme weather pose a serious threat to global stability. Critics caution that analogies between past and present can be misleading—modern technology and institutions may allow for adaptation that was not possible in the past. The debate underscores the importance of understanding both the vulnerability and the resilience of human societies in the face of environmental change.',
  'Climate and Civilization',
  'Climate and Civilization

The role of climate in the rise and fall of civilizations has long fascinated historians and scientists. Early twentieth-century scholars sometimes attributed the decline of ancient societies primarily to climatic shifts—droughts, cooling, or flooding—suggesting that environmental change could overwhelm human adaptation. In recent years, improved methods of dating and the availability of data from ice cores, tree rings, and sediment layers have allowed researchers to reconstruct past climates with greater precision. The result has been a more nuanced picture: climate has often acted as one factor among many, interacting with political instability, resource management, and economic systems rather than determining outcomes on its own.

Archaeologist Harvey Weiss has argued that a prolonged drought in the late third millennium BCE contributed to the collapse of the Akkadian Empire in Mesopotamia and to upheavals in the Nile Valley and the Indus Valley. Weiss suggests that societies that had become dependent on intensive agriculture were particularly vulnerable when rainfall patterns shifted. Nevertheless, not all societies in affected regions collapsed; some adapted by shifting to different crops, migrating, or developing new forms of storage and trade. The example of the Maya illustrates that environmental stress can accelerate decline when it coincides with warfare, overpopulation, or political fragmentation. Thus, the relationship between climate and civilization is not one of simple cause and effect but of interaction between environmental pressures and human choices.

Today, the study of past climate and society is often cited in discussions of contemporary climate change. If ancient civilizations could be destabilized by shifts that were small by modern standards, the argument runs, then current warming and extreme weather pose a serious threat to global stability. Critics caution that analogies between past and present can be misleading—modern technology and institutions may allow for adaptation that was not possible in the past. The debate underscores the importance of understanding both the vulnerability and the resilience of human societies in the face of environmental change.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, what has changed in recent years regarding the study of climate and civilization?',
  '["Scholars no longer believe climate mattered.", "Improved methods have allowed a more nuanced picture: climate acts as one factor among many.", "All ancient collapses are now attributed only to climate.", "No new data are available."]', 1, 0
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Harvey Weiss argue?',
  '["Climate had no effect on the Akkadian Empire.", "A prolonged drought contributed to the collapse of the Akkadian Empire and to upheavals in the Nile and Indus Valleys.", "Only the Maya were affected by drought.", "All societies adapted successfully."]', 1, 1
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The example of the Maya illustrates that',
  '["environmental stress has no effect on civilization.", "environmental stress can accelerate decline when it coincides with warfare, overpopulation, or political fragmentation.", "the Maya had no political problems.", "climate never affects human societies."]', 1, 2
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What do critics caution about analogies between past and present climate change?',
  '["They are always accurate.", "They can be misleading; modern technology and institutions may allow for adaptation that was not possible in the past.", "Past societies were more resilient.", "Current warming is not a threat."]', 1, 3
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to Weiss, which societies were particularly vulnerable to drought?',
  '["Nomadic societies.", "Societies that had become dependent on intensive agriculture.", "Industrial societies.", "Societies with no agriculture."]', 1, 4
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 8: The Placebo Effect (medicine / psychology) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '1級', 'expository', 'long_content',
  'The Placebo Effect

The placebo effect—the phenomenon whereby a patient experiences a real improvement in symptoms after receiving a treatment that has no active therapeutic ingredient—has been observed in countless clinical trials. For decades, researchers assumed that placebos worked only for subjective conditions such as pain or anxiety, and that the effect was largely psychological. In recent years, however, studies have shown that placebos can produce measurable physiological changes, including the release of endorphins, changes in brain activity, and even alterations in immune response. Psychologist Irving Kirsch has argued that much of the benefit attributed to antidepressant medication may be due to the placebo effect, and that the difference between drug and placebo in many trials is smaller than has been advertised. Kirsch''s interpretation has been contested, but it has prompted greater scrutiny of how clinical trials are designed and how their results are reported.

One concern that ethicists cite with regard to the use of placebos in medicine is that withholding effective treatment from patients in a control group may be unethical when a proven therapy exists. In trials where a new drug is compared to a placebo rather than to an existing treatment, patients in the placebo group may be denied care that could help them. Furthermore, the placebo effect raises questions about the line between "real" and "imagined" improvement. If a patient feels better, does it matter whether the cause was a chemical in a pill or the expectation of relief? Some researchers have suggested that doctors could harness the placebo effect ethically by creating positive expectations and by using rituals of care—such as taking a history, performing an examination, and prescribing in a thoughtful manner—that may enhance the effectiveness of both drugs and placebos.

The placebo effect thus challenges simple distinctions between mind and body and between "authentic" and "inauthentic" healing. Understanding it may lead to more humane and effective medical practice, even as it complicates the task of evaluating which treatments truly work. The debate over placebos is therefore not only scientific but also philosophical and ethical, touching on the nature of healing and the responsibilities of clinicians and researchers.',
  'The Placebo Effect',
  'The Placebo Effect

The placebo effect—the phenomenon whereby a patient experiences a real improvement in symptoms after receiving a treatment that has no active therapeutic ingredient—has been observed in countless clinical trials. For decades, researchers assumed that placebos worked only for subjective conditions such as pain or anxiety, and that the effect was largely psychological. In recent years, however, studies have shown that placebos can produce measurable physiological changes, including the release of endorphins, changes in brain activity, and even alterations in immune response. Psychologist Irving Kirsch has argued that much of the benefit attributed to antidepressant medication may be due to the placebo effect, and that the difference between drug and placebo in many trials is smaller than has been advertised. Kirsch''s interpretation has been contested, but it has prompted greater scrutiny of how clinical trials are designed and how their results are reported.

One concern that ethicists cite with regard to the use of placebos in medicine is that withholding effective treatment from patients in a control group may be unethical when a proven therapy exists. In trials where a new drug is compared to a placebo rather than to an existing treatment, patients in the placebo group may be denied care that could help them. Furthermore, the placebo effect raises questions about the line between "real" and "imagined" improvement. If a patient feels better, does it matter whether the cause was a chemical in a pill or the expectation of relief? Some researchers have suggested that doctors could harness the placebo effect ethically by creating positive expectations and by using rituals of care—such as taking a history, performing an examination, and prescribing in a thoughtful manner—that may enhance the effectiveness of both drugs and placebos.

The placebo effect thus challenges simple distinctions between mind and body and between "authentic" and "inauthentic" healing. Understanding it may lead to more humane and effective medical practice, even as it complicates the task of evaluating which treatments truly work. The debate over placebos is therefore not only scientific but also philosophical and ethical, touching on the nature of healing and the responsibilities of clinicians and researchers.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, what have recent studies shown about placebos?',
  '["They work only for pain.", "They can produce measurable physiological changes, including release of endorphins and changes in brain activity.", "They have no effect.", "They work only when patients are deceived."]', 1, 0
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Irving Kirsch argue?',
  '["Antidepressants have no placebo component.", "Much of the benefit attributed to antidepressants may be due to the placebo effect.", "Placebos never work.", "Clinical trials are always well designed."]', 1, 1
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one concern that ethicists cite with regard to the use of placebos?',
  '["Placebos are too expensive.", "Withholding effective treatment from patients in a control group may be unethical when a proven therapy exists.", "Placebos work too well.", "Doctors never use placebos."]', 1, 2
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the passage, how could doctors harness the placebo effect ethically?',
  '["By deceiving patients.", "By creating positive expectations and using rituals of care.", "By never prescribing placebos.", "By avoiding examinations."]', 1, 3
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The author of the passage suggests that the placebo effect',
  '["is only psychological.", "challenges simple distinctions between mind and body and between authentic and inauthentic healing.", "has been fully explained.", "should never be studied."]', 1, 4
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 9: Literacy and Power (education / society) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '1級', 'expository', 'long_content',
  'Literacy and Power

The spread of literacy has often been seen as a straightforward good—a means of empowering individuals and promoting democracy. Historians and sociologists have shown, however, that the relationship between literacy and power is more complex. In many societies, writing was initially the preserve of elites: priests, scribes, and rulers who used it for record-keeping, law, and religious texts. The ability to read and write could reinforce existing hierarchies rather than undermine them. Only when printing, mass education, and political movements combined did literacy begin to spread more widely, and even then, access to education remained unequal along lines of class, gender, and race.

In some cases, governments promoted literacy in order to integrate populations into a national culture and to create a more productive workforce. In other cases, literacy was suppressed or restricted—for example, under slavery in the Americas, where teaching enslaved people to read was often illegal. The historian Carlo Ginzburg has argued that the ability of ordinary people to read and interpret texts for themselves was a crucial factor in the Reformation and in later political revolutions. Ginzburg''s interpretation suggests that literacy could serve either as an instrument of control or as a tool for resistance, depending on who had access to it and how it was used.

Today, debates over "digital literacy" and the spread of misinformation echo these older themes. The internet has put vast amounts of information at the fingertips of billions, but it has also made it easier to spread falsehoods and to target vulnerable audiences. Some argue that education in critical thinking and media literacy is essential if citizens are to participate effectively in democratic life. Others caution that literacy alone cannot solve problems of inequality or political manipulation. The history of literacy thus offers no simple lesson—only a reminder that the distribution of knowledge and the power to communicate have always been contested, and that the same technology can be used to liberate or to dominate.',
  'Literacy and Power',
  'Literacy and Power

The spread of literacy has often been seen as a straightforward good—a means of empowering individuals and promoting democracy. Historians and sociologists have shown, however, that the relationship between literacy and power is more complex. In many societies, writing was initially the preserve of elites: priests, scribes, and rulers who used it for record-keeping, law, and religious texts. The ability to read and write could reinforce existing hierarchies rather than undermine them. Only when printing, mass education, and political movements combined did literacy begin to spread more widely, and even then, access to education remained unequal along lines of class, gender, and race.

In some cases, governments promoted literacy in order to integrate populations into a national culture and to create a more productive workforce. In other cases, literacy was suppressed or restricted—for example, under slavery in the Americas, where teaching enslaved people to read was often illegal. The historian Carlo Ginzburg has argued that the ability of ordinary people to read and interpret texts for themselves was a crucial factor in the Reformation and in later political revolutions. Ginzburg''s interpretation suggests that literacy could serve either as an instrument of control or as a tool for resistance, depending on who had access to it and how it was used.

Today, debates over "digital literacy" and the spread of misinformation echo these older themes. The internet has put vast amounts of information at the fingertips of billions, but it has also made it easier to spread falsehoods and to target vulnerable audiences. Some argue that education in critical thinking and media literacy is essential if citizens are to participate effectively in democratic life. Others caution that literacy alone cannot solve problems of inequality or political manipulation. The history of literacy thus offers no simple lesson—only a reminder that the distribution of knowledge and the power to communicate have always been contested, and that the same technology can be used to liberate or to dominate.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to the first paragraph, what have historians and sociologists shown about literacy?',
  '["Literacy always empowers the poor.", "The relationship between literacy and power is more complex; writing was initially the preserve of elites.", "Literacy has never reinforced hierarchies.", "Access to education has always been equal."]', 1, 0
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one thing that we learn about the way literacy was used in different contexts?',
  '["Governments never promoted literacy.", "In some cases governments promoted literacy to integrate populations; in others, literacy was suppressed, as under slavery.", "Enslaved people were always taught to read.", "Literacy was never restricted."]', 1, 1
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Carlo Ginzburg argue?',
  '["Literacy had no role in the Reformation.", "The ability of ordinary people to read and interpret texts was a crucial factor in the Reformation and in later political revolutions.", "Only elites could read during the Reformation.", "Literacy was never a tool for resistance."]', 1, 2
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to Ginzburg''s interpretation, literacy could serve as',
  '["only an instrument of control.", "either an instrument of control or a tool for resistance, depending on access and use.", "only a tool for resistance.", "neither control nor resistance."]', 1, 3
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The author of the passage concludes that the history of literacy',
  '["offers a simple lesson.", "offers no simple lesson—only a reminder that the distribution of knowledge has always been contested.", "proves that literacy always liberates.", "has no relevance today."]', 1, 4
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;

-- ========== Passage 10: The Printing Revolution (history / culture) ==========
INSERT INTO public.reading_passages (level, genre, passage_type, body, title, content)
VALUES (
  '1級', 'narrative', 'long_content',
  'The Printing Revolution

The invention of movable-type printing in Europe in the mid-fifteenth century is often described as one of the most transformative developments in human history. Historian Elizabeth Eisenstein has argued that the printing press did not merely speed up the production of books but fundamentally altered the way knowledge was produced, stored, and disseminated. Before printing, texts were copied by hand, which was slow, expensive, and prone to error. The ability to produce hundreds or thousands of identical copies made it possible for ideas to spread rapidly and for readers in different places to refer to the same version of a text. Eisenstein suggests that this "fixity" of the printed word was a precondition for the rise of modern science, as it allowed researchers to build on and correct the work of others with a shared reference point.

Initially, the Church used the press to produce indulgences, liturgical texts, and anti-heretical pamphlets. As the Reformation took hold, however, the spread of vernacular Bibles and Protestant tracts undermined the Church''s monopoly on religious interpretation. The Church responded with censorship, the Index of Forbidden Books, and the promotion of orthodox works. Thus, the same technology that had served the Church could also threaten it. According to historian Andrew Pettegree, the fact that the Reformation and the printing press emerged in the same period was no coincidence: the press enabled reformers to reach a mass audience and to coordinate across regions in ways that would have been impossible with manuscript culture alone.

The printing revolution also had economic and social effects. It created new professions—printers, booksellers, editors—and contributed to the rise of literacy and the emergence of a "public sphere" in which ideas could be debated in print. Not everyone benefited equally; women and the poor often had limited access to books and education. Nevertheless, the long-term trend was toward greater circulation of ideas and greater diversity of voices. The example of the scientific revolution illustrates that the ability to publish and compare findings was essential to the development of modern knowledge. Today, as digital media again transform how we produce and consume information, the history of the printing press offers a reminder that technological change can empower and disrupt in equal measure.',
  'The Printing Revolution',
  'The Printing Revolution

The invention of movable-type printing in Europe in the mid-fifteenth century is often described as one of the most transformative developments in human history. Historian Elizabeth Eisenstein has argued that the printing press did not merely speed up the production of books but fundamentally altered the way knowledge was produced, stored, and disseminated. Before printing, texts were copied by hand, which was slow, expensive, and prone to error. The ability to produce hundreds or thousands of identical copies made it possible for ideas to spread rapidly and for readers in different places to refer to the same version of a text. Eisenstein suggests that this "fixity" of the printed word was a precondition for the rise of modern science, as it allowed researchers to build on and correct the work of others with a shared reference point.

Initially, the Church used the press to produce indulgences, liturgical texts, and anti-heretical pamphlets. As the Reformation took hold, however, the spread of vernacular Bibles and Protestant tracts undermined the Church''s monopoly on religious interpretation. The Church responded with censorship, the Index of Forbidden Books, and the promotion of orthodox works. Thus, the same technology that had served the Church could also threaten it. According to historian Andrew Pettegree, the fact that the Reformation and the printing press emerged in the same period was no coincidence: the press enabled reformers to reach a mass audience and to coordinate across regions in ways that would have been impossible with manuscript culture alone.

The printing revolution also had economic and social effects. It created new professions—printers, booksellers, editors—and contributed to the rise of literacy and the emergence of a "public sphere" in which ideas could be debated in print. Not everyone benefited equally; women and the poor often had limited access to books and education. Nevertheless, the long-term trend was toward greater circulation of ideas and greater diversity of voices. The example of the scientific revolution illustrates that the ability to publish and compare findings was essential to the development of modern knowledge. Today, as digital media again transform how we produce and consume information, the history of the printing press offers a reminder that technological change can empower and disrupt in equal measure.'
);
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What does Elizabeth Eisenstein argue about the printing press?',
  '["It only speeded up book production.", "It fundamentally altered the way knowledge was produced, stored, and disseminated.", "It had no effect on science.", "It was used only by the Church."]', 1, 0
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to Eisenstein, why was the "fixity" of the printed word important for science?',
  '["It had no importance.", "It allowed researchers to build on and correct the work of others with a shared reference point.", "It prevented the spread of ideas.", "It was only important for religion."]', 1, 1
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'What is one thing that we learn about the way the Catholic Church responded to printing?',
  '["It never used the press.", "Initially it used the press for indulgences and orthodox texts; later it responded with censorship and the Index of Forbidden Books.", "It encouraged vernacular Bibles from the start.", "It had no response to Protestant tracts."]', 1, 2
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'According to Andrew Pettegree, why was the coincidence of the Reformation and the printing press significant?',
  '["It was not significant.", "The press enabled reformers to reach a mass audience and to coordinate across regions.", "The Church controlled the press completely.", "Printing had no effect on the Reformation."]', 1, 3
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
INSERT INTO public.reading_passage_questions (passage_id, question_text, choices, correct_index, order_num)
SELECT id, 'The example of the scientific revolution illustrates that',
  '["printing had no effect on science.", "the ability to publish and compare findings was essential to the development of modern knowledge.", "science existed only before printing.", "only the Church supported science."]', 1, 4
FROM public.reading_passages WHERE level = '1級' AND passage_type = 'long_content' ORDER BY id DESC LIMIT 1;
