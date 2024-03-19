$(function(){
    /* $('.last_p , .btn_write , .emoji02').on('click',function(){
        $('.warning').show();
        $('.warning .pop_close1 , .pop_close2').on('click',function(){
            $('.warning').hide();
        });
    }); */

    // 신고 클릭시 신고멘트
    $('.last_p').click(function(){
        $('.warning').show();
        $('.warning_txt1').show();
        $('.warning_txt2').hide();
        $('.warning_txt3').hide();
    });

    // 작성 클릭시 작성멘트
    $('.btn_write').click(function(){
        $('.warning').show();
        $('.warning_txt1').hide();
        $('.warning_txt2').show();
        $('.warning_txt3').hide();
    });

    // 좋아요 클릭시 좋아요멘트
    $('.emoji02').click(function(){
        $('.warning').show();
        $('.warning_txt1').hide();
        $('.warning_txt2').hide();
        $('.warning_txt3').show();
    });

    // 로그인 경고창 취소버튼
    $('.warning .pop_close1 , .pop_close2').on('click',function(){
        $('.warning').hide();
    });

    $('.pop_confirm').click(function(){
        location.href="./login.html";
    });

    // 공유 클릭시 로고
    $('.share .sh_svg1').click(function(){
        $('#sh_click1').show();
    });
    $('.share .sh_svg2').click(function(){
        $('#sh_click2').show();
    });
    $('.share .sh_svg3').click(function(){
        $('#sh_click3').show();
    });
    $('.sh_title button').click(function(){
        $('.sh_click').hide();
    });
    // 공유 바깥 클릭시 숨김
    $(document).mouseup(function (e) {
		var movewrap = $(".sh_click");
		if (movewrap.has(e.target).length === 0) {
			movewrap.hide();
		}
	});
    
    // 별 4~5 랜덤
    var result = "";
    var star = $('.star');
    for (var i = 0; i < star.length; i++) {
        var ran = Math.floor((Math.random() * 2) + 4);
        for (var j = 0; j < ran; j++) {
            result += "&#9733;";
        }
        // 별 4개일 경우 회색별
        for (var j = 0; j < 5-ran; j++) {
            result += "<span style='color:#707070;'>&#9733;</span>";
        }
        /* if(ran<5){
            result += "<span style='color:gray;'>&#9733;</span>";
        } */

        star.eq(i).html(result);
        result = "";
    }
});