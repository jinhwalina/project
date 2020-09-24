<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<style>
        .contents{
	        height:1070px;
            margin: 50px;
            border: solid 2px;
        }
        .slide-img{
            height: 370px;
            margin: 20px 20px 0;
            overflow: hidden;
        }
        .slide-box{
            margin-top:40px;
            width: 2700px;
            height: 100%;
        }
        .slide-box>img{
            width: 270px;
            height: 270px;
            border-radius: 115px;
            float: left;
        }
        .middle{
            width: 1000px;
            margin:0 auto;
          
        }
        .middle-img,.middle-img2{
            margin-bottom:30px;
        }
        .middle-img3{
        	margin-left:200px;
            margin-bottom:40px;
        }
        .middle-img4{
        	margin-left: 350px;
		    margin-top: -25px;
		    border-radius: 25px;
        }
        .middle-img4:hover{
        	cursor:pointer;
        }
        .middle-img5{
        	margin-top: -30px;
    		margin-left: 102px;
        }
        .bottom{
        	float: right;
        	width: 400px;
        }
        .bottom>img{
        	float:left;
        }
        .bottom-img4{
        	width:100px;
        	height:100px;
        	margin-left:-5px;
        }
        .bottom-img{
	        width: 200px;
	    	margin-left: 160px;
	    	margin-bottom: 5px;
        }
        .bottom-img2,.bottom-img3{
        	margin: 5px;
        	width:80px;
        	height:80px;
        }
        .bottom-img2{
        	margin-left: 130px;
        }
        
    </style>
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

        <div class="middle">
        	<img class="middle-img5" src="<%=request.getContextPath()%>/resources/css/image/방문감사.jpg" alt="">
            <img class="middle-img2" src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">
            <img class="middle-img" src="<%=request.getContextPath()%>/resources/css/image/소개글내용수정.jpg" alt="">
             <img class="middle-img3" src="<%=request.getContextPath()%>/resources/css/image/시설이용안내버튼.jpg" alt="">
             <a href="<%=request.getContextPath()%>/main/info"><img class="middle-img4" src="<%=request.getContextPath()%>/resources/css/image/이용안내바로가기.jpg" alt=""></a>
        </div>
        
        <div class="bottom">
        	<img class="bottom-img" src="<%=request.getContextPath()%>/resources/css/image/빠른상담문의.jpg" alt="">
        	<img class="bottom-img2" src="<%=request.getContextPath()%>/resources/css/image/카카오톡.png" alt="">
        	<img class="bottom-img3" src="<%=request.getContextPath()%>/resources/css/image/전화.png" alt="">
        	<img class="bottom-img4" src="<%=request.getContextPath()%>/resources/css/image/메세지.png" alt="">
        </div>
        
    </div>
    


    <script>
    
        $(function(){
            setInterval(function(){
                    $('.box').first().animate({'margin-left' : '-300px'},1300,function(){
                        $('.box').first().detach().appendTo('.slide-box')
                        $(this).removeAttr('style')
                    })
            },2000)
        })
        
        $('.bottom>img').click(function(){
            alert(" * 구현하지 않은 기능입니다ㅠ_ㅠ *");
            })
    </script>