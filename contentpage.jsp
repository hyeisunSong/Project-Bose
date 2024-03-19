<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <main class="content_main">
        <section class="content_product w1440">
            <!-- 제품 -->
            <!-- <img src="#" alt="제품이미지" id="content_image"> -->
            <div id="content_image_area"></div>
            <!-- 제품 설명 -->
            <div class="content_product_info">
                <!-- 이름 -->
                <div class="content_product_first">
                    <!-- <div id="new_area"></div> -->
                    <div>
                        <span class="content_product_name">MDR-MV1</span>
                        <!-- <p>압도적 공간감의 오픈형 레퍼런스 헤드폰</p> -->
                    </div>
                    <div>
                        <a href="#"><span class="material-symbols-outlined">share</span></a>
                    </div>
                </div>
                <!-- 가격 -->
                <div class="content_product_price">
                    <div class="price">499,000<small>원</small></div>
                    <p>무료배송</p>
                </div>
                <hr class="line_1">
                <!-- 마일리지 -->
                <div class="content_product_benefits">
                    <div class="mileage_title">
                        <h2>회원별 마일리지 혜택</h2>
                        <p><span class="material-symbols-outlined">error</span></p>
                    </div>
                    <div class="mileage">
                        <div class="vip_mileage">
                            <h2>V</h2>
                            <div class="vip">
                                <h3>VIP&nbsp;4%</h3>
                                <h4>0</h4>
                            </div>
                        </div>
                        <div class="membership_mileage">
                            <h2>M</h2>
                            <div class="membership">
                                <h3>MEMBERSHIP&nbsp;2%</h3>
                                <h4>0</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="line_1">
                <!-- 색상 -->
                <div class="product_color">
                    <h2>색상</h2>
                    <div class="color_box_container">
                        <ul class="circle_color_box">
                            <li class="no_ml">
                                <a href="#실버" class="color_btn">
                                    <span class="circle_color_1"></span>
                                </a>
                            </li>                                        
                            <li>
                                <a href="#블랙" class="color_btn">
                                    <span class="circle_color_2"></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 제품선택 -->
                <div class="product_selection">
                    <h2>제품선택</h2>
                    <div id="product_selection_box">
                        제품을 선택하세요
                        <span></span>
                        <span></span>
                    </div>
                    <div class="product_selected_box">
                        <span>제품명</span>
                    </div>
                </div>
                <hr class="line_2">
                <!-- 총 상품금액 -->
                <div class="product_all_price">
                    <h2>총&nbsp;상품금액&nbsp;<small>(총 -개)</small></h2>
                    <p>-&nbsp;원</p>
                </div>
                <!-- 구매 -->
                <div class="product_remain">
                    <a href="#" class="favorite"><span class="material-symbols-outlined no_ml">favorite</span></a>
                    <a href="#" class="local_mall"><span class="material-symbols-outlined">local_mall</span></a>
                    <a href="#" class="redeem"><span class="material-symbols-outlined">redeem</span></a>
                    <a href="./cart.html" class="buy">바로 구매하기</a>
                </div>
            </div>
        </section>
        <!-- Recommend -->
        <section class="content_recommend">
            <h2>함께 구매하시면 좋은 추천 제품</h2>
            <div class="recommend_product w1440">
                <ul class="cf">
                    <li>
                        <a href="#">
                            <img src="http://placehold.it/338x340" alt="추천제품1" class="recommend_product_img">
                            <h3 class="recommend_product_name">ZV-1M1</h3>
                            <h5  class="recommend_product_price">1,090,001원</h5>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="http://placehold.it/338x340" alt="추천제품2" class="recommend_product_img">
                            <h3 class="recommend_product_name">ZV-1M2</h3>
                            <h5  class="recommend_product_price">1,090,002원</h5>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="http://placehold.it/338x340" alt="추천제품3" class="recommend_product_img">
                            <h3 class="recommend_product_name">ZV-1M3</h3>
                            <h5  class="recommend_product_price">1,090,003원</h5>
                        </a>
                    </li>
                    <li class="no_mr">
                        <a href="#">
                            <img src="http://placehold.it/338x340" alt="추천제품3" class="recommend_product_img">
                            <h3 class="recommend_product_name">ZV-1M3</h3>
                            <h5  class="recommend_product_price">1,090,003원</h5>
                        </a>
                    </li>
                </ul>
            </div>
        </section>
        <section class="content_buttons">
            <ul>
                <a href="#">
                    <li class="content_buttons_logo">
                        <img src="./images/content/alpha.png" alt="알파">
                    </li>
                    <li>보스 알파 유니버스</li>
                </a>
            </ul>
            <ul>
                <a href="https://blog.naver.com/kolonbose" target="_blank">
                    <li class="content_buttons_logo">
                        <img src="./images/content/largeb.png" alt="블로그">
                    </li>
                    <li>보스 블로그</li>
                </a>
            </ul>
            <ul>
                <a href="./noticeboard.html">
                    <li class="content_buttons_logo">
                        <img src="./images/content/downloaddd.png" alt="다운로드">
                    </li>
                    <li>메뉴얼 다운로드</li>
                </a>
            </ul>
        </section>
        <div id="review_wrap">
            <div class="tab_content w1440">
                <!-- Tab Button -->
                <input type="radio" name="tabmenu" id="tab01">
                <label for="tab01">제품 개요</label>
                <input type="radio" name="tabmenu" id="tab02">
                <label for="tab02">제품 상세</label>
                <input type="radio" name="tabmenu" id="tab03">
                <label for="tab03">배송/환불규정</label>
                <input type="radio" name="tabmenu" id="tab04" checked>
                <label for="tab04">리뷰</label>
        
                <!-- Tab Contents -->
                <div class="content con1">
                    <img src="http://pimg.bose.co.kr/bose/product/QC%20Earbuds/NewColor/QC_Earbuds_detail%20_newcolor_1.jpg" alt="제품개요 이미지">
                </div>
                
                <div class="content con2">
                    <img src="http://pimg.bose.co.kr/bose/product/NCHP/BDL/detail.jpg" alt="제품상세 이미지">
                </div>
                
                <div class="content con3">
                    <ul>
                        <li>배송안내</li>
                        <li>배송비 : 기본배송료는 3,000원 입니다. (도서,산간,오지 일부지역은 배송비가 추가될 수 있습니다),&nbsp;50,000원 이상 구매시 무료배송입니다.</li>
                        <li>본 상품의 평균 배송일은 3일입니다.(입금 확인 후) 설치 상품의 경우 다소 늦어질수 있습니다.&nbsp;[배송예정일은 주문시점(주문순서)에 따른 유동성이 발생하므로 평균 배송일과는 차이가 발생할 수 있습니다.</li>
                        <li>본 상품의 배송 가능일은 30일 입니다. 배송 가능일이란 본 상품을 주문 하신 고객님들께 상품 배송이 가능한 기간을 의미합니다.&nbsp;(단, 연휴 및 공휴일은 기간 계산시 제외하며 현금 주문일 경우 입금일 기준 입니다.)</li>    
                    </ul>
                    <ul>
                        <li>교환 및 반품 안내</li>
                        <li>상품 청약철회 가능기간은 상품 수령일로 부터 7일 이내 입니다.</li>
                        <li>상품 택(tag)제거 또는 개봉으로 상품 가치 훼손 시에는 7일 이내라도 교환 및 반품이 불가능합니다.</li>
                        <li>저단가 상품, 일부 특가 상품은 고객 변심에 의한 교환, 반품은 고객께서 배송비를 부담하셔야 합니다(제품의 하자,배송오류는 제외)</li>
                        <li> 일부 상품은 신모델 출시, 부품가격 변동 등 제조사 사정으로 가격이 변동될 수 있습니다.</li>
                        <li>일부 특가 상품의 경우, 인수 후에는 제품 하자나 오배송의 경우를 제외한 고객님의 단순변심에 의한 교환, 반품이 불가능할 수 있사오니, 각 상품의 상품상세정보를 꼭 참조하십시오.</li>
                    </ul>  
                </div>
                
                 <!-- 리뷰 -->
           1234 <div class="content con4">
                <div class="review">
                    <div class="button">
                        <button class="btn_write">
                            <img src="./images/content/edit.svg" alt="펜">
                            상품명 작성
                        </button>
                    </div>
                    <article class="review01">
                        <ul>
                            <li>베스트</li>
                            <li>한달 상품평</li>
                            <li>이벤트</li>
                        </ul>

                        <div class="share">
                            <div class="sh_click" id="sh_click1">
                                <div class="sh_title">
                                    <p>공유</p>
                                    <button>X</button>
                                </div>
                                <div class="sh_sns">
                                    <a href="http://facebook.com" onClick="window.open('http://facebook.com','pagename','resizable,height=800,width=500'); return false;">
                                        <img src="./images/content/facebook.svg" alt="페북">
                                    </a>
                                    <a href="http://instagram.com" onClick="window.open('http://instagram.com','pagename','resizable,height=800,width=500'); return false;">
                                        <img src="./images/content/instagram.svg" alt="인스타">
                                    </a>
                                </div>
                            </div>
                            <span class="sh_svg1">
                                <img src="./images/icon/share.svg" alt="공유">
                            </span>
                        </div>

                        <div class="name">
                            <p class="user">
                                <img src="./images/content/queen-crown-48.png" alt="유저이미지1">
                            </p>
                            <p class="name01">snb*****</p>
                            <!-- <img class="star" src="./images/content/star.png" alt="별"> -->
                            <span class="star"></span>
                            <p class="date">2023-12-20 | 보스닷컴구매</p>
                        </div>
                        <div class="write">
                            <p>
                                작은 스피커입니다 그래서 배치하기 좋아요<br>
                                전 책상에 뒀는데 먹먹하지 않고 잘 퍼집니다.
                            </p>
                        </div>
                        <div class="review_img">
                            <img src="./images/content/review_img_01.jpg" alt="리뷰사진1">
                            <img src="./images/content/review_img_02.jpg" alt="리뷰사진2">
                        </div>
                        <div class="emoji01">
                            <p>😍 성능이 좋아요</p>
                        </div>
                        <div class="emoji01">
                            <p>🚚 배송이 빨라요</p>
                        </div>
                        <div class="emoji01">
                            <p>💎 디자인이 마음에 들어요</p>
                        </div>
                        <div class="emoji02">
                            <p>도움이 돼요 <i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 2</p>
                        </div>
                        <p class="last_p">신고</p>
                    </article>
                </div>
                <div class="review">
                    <div class="button">
                    </div>
                    <article class="review01">
                        <ul>
                            <li>베스트</li>
                            <li>한달 상품평</li>
                            <li>이벤트</li>
                        </ul>

                        <div class="share">
                            <div class="sh_click" id="sh_click2">
                                <div class="sh_title">
                                    <p>공유</p>
                                    <button>X</button>
                                </div>
                                <div class="sh_sns">
                                    <a href="http://facebook.com" onClick="window.open('http://facebook.com','pagename','resizable,height=800,width=500'); return false;">
                                        <img src="./images/content/facebook.svg" alt="페북">
                                    </a>
                                    <a href="http://instagram.com" onClick="window.open('http://instagram.com','pagename','resizable,height=800,width=500'); return false;">
                                        <img src="./images/content/instagram.svg" alt="인스타">
                                    </a>
                                </div>
                            </div>
                            <span class="sh_svg2">
                                <img src="./images/icon/share.svg" alt="공유">
                            </span>
                        </div>
                        
                        <div class="name">
                            <p class="user">
                                <img src="./images/content/crown-48.png" alt="유저이미지2">
                            </p>
                            <p class="name01">ble*****</p>
                            <!-- <img class="star" src="./images/content/star.png" alt="별"> -->
                            <span class="star"></span>
                            <p class="date">2023-12-11 | 보스닷컴구매</p>
                        </div>
                        <div class="write">
                            <p>
                                블루투스로 연결해서 작동하기 편하고 음질도 좋아요
                            </p>
                        </div>
                        <div class="review_img">
                            <img src="./images/content/review_img_03.jpg" alt="리뷰사진3">
                            <img src="./images/content/review_img_04.jpg" alt="리뷰사진4">
                        </div>
                        <div class="emoji01">
                            <p>😍 성능이 좋아요</p>
                        </div>
                        <div class="emoji01">
                            <p>🎨 색상이 마음에 들어요</p>
                        </div>
                        <div class="emoji02">
                            <p>도움이 돼요 <i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 4</p>
                        </div>
                        <p class="last_p">신고</p>
                    </article>
                </div>

                <!-- 3번째 리뷰 -->
                <div class="review">
                    <div class="button">
                    </div>
                    <article class="review01">
                        <ul>
                            <li>베스트</li>
                            <li>한달 상품평</li>
                            <li>이벤트</li>
                        </ul>
                        
                        <div class="share">
                            <div class="sh_click" id="sh_click3">
                                <div class="sh_title">
                                    <p>공유</p>
                                    <button>X</button>
                                </div>
                                <div class="sh_sns">
                                    <a href="http://facebook.com" onClick="window.open('http://facebook.com','pagename','resizable,height=800,width=500'); return false;">
                                        <img src="./images/content/facebook.svg" alt="페북">
                                    </a>
                                    <a href="http://instagram.com" onClick="window.open('http://instagram.com','pagename','resizable,height=800,width=500'); return false;">
                                        <img src="./images/content/instagram.svg" alt="인스타">
                                    </a>
                                </div>
                            </div>
                            <span class="sh_svg3">
                                <img src="./images/icon/share.svg" alt="공유">
                            </span>
                        </div>

                        <div class="name">
                            <p class="user">
                                <img src="./images/content/queen-crown-48.png" alt="유저이미지1">
                            </p>
                            <p class="name01">tom***</p>
                            <!-- <img class="star" src="./images/content/star.png" alt="별"> -->
                            <span class="star"></span>
                            <p class="date">2023-11-27 | 보스닷컴구매</p>
                        </div>
                        <div class="write">
                            <p>
                                역시 재입고를 기다린 보람이 있습니다 아주 좋아요
                            </p>
                        </div>
                        <div class="review_img">
                            <img src="./images/content/review_img_05.jpg" alt="리뷰사진5">
                            <img src="./images/content/review_img_06.jpg" alt="리뷰사진6">
                        </div>
                        <div class="emoji01">
                            <p>😍 성능이 좋아요</p>
                        </div>
                        <div class="emoji01">
                            <p>⚙️ 사용하기 편리해요</p>
                        </div>
                        <div class="emoji02">
                            <p>도움이 돼요 <i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 7</p>
                        </div>
                        <p class="last_p">신고</p>
                    </article>
                </div>

                <!-- 페이지 버튼 -->
                <div class="listPage">
                    <a href="#"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
                    <ul>
                        <li><a href="#">1</a></li>
                        <!-- <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li> -->
                    </ul>
                    <a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </main>

    <!-- 클릭시 로그인 경고창 -->
    <aside class="warning">
        <div class="box">
            <p class="warning_txt1">
                로그인 이후 신고 가능합니다.<br>
                로그인 화면으로 이동하시겠습니까?
            </p>
            <p class="warning_txt2">
                로그인 이후 상품명 작성 가능합니다.<br>
                로그인 화면으로 이동하시겠습니까?
            </p>
            <p class="warning_txt3">
                로그인 이후 좋아요 가능합니다.<br>
                로그인 화면으로 이동하시겠습니까?
            </p>
            <div class="twoBtn">
                <button class="pop_close1">취소</button>
                <button class="pop_confirm">확인</button>
            </div>
            <button class="pop_close2">X</button>
        </div>
    </aside>

    <!-- 팝업 -->
    <div class="content_favorite">
        <div class="box">
            <h3 class="favorite_title">
                찜하기
            </h3>
            <p class="favorite_txt">
                찜하기는 보스스토어 회원만 이용하실 수 있습니다.
            </p>
            <div class="twoBtn">
                <button class="pop_close1">쇼핑 계속하기</button>
                <button class="pop_confirm">확인</button>
            </div>
        </div>
    </div>
    <!-- 팝업 -->
    <div class="content_option">
        <div class="box">
            <p class="favorite_txt">
                옵션을 선택하세요.
            </p>
            <div class="twoBtn">
                <button class="pop_close1">확인</button>
            </div>
        </div>
    </div>

    <!-- 공유 -->
    <div id="content_share_bg">
        <div class="content_share" id="share_click">
            <div class="sh_title">
                <p>공유하기</p>
                <button>X</button>
            </div>
            <div class="sh_sns">
                <a href="https://www.kakaocorp.com/page/service/service/KakaoTalk" onClick="window.open('https://www.kakaocorp.com/page/service/service/KakaoTalk','pagename','resizable,height=800,width=500'); return false;">
                    <img src="./images/content/kakaotalk_logo.png" alt="카카오톡"><br><br><span>카카오톡</span>  
                </a>
                <a href="http://facebook.com" onClick="window.open('http://facebook.com','pagename','resizable,height=800,width=500'); return false;">
                    <img src="./images/content/facebook_logo.png" alt="페북"><br><br><span>페이스북</span>    
                </a>
                <a href="http://instagram.com" onClick="window.open('http://instagram.com','pagename','resizable,height=800,width=500'); return false;">
                    <img src="./images/content/instagram_logo.png" alt="인스타"><br><br><span>인스타그램</span>  
                </a>
                <a href="https://twitter.com" onClick="window.open('https://twitter.com','pagename','resizable,height=800,width=500'); return false;">
                    <img src="./images/content/twitter_logo.png" alt="트위터"><br><br><span>트위터</span>  
                </a>
                <a href="https://line.me/ko/" onClick="window.open('https://line.me/ko/','pagename','resizable,height=800,width=500'); return false;">
                    <img src="./images/content/line_logo.png" alt="라인"><br><br><span>라인</span>  
                </a>
            </div>
        </div>
    </div>
    
    <div id="readyreadyready">
        <img src="./images/ready.png" alt="준비중입니다">
    </div>
    
    <script src="./js/contentpage.js"></script>