/*=========================================================
Functions
=========================================================*/
$(document).ready(function(){
/* jquery*/
  $(".searchdet").click(function(){
    $(".toggle").slideToggle("slow");
  });

  $("a.tab").click(function(){
    $(".activo").removeClass("activo");
    $(this).addClass("activo");
    $(".contenido").hide('slow');
     var muestra = $(this).attr("title");
    $("#"+muestra).show('slow'); 
  });
/*scroll*/
  var topBtn = $('#scroll');
  $(window).scroll(function(){
    if($(this).scrollTop() > 120){ //スクロール値
      topBtn.addClass('fixed');
    }else{
      topBtn.removeClass('fixed');
    }
  });
  // 動きをスムーズに
  topBtn.click(function () {
    $('body,html').animate({
      scrollTop: 0
    },500);
    return false;
  });
  $(".answer").hide();
      $("h3.question").on("click", function() {
    $(this).next().slideToggle();
    $(this).toggleClass("active");
  });

      /* fixed */
      jQuery(function() {
        var nav = jQuery('.wt_header');
        var offsetTop = nav.offset().top;
        var floatMenu = function() {
          if (jQuery(window).scrollTop() > 120) {
            nav.addClass('fixed');
          } else {
            nav.removeClass('fixed');
          }
        }
        jQuery(window).scroll(floatMenu);
        jQuery('body').bind('touchmove', floatMenu);
      });
      var topBtn = $('#scroll');
      $(window).scroll(function() {
        if ($(this).scrollTop() > 80) {
          topBtn.addClass('fixed');
        } else {
          topBtn.removeClass('fixed');
        }
      });
  
      /* drawer */
  $('.drawer').drawer({
    iscroll: {
      mouseWheel: false
    }
  });
});