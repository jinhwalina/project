<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
    .mypage{
        width: 900px;
        margin: 0 auto;
        height: 1000px;
        border: 1px solid;
    }
    .mypage-img{
    	margin: 0 auto;
    }
    .mypage-info{
        border: 1px solid;
        height: 300px;
    }
    .info-phone,.text-pw,.text-pw2{
        float: left;
    }
    .mypage-status,.mypage-pay{
        border: 1px solid;
        height: 300px;
    }
    
    .price-box{
    	border: 1px solid black;
    	width:100px;
    	height:20px;
    }
</style>

<div class="mypage">
        <div class="mypage-img">
            <img src="<%=request.getContextPath()%>/resources/css/image/마이페이지입니다.jpg" alt="">
            <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
        </div>

        <div class="mypage-info">
            <div class="mypage-info-img">
                <img src="<%=request.getContextPath()%>/resources/css/image/내정보.jpg" alt="">
            </div>

            <div class="info-box">
                <div class="info-id">
                    	${myInn.inn_user_mail}
                </div>

                <div class="info-nickname">
                    <div class="text-nickname">별명</div>
                    <div class="box-nickname">
                        <input type="text" name="nickname" class="nickname" value="${user.nickname }">
                    </div>
                    <label for="" id="nickname-error" class="error"></label>
                </div>

                <div class="info-phone">
                    <div class="text-phone">연락처</div>
                    <div class="box-phone">
                        <input type="text" name="pnum" class="phone" placeholder=" '-'없이 숫자만 입력해주세요 :)" value="${user.pnum }">
                    </div>
                    <label for="" id="pnum-error" class="error"></label>
                </div>

                <div class="info-pw">
                    <div class="text-pw">비밀번호<br>
                        <input type="password" name="pw" class="pw" id="pw"><br>
                        <label for="" id="pw-error" class="error"></label>
                    </div>
                    <div class="text-pw2">비밀번호 확인<br>
                        <input type="password" name="pw2" class="pw2"><br>
                        <label for="" id="pw2-error" class="error"></label>
                    </div>
                </div> 

                <div class="info-btn">
                    <button class="info-btn-modi" type="button">수정하기</button>
                </div>
            </div>
        </div>

        <div class="mypage-status">
            <div class="mypage-status-img">
                <img src="<%=request.getContextPath()%>/resources/css/image/예약현황.jpg" alt="">
            </div>
            <c:if test="${myInn.inn_isRe == 'N'}">
            	<h1>예약이 없어요 ! </h1>
            </c:if>
			<c:if test="${myInn.inn_isRe == 'Y'}">
	            <div class="table-responsive">
	                <table class="table table-bordered">
	                    <thead>
	                    <tr>
	                        <th>숙박번호</th>
	                        <th>체크인</th>
	                        <th>체크아웃</th>
	                        <th>숙박일수</th>
	                        <th>부가서비스</th>
	                        <th>예약자이름</th>
	                        <th>휴대전화</th>
	                        <th>결제유무</th>
	                    </tr>
	                    </thead>
	                    <tbody>
	                    <tr>
	                        <td>${myInn.inn_num }</td>
	                        <td>${myInn.inn_st_date }</td>
	                        <td></td>
	                        <td>${myInn.inn_time }</td>
	                        <td>${myInn.inn_service }</td>
	                        <td>${myInn.inn_add_name }</td>
	                        <td>${user.pnum }</td>
	                        <td>${myInn.inn_pay }</td>
	                    </tr>
	                    </tbody>
	                </table>
	            </div>
	
	            <div class="table-responsive">
	                <table class="table table-bordered">
	                <thead>
	                    <tr>
	                    <th>반려견번호</th>
	                    <th>반려견이름</th>
	                    <th>부탁드려요!</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                    <td>${myPet.petnum }</td>
	                    <td>${myPet.pname }</td>
	                    <td>${myPet.pcau }</td>
	                    </tr>
	                </tbody>
	                </table>
	                
	                <div class="price-box">
	                	${myInn.inn_total_price }
	                </div>
	           
	            </div>
	
	            <div class="mypage-status-btn">
	                <button type="button">예약취소</button>
	            </div>
	            <div class="mypage-pay-btn">
	                <button type="button">결제하기</button>
	            </div>
            </c:if>
        </div>

    </div>

    
    <script>
    // 회원정보 수정 
    $('.info-btn-modi').click(function(e){
		e.preventDefault();
		var input = confirm('회원정보를 수정하시겠습니까 ?');
		var data = {"nickname": $('.nickname').val(), "pnum": $('.phone').val(), "pw": $('.pw').val(), "pw2":$('.pw2').val()}

		if($('.pw').val().length == 0){
			alert(" 비밀번호를 입력하세요 !")
		}
		else if ($('.pw').val() != $('.pw2').val()){
			alert("* 비밀번호가 일치하지 않습니다 ! *")
		}else{
			
			if (input == true){
				
				$.ajax({
			        async:true,
			        type:'POST',
			        data: JSON.stringify(data),
			        url:"<%=request.getContextPath()%>/mypageModi",
			        dataType:"json",
			        contentType:"application/json; charset=UTF-8",
			        success : function(){
			        	alert('수정이 완료되었습니다 :)');
			        	location.reload();
			        }
		        	
			    });
			}
			
		}
		
		
		
		

		
	})
    </script>