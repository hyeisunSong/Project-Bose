<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bose</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<style>
    #wrap{
        display: flex;
        flex-flow: row nowrap;
        justify-content: start;
        height: 80px;
    }
    h2{
        width: 120px;
        text-align: left;
        color: #888;
        font-size: 18px;
        font-weight: 600;
        margin-right: 40px;
    }
    span{
        padding-top: 16px;
        margin-right: 30px;
    }
    img{
        padding-top: 16px;
        margin-right: 30px;
    }
</style>
<body>
    <div id="wrap">
        <h2>Main Page</h2>
        <div>
            <span class="material-symbols-outlined">search</span>
            <span class="material-symbols-outlined">person</span>
            <span class="material-symbols-outlined">workspace_premium</span>
            <span class="material-symbols-outlined">volunteer_activism</span>
            <span class="material-symbols-outlined">imagesmode</span>
            <!-- 
                <span class="material-symbols-outlined">naver</span>
                <span class="material-symbols-outlined">blog</span>
                <span class="material-symbols-outlined">instagram</span> 
            -->
            <span class="material-symbols-outlined">keyboard_arrow_up</span>
            <span class="material-symbols-outlined">forum</span>
        </div>
    </div>

    <br>
    <br>
    <br>

    <div id="wrap">
        <h2>GNB Menu</h2>
        <div>
            <span class="material-symbols-outlined">sim_card_download</span>
            <span class="material-symbols-outlined">support_agent</span>
            <span class="material-symbols-outlined">live_help</span>
            <span class="material-symbols-outlined">settings_phone</span>
            <span class="material-symbols-outlined">devices</span>
        </div>
    </div>

    <br>
    <br>

    <div id="wrap">
        <h2>View All</h2>
        <div><span class="material-symbols-outlined">keyboard_arrow_right</span></div>
    </div>
    
    <br>
    <br>
    <br>
    <div id="wrap">
        <h2>Sub Page</h2>
        <div>
            <span class="material-symbols-outlined">shopping_cart</span>
            <span class="material-symbols-outlined">maps_ugc</span>
        </div>
    </div>
    
    <br>
    <br>
    <br>
    <div id="wrap">
        <h2>Content Page</h2>
        <div>
            <span class="material-symbols-outlined">share</span>
            <span class="material-symbols-outlined">IOS_share</span>
            <span class="material-symbols-outlined">error</span>
            <span class="material-symbols-outlined">favorite</span>
            <span class="material-symbols-outlined">local_mall</span>
            <span class="material-symbols-outlined">redeem</span>
        </div>
    </div>
    
    <br>
    <br>
    <div id="wrap">
        <h2>Content Page <br>Review</h2>
        <div>
            <span class="material-symbols-outlined">border_color</span>
            <span class="material-symbols-outlined">star</span>
            <span class="material-symbols-outlined">star_rate_half</span>
            <span class="material-symbols-outlined">thumb_up</span>
            <span class="material-symbols-outlined">account_circle</span>
            <span class="material-symbols-outlined">toggle_on</span>
            <span class="material-symbols-outlined">toggle_off</span>
            <span class="material-symbols-outlined">visibility_off</span>
        </div>
    </div>

    <br><br><br>
    <div id="wrap">
        <h2>SNS</h2> 
        <!-- <h3>색고정</h3> -->
        <div>
            <img src="./image_icon/blog.png" alt="">
            <img src="./image_icon/instagram.png" alt="">
            <img src="./image_icon/kakaotalk.png" alt="">
            <img src="./image_icon/naver.png" alt="">
        </div>
    </div>

</body>
</html>