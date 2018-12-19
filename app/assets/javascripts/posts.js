$(function(){
  // $('.unfavorite').on('click', function(){
  //   $(this).toggleClass('favorite')
  // })

  $('.unfavorite').on('click',function(){
    $.ajax({
        url:'/favorites',
        type:'POST',
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