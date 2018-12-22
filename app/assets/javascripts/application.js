//= require jquery
//= require rails-ujs
//= require_tree .
//= require bootstrap-sprockets


$(function(){
  $('p.up').hide();
  $(window).scroll(function(){
    $('p.pagenum').text($(this).scrollTop());
    if ($(this).scrollTop() > 50){
      $('p.up').fadeIn();
    }else{
      $('p.up').fadeOut();
    }
  });
  $('p.up').on('click',function(){
  $('body, html').animate({
    scrollTop: 0
  },"slow");
  return false;
  });
});
