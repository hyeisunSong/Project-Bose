$(function() {
	var iconIndex = 0;
	var iconPaths = ["./images/icon/pw_show.png", "./images/icon/pw_hide.png"];
	var passwordField = $('#login_password');
	
	$('#show_img').on('click', function() {
	    // 현재 아이콘 경로 설정
	    $(this).find('img').attr('src', iconPaths[iconIndex]);
	    // 다음 아이콘으로 순환
	    iconIndex = (iconIndex + 1) % iconPaths.length;
	    if(iconIndex==1 && passwordField.attr('type') === 'password'){
	        passwordField.attr('type', 'text');
	    } else {
	        passwordField.attr('type', 'password');
	    }
	});
	
	//버튼을 누르면 창이 뜸
	$('#find_idpw_btn').on('click',function(){
	    // alert('aa')
	    $('#body_login2').css("display","block");
	});
	
	// 닫기 누르면 닫침
	$('.login2_header img').on('click',function(){
	    $('#body_login2').css("display","none");
	});
	
	// 아이디 비밀번호 찾기 버튼을 누르면 준비중입니다 얼럿
	$('.login2_btn').on('click',function(){
	    alert('입력하신 정보와 일치하는 계정이 없습니다. 다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
	});
	
	// SNS 버튼을 누르면 준비중이 뜸
	$('.sns_img img').on('click',function(){
	    readyImg();
	});
	
});