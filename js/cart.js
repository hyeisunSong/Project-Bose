// 총 주문 금액
let totalPrice = 0;
// 장바구니 저장 상품 목록
let cartArr = null;
// 아이템의 코드재정의를 위한 변수
let cnt = 0;

$(function() {
    // 장바구니 상품 세팅 함수 호출
    setCartItem();

    // 체크박스 모두 선택
    $('#cart_wrap #shopCheckAll').on('click', function() {
        $(this).closest('.shopTable').find('input[type="checkbox"]').prop('checked', $(this).prop('checked'));
    });

    // 상품 삭제 (x 버튼)
    $('#cart_wrap').on('click', '.cartShopClose a', function() {
        if (confirm('해당 상품을 삭제 하시겠습니까?')) {
            // 현재 상품의 가격정보
            let thisPrice = Number($(this).closest('tr').find('.cartShopPrice').data('price'));
            // 전체가격 - 현재상품의 가격
            totalPrice -= thisPrice;
            // 전체 가격 세팅
            $('#cart_wrap .totalPrice').text(withComma(totalPrice));
            // 상품삭제 함수 호출
            delCartItem($(this).closest('tr').data('itemcode'));
        }
    });

    // 선택상품 삭제
    $('#cart_wrap .selectDelBtn').on('click', function() {
        if (confirm('선택 상품을 삭제 하시겠습니까?')) {
            // 장바구니 목록의 전체 상품 정보
            let chbox = $('#cart_wrap .shopTable .shopCheck');
            for (let i = 0; i < chbox.length; i++) {
                // 전체 상품 중 체크가 된 상품만
                if (chbox.eq(i).is(':checked')) {
                    // 현재 상품의 가격정보
                    let thisPrice = Number(chbox.closest('tr').find('.cartShopPrice').data('price'));
                    // 전체가격 - 현재상품의 가격
                    totalPrice -= thisPrice;
                    // 전체 가격 세팅
                    $('#cart_wrap .totalPrice').text(withComma(totalPrice));
                    // 상품삭제 함수 호출
                    delCartItem(chbox.eq(i).closest('tr').data('itemcode'));
                }
            }
        }
    });

    // 품절상품, 주문하기, nPay, 쇼핑계속하기, 바로구매 버튼
    $('#cart_wrap .soldoutDelBtn, .payBox button, .chBtn').on('click', function() {
        readyImg();
    });

});


function setCartItem() {
    // 로컬스토리지의 객체 배열 받아오기
    cartArr = JSON.parse(localStorage.getItem('carts'));

    if (cartArr.length > 0) {
        // 테이블 목록 삭제 (초기화)
        $('#cart_wrap .shopTable tr:nth-child(n+2)').remove();

        // 장바구니 저장 개수
        $('#cart_wrap .shopCnt').text(cartArr.length);

        // 상품 총 결제 금액 초기화
        totalPrice = 0;
    
        for (let i = 0; i < cartArr.length; i++) {
            // 중복아이템 체크
            for (let j = 0; j < i; j++) {
                if (cartArr[i].itemCode === cartArr[j].itemCode) {
                    // 아이템코드 재정의
                    cartArr[i].itemCode = cartArr[i].itemCode + "_" + cnt++;
                    break;
                }
            }

            // 삭제를 위한 아이템 코드 추가
            let tr = $('<tr data-itemcode="' + cartArr[i].itemCode + '"></tr>');
            // 체크박스 추가
            let td = $('<td><input type="checkbox" class="shopCheck"></td>');
            tr.append(td);
    
            // 이미지 추가
            td = $('<td></td>');
            let str = "";
            str += '<div class="cartShopWrap">';
            str += '    <div class="cartShopImg">';
            str += '        <img src="./images/' + cartArr[i].mType + '/' + cartArr[i].imgs[0] +'" alt="">';
            str += '    </div>';
            str += '    <div class="cartShopDesc">';
            str += '        <p>' + cartArr[i].itemName + '</p>';
            str += '        <p>BOSE 쇼핑백 - 1개</p>';
            str += '        <p>트리플 블랙 - 1개</p>';
            str += '    </div>';
            str += '    <div class="cartShopClose">';
            str += '        <a href="#">X</a>';
            str += '    </div>';
            str += '</div>';
            td.html(str);
            tr.append(td);
            
            td = $('<td><span class="cartShopCnt">1</span><button class="chBtn">옵션/수량 변경</button></td>');
            tr.append(td);
            
            td = $('<td><span class="cartShopPrice" data-price="' + cartArr[i].price + '">'+ withComma(cartArr[i].price) +'원</span><button class="chBtn on">바로구매</button></td>');
            tr.append(td);
    
            td = $('<td>무료<br><br>택배</td>');
            tr.append(td);
    
            $('#cart_wrap .shopTable').append(tr);
    
            // 총 주문 금액 합산
            totalPrice += Number(cartArr[i].price);
            if (i === cartArr.length - 1) {
                $('#cart_wrap .totalPrice').text(withComma(totalPrice));
            }
        }

    } else { // 선택 상품이 없다면...
        $('#cart_wrap .shopTable tr:nth-child(n+2)').remove();
        $('#cart_wrap .shopCnt').text(0);

        let tr = $("<tr></tr>");
        let td = $('<td colspan="5"></td>');
        td.css({'text-align':'center', 'padding':'100px 0'});
        let img = $('<img src="./images/icon/cart.svg" alt="장바구니 이미지">');
        img.css({'width':'72px', 'margin-bottom':'20px'});
        let div = $('<div>장바구니가 비어있습니다.</div>');
        td.append(img)
        td.append(div);
        tr.append(td);
        
        $('#cart_wrap .shopTable').append(tr);
        $('#cart_wrap .totalPrice').text(0);
    }
}

// 상품 삭제 함수
function delCartItem(itemCode) {
    for (let i = 0; i < cartArr.length; i++) {
        if (cartArr[i].itemCode === itemCode) {
            cartArr.splice(i, 1);
        }
    }
    
    // 스토리지 정보 다시 설정
    localStorage.setItem("carts", JSON.stringify(cartArr));
    // 상품 다시 세팅
    setCartItem();
}