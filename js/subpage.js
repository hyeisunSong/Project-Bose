let mType;  // 메인타입
let dType;  // 서브타입
let typeNm; // 타입명

$(function() {
    // 로컬스토리지 정보 받아오기
    mType = localStorage.getItem("mType");
    dType = localStorage.getItem("dType");
    typeNm = localStorage.getItem("typeNm");
    // console.log("mType : ", mType);
    // console.log("dType : ", dType);
    // console.log("typeNm : ", typeNm);

    // gnb 하위 항목으로 진입 시
    if (typeNm) {
        $('#sub_wrap .itemReco').text(typeNm);
    }

    // 서브페이지 설정
    if (mType) {
        // 서브페이지 별 대표이미지 이미지명
        let imgName = mType + '_signature.png';

        // 리퍼상품인 경우
        if (mType === 'rp') {
            $('#sub_wrap .reaperStep').show();
            $('#sub_wrap .sigTitle').css({'bottom':'280px', 'color':'#181818', 'font-size':'43px'});
            $('#sub_wrap .sigDesc').css({'bottom':'220px', 'color':'#181818', 'font-size':'18px', 'font-weight':'700'});
        }

        // 대표이미지 설정
        let url = 'url(./images/' + mType + '/' + imgName + ') no-repeat center / cover';
        $('#sub_wrap .signature').css({'background': url});

        // 서브페이지별 타이틀, 내용 변경
        let signature = getSignature(mType);
        $('#sub_wrap .sigTitle').html(signature.title);
        $('#sub_wrap .sigDesc').html(signature.desc);

        // 아이템별 전체 리스트 조회
        items = itemList(mType);
        // 하위 목록 클릭으로 들어왔을 경우 items 다시 세팅
        if (dType) {
            items = itemType(mType, dType);
        }

        // 아이템 세팅 함수 호출
        itemSetting(items);
    }

    // 장바구니 팝업 닫기
    $('#sub_wrap .cartCloseBtn').on('click', function() {
        $('#sub_wrap .cartWrap').hide();
        // 스크롤 이벤트 막기 해제
        $('html, body').css({'overflow': 'auto'});
        $('.itemCart').off('scroll touchmove mousewheel');
    });

    // 장바구니 팝업 - 드랍박스
    $('#sub_wrap .cartWrap .selectBox').on('click', function() {
        $(this).find('.dropDownBox').stop().slideToggle();
        $(this).find('.arrowBtn').toggleClass('arrowUp');
    });

    // 장바구니 팝업 - 구매하기, 장바구니, 하트 
    $('#sub_wrap .cartWrap .buyBtns button').on('click', function() {
        $('#sub_wrap .cartWrap .buyBtns button').removeClass('on');
        $(this).addClass('on');
    });

    // 장바구니 팝업 - 하트
    $('#sub_wrap .cartWrap .buyBtns .heart').on('click', function() {
        // 현재 좋아요 개수 받아오기
        let heartCnt = Number($(this).find('span').text());
        // 좋아요 개수 + 1 세팅하기
        $(this).find('span').text(++heartCnt);
    });

    // 장바구니 팝업 - 상품 담기
    $('#sub_wrap .addCart').on('click', function() {
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
        alert('장바구니에 담았습니다.');
    });

    // 장바구니 팝업 - 셀렉터 박스 선택 목록 보여지기
    $('#sub_wrap .dropDownBox a[href="#"]').on('click', function(e) {
        e.preventDefault();
        let txt1 = $(this).find('span').eq(0).text();
        let txt2 = $(this).find('span').eq(1).text();
        $('#sub_wrap .selectBox button').text(txt1 + ' (' + txt2 + ')');
    });

    // 장바구니 팝업 이외 영역 클릭시 닫기
    $('.cartWrap').click(function(e) {
        if ($('.cartWrap').css('display') == 'block') {
            if ($(e.target).parents('.cartWrap').length < 1) {
                $('#sub_wrap .cartCloseBtn').click();
            }
        }
    });

    // 장바구니 팝업 esc 버튼 클릭 시 닫기
    $(document).on('keyup', function(event) {
        if ($('.cartWrap').css('display') == 'block') {
            if ( event.keyCode == 27 || event.which == 27 ) {
                $('#sub_wrap .cartCloseBtn').click();
            }
        }
    });

    // 장바구니 팝업 - 구매하기 버튼
    $(document).on('click', '#sub_wrap .buyBtn' ,function() {
        let cartArr = JSON.parse(localStorage.getItem('carts'));
        if (cartArr) {
            carts = cartArr;
        }
        carts.push(getItem($(this).next().data('itemcode')));
        localStorage.setItem("carts", JSON.stringify(carts));
        location.href = 'index.jsp?content=cart.jsp';
    });

    // 정렬 select 변경 시
    $('#sub_wrap #sortItem').on('change', function() {
        // 정렬 정보 옵션
        let opt = $(this).val();
        // 높은 가격순, 낮은 가격순, 기본 순 정보로 배열 정렬 후 아이템 다시 세팅
        itemSetting(itemSort(opt));
    });
});

