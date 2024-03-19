// 최상단 이동버튼
$('#sub_wrap .floBtn').on('click', function() {
    $('html, body').animate({scrollTop : 0}, 500);
});
// 스크롤 위치가 상단인 경우 이동버튼 제어
$(window).on('scroll', function() {
    if ($(this).scrollTop() < 300) {
        $('#sub_wrap .floButtonArea').hide();
    } else {
        $('#sub_wrap .floButtonArea').show();
    }
});