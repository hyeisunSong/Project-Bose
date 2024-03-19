$(function(){
    let noticeIdx = localStorage.getItem('noticeIdx');
    if (noticeIdx) {
        $('#faq_subpge').find('input[name="tabmemu"]').each(function() {
            if (Number(noticeIdx) === $(this).index()/2) {
                $(this).prop('checked', true);
            }
        });
    }

    $('.tab_content2 .all').click(function(){
        localStorage.setItem('title', $(this).find('a').text());
    });
    $('.faq_header .title').text(localStorage.getItem('title'));

    // con4 1-3. 아이템 선택
    $('.item .item_ul li:nth-child(1), .item li:nth-child(5)').click(function(){
        $('.item_slide').slideUp();
        $('.item_slide .speaker').parent().stop().hide();
        $('.item_slide .soundbar').parent().stop().hide();
        $('.item_slide .earbuds').parent().stop().hide();
    });


    $('.item_earbuds').click(function(){ 
        $('.item_slide').slideDown();
        $('.item_slide .speaker').parent().stop().hide();
        $('.item_slide .soundbar').parent().stop().hide();
        $('.item_slide .earbuds').parent().stop().show();
    });

    $('.item_soundbar').click(function(){ 
        $('.item_slide').slideDown();
        $('.item_slide .speaker').parent().stop().hide();
        $('.item_slide .earbuds').parent().stop().hide();
        $('.item_slide .soundbar').parent().stop().show();
    });

    $('.item_speaker').click(function(){ 
        $('.item_slide').slideDown();
        $('.item_slide .soundbar').parent().stop().hide();
        $('.item_slide .earbuds').parent().stop().hide();   
        $('.item_slide .speaker').parent().stop().show();
    });
    $('.item').find('li').on('click',function(){
        $(this).css('border','3px solid #08cf7c');
        $(this).siblings().css('border', '1px solid #ccc');
    })
    setDateBox();

    $('.con4 button').on('click',function(){
        readyImg();
        return false;
    });
    $('#noticeboard_wrap input[type="submit"]').on('click',function(){
        var isTrue = true;
        var inputTags = $('form input, form textarea');
        for(let i = 0; i < inputTags.length; i++) {
            if (inputTags.eq(i).prop('required')) {
                if (inputTags.eq(i).val().trim().length == 0) {
                    isTrue = false;
                    break;
                }
            }
        }

        if (isTrue) {
            readyImg();
            return false;
        }
    });

    
    $('#tab05').on('click',function(e){
    	e.preventDefault();
//        window.open('index.jsp?content=noticeboard_3.jsp', '_blank');
//        location.href = "index.jsp?content=noticeboard_3.jsp";
		loginCheck('index.jsp?content=noticeboard_3.jsp');
    });

    // 게시판 상세보기에서 목록 버튼 클릭 시
    $('#noticeboard_wrap #boardList').on('click', function() {
        localStorage.removeItem('noticeIdx');
        localStorage.setItem('noticeIdx', 2);
//        location.href='boardAllCtrl.do';
		history.back();
    });

});

function setDateBox(){
	var dt = new Date();
	var year = dt.getFullYear();

	$("#year").append("<option value=''>년도</option>");
	for(var y = (year)-30; y <= (year); y++){
		$("#year").append("<option value='"+ y +"'>"+ y +"</option>");
	}
	
	$("#month").append("<option value=''>월</option>");
	for(var i = 1; i <= 12; i++){
		if(String(i).length == '1'){
			$("#month").append("<option value='"+"0" + i +"'>"+"0" + i +"</option>");
		}else{
			$("#month").append("<option value='"+ i +"'>"+ i +"</option>");
		}
	}
}