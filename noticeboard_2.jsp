<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div id="noticeboard_wrap">
        <h1>SUPPORT</h1>
        <div class="tab_content" id="faq_content_page">
            
            <div class="content con3" style="display: block;">
                
                <div class="faq_1 w1440">
                    <div class="faq_header" >
                        <h1><span class="bold">${vo.cate_name }</span>&nbsp;&nbsp;&nbsp;<b class="title">${vo.title }</b></h1>
                        <p>${vo.writer }</p>
                        <p><span class="bold">FAQ</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>${vo.reg_date }</span></p>
                    </div>
                    <hr class="faq_hr">
                    <div class="faq_content">
                        <script src="https://cdn.ckeditor.com/ckeditor5/41.0.0/classic/ckeditor.js"></script>
		                <textarea id="editor">${vo.content }</textarea>
                        <script>
						    ClassicEditor
						        .create( document.querySelector( '#editor' ), {
						            toolbar: []
						        } )
						        .catch( error => {
						            console.error( error );
						        } );
						</script>
                    </div>
                    <hr class="faq_hr">
                    <button type="button" class="faq_btn" id="boardList">목록</button>
                    <c:if test="${vo.id eq user.id }">
                    	<button type="button" class="faq_btn" onclick="boardFunc(${vo.seq}, 'Update');">수정</button>
                    	<button type="button" class="faq_btn" onclick="boardFunc(${vo.seq}, 'Delete');">삭제</button>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    	function boardFunc(seq, type) {
    		var temp = (type == 'Update') ? '수정' : '삭제';
    		
    		if (confirm(temp + '하시겠습니까?')) {
    			location.href = 'board' + type + 'Ctrl.do?seq=' + seq;
    		}
    	}
    </script>