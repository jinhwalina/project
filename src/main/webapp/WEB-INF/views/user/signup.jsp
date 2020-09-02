<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

<div class="signup">
        <form method="post" action="<%=request.getContextPath()%>/user/signup">
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
                   	<label for="" id="mail-error" class="error"></label>
                    </div>
                    
                    
                    
                    <!-- 비밀번호 박스 -->
                    <div class="site-info-pw">
                        <div class="site-text-pw">비밀번호<br>
                            <input type="password" name="pw" class="pw" id="pw"> <!-- 유효성 검사 시 , 같은지 비교하기 위해서는 id가 필요 --><br>
                        	<label for="" id="pw-error" class="error"></label>
                        </div>
                        
					
					
                        <div class="site-text-pw2">비밀번호 확인<br>
                            <input type="password" name="pw2" class="pw2"><br>
                            <label for="" id="pw2-error" class="error"></label>
                        </div>
                    </div> 
                    
                     
                     
                </div>

                <!-- 개인정보 입력 -->
                <div class="per-img">
                    <img  class="per-img-img" src="<%=request.getContextPath()%>/resources/css/image/개인정보입력.jpg" alt="">
                    <img src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">
                </div>
                <div class="per-info">
                    <!-- 이름 박스 -->
                    <div class="per-info-name">
                        <div class="per-text-name">이름</div>
                        <div class="per-box-name">
                            <input type="text" name="name" class="name">
                        </div>
                        <label for="" id="name-error" class="error"></label>
                    </div>
                    
                    
                    <div class="per-info-nickname">
                        <div class="per-text-nickname">별명</div>
                        <div class="per-box-nickname">
                            <input type="text" name="nickname" class="nickname">
                        </div>
                        <label for="" id="nickname-error" class="error"></label>
                    </div>
                    
                    
                    <div class="per-info-phone">
                        <div class="per-text-phone">연락처</div>
                        <div class="per-box-phone">
                            <input type="text" name="pnum" class="phone" placeholder=" '-'없이 숫자만 입력해주세요 :)">
                        </div>
                        <label for="" id="pnum-error" class="error"></label>
                    </div>
					
					
                </div>
            </div>
            <div class="button-box">
                <div class="cancel">
                    <a href="<%=request.getContextPath()%>/" class="btn-cancel">취소</a>
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

		/* 유효성 검사 */
			$("form").validate({ // form태그의 유효성을 검사하겠다. submit 될 때 동작함. 
		        rules: { // 규칙 
		            mail: { // id는 ,  
		                required : true, // 필수항목 
		                minlength : 3 // 최대 4글자 
		            }, 
		            pw: { 
		                required : true, 
		                minlength : 6, 
		                maxlength : 20, 
		                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/ // 정규 표현식. 숫자, 영문이 하나 이상 포함되게끔 
			                	// (?=\w{8,20}$)글자가 이런 조건을 만족 한다. 라는 뜻 \w 영문,숫자 
		            }, 
		            pw2: { 
		                required : true, 
		                equalTo : pw // 누구랑 같은지 확인하는거. 
		            }, 
		            nickname : { 
		                required : true,
		                minlength : 2, 
		                maxlength : 6
		            } ,
		            name : {
		            	required : true,
		            	minlength : 2
			        }
		        }, 
		        //규칙체크 실패시 출력될 메시지 
		        messages : { 
		            mail: { 
		                required : "필수로입력하세요", 
		                minlength : "최소 {0}글자이상이어야 합니다" 
		            }, 
		            pw: { 
		                required : "필수로입력하세요", 
		                minlength : "최소 {0}글자이상이어야 합니다", 
		                maxlength : "최대 {0}글자이상이어야 합니다", 
		                regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함" 
		            }, 
		            pw2: { 
		                required : "필수로입력하세요", 
		                equalTo : "비밀번호가 일치하지 않습니다." 
		            }, 
		            nickname: { 
		            	required : "필수로입력하세요", 
		            	minlength : "최소 {0}글자이상이어야 합니다", 
		                maxlength : "최대 {0}글자이상이어야 합니다"
		            } ,
		            name: {
		            	required : "필수로입력하세요",
		            	minlength : "최소 {0}글자이상이어야 합니다"
				    }
		        } 
		    }); 
			$.validator.addMethod( 
				    "regex", 
				    function(value, element, regexp) { 
				        var re = new RegExp(regexp); 
				        return this.optional(element) || re.test(value); 
				    }, 
				    "Please check your input." 
				); 
			
			
        })
    </script>