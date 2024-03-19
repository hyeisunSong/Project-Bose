$(function() {
    // 피드백바 버튼 누르면 피드백 바 버튼 사라짐
    $('.feedbackbar').on('click',function(){
        $('.feedbackbar').hide();
    });
    //피드백의 닫기를 누르면 피드백 사라지고, 버튼 나타남
    $('.feedback_btn1').on('click',function(){
        $('.feedback_wrap').css('right',-600);
        $('.feedbackbar').show();
    });
    $('.feedback_btn2').on('click',function(){
        $('.feedback_wrap').css('right',-600);
        $('.feedbackbar').show();
        // alert("제출되었습니다");
    });
    
});

function toggleFeedback() {
    var feedbackWrap = document.querySelector('.feedback_wrap');
    // feedback_wrap의 left 속성을 토글하여 나타내거나 숨김
    if (feedbackWrap.style.right === '-600px' || feedbackWrap.style.right === '') {
        feedbackWrap.style.right = '0';
    } else {
        feedbackWrap.style.right = '-600px';
    }
}

function changeLanguage() {
    // var selectedLanguage = document.getElementById('languageSelect').value;
    var selectedLanguage = $('#languageSelect').val();
    // console.log(selectedLanguage);

    if (selectedLanguage === 'ko') {
        document.getElementById('q1_text').innerText = '목표를 달성할 수 있었나요?';
        $('label[for="yes"]').text('예');
        $('label[for="no"]').text('아니오');
        document.getElementById('q2_text').innerText = '친구나 가족에게 Bose.com 쇼핑을 추천할 의향은 얼마나 됩니까?';
        document.getElementById('q2_lv1').innerText = '전혀 가능성이 없음';
        document.getElementById('q2_lv10').innerText = '가능성이 매우 높음';
        document.getElementById('q3_text').innerText = '귀하의 쇼핑 경험을 향상시키기 위해 우리가 할 수 있는 한 가지는 무엇입니까?';
        document.getElementById('footer_text').innerText = '개인 정보 정책';
        document.getElementById('footer_text').innerText = '개인 정보 정책';
        document.querySelector('.feedback_btn1').innerText = '닫기';
        document.querySelector('.feedback_btn2').innerText = '제출';
    } else if (selectedLanguage === 'en') {
        document.getElementById('q1_text').innerText = 'Were you able to achieve your goals?';
        $('label[for="yes"]').text('Yes');
        $('label[for="no"]').text('No');
        document.getElementById('q2_text').innerText = 'How likely are you to recommend Bose.com shopping to friends or family?';
        document.getElementById('q2_lv1').innerText = 'Not likely at all';
        document.getElementById('q2_lv10').innerText = 'Very likely';
        document.getElementById('q3_text').innerText = 'What is one thing we can do to enhance your shopping experience?';
        document.getElementById('footer_text').innerText = 'Privacy Policy';
        document.querySelector('.feedback_btn1').innerText = 'Close';
        document.querySelector('.feedback_btn2').innerText = 'Turn It';
    }
}