<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BOSE</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- 파비콘(사이즈 = 32X32) -->
    <link rel="shortcut icon" href="./images/fav32x32.png">   
    <!-- 모바일파비콘(사이즈 = 180X180) -->
    <link rel="apple-touch-icon=precomposed" href="./images/fav180x180.png">
    
    <!-- css -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/header.css">
<!--     <link rel="stylesheet" href="./css/headerMain.css"> -->
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="stylesheet" href="./css/feedback.css">
    <link rel="stylesheet" href="./css/display_none_scrollbar.css">
    <link rel="stylesheet" href="./css/mainpage.css">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/find_idpw.css">
    <link rel="stylesheet" href="./css/join.css">
    <link rel="stylesheet" href="./css/subpage.css">
    <link rel="stylesheet" href="./css/cart.css">
    <link rel="stylesheet" href="./css/contentpage.css">
    <link rel="stylesheet" href="./css/review.css">
    <link rel="stylesheet" href="./css/noticeboard.css">
    <link rel="stylesheet" href="./css/noticeboard2.css">
    <link rel="stylesheet" href="./css/noticeboard3.css">
    <link rel="stylesheet" href="./css/searchpage.css">
    <link rel="stylesheet" href="./css/mainpage_jquery.bxslider.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    
    <!-- jq -->
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/items.js"></script>
    <script src="./js/header.js"></script>
    <script src="./js/feedback.js"></script>
    <script src="./js/mainpage.js"></script>
    <script src="./js/find_idpw.js"></script>
    <script src="./js/login.js"></script>
    <script src="./js/subpage.js"></script>
    <script src="./js/review.js"></script>
    <script src="./js/noticetitle.js"></script>
    <script src="./js/searchpage.js"></script>
    
    <!-- 박스 슬라이더 -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="./js/mainpage_jquery.bxslider.js"></script>
    <script src="./js/mainpage_jquery.bxslider2.js"></script>
</head>
<body>
	<header>
		<jsp:include page="./includes/header.jsp" />
	</header>
	
	<main>
		<jsp:include page="${empty param.content ? './main.jsp' : param.content }" />
		<jsp:include page="./includes/chatbot.jsp"></jsp:include>
		<jsp:include page="./includes/floButton.jsp"></jsp:include>
	</main>
    
    <footer>
    	<jsp:include page="./includes/footer.jsp" />
    </footer>
</body>
</html>