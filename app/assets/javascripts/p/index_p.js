$(document).ready(function(){


  
  //手机端新闻列表内容宽度
  var w_h = document.body.clientWidth;
  $('#news_all_lists_p .news-lists-nav .news-detail-contain .news-detail-ct').width(w_h-153);

  // 切换导航栏展示
  $('#index_header_p .fa-bars').off("click").on("click",function(){
    $(this).toggle();
    $('#index_header_p .fa-times').toggle();
    $('#nav_div_p').toggle();
  });
  $('#index_header_p .fa-times').off("click").on("click",function(){
    $(this).toggle();
    $('#index_header_p .fa-bars').toggle();
    $('#nav_div_p').toggle();
  });
});
