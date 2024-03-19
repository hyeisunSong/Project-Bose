<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="body_login2">
		<div class="login2_wrap w400">
			<div class="login2_header">
				<h1>아이디 찾기</h1>
				<img src="./images/icon/close.svg" alt="닫기">
			</div>
    
			<hr class="login2_line">
    
			<div class="login2_tab">
				<input type="radio" name="login2_tabmenu" id="login2_tab01" checked >
				<label for="login2_tab01">아이디 찾기</label>
				<input type="radio" name="login2_tabmenu" id="login2_tab02">
				<label for="login2_tab02" id="login2_tab02" >비밀번호 찾기</label>
			</div>
			
			<div class="login2_content">
				<div class="login2_sec1">
					<p>아이디 찾을 방법을 선택해주세요.</p>
					<input type="radio" id="login2_email" name="1" checked>
					<label for="login2_email">가입한 이메일로 찾기</label>
					<input type="text" id="login2_email2" placeholder="이메일 또는 아이디">
                    
					<hr class="login2_line">
    
					<input type="radio" id="login2_num" name="1" >
					<label for="login2_num" >가입한 휴대폰으로 찾기</label>
					
					<div class="findByN">
						<input type="text" name="nameornick" id="nameornick" placeholder="이름 또는 닉네임" autocomplete="off">
						<input type="text" name="phonnum" id="phonnum" placeholder="휴대폰 번호" autocomplete="off">
					</div>
    
					<hr class="login2_line">
    
					<button class="login2_btn">아이디 찾기</button>
				</div>
				
				<div class="login2_sec2">
                    <input type="text" id="login2_password" placeholder="가입한 아이디" autocomplete="off" required>
                    <button class="login2_btn">비밀번호 찾기</button>
                </div>
            </div>
        </div>
	</div>