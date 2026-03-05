(function () {

var processing = false;

$(document).ready(function(){
	var fav_set_list = $('a.fav_set');
	// clickイベントリスナー
	fav_set_list.click( function(event) {
		event.preventDefault();
		if( processing === true ) { return; }
		reqFavSet($(this));
	});
});

function reqFavSet(fav_set) {
	var url = fav_set.attr('href');
	if( ! url ) { return; }
	if( ! fav_set.hasClass('fav_set') ) { return; }
	fav_set.text('処理中...');
	$.ajax({
		url: url,
		type: 'GET',
		cache: false,
		dataType: 'text',
		success: function(data) {
			if( data.match(/^0/) ) {
				var caption = fav_set.attr('data-caption0');
				fav_set.text(caption);
			} else if( data.match(/^1/) ) {
				var caption = fav_set.attr('data-caption1');
				fav_set.text(caption);
			} else {
				fav_set.text('処理エラー');
			}
			processing = false;
		},
		error: function(jqXHR, textStatus, errorThrown) {
			fav_set.text('処理エラー');
			processing = false;
		}
	});
}

})();
