<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<div class="signup">
        <form action="#">
            <div class="signup-box">
                <div class="site-img">
                    <img src="<%=request.getContextPath()%>/resources/css/image/사이트이용정보입력.jpg" alt="">
                    <img src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">
                </div>
                <!-- 사이트 이용 정보 입력 -->
                <div class="site-info">
                    <!-- 아이디 (메일 박스) -->
                    <div class="site-info-id">
                        <div class="site-text-id">아이디</div>
                        <div class="site-box-id">
                            <input type="text" class="mail">
                            <span>@</span>
                            <input type="text" class="mail2">
							
							<input type="hidden" name="mail" class="email">
               				<!-- vo에 있는 이름은 여기잇는 name속성과 이름이 같아야한다. -->
							
                            <select class="sel-add"> 
                                <option value="" selected>직접입력</option>
                                <option>naver.com</option>
                                <option>hanmail.net</option>
                                <option>gmail.com</option>
                                <option value="nate.com">nate.com</option>
                            </select>
                        </div>
                    </div>
                    <!-- 비밀번호 박스 -->
                    <div class="site-info-pw">
                        <div class="site-text-pw">비밀번호<br>
                            <input type="password" name="pw" class="pw">
                        </div>

                        <div class="site-text-pw2">비밀번호 확인<br>
                            <input type="password" name="pw2" class="pw2">
                        </div>
                    </div>   
                </div>

                <!-- 개인정보 입력 -->
                <div class="per-img">
                    <img src="<%=request.getContextPath()%>/resources/css/image/개인정보입력.jpg" alt="">
                    <img src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">
                </div>
                <div class="per-info">
                    <!-- 이름 박스 -->
                    <div class="per-info-name">
                        <div class="per-text-name">이름</div>
                        <div class="per-box-name">
                            <input type="text" name="name" class="name">
                        </div>
                    </div>
                    <div class="per-info-phone">
                        <div class="per-text-phone">연락처</div>
                        <div class="per-box-phone">
                            <input type="text" name="phone" class="phone">
                        </div>
                    </div>

                </div>
            </div>
            <div class="button-box">
                <div class="cancel">
                    <a href="<%=request.getContextPath()%>/" class="btn-cancel" href="#">취소</a>
                </div>
                <div class="enter">
                    <button type="button" class="btn-enter">확인</button>
                    <button type="submit" hidden="" class="enter2"></button>
                </div>
            </div>
        </form>
    </div>

    <!-- 메일박스 셀렉 할 때 -->
    <script>
        $(function(){
            $('.sel-add').change(function(){
			var email = $(this).val();
            if(email != ''){
                $('.mail2').attr('type','hidden')
                $('.mail2').val(email);
                $(this).animate({'width': '400px'},500);
            } else {
                $(this).animate({'width':'200px'},1);
                $('.mail2').attr('type','text')
                $('.mail2').val('');
            }
		})

		/* 로그인 할 시, 두 개로 나눠진 메일 박스를 하나로 합쳐서 메일 형식으로 저장되어 보내지게 하는 쿼리문 */
			$('.btn-enter').click(function(){
				var email = $('.mail').val() + '@' + $('.mail2').val();
                $('.email').val(email);
                $('.enter2').click();
			})


		
        })
    </script>