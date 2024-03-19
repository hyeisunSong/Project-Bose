// 아이디 비밀번호 찾기 탭을 눌렀을 때 상단 텍스트 바뀜

$('#login2_tab02').on('click',function(){
    $('.login2_header h1').text("비밀번호 찾기");
    $('.login2_sec1').hide();
    $('.login2_sec2').show();
});

$('#login2_tab01').on('click',function(){
    $('.login2_header h1').text("아이디 찾기");
    $('.login2_sec2').hide();
    $('.login2_sec1').show();
});

//이메일로 찾기, 번호로 찾기에 따른 섹션 보이기
$('#login2_num').on('click',function(){
    $('.findByN').show();
    $('#login2_email2').hide();
});
$('#login2_email').on('click',function(){
    $('#login2_email2').show();
    $('.findByN').hide();
});




