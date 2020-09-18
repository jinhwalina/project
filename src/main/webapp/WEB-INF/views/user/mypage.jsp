<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <style>
        .mypage{
            width: 900px;
            margin: 0 auto;
            height: 450px;
            margin-top:30px;
        }
        .mypage-img{
            margin: 0 auto;
            width: 700px;
            height: 80px;
        }
        .mypage-info-img{
            margin: 0 auto;
            width: 700px;
            height: 25px;
            margin-top: 10px;
        }
        .mypage-info-img2{
            width: 70px;
            height: 25px;
        }
        .mypage-info{
            border: 2px solid #ddd;
            width: 700px;
            height: 280px;
            margin: 0 auto;
            margin-top: 10px;
            padding: 15px;
        }
        .mypage-status{
            padding: 15px;
            width: 1100px;
            height: 400px;
            margin: 0 auto;
        }
        .price-box{
            border: 1px solid black;
            width:100px;
            height:20px;
        }
        .info-id-box,.info-nickname-box,.info-phone-box{
            float: left;
            width: 205px;
            height: 90px;
            margin-top:10px
        }

        .info-id,.nickname,.phone{
            width: 214px;
            height: 40px;
            border: 2px solid #ddd;
            line-height: 35px;
            text-align: center;
            font-weight:500;
            font-size:15px;
        }
        .info-pw-box{
            float: left;
            width: 330px;
            height: 70px;
        }
        .pw,.pw2{
            width: 320px;
            height: 40px;
            border: 2px solid #ddd;
            line-height: 35px;
            text-align: center;
        }
        .pw2{
            margin-left: 14px;
        }
        .info-nickname-box,.info-phone-box{
            margin-left: 20px;
        }
        .info-btn-modi{
            line-height: 30px;
			height: 39px;
			width: 88px;
			border: none;
			font-size: 15px;
			background-color: rgb(255, 228, 196);
    		color: rgb(170, 170, 170);
			float: right;
			margin-top:10px;
            margin-right: 3px;
        }
        .info-btn-modi:hover{
            color: rgb(109, 109, 109);
        }

        .section{
            width: 700px;
            height: 20px;
            margin: 0 auto;
        }

        /* 예약 목록 쪽 css */
        .mypage-status-img{
            width: 150px;
            height: 30spx;
            margin: 0 auto;
        }
        .mypage-status-no-img{
            width: 350px;
            height: 25px;
            margin: 0 auto;
            margin-top: 10px;
        }
        .table-bordered{
            text-align: center;
            margin-top: 10px ;
        }
        .status-pet-name-box{
            width: 200px;
            height: 70px;
            float: left;
        }
        .status-pet-pcau-box{
            height: 70px;
            float: left;
            width: 767px;
        }
        .status-pet-num-box{
            width: 100px;
            height: 70px;
            float: left;
        }
        .status-pet-num{
            width: 70px;
            height: 40px;
            border: 2px solid #ddd;
            line-height: 35px;
            text-align: center;
            font-size:15px;
            font-weight:500;
        }
        .status-pet-name{
            width: 170px;
            height: 40px;
            border: 2px solid #ddd;
            line-height: 35px;
            text-align: center;
            font-size:15px;
            font-weight:700;
        }
        .status-pet-pcau{
            width: 767px;
            height: 40px;
            border: 2px solid #ddd;
            line-height: 35px;
            padding-left: 10px ;
            font-size:15px;
            font-weight:500;
        }
        .status-pet-price-box{
            width: 550px;
            height: 80px;
            border: 3px solid rgb(255, 165, 165);
            float: left;
            margin-top: 20px;
        }
        .status-pet-price{
            border-bottom: 3px solid #ddd;
            width: 150px;
            text-align: center;
            font-size: 25px;
            font-weight: bold;
            color: rgb(114, 114, 114);
            float: left;
        }
        .status-pet-price-img,.status-pet-price-img2{
            float: left;
            margin-top:8px;
        }
        .status-pet-price-img{
            margin-left: 22px;
        }
        .status-pet-price-img3{
            margin-left: 93px;
        }
        .fa-won-sign{
            color:  #ddd;
            font-size: 25px;
            line-height: 30px;
        }

        /* 버튼 */
        .mypage-status-btn,.mypage-pay-btn{
            line-height: 30px;
			height: 39px;
			width: 88px;
			border: none;
			font-size: 15px;
			background-color: rgb(255, 228, 196);
    		color: rgb(170, 170, 170);
			float: right;
			margin-top:20px;
            margin-right: 3px;
        }
        .mypage-status-btn:hover,.mypage-pay-btn:hover{
            color: rgb(109, 109, 109);
        }
        
    </style>
    <div class="mypage">
        <div class="mypage-img">
            <img src="<%=request.getContextPath()%>/resources/css/image/마이페이지입니다.jpg" alt="">
            <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
        </div>

        <div class="mypage-info-img">
            <img class="info-img1" src="<%=request.getContextPath()%>/resources/css/image/회원정보변경.jpg" alt="">  
        </div>

        <div class="mypage-info">
            <div class="mypage-info-img2">
                <img src="<%=request.getContextPath()%>/resources/css/image/회원정보.jpg" alt="">
            </div>

            <div class="info-box">
                
                <div class="info-id-box">
                    <label>아이디</label>
                    <div class="info-id">
                        ${myInn.inn_user_mail}
                    </div>	
                </div>

                <div class="info-nickname-box">
                    <label>별명</label>
                    <div class="info-nickname">
                        <input type="text" name="nickname" class="nickname" value="${user.nickname }">
                    </div>
                </div>

                <div class="info-phone-box">
                    <label>연락처</label>
                    <div class="info-phone">
                        <input type="text" name="pnum" class="phone" placeholder=" '-'없이 숫자만 입력해주세요 :)" value="${user.pnum }">
                    </div>
                </div>

                <div class="info-pw-box">
                    <label>비밀번호</label>
                    <div class="info-pw">
                        <input type="password" name="pw" class="pw" id="pw"><br>
                    </div> 
                </div>

                <div class="info-pw2-box"></div>
                    <label>비밀번호 확인</label>
                    <div class="info-pw2">
                        <input type="password" name="pw2" class="pw2"><br>
                    </div>
                </div> 

                <div class="info-btn">
                    <button class="info-btn-modi" type="button">수정하기</button>
                </div>
            </div>
        </div>

        <div class="section">
            <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
        </div>

        <div class="mypage-status">
            <div class="mypage-status-img">
                <img src="<%=request.getContextPath()%>/resources/css/image/예약현황.jpg" alt="">
            </div>
            <c:if test="${myInn.inn_isRe == 'N'}">
            	<div class="mypage-status-no-img">
                    <img src="<%=request.getContextPath()%>/resources/css/image/예약내역노.jpg" alt="">
                </div>
            </c:if>
			<c:if test="${myInn.inn_isRe == 'Y'}">
			<c:forEach items="${myInn}" >
	            <div class="table-responsive">
	                <table class="table table-bordered">
	                    <thead>
	                    <tr>
	                        <th>숙박번호</th>
	                        <th>반려견정보</th>
	                        <th>체크인</th>   
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
	                        <td><button type="button" class="pet-btn">${myPet.petnum }</button></td>
	                        <td>${myInn.inn_st_date }</td>
	                        <td>${myInn.inn_time }</td>
	                        <td>${myInn.inn_service }</td>
	                        <td>${myInn.inn_add_name }</td>
	                        <td>${user.pnum }</td>
	                        <td>${myInn.inn_pay }</td>
	                    </tr>
	                    </tbody>
	                </table>
	            </div>
                
                <div class="mypage-status-pet">
                    <div class="status-pet-num-box">
                        <label>반려견번호</label>
                        <div class="status-pet-num">
                            ${myPet.petnum }
                        </div>
                    </div>
                    <div class="status-pet-name-box"> 
                        <label>반려견이름</label>
                        <div class="status-pet-name">
                            ${myPet.pname }
                        </div>
                    </div>
                    <div class="status-pet-pcau-box">
                        <label>* 주의사항 *</label>
                        <div class="status-pet-pcau">
                            ${myPet.pcau }
                        </div>
                    </div>
                </div>
            </c:forEach>
                
                <div class="status-pet-price-box">
                    <div class="status-pet-price-img">
                        <img src="<%=request.getContextPath()%>/resources/css/image/결제금액1.jpg" alt="">
                    </div>
                    <div class="status-pet-price">
                        ${myInn.inn_total_price }
                    </div>
                    <div class="status-pet-price-img2">
                        <img src="<%=request.getContextPath()%>/resources/css/image/결제금액2.jpg" alt="">
                    </div>

                    <div class="status-pet-price-img3">
                        <img src="<%=request.getContextPath()%>/resources/css/image/결제금액안내.jpg" alt="">
                    </div>    
                </div>
                

	            <div class="mypage-status-btn-box">
	                <button class="mypage-status-btn" type="button">예약취소</button>
	            </div>
	            <div class="mypage-pay-btn-box">
	                <button class="mypage-pay-btn" type="button">결제하기</button>
	            </div>
            </c:if>
        </div>
${myInn }
${myPet }
    
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
	 					
	                        
	
	// 예약 취소 
	$('.mypage-status-btn').click(function(e){
		e.preventDefault();
		var input = confirm('예약을 취소하시겠습니까?');
		var data = {}

		if (input == true){

			console.log(data);
			$.ajax({
		        async:true,
		        type:'POST',
		        data: JSON.stringify(data),
		        url:"<%=request.getContextPath()%>/deleteInn",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
		        	alert('예약이 취소되었습니다!');
		        	location.reload();
		        }
	        	
		    });
		}
	})
	
	$('.pet-btn,.btn-close').click(function(){
		var target = $(this).attr('data-target');
		$(target).toggleClass('display-none')
	})
    </script>
    
    