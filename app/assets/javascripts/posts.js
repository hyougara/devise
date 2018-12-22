$(function(){
  // $('.unfavorite').on('click', function(){
  //   $(this).toggleClass('favorite')
  // })
  

  $('.fa-heart').on('click',function(){
    //alert($(this).data('post_id'))
    $.ajax({
        url:'/favorites',
        type:'POST',
        data: {post_id: $(this).data('post_id')},
    })
    .done((data) => {
      console.log('/posted/favorites')
      $(this).toggleClass("favorite");
    })
    .fail((data) => {
      alert('お気に入りの登録に失敗しました');
    })
  });
});