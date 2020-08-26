<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  <nav class="navbar navbar-expand-md bg-dark navbar-dark">
	<div class="container">
	  	<a class="navbar-brand" href="#">Navbar</a>
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
	  	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	    	<ul class="navbar-nav">
		      	<li class="nav-item">
		        	<a class="nav-link" href="#">Link</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="#">Link</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="#">Link</a>
		      	</li>    
	    	</ul>
		</div> 
	</div> 
</nav>-->

    <div class="main-logo">
        <div class="logo-box">
            <img class="logo-image" src="<%=request.getContextPath()%>/resources/css/image/logoo.jpg" alt="">
        </div>
    </div>
    <div class="nav-menu">
        <div class="menu-item">
            <ul class="menu-ul">
        		<li class="menu-list">
        			<a href="">SERVICES</a>
        		</li>
        		<li class="menu-list">
        			<a href="">RESERVATION</a>
        			<ul>
                        <li class="sub-menu">
                            <a href="">예약하기</a>
                        </li>
                        <li class="sub-menu">
                            <a href="">예약변경</a>
                        </li>
                        <li class="sub-menu">
                            <a href="">예약취소</a>
                        </li>
                        <li class="sub-menu">
                            <a href="">예약확인</a>
                        </li>
                    </ul>
        		</li>
        		<li class="menu-list">
        			<a href="">Q&A</a>
        		</li>
        		<li class="menu-list">
        			<a href="">REVIEWS</a>
        		</li>
            </ul>
            <div class="user-menu">
                <a href="">login</a>
                <a href="">sign up</a>
            </div>
            
        </div>
    </div>
    
    <!-- 예약 카테고리 호버했을때 슬라이드 나오는 쿼리문 -->
    
    <script>
        $('.menu-list').hover(function(){
            $(this).find('ul').stop().slideToggle(500);
        })
    </script>
