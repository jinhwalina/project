<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    	.contents2{
	        height:1400px;
            margin: 50px;
            border: solid 2px;
        }
        .middle2{
            width: 1000px;
            margin:0 auto;
        }
        .middle3{
        	 width: 1000px;
            margin:0 auto;
        }
        .middle-img2{
            margin-bottom:30px;
        }
        .middle-img3{
            margin-bottom:40px;
            margin-top:15px;
        }
        .middle-img4{
            margin-left: 87px;
            width: 832px;
            height: 420px;
        }
        .middle-img-box{
        	width:600px;
        	height:50px;
        	margin:0 auto;
        	margin-bottom:20px;
        }
        .middle4{
        	width:1420px;
        	height:260px;
        	margin:0 auto;
        	margin-bottom:40px;
        }
        .middle4-img2,.middle4-img5{
        	width:250px;
        	height:250px;
        	border-radius: 20px;
        	
        }
        .middle4-img1,.middle4-img3,.middle4-img4{
        	width:300px;
        	height:250px;
        	border-radius: 20px;
        }
    </style>
    
    <div class="contents2">
	     <div class="middle2">
	         <img class="middle-img3" src="<%=request.getContextPath()%>/resources/css/image/기본안내내용.jpg" alt="">
	         <img class="middle-img2" src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">
	     </div>
	     
	     <div class="middle-img-box">
	     	<img class="middle-img5" src="<%=request.getContextPath()%>/resources/css/image/시설이용안내.jpg" alt="">
	     </div>
	     
	     <div class="middle4">
	     	<img class="middle4-img1" src="<%=request.getContextPath()%>/resources/css/image/시설 (1).jpg" alt="">
	     	<img class="middle4-img2" src="<%=request.getContextPath()%>/resources/css/image/시설 (2).jpg" alt="">
	     	<img class="middle4-img3" src="<%=request.getContextPath()%>/resources/css/image/시설 (3).jpg" alt="">
	     	<img class="middle4-img5" src="<%=request.getContextPath()%>/resources/css/image/시설 (5).jpg" alt="">
	     	<img class="middle4-img4" src="<%=request.getContextPath()%>/resources/css/image/시설 (4).jpg" alt="">
	     </div>
	     
	     <div class="middle3">
	     	<img class="middle-img2" src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">
	     	<img class="middle-img4" src="<%=request.getContextPath()%>/resources/css/image/지도2.jpg" alt="">
	     </div>
    </div>
   