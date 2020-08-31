<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<div class="login">
	<div class="login-plz">
		<img src="<%=request.getContextPath()%>/resources/css/image/로그인요청.jpg" alt="">
		<img src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">
	</div>
       <div class="login-box">
           <form class="form-login" method="post">
               <input type="text" class="lo-mail">
               <span>@</span>
               <input type="text" class="lo-mail2">
               
               <input type="hidden" name="mail" class="email">
               <!-- vo에 있는 이름은 여기잇는 name속성과 이름이 같아야한다. -->
               
               <select class="sel-add"> 
                   <option value="" selected>직접입력</option>
                   <option>naver.com</option>
                   <option>hanmail.net</option>
                   <option>gmail.com</option>
                   <option value="nate.com">nate.com</option>
               </select>

               <input type="password" name="pw" class="lo-pw" placeholder="비밀번호">
               <a href="<%=request.getContextPath()%>/user/signup" class="login-signup">회원가입</a>
               <button type="button" class="login-login">로그인</button>
               <button type="submit" hidden="" class="login2"></button>
               <a href="#" class="pw-lost">비밀번호찾기</a>
           </form>
       </div>
   </div>
   
   <!-- 메일박스 셀릭 시 박스 상태 변화하는 쿼리문 -->
    <script>
        $(function(){
            $('.sel-add').change(function(){
			//$(this).animate({'width':'600px','background-color':'white'},1000);
				var email = $(this).val();
	            if(email != ''){
	                $('.lo-mail2').attr('type','hidden')
	                $('.lo-mail2').val(email);
	                //console.log($('.mail2').val());
	                $(this).animate({'width':'300px'},500);
	            } else {
	                $(this).animate({'width':'150px'},1);
	                $('.lo-mail2').attr('type','text')
	                $('.lo-mail2').val('');
	                //console.log($('.mail2').val());
	            }
			})
			
			/* 로그인 할 시, 두 개로 나눠진 메일 박스를 하나로 합쳐서 메일 형식으로 저장되어 보내지게 하는 쿼리문 */
			$('.login-login').click(function(){
				var email = $('.lo-mail').val() + '@' + $('.lo-mail2').val();
                $('.email').val(email);
                $('.login2').click();
			})
        }) 
    </script>