<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div id="join_wrap" class="nanumgothic">
        <h1>회원가입</h1>
        <p class="policy">
            BOSE 통합 웹회원 정책 상 공식적으로 <strong>만 14세 미만의 경우 회원가입이 불가합니다.</strong>
        </p>
            <div class="top_agree w795">
                <div class="all-agree">
                    <label for="checkbox_choice">
                    <input type='checkbox' id="checkbox_choice" class="select_all" name='essential' value='selectall'/> 
                    <b>약관 전체 동의</b><span class="choice">(선택 항목 포함)</span>
                    </label>
                </div>
                <div class="ckbox">
                    <table>
                        <colgroup>
                            <col style="width: 670px;">
                        </colgroup>
                        <tr>
                            <td>
                                <label for="shop">
                                    <input type='checkbox' class="required" id="shop" name='shop' value='shop'/> 
                                    <span class="select">[필수] BOSE스토어 쇼핑몰 이용약관 동의</span>
                                </label>
                            </td>
                            <td>
                                <span class="all nanumgothic"><a href="#">전체보기 ></a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="guest">
                                    <input type='checkbox' class="required" id="guest" name='guest' value='guest'/> 
                                    <span class="select">[필수] BOSE 고객지원 사이트(SCS) 이용약관 동의</span>
                                </label>
                            </td>
                            <td>
                                <span class="all nanumgothic"><a href="#">전체보기 ></a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="join">
                                    <input type='checkbox' class="required" id="join" name='join' value='join'/> 
                                    <span class="select">[필수] 회원가입 개인정보 수집에 관한 동의</span> 
                                </label>
                            </td>
                            <td>
                                <span class="all nanumgothic"><a href="#">전체보기 ></a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="maketing">
                                    <input type='checkbox' id="maketing" name='maketing' value='maketing'/> 
                                    <span class="select">[선택] 마케팅 목적의 개인정보 처리 및 광고성 정보 수신에 관한 동의</span>
                                </label>
                            </td> 
                            <td>
                                <span class="all nanumgothic"><a href="#">전체보기 ></a></span>
                            </td>
                        </tr>
                    </table>
                </div>
                <button class="agree_btn" onclick="submitAgree()">동의</button>
            </div>
        
        <form action="signUpCtrl.do" method="post" id="signUpForm">
            <div class="container w795 nanumgothic join_check">
                <table>
                    <tr>
                        <td colspan="2"><input type="email" id="email" name="id" required autocomplete="off" placeholder="이메일 아이디 (예:bose@bose.co.kr)"><span id="hdnText" style="color:red;"></span></td>
                        <td align="right">
                            <button type="button" id="idCheck">중복검사</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="password" id="password" name="pass1" required autocomplete="off" placeholder="비밀번호 (대/소문자, 숫자, 특수문자 3종 포함 12-15자리 미만)"></td>
                        <td align="right"><button type="button" id="password_btn"><img class="pw_hide" src="./images/icon/pw_hide.png" alt="패스워드 숨김"></button></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="password" id="repassword" name="pass2" required autocomplete="off" placeholder="비밀번호 확인"></td>
                        <td align="right"><button type="button" id="repassword_btn"><img class="pw_hide" src="./images/icon/pw_hide.png" alt="패스워드 숨김"></button></td>
                    </tr>
                    <tr>
                        <td><input type="text" id="name" name="name" required autocomplete="off" placeholder="이름 (띄어쓰기 없이 입력하세요.)"></td>
                        <td><input type="text" id="bitrh" name="birth" required autocomplete="off" placeholder="생년월일 (예:20210420)"></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <span>성별</span>
                            <label for="gender_f" class="gender"><input type="radio" id="gender_f" name="gender" placeholder="성별" value="F" checked>여성</label>
                            <label for="gender_m" class="gender"><input type="radio" id="gender_m" name="gender" placeholder="성별" value="M">남성</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="tel" id="p_number" name="phone" required autocomplete="off" placeholder="휴대폰 번호 (-없이 입력하세요.)">
                        </td>
                        <td colspan="2" align="right">
                            <button type="button" id="sendmessage" onclick="getToken()">번호인증</button>
                        </td>
                    </tr>
                </table>
                <input type="submit" class="bt_btn" onclick="return submitForm()" value="가입 완료">
            </div>
        </form>
    </div>

    <script>
    	var isCheck = false; // 중복검사 확인 유무
    	
        /* 회원가입 완료 알림창 */ 
        function submitForm() {
            var joinCheck = $('.join_check input');
            var isTrue = true;
            for(var i=0;i<joinCheck.length;i++){
                if (joinCheck.prop('required')) {
                    if (joinCheck.eq(i).val().trim().length==0){
                        isTrue = false;
                        break;
                    }
                }
            }
            
            var pw1 = $('#password').val();
            var pw2 = $('#repassword').val();
            if (pw1 != pw2) {
            	alert('비밀번호가 일치하지 않습니다.');
            	$('#password').focus();
            	return false;
            }
            
            if(isCheck == false) {
            	alert('중복검사 확인 후 가입 가능!');
            	return false;
            }
            
            if(!isTrue){
				return false;
            }
            
            return true;
        }
        
        /* 전체 체크시 애니메이션 */ 
        function submitAgree() {}

        
        function getToken() {
            var telCom = $('input[type="tel"]').val().trim();
            console.log(telCom);
            if (telCom.length>0){
                alert('인증번호가 발송 되었습니다.');
            }else{
                alert('휴대폰 번호를 입력해주세요.');
            }
        }

        /* 아래로 필수만 선택시, 전부 선택시에만 동의버튼 작동하도록 추가 CSS 커서 포인터 추가 */ 
        $('.select_all').on('click',function(){
            let chbox = $('input[type="checkbox"]');
            for (let i = 0; i < chbox.length; i++) {
                var isChecked = $(this).eq(0).prop('checked');
                chbox.eq(i).prop('checked', isChecked);
            }});

        $(document).ready(function(){
	        $('.container').hide();
	        $('.agree_btn').on('click',function(){
	            let chk = true;
	            let chbox = $('input[class="required"]');
	            for (let i = 0; i < chbox.length; i++) {
	                var isChecked = chbox.eq(i).prop('checked');
	                if (!isChecked) {
	                    chk = false;
	                    break;
	                }
	            }
	            if (chk) {
	                $('.container').stop().slideToggle();
	                $('html, body').animate({ scrollTop : $('.agree_btn').offset().top }, 450);
	            }else{
	                alert("필수 항목을 동의하세요.");
	            }
	            
	        });

	        /* 눈 모양 show.hide 제이쿼리 */
	        $('#password_btn, #repassword_btn').on('click', function() {
	            if ($(this).hasClass('active')) {
	                //$('#password_btn, #repassword_btn').attr('type', 'password');
	                $(this).closest('tr').find('input[type="text"]').attr('type', 'password');
	                $(this).removeClass('active');
	                $(this).children().attr("src","./images/icon/pw_hide.png");
	            } else {
	                // $('#password_btn, #repassword_btn').attr('type', 'text');
	                $(this).closest('tr').find('input[type="password"]').attr('type', 'text');
	                $(this).addClass('active');
	                $(this).children().attr("src","./images/icon/pw_show.png");
	            }
	        });
	        $('#join_wrap a[href="#"]').click(function(e){
	            e.preventDefault();
	        });
	        
	        $('#join_wrap #idCheck').on('click', function(e) {
	        	e.preventDefault();
	        	
	        	var email = $('#email').val().trim();
	        	if (email.indexOf('@') < 0) {
	        		alert('이메일 형식이 아닙니다.');
	        		$('#email').focus();
	        		return false;
	        	}
	        	
	        	if (email.length > 0) {
					$.ajax({
						  url : "idCheckCtrl.do"
						, type : 'post'
						, data : {id : $('#email').val()}
						, dataType : 'text'
						, success : function(data) {
							if (data == 1) {
								isCheck = false;
								$('#email').val("").focus();
								$('#hdnText').text('사용중인 아이디 입니다.').css({'color':'red', 'display':'inline-block'});
							} else {
								isCheck = true;
								$('#hdnText').text('사용 가능한 아이디 입니다.').css({'color':'green', 'display':'inline-block'});
							}
						}
						, error : function(request, status, error) {
							console.log(error);
						}
					});
	        	}
			});
	        
	        $('#join_wrap #email').on('keyup', function() {
	        	isCheck = false;
	        	$('#hdnText').text('').css({'display':'none'});
			});
	        
        });
        

    </script>