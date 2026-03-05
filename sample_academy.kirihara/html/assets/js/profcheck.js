$(document).ready(function(){
	$('.replace').each(function(){
		var txt = $(this).html();
		$(this).html(
			txt.replace(/日常会話/g,'Daily Conversation')
			   .replace(/旅・海外旅行/g,'Traveling')
			   .replace(/ワーホリ/g,'Working Holiday')
			   .replace(/キッズ英会話/g,'Kids')
			   .replace(/ビジネス/g,'Business')
			   .replace(/海外就職/g,'Working Abroad')
			   .replace(/学校（授業テスト）/g,'For an academic record')
			   .replace(/資格試験対策/g,'Prepare for Exams')
			   .replace(/映画やニュースの視聴/g,'Watching Movies and News')
			   .replace(/その他/g,'Others')
			   .replace(/たくさん話したい/g,'I want to talk a lot.')
			   .replace(/たくさん話をしてほしい/g,'I want my teacher to talk a lot.')
			   .replace(/まずは基本から教えてほしい/g,'I want to learn from the basics.')
			   .replace(/しっかりと発音を覚えたい/g,'I want to improve my pronunciation.')
			   .replace(/表現をたくさん覚えたい/g,'I want to learn new expressions.')
			   .replace(/文法を中心に学びたい/g,'I want to focus on grammar.')
			   .replace(/間違いをその場で指摘してほしい/g,'I want my teacher to point out the mistakes on the spot.')
			   .replace(/とにかく楽しくレッスンをしたい/g,'I want to have a fun lesson.')
			   .replace(/映画・音楽/g,'Movies, Music')
			   .replace(/スポーツ/g,'Sports')
			   .replace(/旅行/g,'Traveling')
			   .replace(/読書/g,'Reading')
			   .replace(/グルメ、お酒/g,'Food, Drinks')
			   .replace(/美容・ファッション/g,'Beauty, Fashion')
			   .replace(/政治・経済/g,'Politics, Economy')
			   .replace(/ゲーム/g,'Games')
			   .replace(/アウトドア/g,'Outdoors')
			   .replace(/全く会話ができない/g,'I cannot speak at all.')
			   .replace(/単語は少し分かる/g,'I only know simple words.')
			   .replace(/簡単な会話ができる/g,'I can have simple conversations.')
			   .replace(/日常会話ができる/g,'I can have a basic conversation.')
			   .replace(/流ちょうに会話ができる/g,'I can speak fluently.')
		);
	});
});