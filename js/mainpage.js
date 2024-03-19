$(function() {
    // 베스트 상품 ====================================================================================================================
    bestItem = bestItems();

    // 4개씩 묶기 - 부모 박스
    let best_items_page = $('<div></div>');
    let best_items_page_num = 1;
    best_items_page.addClass('best_items_page items_page_num_0' + best_items_page_num);
    $(best_items_page).appendTo('.mainpage_best');
    
    // for(var i = 0; i<bestItem.length; i++)
    for(var i = 0; i<bestItem.length; i++){
        // 4개씩 묶기 
        var result = i%4;
        if(result == 0  && i != 0) {
            best_items_page_num += 1;
            best_items_page = $('<div></div>').addClass('best_items_page items_page_num_0' + best_items_page_num).appendTo('.mainpage_best');
        }

        // 아이템 DIV
        // console.log(bestItem[i]);    
        let itmes_wrap = $('<div></div>');
        itmes_wrap.addClass('best_item_00');
        
        $(itmes_wrap).appendTo(best_items_page);
        itmes_wrap.css({width:333});
        

        // 이미지
        let itmes_img = bestItem[i].imgs[0];
        let html_itmes_img = $('<div></div>');
        html_itmes_img.addClass('items_img');
        let itmes_img_url = '/images/' + bestItem[i].mType +'/'+ itmes_img;
        html_itmes_img.css({
            background:'url(.' + itmes_img_url + ')',
            'background-position':'center',
            'background-size':'cover',
            'cursor': 'pointer'
        });
        html_itmes_img.data('itemcode', bestItem[i].itemCode);
        $(html_itmes_img).appendTo(itmes_wrap);

        // 색상
        for(var j=0; j<bestItem[i].colors.length; j++) {
            let items_color = bestItem[i].colors[j];
            let html_itmes_color = $('<div></div>');
            html_itmes_color.css({
                width: 12,
                height: 12, 
                border: '1px solid #000',
                'margin-right': 6,
                'margin-bottom': 10,
                float: 'left' 
            });
            html_itmes_color.addClass('items_color');
            html_itmes_color.css({background:items_color});
            $(html_itmes_color).appendTo(itmes_wrap);
        }

        // 제품명
        let itmes_name = bestItem[i].itemName;
        let html_itmes_name = $('<div>'+itmes_name+'</div>');
        html_itmes_name.addClass('items_name');
        html_itmes_name.data('itemcode', bestItem[i].itemCode);
        $(html_itmes_name).appendTo(itmes_wrap);

       
        // 가격 + sale
        if(bestItem[i].sales == 0) {
            let items_price = withComma(bestItem[i].price);
            let html_itmes_price = $('<div>'+items_price+' 원</div>');
            html_itmes_price.addClass('items_price');
            $(html_itmes_price).appendTo(itmes_wrap);
        } else {
            let items_price = withComma(bestItem[i].sales);
            let html_itmes_price = $('<div>'+items_price+' 원</div>');
            html_itmes_price.addClass('items_price');
            $(html_itmes_price).appendTo(itmes_wrap);
            
            let html_itmes_sale = $('<div><s>'+ withComma(bestItem[i].price) +' 원</s></div>');
            html_itmes_sale.addClass('items_sale');
            $(html_itmes_sale).appendTo(itmes_wrap);

        }

        let html_itmesBox = $('<div></div>');
        html_itmesBox.addClass('items_box');
        html_itmesBox.css({cursor: 'default'});
        $(html_itmesBox).appendTo(itmes_wrap);
        if(bestItem[i].sales > 0) {
            let html_itemsBox_sale = $('<div>SALE</div>');
            html_itemsBox_sale.addClass('sale')
            $(html_itemsBox_sale).appendTo(html_itmesBox);
        }
        
        // new
        if(bestItem[i].isNew == 'Y'){
            let html_itemsBox_new = $('<div>NEW</div>');
            html_itemsBox_new.addClass('new')
            $(html_itemsBox_new).appendTo(html_itmesBox);
        }

        // best
        if(bestItem[i].isBest == 'Y'){
            let html_itemsBox_best = $('<div>BEST</div>');
            html_itemsBox_best.addClass('best');
            $(html_itemsBox_best).appendTo(html_itmesBox);
        }

        // 리뷰
        let html_itmes_review = $('<div></div>');
        html_itmes_review.addClass('items_review');
        $(html_itmes_review).appendTo(itmes_wrap);

        let maps_ugc = $('<span>maps_ugc</span>').css({cursor:'pointer'});
        maps_ugc.addClass('material-symbols-outlined review_maps_ugc');
        $(maps_ugc).appendTo(html_itmes_review);
        
        let items_review_p = $('<p>00</p>').css({cursor:'default'});
        $(items_review_p).appendTo(html_itmes_review);

        let shopping_cart = $('<span>shopping_cart</span>').css({cursor:'pointer'});
        shopping_cart.addClass('material-symbols-outlined review_shopping_cart');
        shopping_cart.data('itemcode', bestItem[i].itemCode);
        $(shopping_cart).appendTo(html_itmes_review);
    }

    // 신제품 ====================================================================================================================
    newItem = newItems();

    // 4개씩 묶기 - 부모 박스
    let new_items_page = $('<div></div>');
    let new_items_page_num = 1;
    new_items_page.addClass('new_items_page items_page_num_0' + new_items_page_num);
    $(new_items_page).appendTo('.mainpage_new');

    for(var i = 0; i<newItem.length; i++){
        // 4개씩 묶기 
        var result = i%4;
        if(result == 0  && i != 0) {
            new_items_page_num += 1;
            new_items_page = $('<div></div>').addClass('new_items_page items_page_num_0' + new_items_page_num).appendTo('.mainpage_new');
        }

        // 아이템 div
        // console.log(newItem[i]);
        let itmes_wrap = $('<div></div>');
        itmes_wrap.addClass('new_item_00');

        $(itmes_wrap).appendTo(new_items_page);
        itmes_wrap.css({width:333})

        // 이미지
        let itmes_img = newItem[i].imgs[0];
        let html_itmes_img = $('<div></div>');
        html_itmes_img.addClass('items_img');
        let itmes_img_url = '/images/' + newItem[i].mType +'/'+ itmes_img
        html_itmes_img.css({
            background:'url(.' + itmes_img_url + ')',
            'background-position':'center',
            'background-size':'cover',
            'cursor': 'pointer'
        })
        html_itmes_img.data('itemcode', newItem[i].itemCode);
        $(html_itmes_img).appendTo(itmes_wrap);

        // 색상
        for(var j=0; j<newItem[i].colors.length; j++) {
            let items_color = newItem[i].colors[j];
            let html_itmes_color = $('<div></div>');
            html_itmes_color.css({
                width: 12,
                height: 12, 
                border: '1px solid #000',
                'margin-right': 6,
                'margin-bottom': 10,
                float: 'left' 
            })
            html_itmes_color.addClass('items_color');
            html_itmes_color.css({background:items_color});
            $(html_itmes_color).appendTo(itmes_wrap);
        }

        // 제품명
        let itmes_name = newItem[i].itemName;
        let html_itmes_name = $('<div>'+itmes_name+'</div>');
        html_itmes_name.addClass('items_name');
        html_itmes_name.data('itemcode', newItem[i].itemCode);
        $(html_itmes_name).appendTo(itmes_wrap);

       
        // 가격 + sale
        if(newItem[i].sales == 0) {
            let items_price = withComma(newItem[i].price);
            let html_itmes_price = $('<div>'+items_price+' 원</div>');
            html_itmes_price.addClass('items_price');
            $(html_itmes_price).appendTo(itmes_wrap);
        } else {
            let items_price = withComma(newItem[i].sales);
            let html_itmes_price = $('<div>'+items_price+' 원</div>');
            html_itmes_price.addClass('items_price');
            $(html_itmes_price).appendTo(itmes_wrap);
            
            let html_itmes_sale = $('<div><s>'+ withComma(newItem[i].price) +' 원</s></div>');
            html_itmes_sale.addClass('items_sale');
            $(html_itmes_sale).appendTo(itmes_wrap);

        }

        let html_itmesBox = $('<div></div>');
        html_itmesBox.css({cursor: 'default'});
        html_itmesBox.addClass('items_box');
        $(html_itmesBox).appendTo(itmes_wrap);
        if(newItem[i].sales > 0) {
            let html_itemsBox_sale = $('<div>SALE</div>');
            html_itemsBox_sale.addClass('sale')
            $(html_itemsBox_sale).appendTo(html_itmesBox);
        }
        
        // new
        if(newItem[i].isNew == 'Y'){
            let html_itemsBox_new = $('<div>NEW</div>');
            html_itemsBox_new.css({cursor: 'default'});
            html_itemsBox_new.addClass('new')
            $(html_itemsBox_new).appendTo(html_itmesBox);
        }

        // best
        if(newItem[i].isBest == 'Y'){
            let html_itemsBox_best = $('<div>BEST</div>');
            html_itemsBox_best.css({cursor: 'default'});
            html_itemsBox_best.addClass('best');
            $(html_itemsBox_best).appendTo(html_itmesBox);
        }

        // 리뷰
        let html_itmes_review = $('<div></div>');
        html_itmes_review.addClass('items_review');
        $(html_itmes_review).appendTo(itmes_wrap);

        let maps_ugc = $('<span>maps_ugc</span>').css({cursor:'pointer'});
        maps_ugc.addClass('material-symbols-outlined review_maps_ugc');
        $(maps_ugc).appendTo(html_itmes_review);
        
        let items_review_p = $('<p>00</p>').css({cursor:'default'});
        $(items_review_p).appendTo(html_itmes_review);
        
        let shopping_cart = $('<span>shopping_cart</span>').css({cursor:'pointer'});
        shopping_cart.addClass('material-symbols-outlined review_shopping_cart');
        shopping_cart.data('itemcode', newItem[i].itemCode);
        $(shopping_cart).appendTo(html_itmes_review);
    }


    // 리뷰, 장바구니 ==================================================================================================
    $(document).on('click', '.review_maps_ugc', function() {
        $('.mainpage_warning').show();
        $('.mainpage_warning warning_txt2').show();
    });
    $('.pop_confirm').click(function(){
        location.href="./login.html";
    });
    $(document).on('click', '.pop_close1, .pop_close2', function() {
        $('.mainpage_warning').hide();
        $('.mainpage_warning warning_txt2').hide();
    });
    
    $(document).on('click', '.review_shopping_cart', function() {
        // 로컬스토리지의 객체배열 정보 받아오기
        let cartArr = JSON.parse(localStorage.getItem('carts'));
        if (cartArr) {
            // 로컬스토리지 정보가 있다면 내 장바구니 배열정보에 덮어쓰기
            carts = cartArr;
        }
        // 현재 상품의 아이템코드 정보 받아와 상품 객체의 모든 정보를 장바구니 배열에 추가
        carts.push(getItem($(this).data('itemcode')));
        // 장바구니 배열을 다시 로컬스토리지에 덮어쓰기
        localStorage.setItem("carts", JSON.stringify(carts));

        location.href = "./cart.html";
    });

    // 페이지 첫번째 이미지 ==================================================================================================
    // 자세히보기 클릭시 서브 페이지로 이동!
    $(document).on('click', '.img_text button', function(e) {
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
        
    // 이미지 계속 바뀜
    var currentIndex = 0;

    function showImage(index) {
        $(".mainpage_img_list").hide().removeClass("fade-in");
        $(".mainpage_img_list:eq(" + index + ")").show().addClass("fade-in");
    }

    function nextImage() {
        currentIndex = (currentIndex + 1) % $(".mainpage_img_list").length;
        showImage(currentIndex);
    }
    function prevImage() {
        currentIndex = (currentIndex - 1 + $(".mainpage_img_list").length) % $(".mainpage_img_list").length;
        showImage(currentIndex);
    }

    showImage(currentIndex);
    setInterval(nextImage, 8000);

    // 버튼 클릭 시 다음 이미지로 넘어감
    $(".right_arrow").on("click", function() {
        nextImage();
    });
    $(".left_arrow").on("click", function() {
        prevImage();
    });
    

    // 상품 ==================================================================================================
    $('.mainpage_best').bxSlider2({
        mode:'horizontal',
        // auto: true,
        touchEnabled: false
    });
    $('.mainpage_new').bxSlider2({
        mode:'horizontal',
        // auto: true,
        touchEnabled: false
    });

    $(document).on('click', '.items_img, .items_name', function() {
        localStorage.removeItem('itemCode');
        localStorage.setItem('itemCode', $(this).data('itemcode'));
        location.href = "./contentpage.html";
    });

    // 유튜브 - more 버튼 =================================================================================================
    $('.mainpage_youtube_customer .more').on('click', function() {
        location.href = "./noticeboard_3.html";
    });


    
    
});