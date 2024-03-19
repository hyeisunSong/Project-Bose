let searchTxt; // 검색값

$(function() {
    searchTxt = localStorage.getItem("searchTxt");
    // console.log("searchTxt : ", searchTxt);

    let items = searchItem(searchTxt);
    itemSetting(items);

    // 검색 엔터키
    $(document).on('keyup', function(e) {
        let focusId = $(':focus').attr('id');
        let searchText = $('#searchText').val();
        // 현재 포커스가 검색 창인지 확인 | 엔터키 인지 확인
        if (focusId === 'searchText' && e.keyCode == 13 && searchText.length > 0) {
            searchTxt = searchText;
            itemSetting(searchItem(searchTxt));
        }
    });

    // 장바구니 팝업 닫기
    $('#search_wrap .cartCloseBtn').on('click', function() {
        $('#search_wrap .cartWrap').hide();
        // 스크롤 이벤트 막기 해제
        $('html, body').css({'overflow': 'auto'});
        $('.itemCart').off('scroll touchmove mousewheel');
    });

    // 장바구니 팝업 - 드랍박스
    $('#search_wrap .cartWrap .selectBox').on('click', function() {
        $(this).find('.dropDownBox').stop().slideToggle();
        $(this).find('.arrowBtn').toggleClass('arrowUp');
    });

    // 장바구니 팝업 - 버튼
    $('#search_wrap .cartWrap .buyBtns button').on('click', function() {
        $('#search_wrap .cartWrap .buyBtns button').removeClass('on');
        $(this).addClass('on');
    });

    // 장바구니 팝업 - 하트
    $('#search_wrap .cartWrap .buyBtns .heart').on('click', function() {
        let heartCnt = Number($(this).find('span').text());
        $(this).find('span').text(++heartCnt);
    });

    // 장바구니 팝업 - 상품 담기
    $('#search_wrap .addCart').on('click', function() {
        let cartArr = JSON.parse(localStorage.getItem('carts'));
        if (cartArr) {
            carts = cartArr;
        }
        carts.push(getItem($(this).data('itemcode')));
        localStorage.setItem("carts", JSON.stringify(carts));
        alert('장바구니에 담았습니다.');
    });

    // 장바구니 팝업 이외 영역 클릭시 닫기
    $('.cartWrap').click(function(e) {
        if ($('.cartWrap').css('display') == 'block') {
            if ($(e.target).parents('.cartWrap').length < 1) {
                $('#search_wrap .cartCloseBtn').click();
            }
        }
    });

    // 장바구니 팝업 esc 버튼 클릭 시 닫기
    $(document).on('keyup', function(event) {
        if ($('.cartWrap').css('display') == 'block') {
            if ( event.keyCode == 27 || event.which == 27 ) {
                $('#search_wrap .cartCloseBtn').click();
            }
        }
    });

    // 장바구니 팝업 - 구매하기 버튼
    $(document).on('click', '.cartWrap .buyBtn' ,function() {
        let cartArr = JSON.parse(localStorage.getItem('carts'));
        if (cartArr) {
            carts = cartArr;
        }
        carts.push(getItem($(this).next().data('itemcode')));
        localStorage.setItem("carts", JSON.stringify(carts));
        location.href = 'index.jsp?content=cart.jsp';
    });
});

// 아이템 정렬
function itemSort(sort) {
    // 참조없이 복사하기 위해 사용
    var cloneItems = JSON.parse(JSON.stringify( items ));

    if (sort === 'high') {
        cloneItems.sort(function (a, b) {
            return b.price - a.price;
        });
    } else if (sort === 'low') {
        cloneItems.sort(function (a, b) {
            return a.price - b.price;
        });
    }
  
    return cloneItems;
}

