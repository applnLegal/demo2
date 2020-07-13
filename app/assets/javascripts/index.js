$(document).ready(function(){
  // if(navigator.userAgent.match(/(iPhone|iPad|Android|ios)/i)){
  //   $("#nav_div").css({"width": "90%"});
  //   $("#nav_div").css({"margin": "0 5%"});
  // };

  Timer();
  // 计时器
  function Timer(){
    var b_time = new Date("2019/01/01 00:00:00").getTime();
    var e_time = new Date().getTime();
    var interval = e_time - b_time;
    var day = Math.floor(interval / (24 * 3600 * 1000));//计算出相差天数
    var leave1=interval%(24*3600*1000);//计算天数后剩余的毫秒数
    var hour = Math.floor(leave1/(3600*1000));//计算出小时数
    var leave2=leave1%(3600*1000); //计算小时数后剩余的毫秒数
    var minute=Math.floor(leave2/(60*1000));//计算相差分钟数
    var leave3=leave2%(60*1000); //计算分钟数后剩余的毫秒数
    var second=Math.round(leave3/1000);
    $('.counttime').text(day+"天"+hour+"时"+minute+"分"+second+"秒");
  }
  var t1 = window.setInterval(Timer,1000);

  // 设置平台下拉框宽度
  var nav_platform_width = $('.nav-platform-div').width();
  $('.nav-platform-option').width(nav_platform_width);
  // 选中的平台
  $('.nav-platform-name').off("click").on("click",function(){
    var text = $(this).text();
    var url = $(this).attr('data-url');
    $('.nav-platform-choose').text(text);
    $('.nav-platform-choose').attr('data-url',url);
    $('.nav-platform-option').toggle();
  });
  // 平台跳转
  $('.nav-platform-jump').off("click").on("click",function(){
    var url = $('.nav-platform-choose').attr('data-url');
    window.open(url);
  });

  /*导航条*/
  $(".nav-platform").off("click").on("click",function(){
    $(".nav-platform-option").toggle();
  });

  /*导航条*/
  $(".nav-span div a").off("click").on("click",function(){
    $(".nav-choose").each(function(){

      $(this).addClass("nav-span-menu");
      $(this).removeClass("nav-choose");
    });
    $(this).parent().addClass("nav-choose");
    $(this).parent().removeClass("nav-span-menu");
    
  });

  /*五大体系*/
  $(".five-system-lists div").off("click").on("click",function(){
    var id = $(this).attr("data-id");
    $(".five-system-choose").each(function(){
      $(this).removeClass("five-system-choose");
    });
    $(this).addClass("five-system-choose");

    // $(".fs-detail-hide").each(function(){
    //   $(this).removeClass("fs-detail-hide");
    // });
    $(".five-system-details").each(function(){
      if(!$(this).is('.fs-detail-hide')){
        $(this).addClass("fs-detail-hide");
      }
      var detail_id = $(this).attr("data-id");
      if(detail_id == id){
        $(this).removeClass("fs-detail-hide");
      }
    });
  });



  $('.bshare-weixin').off("mouseover").on("mouseover",function(){
    $('#qcode_txt').empty();
    var text = $('#qcode_txt').attr("value");
    var qrcode = new QRCode(document.getElementById("qcode_txt"), {
      text: text,
      colorDark : "#000000",
      colorLight : "#ffffff",
      width: 50,
      height: 50,
      correctLevel: 3
    });

  });


  // qq空间转载
  $('.bshare-qzone').off("click").on('click',function(event){
    var h_title = $(this).attr("h_title");
    var h_url = $(this).attr("h_url");
    var h_desc = $(this).attr("h_desc");
     
    var _shareUrl = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?';
    _shareUrl += 'url=' + encodeURIComponent(h_url || document.location);   //参数url设置分享的内容链接|默认当前页location
    // _shareUrl += '&showcount=' + _showcount||0;      //参数showcount是否显示分享总数,显示：'1'，不显示：'0'，默认不显示
    _shareUrl += '&desc=' + encodeURIComponent(h_desc||'分享的描述');    //参数desc设置分享的描述，可选参数
    // _shareUrl += '&summary=' + encodeURIComponent('_summary'||'分享摘要');    //参数summary设置分享摘要，可选参数
    _shareUrl += '&title=' + encodeURIComponent(h_title||document.title);    //参数title设置分享标题，可选参数
    // _shareUrl += '&site=' + encodeURIComponent('_site'||'');   //参数site设置分享来源，可选参数
    //参数pics设置分享图片的路径，多张图片以＂|＂隔开，可选参数
    window.open(_shareUrl,'_blank');
  })



  //  QQ好友分享
  $('.bshare-qq').off("click").on('click',function(event){
    var h_title = $(this).attr("h_title");
    var h_url = $(this).attr("h_url");
    var h_desc = $(this).attr("h_desc");

    var _shareUrl = 'https://connect.qq.com/widget/shareqq/iframe_index.html?';
    _shareUrl += 'url=' + encodeURIComponent(h_url||location.href);   //分享的链接
    _shareUrl += '&title=' + encodeURIComponent(h_title||document.title);     //分享的标题
    window.open(_shareUrl,'_blank');
  })



});
