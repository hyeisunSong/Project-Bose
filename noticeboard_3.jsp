<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div id="write_wrap" class="w1440">
        <section>
            <h2>1:1문의</h2>
        </section>

        <article class="writeCustom">
            <p>고객지원 &gt; 1:1 문의</p>
            <p>※ 신속한 답변을 위하여 문의 분류를 정확히 선택해주세요.</p>
        </article>

        <form action="boardInsertCtrl.do" method="post" class="writeForm">
            <article class="questionArea">
                <div>
                    <select name="cate_no" id="cate_no"></select>
                    <span>
                        <label>
                            <input type="checkbox" name="password"> 비밀글
                            <img src="./images/icon/lock_open.svg" alt="비밀글 이미지">
                        </label>
                    </span>
                </div>
    
                <div>
                    <button>임시저장</button>
                    <button class="on">불러오기</button>
                </div>
            </article>
    
            <article class="writeTitle">
                <input type="text" name="title" placeholder="제목을 입력해주세요.">
            </article>
    
            <article class="writeContent">
            	<script src="https://cdn.ckeditor.com/ckeditor5/41.0.0/classic/ckeditor.js"></script>
                <textarea name="content" cols="30" rows="10" id="editor"
                placeholder="아래의 양식에 따라 글을 작성해 주세요&#10;&#10;&#10;&#10;

문의자 :  홍개동
                
연락처 :   010 - 1234 -5678
                
사용기기 : 헤드폰
                
                
                
                
                
상세 설명 : 크기가 안맞아요 "></textarea>
				<script>
				    ClassicEditor
				        .create( document.querySelector( '#editor' ) )
				        .catch( error => {
				            console.error( error );
				        } );
				</script>
            </article>
    
            <hr>
    
            <article class="fileArea">
                <div>파일첨부</div>
                <div>
                    <div class="box_1">
                        <input class="upload-name" value="첨부파일" placeholder="첨부파일">
                        <label for="file">찾아보기</label> 
                        <input type="file" id="file">
                    </div>
                    <div class="box_2">
                        <input class="upload-name" value="...">
                        <label for="file">파일삭제</label>
                        <input type="file" id="file">
                    </div>
                    <div>
                        ※ (주)bose는  1:1 문의하기를 통하여 개인정보 서류를 접수하지 않습니다.<br>
                        첨부파일은 제품 및 관련 오류 및 신 이미지만 가능합니다.
                    </div>
                </div>
            </article>
    
            <article class="writeBtns">
                <button type="reset">취소</button>
                <button type="submit" class="on">작성</button>
            </article>
        </form>
    </div>
    
    <script>
    	$(function() {
    		localStorage.setItem('noticeIdx', 2);
    		getCategory();
    	});
    	
    	// 페이지 진입시 옵션 설정
    	function getCategory() {
    		$.ajax({
				  url : "boardCategory.do"
				, type : 'post'
				, success : function(data) {
					$.each(JSON.parse(data), function(i, v) {
						if (i > 0) {
							let d = JSON.parse(v);
							// 카테고리 설정
							var op = $('<option>');
							op.attr('value', d.cate_no);
							op.text(d.cate_name);
							
							$('#write_wrap #cate_no').append(op);
						}
					});
				}
				, error : function(request, status, error) {
					console.log(error);
				}
			});
    	}
    </script>