<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
	<div class="login_wrap w680">
		<div class="login_header">
			<h1>로그인</h1>
			<p><span class="span_popins">SIGN IN TO ACCESS YOUR ACCOUNT</span></p>
		</div>
		
		<main>
			<form action="loginCtrl.do" method="post">
				<section class="login_section_1">
					<div class="login_id">
						<label for="username"></label>
						<input type="text" id="username" name="id" placeholder="이메일 아이디" autocomplete="off" required>
					</div>
                    
					<div class="login_pw">
						<div>
							<label for="login_password"></label>
							<input type="password" id="login_password" name="password" placeholder="비밀번호" autocomplete="off" required>
						</div>
						<div id="show_img">
							<img src="./images/icon/pw_hide.png" alt="비밀번호 보이기">
						</div>
					</div>
				</section>
                
				<div class="login_btn">
					<input type="submit" value="로그인"></input>
				</div>
                
				<div class="login_section_2">
					<div class="right">
						<input type="checkbox" id="save">
						<label for="save">이메일 아이디 저장</label>
					</div>
                    
					<div class="left">
						<div id="find_idpw_btn"><a href="#">아이디·비밀번호 찾기</a></div>
						<div>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
						<div><a href="index.jsp?content=join.jsp">회원가입</a></div>
					</div>
				</div>
			</form>
            
			<div class="cut_line">
				<hr class="colored-line">
				<p>또는</p>
				<hr class="colored-line">
			</div>
            
			<div class="login_sns ">
				<p><span class="span_popins">SNS</span> 계정으로 간편 회원가입</p>
				<div class="sns_img">
					<img src="./images/icon/naver_icon_circle.png" alt="네이버">
					<img src="./images/icon/kakao_circle.png" alt="카카오톡">
				</div>
			</div>
		</main>
	</div>

    <!-- find_idpw -->
	<div id="body_login2">
		<div class="login2_wrap w440">
            <div class="login2_header">
                <h1>아이디 찾기</h1>
                <img src="./images/icon/close.svg" alt="닫기" class="grey_svg">
            </div>
    
            <hr class="login2_line">
    
            <div class="login2_tab">
				<input type="radio" name="login2_tabmenu" id="login2_tab01" checked>
				<label for="login2_tab01">아이디 찾기</label>
				<input type="radio" name="login2_tabmenu" id="login2_tab02">
				<label for="login2_tab02" id="login2_tab02" >비밀번호 찾기</label>
            </div>
            
            <div class="login2_content">
                <div class="login2_sec1">
                    <p>아이디 찾을 방법을 선택해주세요.</p>
                    <input type="radio" id="login2_email" name="1" checked>
                    <label for="login2_email">가입한 이메일로 찾기</label>
                    <input type="text" id="login2_email2" placeholder="이메일 또는 아이디" required>
                    
                    <hr class="login2_line">
    
                    <input type="radio" id="login2_num" name="1" >
                    <label for="login2_num" >가입한 휴대폰으로 찾기</label>
                    <div class="findByN">
                        <input type="text" name="nameornick" id="nameornick" placeholder="이름 또는 닉네임" autocomplete="off" required/>
                        <input type="text" name="phonnum" id="phonnum" placeholder="휴대폰 번호" autocomplete="off" required/>
                    </div>
    
                    <hr class="login2_line">
    
                    <button class="login2_btn">아이디 찾기</button>
                </div>
            </div>
            
            <div class="login2_sec2">
                <input type="text" id="login2_password" placeholder="가입한 아이디" autocomplete="off" required>
                <button class="login2_btn">비밀번호 찾기</button>
            </div>
        </div>
    </div>
    <!-- /find_idpw -->