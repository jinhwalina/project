<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!--  모달 창 css  -->
<style>
/* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }
    
    /* Modal Content/Box */
    .modal-content {
         position:relative;
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 10px;
        border: 4px solid silver;
        width: 30%; /* Could be more or less, depending on screen size */
        min-height: 120px;                     
    }
    .modal-login p{
    	font-size: 25px;
    	font-weight: bold;
    	color: rosybrown;
    	text-align: center;
    }
    .modal-go{
    	padding-bottom: 10px;
    }
    .modal-go p{
    	font-size: 17px;
    	font-weight: bold;
    	text-align: center;
    	color: #757575;
    	
    }
    
    /* The Close Button */
    .close {
          position:absolute;
        color: #555555;
        right:30px;
        font-size: 30px;
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .modal-content button{
          width: 100px;
          background-color: transparent;
          position: absolute;
          bottom:10px;
    }
   .modal-content button:hover{
      background-color: rgb(33,51,87);
      color: white;
   }
   .modal-content a{
   	color: darkgrey;
   	width: 100%;
   	text-align: center;
   	float:left;
   }
   .modal-content a:hover{
   		text-decoration: none;
   		color: black;
   }
</style>
<!-- ------------------------------------------------------------------------------------------------------------------------------- -->

<!--  헤더 html -->
    <div class="main-logo">
        <div class="logo-box" >
        	<a href="<%=request.getContextPath()%>/">
        	<img class="logo-image" src="<%=request.getContextPath()%>/resources/css/image/logoo.jpg"  alt="">
        	</a>
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
        			<ul class="reservation-modal">
                        <li class="sub-menu">
                            <a href="<%=request.getContextPath()%>/reservation/innDo">예약하기</a>
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
            	<c:if test="${user == null }">
                	<a href="<%=request.getContextPath()%>/user/login">login</a>
                </c:if>
                
                <c:if test="${user != null }">
                	<a href="<%=request.getContextPath()%>/user/mypage">my page</a>
                </c:if>
                
                <c:if test="${user == null }">
                	<a href="<%=request.getContextPath()%>/user/signup">sign up</a>
            	</c:if>
                <c:if test="${user != null }">
                	<a href="<%=request.getContextPath()%>/user/signout">sign out</a>
                	<!-- 이때 적어주는 signout 페이지는 사실 화면에는 없는 경로! 컨트롤러에서 로그아웃 처리 해줄때 
                	정보를 건네받아 처리해주기 위해 존재함..
                	 -->
            	</c:if>
            </div>
            
        </div>
    </div>
    
<!-- ------------------------------------------------------------------------------------------------------------------------------- -->      
    <!-- The Modal -->
	<div id="myModal" class="modal">
 
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close" onclick="close()">&times;</span>
        <div class="modal-login">
           <p>로그인 후 이용해주세요 :)</p>
        </div>
        <div class="modal-go">                                                         
           <p>로그인 창으로 이동하시겠습니까?</p>
        </div>
	<!-- 링크로 보낼거면 링크로 넘겨주고, 권한 제어만 풀어줄 경우에는 없어도 되는코드. --> 
        <a href="<%=request.getContextPath()%>/user/login">YES</a>
       <a href="<%=request.getContextPath()%>/">CLOSE</a>
	   </div>
	</div>
<!-- ------------------------------------------------------------------------------------------------------------------------------- -->    

    
    <script>
    	<!-- 예약 카테고리 호버했을때 슬라이드 나오는 쿼리문 -->
        $('.menu-list').hover(function(){
            $(this).find('ul').stop().slideToggle(300);
        })
    </script>
    
    
    <c:if test="${user == null }" >
	    <script>
	    <!-- 모달창 관련 script -->
        $('.sub-menu>a').click(function(){
        	 modal.style.display = "block";
            <!-- 클릭했을때 링크 연결되서 페이지로 안넘어가고 , 이 상태에서 로그인 모달창 띄워주기 -->
            return false;
        })
        
        		var modal = document.getElementById('myModal');
	            var span = document.getElementsByClassName("close")[0];          
	            span.onclick = function() {
	                modal.style.display = "none";
	            

	            function yes_close(obj){
	                obj.click(function(){
	                   modal.style.display = "none";
	                })
	            }
	            function no_close(obj){
	                obj.click(function(){
	                   modal.style.display = "none";
	                })
	            }
	             /* 윈도우 창에 아무곳이나 클릭하면 창 닫혀지는. */
	            window.onclick = function(event) {
	                 if (event.target == modal) {
	                     modal.style.display = "none";
	                 }
	             }

	            yes_close($('#yes'));
	            no_close($('#no')); 
	            
			}
	    </script>
    </c:if>


    <c:if test="${user != null }">
    	<script>
			
    	</script>
    </c:if>
    
    
