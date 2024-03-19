$(function(){
    /* 아이템 코드 받아오기 */
    var itemCode = localStorage.getItem('itemCode');
    // console.log(itemCode);
    var item = getItem(itemCode);
    // console.log(item);
    // 전체아이템
    // console.log(items);

    /* 상단 상품이미지 및 설명 */
    var itemImg = $('<img>');
    itemImg.attr({'src':'./images/'+item.mType+'/'+item.imgs[0], 'alt':'제품이미지', 'id':'content_image'});
    // $('#content_image').attr('src', './images/'+item.mType+'/'+item.imgs[0]);
    $('#content_image_area').html(itemImg);
    // console.log('./images/'+item.mType+'/'+item.imgs[0]);
    $('.content_product_name').text(item.itemName);
    $('.content_product_price .price').html(withComma(item.price)+'<small>원</small>');
    $('.circle_color_1').css('background-color',item.colors[0]);
    $('.circle_color_2').css('background-color',item.colors[1]).hide();
    // 색이 1개면 1개만 출력, 2개면 2개 출력 되는 조건문
    if(item.colors[1]){
        $('.circle_color_2').css('background-color',item.colors[1]).show();
        $('.circle_color_1').click(function(e){
            e.preventDefault();
            $('#content_image').attr('src', './images/'+item.mType+'/'+item.imgs[0]);
        });
        $('.circle_color_2').click(function(e){
            e.preventDefault();
            $('#content_image').attr('src', './images/'+item.mType+'/'+item.imgs[1]);
        });
    }

    /* 추천 제품 랜덤으로 나열 */
    // 중복없이!! 난수 생성
    var ranArr = [];
    while(ranArr.length < 6) {
        let ran = Math.floor(Math.random() * items.length);
        if (ranArr.indexOf(ran) == -1) {
            ranArr.push(ran);
        }
    }
    // console.log(ranArr);
    // 추천 제품에 서로 다른 제품 할당
    for(var i=0; i<ranArr.length;i++){
        if ($('.recommend_product_img').eq(i)) {
            $('.recommend_product_img').eq(i).attr('src', './images/' + items[ranArr[i]].mType + '/' + items[ranArr[i]].imgs[0]);
            $('.recommend_product_name').eq(i).text(items[ranArr[i]].itemName.substr(6));
            $('.recommend_product_price').eq(i).html(withComma(items[ranArr[i]].price + '원'));
            $('.recommend_product_name').eq(i).parent().data('itemcode', items[ranArr[i]].itemCode);
        }
    } 

    /* 추천 상품 클릭시 -> 다른 콘텐츠 페이지로 이동 */
    let contentItem = $('.recommend_product a');
    // contentItem.append(itemLink);
    contentItem.on('click', function(e) {
        e.preventDefault();
        // console.log($(this).data('itemcode'));
        localStorage.removeItem('itemCode');
        localStorage.setItem('itemCode', $(this).data('itemcode'));
        location.href = "./contentpage.html";
    });

    /* 팝업 띄우기 */
    // 1. 찜하기 버튼 클릭
    $('.favorite').click(function(e){
        e.preventDefault();
        $('.content_favorite').css('display','block');
    });
    // 1-1. 쇼핑 계속하기 시 팝업 숨기기
    $('.content_favorite .pop_close1').on('click',function(){
        $('.content_favorite').hide();
    });
    // 2. 옵션 팝업
    $('.product_remain .local_mall, .product_remain .redeem, .product_remain .buy').click(function(e){
        e.preventDefault();
        $('.content_option').css('display','block');
    });
    // 2-1. 옵션 확인 버튼
    $('.content_option .pop_close1, .content_option .buy').on('click',function(){
        $('.content_option').hide();
    });
    // ++ 제품 선택 제품명 가지고 오기
    $('.product_selected_box>span:last-child').html("제품 : "+item.itemName);

    /* 제품선택 - 우측 arrow 움직임 및 선택할 제품 토글 */
    var rotated = false;
    $('#product_selection_box').click(function(){        
        if (rotated) {
            $('.product_selection #product_selection_box span:first-child').css({ 'transform': 'rotate(45deg)' });
            $('.product_selection #product_selection_box span:last-child').css({ 'transform': 'rotate(-45deg)' });
            $('.product_selected_box').css('display','none');
        } else {
            $('.product_selection #product_selection_box span:first-child').css({ 'transform': 'rotate(-45deg)' });
            $('.product_selection #product_selection_box span:last-child').css({ 'transform': 'rotate(45deg)' });
            $('.product_selected_box').css('display','block');
        }
        rotated = !rotated; 
    });
    /* 옵션 선택시 총 상품 단에 개수 & 금액 증가 */
    $('.product_selected_box').click(function(){ 
        $('#product_selection_box').html("제품 : "+ item.itemName+"<span></span><span></span>");
        $('.product_selected_box').css('display','none');
        $('.product_all_price>h2').html('총&nbsp;상품금액&nbsp;<small>(총&nbsp;'+ 1+'개)</small>');
        $('.product_all_price>p').html(withComma(item.price)+'&nbsp원');
        // 옵션 선택했을 때 팝업 및 alert 효과
        $('.product_remain .buy').click(function(){
            $('.content_option').css('display','none');
            $('#readyreadyready').fadeIn().delay(1500).fadeOut();
        });
        $('.product_remain .local_mall').click(function(){
            $('.content_option').css('display','none');
            alert("장바구니에 담겼습니다.");
        });
        $('.product_remain .redeem').click(function(){
            $('.content_option').css('display','none');
            $('#readyreadyready').fadeIn().delay(1500).fadeOut();
        });
        rotated = !rotated; 
    });

    /* 공유 팝업 */
    $('.content_product_first div:last-child a').click(function(e){
        e.preventDefault();
        $('#content_share_bg').css('display','block');
    });
    $('.content_share .sh_title button').click(function(){
        $('#content_share_bg').css('display','none');
    });
    // 아이콘 마진
    var iconMargin = $('#content_share_bg .sh_sns').children();
    // console.log(iconMargin);
    for(i=0; i<iconMargin.length;i++){
        if(i>3){
            $(iconMargin).eq(i).css('margin-top','20px');
        }
    }

     /* 보스 알파 유니버스 -  준비중 팝업 */
     $('.content_buttons ul:first-child a').click(function(e){   
        e.preventDefault();
        $('#readyreadyready').fadeIn().delay(1500).fadeOut();

    });

    // + 추가) 마일리지 계산
    $('.vip_mileage .vip>h4').text(withComma(item.price*4/100));
    $('.membership_mileage .membership>h4').text(withComma(item.price*2/100));
   

    // 리뷰페이지 a href 막기
    $('.listPage').click(function(e){
        e.preventDefault();
    });
});
