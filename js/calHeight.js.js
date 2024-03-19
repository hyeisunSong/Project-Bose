$(function(){
    // 브라우저의 동적 너비, 높이 값
    var browserWidth = $(window).width();
    var browserHeight = $(window).height();
    // DOM에 적용
    $('#wrap').css('height',browserHeight);
});