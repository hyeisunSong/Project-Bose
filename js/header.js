$(document).ready(function() {
    let isMain = $(document).find('.mainpage_wrap');
    
    $(document).on('click','#header_wrap .popupArea p:last-child img', function(){
        $('.popupArea').slideUp();
    });

    // 검색 버튼 (돋보기)
    $(document).on('click', '#searchIcon', function(e) {
        e.preventDefault();
        $('.searchPop').stop().slideDown();
        setTimeout(function() {
            $('#searchInput').focus();
        }, 500);
    });
    // 검색 영역 닫기
    $(document).on('click', '.closeX', function() {
        $('.searchPop').stop().slideUp();
    });
    // 추천검색어 선택
    $(document).on('click', '.recommandArea span', function() {
        let searchTxt = $(this).text();
        localStorage.removeItem('searchTxt');
        localStorage.setItem('searchTxt', searchTxt);
        location.href = "./searchpage.html";
    });
    // 검색 엔터키
    $(document).on('keyup', function(e) {
        let focusId = $(':focus').attr('id');
        // 현재 포커스가 검색 창인지 확인 | 엔터키 인지 확인
        if (focusId === 'searchInput' && e.keyCode == 13) {
            let searchTxt = $('#searchInput').val().trim();
            if (searchTxt.length > 0) {
                localStorage.removeItem('searchTxt');
                localStorage.setItem('searchTxt', searchTxt);
                location.href = "./searchpage.html";
            }
        }
    });
    // 돋보기 버튼 클릭 시
    $(document).on('click', '.searchPop #searchBtn', function() {
        let searchTxt = $('#searchInput').val().trim();
        if (searchTxt.length > 0) {
            localStorage.removeItem('searchTxt');
            localStorage.setItem('searchTxt', searchTxt);
            location.href = "./searchpage.html";
        }
    });

    // 서브페이지 이동
    $(document).on('click', '.menu1 a[href="#"]', function(e) {
        e.preventDefault();
        let link  = $(this).data('link');
        let mType = $(this).data('mtype');
        let dType = $(this).data('dtype');
        let typeNm;
        if (dType) {
            typeNm = $(this).text();
        }
        pageMove(link, mType, dType, typeNm);
    });

    // 고객지원 하위목록 클릭시
    $(document).on('click', '.menu2 > ul li', function() {
        localStorage.removeItem('noticeIdx');
    });
    $(document).on('click', '.menu2 .subNav_support li', function() {
        let noticeIdx = $(this).index();
        console.log(noticeIdx);
        localStorage.removeItem('noticeIdx');
        localStorage.setItem('noticeIdx', noticeIdx);
    });
    $(document).on('mouseenter', '.subNav', function() {
        $(this).parent().css({'background':'rgba(255,255,255,0.1)'});
    });
    $(document).on('mouseleave', '.subNav', function() {
        $(this).parent().css({'background':'#000'});
    });


    // 최상단 이동버튼
    $(document).on('click', '.floBtn', function() {
        $('html, body').animate({scrollTop : 0}, 500);
    });
    // 스크롤 위치가 상단인 경우 이동버튼 제어
    $(window).on('scroll', function() {
        if ($(this).scrollTop() < 300) {
            $('.floButtonArea').hide();
        } else {
            $('.floButtonArea').show();
        }

        if (isMain.length > 0 && $(this).scrollTop()>1030) {
            $('#header_wrap').hide();
        }else{
            $('#header_wrap').show();
        }
    });

    // 챗봇
    $(document).on('click','.chatBtn>a',function(e){
        e.preventDefault();
        readyImg();
    })

    // 메뉴1,2 영역 
    $(document).on('mouseenter', '.menu1 , .menu2', function() {
        $(this).find('.subMenu').stop().fadeIn();
        $('#header_wrap .logoArea, #header_wrap .gnbArea').css('background','rgba(0,0,0,1)');
    });
    $(document).on('mouseleave', '.menu1 , .menu2', function() {
        $(this).find('.subMenu').stop().fadeOut();
        if (isMain.length > 0) {
            $('#header_wrap .logoArea, #header_wrap .gnbArea').css('background','rgba(0,0,0,0.5)');
        }
    });

    // header효과 수정 ing....
    // gnb메뉴
    $(document).on('mouseenter', '.subMenu>ul>li', function() {
        $(this).css({'background':'rgba(255,255,255,0.1)'});
        $(this).css({'background':'rgba(255,255,255,0.1)'});
        $(this).parents('.menu1').find('.menu li').eq($(this).index()).css({'background':'rgba(255,255,255,0.1)'});
        $(this).parents('.menu1').find('.menu li a').eq($(this).index()).css({
            'color':'#5ae0a8',
            'box-shadow': '0px -1px 0px 0px #5ae0a8 inset'
        });
    });
    $(document).on('mouseleave', '.subMenu>ul>li', function() {
        $(this).css({'background':'#000'});
        $(this).parents('.menu1').find('.menu li').eq($(this).index()).css({'background':'none'});
        $(this).parents('.menu1').find('.menu li a').eq($(this).index()).css({
            'color':'#fff',
            'box-shadow': 'none'
        });
    });
    // 고객지원
    $(document).on('mouseenter', '.menu2>ul>li', function() {
        $(this).css({'color':'#5ae0a8','box-shadow': '0px -1px 0px 0px #5ae0a8 inset'});
    });
    $(document).on('mouseleave', '.menu2>ul>li', function() {
        $(this).css({'color':'#fff','box-shadow': 'none'});
    });
    $(document).on('mouseenter', '.subMenu>ul>li', function() {
        $(this).css({'background':'rgba(255,255,255,0.1)','color':'#5ae0a8'});
    });
    $(document).on('mouseleave', '.subMenu>ul>li', function() {
        $(this).css({'background':'#000','color':'#fff'});
    });
    
    $(document).on('mouseenter', '.subNav_support', function() {
        $('.menu2>ul>li').css({
            'color':'#5ae0a8',
            'box-shadow': '0px -1px 0px 0px #5ae0a8 inset'  
        });
    });
    $(document).on('mouseleave', '.subNav_support', function() {
        $('.menu2>ul>li').css({
            'color':'#fff',
            'box-shadow': 'none'
        });
    });
    
    $('#inquiry').on('click',function(e){
    	e.preventDefault();
    	localStorage.removeItem('searchText');
    	loginCheck('index.jsp?content=noticeboard_3.jsp');
    });
    
});

function loginCheck(path) {
	$.ajax({
		  url : "loginCheckCtrl.do"
		, type : 'post'
		, data : {path : path}
		, dataType : 'text'
		, success : function(data) {
			if (data != 1) {
				alert('로그인 후 이용해주세요');
    			location.href = 'index.jsp?content=login.jsp';
    			return false;
    		}
			location.href = path;
		}
		, error : function(request, status, error) {
			console.log(error);
		}
	});
}



function pageMove(link, mType, dType, typeNm) {
    localStorage.removeItem('mType');
    localStorage.removeItem('dType');
    localStorage.removeItem('typeNm');
    localStorage.removeItem('searchTxt');

    if (mType)  localStorage.setItem('mType', mType);
    if (dType)  localStorage.setItem('dType', dType);
    if (typeNm) localStorage.setItem('typeNm', typeNm);
    if (link)   location.href = 'index.jsp?content=' + link + '.jsp';
}

// 준비중 이미지
function readyImg() {
    $(document).find('.readyImg').stop().fadeIn().delay(1500).fadeOut();
}