// 아이템 세팅
function itemSetting(items) {
    $('#search_wrap #searchText').val(searchTxt);
    $('#search_wrap .searchTextHead').text(searchTxt);
    $('#search_wrap .searchTextCnt').text(items.length);

    // 상품리스트 항목 초기화
    $('#search_wrap .itemListAll .item').empty();

    for(let i = 0; i < items.length; i++) {
        // 아이템 프레임
        let itemImgWrap = $('<div></div>');
        itemImgWrap.addClass('itemImg');

        // 이미지 링크
        let itemLink = $('<a href="#"></a>');
        $(itemLink).on('click', function(e) {
            e.preventDefault();
            localStorage.removeItem('itemCode');
            localStorage.setItem('itemCode', items[i].itemCode);
            location.href = "index.jsp?content=contentpage.jsp";
        });
        
        // 이미지
        let itemImg = $('<img>');
        itemImg.attr('src', './images/' + items[i].mType + '/' + items[i].imgs[0]);
        itemLink.append(itemImg);
        itemImgWrap.append(itemLink);

        // hover 설정 (이미지가 2개인 경우만)
        if (items[i].imgs.length > 1) {
            itemImg.hover(function(){
                itemImg.attr('src', './images/' + items[i].mType + '/' + items[i].imgs[1]);
            }, function(){
                itemImg.attr('src', './images/' + items[i].mType + '/' + items[i].imgs[0]);
            });
        }
        
        // 이미지 색상 리스트
        let colors = items[i].colors;
        let itemColors = $('<div></div>');
        itemColors.addClass('itemColors');
        for (let j = 0; j < colors.length; j++) {
            let itemColorSpan = $('<span></span>');
            itemColorSpan.css({'display':'inline-block', 'width':'9px', 'height':'9px', 'background':colors[j], 'margin-right':'4px'});
            if (colors[j] == '#fff' || colors[j] == '#ffffff') {
                itemColorSpan.css({'border':'1px solid #ccc'});
            }
            itemColors.append(itemColorSpan);
        }
        itemImgWrap.append(itemColors);
        
        // 아이템명
        let itemName = $('<div></div>');
        itemName.addClass('itemName');
        let itemLink2 = $('<a href="#"></a>');
        itemLink2.append(items[i].itemName);
        $(itemLink2).on('click', function(e) {
            e.preventDefault();
            localStorage.removeItem('itemCode');
            localStorage.setItem('itemCode', items[i].itemCode);
            location.href = "index.jsp?content=contentpage.jsp";
        });
        itemName.append(itemLink2);
        itemImgWrap.append(itemName);

        // 가격
        let itemPrice = $('<div></div>');
        itemPrice.addClass('itemPrice');
        let priceComma = withComma(items[i].price);
        let salesComma = withComma(items[i].sales);

        // 세일상품 여부
        if (items[i].sales > 0) {
            $('<span>' + salesComma + '원</span>').appendTo(itemPrice);
            $('<span><del>' + priceComma + '원</del></span>').appendTo(itemPrice).css({'font-size':'0.75rem', 'color':'#666', 'margin-left':'5px'});
        } else {
            $('<span>' + priceComma + '원</span>').appendTo(itemPrice);
        }
        itemImgWrap.append(itemPrice);
        
        // 세일/신규/베스트 여부
        let itemStatus = $('<div></div>');
        itemStatus.addClass('itemStatus');
        // 추가여부
        let isSaleItem  = false;
        let isNewItem   = false;
        let isBestItem  = false;

        // 세일여부
        if (items[i].sales > 0) {
            let sBox = $('<span></span>');
            sBox.css({'display':'inline-block', 'width':'55px', 'height':'23px', 'color':'#fff', 'text-align':'center', 'margin-right':'5px', 'line-height':'23px'});
            sBox.css({'background-color':'red'});
            sBox.text('SALE');
            itemStatus.append(sBox);
            isSaleItem = true;
        }
        // 신규여부
        if (items[i].isNew === 'Y') {
            let sBox = $('<span></span>');
            sBox.css({'display':'inline-block', 'width':'55px', 'height':'23px', 'color':'#fff', 'text-align':'center', 'margin-right':'5px', 'line-height':'23px'});
            sBox.css({'background-color':'black'});
            sBox.text('NEW');
            itemStatus.append(sBox);
            isNewItem = true;
        }
        // 베스트여부
        if (items[i].isBest === 'Y') {
            let sBox = $('<span></span>');
            sBox.css({'display':'inline-block', 'width':'55px', 'height':'23px', 'color':'#fff', 'text-align':'center', 'margin-right':'5px', 'line-height':'23px'});
            sBox.css({'background-color':'#5BA1D5'});
            sBox.text('BEST');
            itemStatus.append(sBox);
            isBestItem = true;
        }
        // 상태값이 있는 경우에만 붙이기
        if (isSaleItem || isNewItem || isBestItem) {
            itemImgWrap.append(itemStatus);
        }

        // 리뷰
        let itemReview = $('<div></div>');
        itemReview.addClass('itemReview');
        // 리뷰 아이콘
        let reviewIcon = $('<span></span>');
        reviewIcon.addClass('reviewIcon');
        itemReview.append(reviewIcon);
        // 리뷰 개수
        let reviewCount = $('<span></span>');
        reviewCount.addClass('reviewCount');
        // 랜덤개수 추가
        reviewCount.text(Math.floor(Math.random()*100));
        itemReview.append(reviewCount);
        // 장바구니
        let itemCart = $('<span></span>');
        itemCart.addClass('itemCart');
        itemCart.on('click', function() {
            // 팝업 중 html,body의 scroll을 hidden시킴
            $('html, body').css({'overflow': 'hidden'});
            // 터치무브와 마우스휠 스크롤 방지
            $(this).on('scroll touchmove mousewheel', function(e) {
                e.preventDefault();
                e.stopPropagation();
                return false;
            });
            // 이미지 세팅
            $('#search_wrap .cartTitle').text(items[i].itemName);
            // 제품명 세팅
            $('#search_wrap .cartImg img').attr('src', './images/' + items[i].mType + '/' + items[i].imgs[0]);
            // 가격 세팅
            $('#search_wrap .cartPrice').empty();
            // 세일상품 여부
            if (items[i].sales > 0) {
                $('<span>' + salesComma + '원</span>').appendTo('#search_wrap .cartPrice');
                $('<span><del>' + priceComma + '원</del></span>').appendTo('#search_wrap .cartPrice').css({'font-size':'1.05rem', 'color':'#666', 'margin-left':'5px'});
            } else {
                $('<span>' + priceComma + '원</span>').appendTo('#search_wrap .cartPrice');
            }
            // 색상
            $('#search_wrap .choiceColors').empty();
            for (let k = 0; k < colors.length; k++) {
                let cartColorSpan = $('<span></span>');
                if (k < 2) {
                    cartColorSpan.attr('data-img', items[i].imgs[k]);
                }
                cartColorSpan.css({'display':'inline-block', 'width':'24px', 'height':'24px', 'background':colors[k], 'margin-right':'4px', 'cursor':'pointer'});
                if (colors[k] == '#fff' || colors[k] == '#ffffff') {
                    cartColorSpan.css({'border':'1px solid #ccc'});
                }
                cartColorSpan.appendTo('#search_wrap .choiceColors');

                $(cartColorSpan).on('mouseenter', function() {
                    if ($(this).data('img')) {
                        $('#search_wrap .cartImg img').attr('src', './images/' + items[i].mType + '/' + $(this).data('img'));
                    }
                });
            }
            // 아이템코드 설정
            $('#search_wrap .addCart').data('itemcode', items[i].itemCode);

            // 카트팝업 보이기
            $('#search_wrap .cartWrap').show();
        });
        itemReview.append(itemCart);
        itemImgWrap.append(itemReview);
        
        $('.itemListAll .item').append(itemImgWrap);
    }
}