let itemSignature = [
    {
          mType : 'hp'
        , title : 'HEADPHONES'
        , desc  : '세계적인 프리미엄 오디오 브랜드 BOSE'
    },
    {
          mType : 'ep'
        , title : 'EARBUDS'
        , desc  : '세계적인 프리미엄 오디오 브랜드 BOSE'
    },
    {
          mType : 'sb'
        , title : 'SOUNDBAR'
        , desc  : '세계적인 프리미엄 오디오 브랜드 BOSE'
    },
    {
          mType : 'sp'
        , title : 'SPEAKER'
        , desc  : '세계적인 프리미엄 오디오 브랜드 BOSE'
    },
    {
          mType : 'rp'
        , title : 'BOSE의 혜택과 품질은 동일하게.<br>가격은 더욱 저렴하게.'
        , desc  : '정품과 동일한 1년의 보증기간과 꼼꼼한 검수를 약속하는 인증 리퍼상품'
    }
];

// 대표이미지의 내용 확인
function getSignature(mType) {
    for (let i = 0; i < itemSignature.length; i++) {
        if (itemSignature[i].mType === mType) {
            return itemSignature[i];
        }
    }
    return null;
}

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
    // 상품리스트 항목 초기화
    $('#sub_wrap .itemListAll .item').empty();

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
        itemImg.attr('src', './images/' + mType + '/' + items[i].imgs[0]);
        itemLink.append(itemImg);
        itemImgWrap.append(itemLink);

        // hover 설정 (이미지가 2개인 경우만)
        if (items[i].imgs.length > 1) {
            itemImg.hover(function(){
                itemImg.attr('src', './images/' + mType + '/' + items[i].imgs[1]);
            }, function(){
                itemImg.attr('src', './images/' + mType + '/' + items[i].imgs[0]);
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
            $('#sub_wrap .cartTitle').text(items[i].itemName);
            // 제품명 세팅
            $('#sub_wrap .cartImg img').attr('src', './images/' + mType + '/' + items[i].imgs[0]);
            // 가격 세팅
            $('#sub_wrap .cartPrice').empty();
            // 세일상품 여부
            if (items[i].sales > 0) {
                $('<span>' + salesComma + '원</span>').appendTo('#sub_wrap .cartPrice');
                $('<span><del>' + priceComma + '원</del></span>').appendTo('#sub_wrap .cartPrice').css({'font-size':'1.05rem', 'color':'#666', 'margin-left':'5px'});
            } else {
                $('<span>' + priceComma + '원</span>').appendTo('#sub_wrap .cartPrice');
            }
            // 색상
            $('#sub_wrap .choiceColors').empty();
            for (let k = 0; k < colors.length; k++) {
                let cartColorSpan = $('<span></span>');
                if (k < 2) {
                    cartColorSpan.attr('data-img', items[i].imgs[k]);
                }
                cartColorSpan.css({'display':'inline-block', 'width':'24px', 'height':'24px', 'background':colors[k], 'margin-right':'4px', 'cursor':'pointer'});
                if (colors[k] == '#fff' || colors[k] == '#ffffff') {
                    cartColorSpan.css({'border':'1px solid #ccc'});
                }
                cartColorSpan.appendTo('#sub_wrap .choiceColors');

                $(cartColorSpan).on('mouseenter', function() {
                    if ($(this).data('img')) {
                        $('#sub_wrap .cartImg img').attr('src', './images/' + mType + '/' + $(this).data('img'));
                    }
                });
            }
            // 아이템코드 설정
            $('#sub_wrap .addCart').data('itemcode', items[i].itemCode);

            // 카트팝업 보이기
            $('#sub_wrap .cartWrap').show();
        });
        itemReview.append(itemCart);
        itemImgWrap.append(itemReview);
        
        $('.itemListAll .item').append(itemImgWrap);
    }
}