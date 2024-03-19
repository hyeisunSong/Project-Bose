<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <div id="noticeboard_wrap">
        <h1>SUPPORT</h1>
        <div class="tab_content" id="faq_subpge">
            <!-- Tab Button -->
            <input type="radio" name="tabmemu" id="tab01">
            <label for="tab01">메뉴얼 &amp; 다운로드</label>
            <input type="radio" name="tabmemu" id="tab02">
            <label for="tab02">원격상담</label>
            <input type="radio" name="tabmemu" id="tab03" checked>
            <label for="tab03">FAQ</label>
            <input type="radio" name="tabmemu" id="tab04">
            <label for="tab04">전화 상담 예약</label>
            <input type="radio" name="tabmemu" id="tab05">
            <label for="tab05">1:1 문의</label>
            <!-- /Tab Button -->
    
            <!-- Tab Contents -->
            <div class="content con1">
                <div class="loading">
                    <img src="./images/notice/loading.png" alt="로딩이미지">
                    <h2>페이지 <span>준비중</span> 입니다.</h2>
                    <p>
                        보다 나은 서비스 제공을 위하여 서비스 준비중에 있습니다.<br>
                        빠른 시일내에 준비하여 찾아뵙겠습니다.
                    </p>
                </div>
            </div>
            <div class="content con2">
                <div class="loading">
                    <img src="./images/notice/loading.png" alt="로딩이미지">
                    <h2>페이지 <span>준비중</span> 입니다.</h2>
                    <p>
                        보다 나은 서비스 제공을 위하여 서비스 준비중에 있습니다.<br>
                        빠른 시일내에 준비하여 찾아뵙겠습니다.
                    </p>
                </div>              
            </div>
            <div class="content con3" id="tab_content3">
                <div class="search_box">
                    <div class="search_boxs">
                        <input type="text" class="search" id="search" required placeholder="검색어를 입력해주세요">
                        <p><img src="./images/icon/search.svg" alt="돋보기 아이콘"></p>
                    </div>
                    <button id="searchBoardBtn">검색</button>
                    <button id="resetBoardBtn">초기화</button>
                </div>

                <div class="tab_content2" id="tab_content2">
				<c:forEach var="c" items="${cate }" varStatus="status">
					<input type="radio" name="tab2memu" id="tab2_0${c.cate_no }" <c:if test="${status.first }">checked</c:if> <c:if test="${cateNo eq status.count }">checked</c:if>>
                    <label for="tab2_0${c.cate_no }"><a href="boardAllCtrl.do?cate_no=${c.cate_no }">${c.cate_name }</a></label>
				</c:forEach>
					<!-- 
                    <input type="radio" name="tab2memu" id="tab2_02">
                    <label for="tab2_02">주문/결제</label>
                    <input type="radio" name="tab2memu" id="tab2_03">
                    <label for="tab2_03">출고/배송</label>
                    <input type="radio" name="tab2memu" id="tab2_04">
                    <label for="tab2_04">교환/반품</label>
                    <input type="radio" name="tab2memu" id="tab2_05">
                    <label for="tab2_05">서비스</label>
                    <input type="radio" name="tab2memu" id="tab2_06">
                    <label for="tab2_06">기타</label>
 					-->
 					
                    <ul class="title">
                        <li>카테고리</li>
                        <li>제목</li>
                        <li>글쓴이</li>
                        <li>작성시간</li>
                    </ul>
                    
				<c:forEach var="b" items="${list }">
					<ul class="all contents${b.cate_no - 1 } cf">
                        <li>${b.cate_name }</li>
                        <li>
                        	<c:if test="${b.password eq 'on' }">
	                        	<c:choose>
	                        		<c:when test="${user.id eq b.id }">
			                        	<a href="boardOneCtrl.do?seq=${b.seq }">Q.&nbsp;&nbsp;${b.title }<c:if test="${b.password eq 'on' }">&nbsp;&nbsp;<img src="./images/icon/lock_open.svg" alt="비밀글 이미지" style="vertical-align:middle;"></c:if></a>
	                        		</c:when>
	                        		<c:otherwise>
			                        	Q.&nbsp;&nbsp;비밀글입니다.<c:if test="${b.password eq 'on' }">&nbsp;&nbsp;<img src="./images/icon/lock_open.svg" alt="비밀글 이미지" style="vertical-align:middle;"></c:if>
	                        		</c:otherwise>
	                        	</c:choose>
                        	</c:if>
                        	<c:if test="${b.password ne 'on' }">
                        		<a href="boardOneCtrl.do?seq=${b.seq }">Q.&nbsp;&nbsp;${b.title }</a>
                        	</c:if>
                        </li>
                        <li>${b.writer }</li>
                        <li>${b.reg_date }</li>
                    </ul>
				</c:forEach>

                    <!-- Tab Contents -->
                    <!-- 
                    <ul class="all contents4 cf">
                        <li>서비스</li>
                        <li><a href="index.jsp?content=noticeboard_2.jsp#faq_content_page">헤드폰/이어버드의 베터리 교체가 가능한가요?</a></li>
                        <li>관리자</li>
                        <li>2022-08-25</li>
                    </ul>
                    <ul class="all contents2 cf">
                        <li>출고/배송</li>
                        <li><a href="index.jsp?content=noticeboard_2.jsp#faq_content_page">색상을 변경해서 보내주세요.</a></li>
                        <li>관리자</li>
                        <li>2022-08-25</li>
                    </ul>
                    <ul class="all contents4 cf">
                        <li>서비스</li>
                        <li><a href="index.jsp?content=noticeboard_2.jsp#faq_content_page">헤드폰 이어패드를 교체할 수 있나요?</a></li>
                        <li>관리자</li>
                        <li>2022-08-25</li>
                    </ul>
                    <ul class="all contents4 cf">
                        <li>서비스</li>
                        <li><a href="index.jsp?content=noticeboard_2.jsp#faq_content_page">이어버드 케이스만 별도로 구매할 수 있나요?</a></li>
                        <li>관리자</li>
                        <li>2022-08-25</li>
                    </ul>
                    <ul class="all contents3 cf">
                        <li>교환/반품</li>
                        <li><a href="index.jsp?content=noticeboard_2.jsp#faq_content_page">초도 불량 제품의 교환/반품 가능 기간은 어떻게 되나요?</a></li>
                        <li>관리자</li>
                        <li>2022-08-12</li>
                    </ul>
                    <ul class="all contents3 cf">
                        <li>교환/반품</li>
                        <li><a href="index.jsp?content=noticeboard_2.jsp#faq_content_page">단순 변심 반품이 가능한가요?</a></li>
                        <li>관리자</li>
                        <li>2022-08-12</li>
                    </ul>
                    <ul class="all contents3 cf">
                        <li>교환/반품</li>
                        <li><a href="index.jsp?content=noticeboard_2.jsp#faq_content_page">제품 불량으로 접수 할 경우 교환/반품 배송비는 어떻게 부과되나요?</a></li>
                        <li>관리자</li>
                        <li>2022-08-12</li>
                    </ul>
                    <ul class="all contents3 cf">
                        <li>교환/반품</li>
                        <li><a href="index.jsp?content=noticeboard_2.jsp#faq_content_page">제품 불량으로 교환/반품을 하고싶습니다.</a></li>
                        <li>관리자</li>
                        <li>2022-08-12</li>
                    </ul>
                    <ul class="all contents3 cf">
                        <li>교환/반품</li>
                        <li><a href="index.jsp?content=noticeboard_2.jsp#faq_content_page">색상 교환을 하고 싶습니다.</a></li>
                        <li>관리자</li>
                        <li>2022-08-12</li>
                    </ul>
                    <ul class="all contents3 cf">
                        <li>교환/반품</li>
                        <li><a href="index.jsp?content=noticeboard_2.jsp#faq_content_page">결제수단을 변경하여 다시 결제가 가능한가요?</a></li>
                        <li>관리자</li>
                        <li>2022-08-12</li>
                    </ul>
                     
                    <p>
                        <img src="./images/icon/left.svg" alt="왼쪽으로 이동">
                        <span>&nbsp;&nbsp;1&nbsp;&nbsp;</span>
                        <img src="./images/icon/right.svg" alt="오른쪽으로 이동">
                    </p>
                     -->
                    
                    <!-- 페이징 -->
					<p id="pagingArea">
						<!-- 계산을 위한 바인딩 데이터 사용 -->
						<c:if test="${count > 0 }"><!-- 총글개수가 몇개라고 가정 -->
							<!--  총글개수가 7개라 가정 0.7 + 1 = 1.7 -->
							<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
							<!-- startPage = 1 -->
							<c:set var="startPage" value="${1 }" />
							
							<c:if test="${currentPage % 10 != 0 }"><!-- 시작페이지가 0이 아니면 -->
								<!-- 결과를 정수형으로 받기위해 fmt 사용 -->
								<!-- integerOnly = 정수 부분만 파싱할지 여부를 지정 | 기본값은 false -->
								<fmt:parseNumber var="result" value="${currentPage/10 }" integerOnly="true" />
								<!-- startPage = 0.1 * 10 + 1 = 1 -->
								<c:set var="startPage" value="${result * 10 + 1 }" />
							</c:if>
							<c:if test="${currentPage % 10 == 0 }"><!-- 시작페이지가 0이면 10페이지 % 10 -->
								<c:set var="startPage" value="${result * 10 + 1 }" />
							</c:if>
							
							<!-- endPage 화면에 보여질 페이지 숫자 -->
							<c:set var="pageBlock" value="${10 }" />
							<c:set var="endPage" value="${startPage + pageBlock - 1 }" />
							
							<!-- 마지막 페이지가 10보다 크면 -->
							<c:if test="${endPage > pageCount }">
								<!-- 11할당 -->
								<c:set var="endPage" value="${pageCount }" />
							</c:if>
							
							<!-- 이전 -->
							<c:if test="${startPage > 10 }"><!-- 10개이상이면 이전 출력 -->
								<a href="boardAllCtrl.do?pageNum=${startPage - 10 }&cate_no=${cateNo}" class="pagingBtn">&lt;</a>
							</c:if>
							
							<!-- 페이징, 카운터 처리 -->
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:if test="${i eq currentPage }">
									<a href="boardAllCtrl.do?pageNum=${i }&cate_no=${cateNo}" style="color:white;;font-weight:900;background:#181818;" class="pagingBtn">${i }</a>
								</c:if>
								<c:if test="${i ne currentPage }">
									<a href="boardAllCtrl.do?pageNum=${i }&cate_no=${cateNo}" class="pagingBtn">${i }</a>
								</c:if>
							</c:forEach>
							
							<!-- 다음 -->
							<c:if test="${endPage < pageCount }"><!-- 10개이상이면 다음 출력 -->
								<a href="boardAllCtrl.do?pageNum=${startPage + 10 }&cate_no=${cateNo}" class="pagingBtn">&gt;</a>
							</c:if>
						</c:if>
					</p>
                    
                </div>
            </div>
            <div class="content con4">
                <form action="javascript:void(0);">
                    <!-- 전화상담 예약 안내문구 -->
                    <h2>전화상담 예약</h2>
                    <div class="call_manual">
                        <h3><span class="material-symbols-outlined">contact_phone</span></h3>
                        <ul>
                            <li>전화상담 예약 시 제품 상담사가 직접 전화를 드리며, 챗봇상담/이메일 상담으로도 전문 상담을 받아보실 수 있습니다.</li>
                            <li><span>비회원은 예약/조회/취소만 가능</span>하며, <span>로그인</span>하시면 <span>마이페이지 내 서비스 현황에서 진행 상황</span>을 확인하실 수 있습니다.</li>
                            <li>전화상담 완료 내용은 02-2038-7986 고객센터를 통해 확인 가능합니다.</li>
                            <li>방문수리를 원하시면 <span>방문수리 예약을</span>이용해 주시기 바랍니다.</li>
                        </ul>
                    </div>
                    <!-- /전화상담 예약 안내문구 -->
    
                    <!-- 1. 제품/증상 선택 -->
                    <div class="symptom">
                        <h2 class="sub_title">1. 제품/증상 선택</h2>
                        <button>보유제품 선택</button>
                        <p><span>*</span>&nbsp;필수입력사항</p>
                    </div>
                    <!-- /1. 제품/증상 선택 -->
    
                    <!-- 제품/증상 메뉴 -->
                    <div class="symptom_menu">
                        <!-- 1-1. 제품 선택 -->
                        <div class="product_selection">
                            <h4>제품선택&nbsp;<span>*</span></h4>
                            <p class="line"></p>
                            <p>아래 모델명(코드)입력 또는 사용 제품을 선택해 주세요.</p>
                        </div>
                        <!-- /1-1. 제품 선택 -->
    
                        <!-- 1-2 모델명(코드) -->
                        <div class="model">
                            <h4>모델명(코드)</h4>
                            <div class="model_search">
                                <input type="search" required placeholder="예&#41;보스 QC 울트라 이어버드">
                                <button class="model_button">
                                    <span class="material-symbols-outlined">imagesmode</span>
                                    <p>모델명 사진선택</p>
                                </button>
                                <button>모델명 확인방법</button>
                            </div>
                        </div>
                        <ul class="model_explanation">
                            <li>모델명(코드)을 입력하시면 정확한 상담에 도움이 됩니다.(3자리 이상입력)</li>
                            <li>모델명(코드)을 모를 경우 아래 제품 선택 후 문의를 진행해 주세요.</li>
                            <li>모델명(코드)을 촬영하거나 저장된 이미지를 선택하시면 모델명이 인식됩니다.</li>
                        </ul>
                            <!-- 1-2 모델명(코드) -->
    
                            <!-- 1-3. 아이템 선택 -->
                            <div class="item_box">
                                <div class="item">
                                    <ul class="item_ul">
                                        <li>
                                            <span class="material-symbols-outlined">headphones</span>
                                            <p>헤드폰</p>
                                        </li>
                                        <li class="item_earbuds">
                                            <span class="material-symbols-outlined">earbuds</span>
                                            <p>이어폰</p>
                                        </li>
                                        <li class="item_soundbar">
                                            <span class="material-symbols-outlined">google_home_devices</span>
                                            <p>사운드바</p>
                                        </li>
                                        <li class="item_speaker">
                                            <span class="material-symbols-outlined">speaker</span>
                                            <p>스피커</p>
                                        </li>
                                        <li>
                                            <span class="material-symbols-outlined">construction</span>
                                            <p>리퍼상품</p>
                                        </li>
                                    </ul>
                                    <div class="item_slide">
                                        <p></p>
                                        <div>
                                            <ul class="earbuds">
                                                <li>이어폰</li>
                                                <li>액세서리</li>
                                            </ul>
                                        </div>
                                        <div>
                                            <ul class="soundbar">
                                                <li>사운드바</li>
                                                <li>홈시어터</li>
                                                <li>액세서리</li>
                                            </ul>
                                        </div>
                                        <div>
                                            <ul class="speaker">
                                                <li>무선스피커</li>
                                                <li>홈스피커</li>
                                                <li>액세서리</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="detailed">
                                    <h4>상세증상<span>*</span></h4>
                                    <textarea required placeholder="고장증상 상세내용만 입력해 주세요."></textarea>
                                </div>
                                <div class="purchase_date">
                                    <h4>구입년월</h4>
                                        <select id="year" name="year">
                                        </select>
                                        년
                                        <select id="month" name="month">
                                        </select>
                                        월
                                </div>
                            </div>
                            <!-- /1-3. 아이템 선택 -->
                    </div>
                    <!-- 제품/증상 메뉴 -->
    
                    <!-- 고객정보 -->
                    <div class="customer">
                        <h2 class="sub_title">2. 고객정보</h2>
                        <div class="customer_information">
                            <ul>
                                <h4>성명<span>*</span></h4>
                                <li><input type="text" required ></li>
                            </ul>
                            <ul>
                                <h4>전화번호<span>*</span></h4>
                                <li>
                                    <input type="text" required  placeholder="'-'없이 전화번호를 입력해주세요.">
                                </li>
                            </ul>
                            <ul>
                                <h4>전화번호 확인<span>*</span></h4>
                                <li>
                                    <input type="text" required placeholder="'-'없이 전화번호를 입력해주세요.">
                                </li>
                            </ul>
                        </div>
                        <div class="terms">
                            <h3>개인정보 수집 · 이용 동의</h3>
                            <p>고객님의 원활한 서비스 신청, 상담, 이력관리 등을 위해 개인정보 수집 및 이용 동의를 받고 있습니다.</p>
                            <div class="terms_radio">
                                <label>
                                    <ul>
                                        <li><input type="radio" name="agreement" value="true" checked required></li>
                                        <li>동의함</li>
                                    </ul>
                                </label>
                                <label>
                                    <ul>
                                        <li><input type="radio" name="agreement" value="false" checked></li>
                                        <li>동의안함</li>
                                    </ul>
                                </label>
                            </div>
                            <div class="terms1">
                                <ul>
                                    <li>수집항목 : [필수] 성명, 전화번호</li>
                                    <li>수집 · 이용 목적 : 전화상담예약 및 서비스 접수(A/S, B/S, 만족도 조사)</li>
                                    <li>보유∙이용 기간 : 1년 (단, 상법 등 타 법령에 따른 정보는 해당 법령에서 정한 기간 보존)</li>
                                    <p>※ 귀하께서는 본 동의를 거절하실 수 있으나, 미동의 시 해당 서비스 신청 및 이용에 제약이 있을 수 있습니다.</p>
                                    <p>※ 개인정보 처리에 대한 상세한 사항은 화면 하단의 개인정보 처리방침을 참조하십시오.</p>
                                </ul>
                                <ul>
                                    <li>개인정보 입력 시 주의사항</li>
                                    <li>개인정보 보호를 위해 <span>본인 외 타인의 정보(가족 포함)는 입력이 불가</span>하며, 잘못된 정보 제공으로 인한 <span>책임은 정보 제공자에게 있으니</span> 주의해 주시기 바랍니다.</li>
                                    <p>※ 본 화면에 입력하신 개인정보는 실제 서비스(상담)나 상품 주문 등을 신청해야 수집이 되며, 그 외에는 수집 또는 저장되지 않습니다.</p>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <input type="submit" value="전송">
                    <a href="#"><input type="reset" value="취소"></a>
                </form>
            </div>


            <!-- <div class="content con5">
                <p>글씨를 누르시면 문의 페이지로 넘어갑니다!&nbsp;&nbsp;&nbsp;수정 예정</p>
            </div> -->
      
            <!-- /Tab Contents -->
        </div>
    </div>
    
    <div style="display:none;">
    	<form action="boardAllCtrl.do#tab_content3" method="post" id="searchBoardForm">
    		<input type="hidden" name="searchText" id="searchText">
    	</form>
    </div>
    
    <script>
    	$(function() {
    		let searchTextLocal = localStorage.getItem('searchText');
    		if (searchTextLocal != null) {
				$('#noticeboard_wrap #search').val(searchTextLocal);
			}
    		
    		$(document).on('keyup', '#noticeboard_wrap #search', function(e) {
    			if (e.keyCode == 13) {
    				searchBoard();
    			}
    		});
    		
    		$(document).on('click', '#noticeboard_wrap #searchBoardBtn', function() {
    			searchBoard();
    		});
    		
    		$(document).on('click', '#noticeboard_wrap #resetBoardBtn', function() {
    			localStorage.removeItem('searchText');
    			location.href = 'boardAllCtrl.do?pageNum=1#tab_content3';
    		});
    		
    		$(document).on('click', '#pagingArea a, #tab_content2 label a', function(e) {
    			e.preventDefault();
    			let path = $(this).attr('href');
    			let seachTxt = $('#noticeboard_wrap #search').val().trim();
    			if (seachTxt.length > 0) {
    				path += '&searchText=' + seachTxt;
    			}
    			path += '#tab_content2';
    			location.href = path;
			});
    		
    		$(document).on('click', '#tab2_01 + label a', function(){
    	    	localStorage.removeItem('searchText');
    	    	$('#search').val('');
    	    });
    		
    		function searchBoard() {
    			let seachTxt = $('#noticeboard_wrap #search').val().trim();
    			if (seachTxt.length > 0) {
    				localStorage.setItem('searchText', seachTxt);
    				$('#searchText').val(seachTxt);
    				$('#searchBoardForm').submit();
    			} else {
    				alert('검색어를 입력해주세요.');
    			}
    		}
    	});
    </script>