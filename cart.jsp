<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div id="cart_wrap" class="w1440">
        <div class="shopTitle">장바구니<span class="shopCnt">0</span></div>
        <table class="shopTable">
            <colgroup>
                <col style="width: 36px;">
                <col>
                <col style="width: 189px;">
                <col style="width: 189px;">
                <col style="width: 147px;">
            </colgroup>
            <tr>
                <th><input type="checkbox" id="shopCheckAll"></th>
                <th>상품정보</th>
                <th>수량</th>
                <th>주문금액</th>
                <th>배송 정보</th>
            </tr>
        </table>

        <div class="shopBtnDelArea">
            <div>
                <button class="selectDelBtn">선택상품 삭제</button>
                <button class="soldoutDelBtn">품절상품 삭제</button>
            </div>
            <p>
                네이버페이로 결제 시 할인금액과 배송비가 변경될 수 있습니다.
            </p>
        </div>

        <table class="totalTable">
            <tr>
                <th>총 주문상품</th>
            </tr>
            <tr>
                <td>
                    <div>
                        <div><span class="totalPrice">0</span>원<span>상품금액</span></div>
                        <p>+</p>
                        <div><span>무료</span><span>배송비</span></div>
                        <p>=</p>
                        <div><span class="totalPrice">0</span>원<span>총 주문금액</span></div>
                    </div>
                </td>
            </tr>
        </table>

        <div class="payBox">
            <button class="order">주문하기</button>
            <button class="buy"></button>
            <button class="continue">쇼핑 계속하기</button>
        </div>
    </div>
    
    <script src="./js/cart.js"></script>