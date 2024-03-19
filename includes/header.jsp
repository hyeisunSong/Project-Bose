<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- Header -->
    <div id="header_wrap">
        <!-- popup -->
        <!-- <div class="popupArea">
            <div class="w1440">
                <p></p>
                <p>
                    <a href="#">
                        🎄&nbsp;크리스마스 선물을 준비했어요. 출첵하러 오세요! <span>출석하기 <img src="./images/icon/right.svg" alt="오른쪽 화살표"></span>
                    </a>
                </p>
                <p><img src="./images/icon/close.svg" alt="닫기버튼"></p>
            </div>
        </div> -->

        <!-- logo & icon -->
        <div class="logoArea">
            <div class="w1440">
                <h1><a href="./"><img src="./images/main/bose_logo.png" alt=""></a></h1>
                <ul>
                    <li><a href="#" id="searchIcon"><img src="./images/icon/search.svg" alt="검색"></a></li>
                    <li><a href="index.jsp?content=cart.jsp"><img src="./images/icon/cart.svg" alt="장바구니"></a></li>
			<c:choose>
				<c:when test="${empty user }">
					<li><a href="index.jsp?content=login.jsp"><img src="./images/icon/person.svg" alt="마이페이지"></a></li>
				</c:when>
				<c:otherwise>
					<li style="color: #fff;">${user.name }님 &nbsp;<a href="logoutCtrl.do"><img src="./images/icon/logout.svg" alt="마이페이지"></a></li>
				</c:otherwise>
			</c:choose>
                </ul>
            </div>
        </div>

        <!-- <div class="back color-3">
            <div class="row columns">
                <h3>Effect 73</h3>
                <ul class="menu align-center expanded text-center SMN_effect-73">
                    <li><a href="">Home</a></li>
                    <li><a href="">About</a></li>
                    <li><a href="">Gallery</a></li>
                    <li><a href="">Notes</a></li>
                    <li><a href="">Contact</a></li>
                </ul>
            </div>
        </div> -->

        <!-- GNB -->
        <div class="gnbArea">
            <div class="w1440">
                <!-- 메뉴 영역 -->
                <nav class="menu1">
                    <ul class="menu effect">
                        <li><a href="#" data-hover="헤드폰" data-link="subpage" data-mtype="hp"><span>헤드폰</span></a></li>
                        <li><a href="#" data-hover="이어폰" data-link="subpage" data-mtype="ep"><span>이어폰</span></a></li>
                        <li><a href="#" data-hover="사운드바" data-link="subpage" data-mtype="sb"><span>사운드바</span></a></li>
                        <li><a href="#" data-hover="스피커" data-link="subpage" data-mtype="sp"><span>스피커</span></a></li>
                        <li><a href="#" data-hover="리퍼상품" data-link="subpage" data-mtype="rp"><span>리퍼상품</span></a></li>
                    </ul>
                    <div class="subMenu">
                        <ul>
                            <li>&nbsp;</li>
                            <li>
                                <ul class="subNav">
                                    <li><a href="#" data-link="subpage" data-mtype="ep">전체</a></li>
                                    <li><a href="#" data-link="subpage" data-mtype="ep" data-dtype="type1">이어폰</a></li>
                                    <li><a href="#" data-link="subpage" data-mtype="ep" data-dtype="acce">액세서리</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul class="subNav">
                                    <li><a href="#" data-link="subpage" data-mtype="sb">전체</a></li>
                                    <li><a href="#" data-link="subpage" data-mtype="sb" data-dtype="type1">사운드바</a></li>
                                    <li><a href="#" data-link="subpage" data-mtype="sb" data-dtype="type2">홈시어터</a></li>
                                    <li><a href="#" data-link="subpage" data-mtype="sb" data-dtype="acce">액세서리</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul class="subNav">
                                    <li><a href="#" data-link="subpage" data-mtype="sp">전체</a></li>
                                    <li><a href="#" data-link="subpage" data-mtype="sp" data-dtype="type1">무선스피커</a></li>
                                    <li><a href="#" data-link="subpage" data-mtype="sp" data-dtype="type2">홈스피커</a></li>
                                    <li><a href="#" data-link="subpage" data-mtype="sp" data-dtype="acce">액세서리</a></li>
                                </ul>
                            </li>
                            <li>&nbsp;</li>
                        </ul>
                    </div>
                </nav>
                <!-- 고객지원 영역 -->
                <nav class="menu2">
                    <ul>
                        <li><a href="boardAllCtrl.do">고객지원</a></li>
                    </ul>
                    <div class="subMenu">
                        <ul class="subNav_support">
                            <li>
                                <a href="boardAllCtrl.do">
                                    <p><img src="./images/icon/download.svg" alt="메뉴얼&다운로드"></p>
                                    <p>메뉴얼&다운로드</p>
                                </a>
                            </li>
                            <li>
                                <a href="boardAllCtrl.do">
                                    <p><img src="./images/icon/support.svg" alt="원격상담"></p>
                                    <p>원격상담</p>
                                </a>
                            </li>
                            <li>
                                <a href="boardAllCtrl.do">
                                    <p><img src="./images/icon/faq.svg" alt="FAQ"></p>
                                    <p>FAQ</p>
                                </a>
                            </li>
                            <li>
                                <a href="boardAllCtrl.do">
                                    <p><img src="./images/icon/phone.svg" alt="전화상담"></p>
                                    <p>전화상담</p>
                                </a>
                            </li>
                            <li>
                                <a id="inquiry" href="#">
                                    <p><img src="./images/icon/online.svg" alt="1:1 문의"></p>
                                    <p>1:1 문의</p>
                                </a>
                            </li>
                            <li>&nbsp;</li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <!-- 검색영역 -->
        <div class="searchPop">
            <div class="searchTxtArea">
                <input type="text" id="searchInput" placeholder="찾고 싶은 상품을 검색해보세요.">
                <button id="searchBtn"><img src="./images/icon/search.svg" alt="돋보기"></button>
            </div>
            <div class="recommandArea">
                추천검색어 : 
                <span>이어폰</span>
                <span>헤드폰</span>
                <span>사운드바</span>
                <span>스피커</span>
                <b class="closeX">[닫기]</b>
            </div>
        </div>
    
        <!-- 준비중 이미지 -->
        <div class="readyImg">
            <img src="./images/ready.png" alt="준비중이미지">
        </div>
    </div>