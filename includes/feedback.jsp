<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Feedback bar -->
    <div class="feedbackbar" onclick="toggleFeedback()">피드백보내기</div>
    <!-- /Feedback bar -->
    <div class="feedback_wrap w600">
        <div class="feedback_header">
            <div class="feedback_logo">
                <img src="./images/main/bose_logo2.png" alt="로고90x90">
            </div>
            <form class="feedback_lang">
                <select id="languageSelect" onchange="changeLanguage()">
                    <option value="ko">한국어</option>
                    <option value="en">영어</option>
                </select>
            </form>
        </div>
        <div class="feedback_q1">
            <p id="q1_text">목표를 달성할 수 있었나요?</p>
            <input type="radio" id="yes" name="choice" value="yes" checked>
            <label for="yes">예</label>
    
            <input type="radio" id="no" name="choice" value="no">
            <label for="no">아니오</label>
        </div>
            <hr class="grey1">
        <div class="feedback_q2">
            <p id="q2_text">친구나 가족에게 Bose.com 쇼핑을 추천할 의향은 얼마나 됩니까?</p>
            <div class="level">
                <p id="q2_lv1">전혀 가능성이 없음</p>
                <p id="q2_lv10">가능성이 매우 높음</p>
            </div>
            <div class="q2_level">
                <div>
                    <label for="lv1">1</label>
                    <input type="radio" name="level" id="lv1">
                </div>
                
                <div>
                    <label for="lv2">2</label>
                    <input type="radio" name="level" id="lv2">
                </div>
                <div>
                    <label for="lv3">3</label>
                    <input type="radio" name="level" id="lv3">
                </div>
                <div>
                    <label for="lv4">4</label>
                    <input type="radio" name="level" id="lv4">
                </div>
                <div>
                    <label for="lv5">5</label>
                    <input type="radio" name="level" id="lv5" checked>
                </div>
                <div>
                    <label for="lv6">6</label>
                    <input type="radio" name="level" id="lv6">
                </div>
                <div>
                    <label for="lv7">7</label>
                    <input type="radio" name="level" id="lv7">
                </div>
                <div>
                    <label for="lv8">8</label>
                    <input type="radio" name="level" id="lv8">
                </div>
                <div>
                    <label for="lv9">9</label>
                    <input type="radio" name="level" id="lv9">
                </div>
                <div>
                    <label for="lv10">10</label>
                    <input type="radio" name="level" id="lv10">
                </div>
            </div>
        </div>
        
        <hr class="grey2">
        
        <div class="feedback_q3">
            <p id="q3_text">귀하의 쇼핑 경험을 향상시키기 위해 우리가 할 수 있는 한 가지는 무엇입니까?</p>
            <input type="text">
        </div>
        <div class="feedback_footer">
            <p ><a href="javascript:void(0);"><font id="footer_text">개인 정보 정책</font></a></p>
        </div>
        <div class="feedback_btn">
            <div>
                <button class="feedback_btn1">닫기</button>
                <button class="feedback_btn2">제출</button>
            </div>
        </div>
    </div>