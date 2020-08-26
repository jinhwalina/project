<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

	<div class="contents">
        <div class="slide-img">
            <div class="slide-box">
                <img class="box box1" src="<%=request.getContextPath()%>/resources/css/image/KakaoTalk_20200826_140436229.jpg" alt="">
                <img class="box box2" src="<%=request.getContextPath()%>/resources/css/image/KakaoTalk_20200826_140436229_02.jpg" alt="">
                <img class="box box3" src="<%=request.getContextPath()%>/resources/css/image/KakaoTalk_20200826_140436229_03.jpg" alt="">
                <img class="box box4" src="<%=request.getContextPath()%>/resources/css/image/KakaoTalk_20200826_140436229_07.jpg" alt="">
                <img class="box box5" src="<%=request.getContextPath()%>/resources/css/image/KakaoTalk_20200826_140436229_13.jpg" alt="">
                <img class="box box6" src="<%=request.getContextPath()%>/resources/css/image/KakaoTalk_20200826_140436229_09.jpg" alt="">
                <img class="box box7" src="<%=request.getContextPath()%>/resources/css/image/KakaoTalk_20200826_140436229_12.jpg" alt="">
                <img class="box box8" src="<%=request.getContextPath()%>/resources/css/image/KakaoTalk_20200826_140436229_28.jpg" alt="">
                <img class="box box9" src="<%=request.getContextPath()%>/resources/css/image/KakaoTalk_20200826_140436229_01.jpg" alt="">
            </div>
        </div>

        <div class="intro">
            <img class="intro-img" src="<%=request.getContextPath()%>/resources/css/image/소개글.jpg" alt="">
            <img class="intro-img" src="<%=request.getContextPath()%>/resources/css/image/기본안내.jpg" alt="">
            <img class="intro-img" src="<%=request.getContextPath()%>/resources/css/image/질문답변.jpg" alt="">
            <img class="intro-img" src="<%=request.getContextPath()%>/resources/css/image/예약.jpg" alt="">
        </div>
        <div>
            <img class="intro-img2" src="<%=request.getContextPath()%>/resources/css/image/소개글내용수정.jpg" alt="">
            <img class="intro-img2" src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">
            <img class="intro-img2" src="<%=request.getContextPath()%>/resources/css/image/기본안내내용.jpg" alt="">
            <img class="intro-img2" src="<%=request.getContextPath()%>/resources/css/image/지도2.jpg" alt="">
            <img class="intro-img2" src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">
        </div>
    </div>
    
    <script>
    <!-- 메인 이미지 슬라이드 쿼리문 
        $(function(){
            setInterval(function(){
                    $('.box').first().animate({'margin-left' : '-300px'},1300,function(){
                        $('.box').first().detach().appendTo('.slide-box')
                        $(this).removeAttr('style')
                    })
            },2000)
        })
    -->
    </script>