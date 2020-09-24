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
            height: 710px;
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
        .mypage-status-pet{
        	height:90px;
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
            margin-bottom:25px;
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
        .mypage-status-btn,.mypage-pay-btn,.mypage-re-btn{
            line-height: 30px;
			height: 39px;
			width: 88px;
			border: none;
			font-size: 15px;
			background-color: rgb(255, 228, 196);
    		color: rgb(170, 170, 170);
			float: right;
            margin-right: 3px;
        }
        .mypage-status-btn:hover,.mypage-pay-btn:hover,.mypage-re-btn:hover{
            color: rgb(109, 109, 109);
        }
        .pet-info{
        	color: ff5f64;
        }
        .pet-info:hover{
        	cursor:pointer;
        	color:red;
        }
        .mypage-status-pet{
       		display:none;
       	}
       	.page-box{
       	margin-top:15px;
       	}
       	
       	.pay-type-img{
       		margin-left:20px;
       		margin-top: -4px;
       	}
       .pay-type-img2{
       		margin-left:-48px;
       		margin-top: -5px;
       	}
       	.pay-type-img3{
       		margin-left: 220px;
       		margin-top: -13px;
       	}
       	.pay-type-img4{
       		margin-left: 500px;
       		margin-top: -8px;
       	}
       	
       	/* 페이지 네이션 */
       	.page-link{
       		color:darkgrey;
       		font-size:13px;
       	}
       	.page-link:hover{
       		background-color:white;
       		color:black;
       	}
       	.page-item.active .page-link{
       	    background-color: silver;
    		border-color: silver;
       	}
       	
       	.refund-info-img{
       		margin-left: 710px;
       		width:350px;
       	}
       	
       	/* 체크박스 */
       	.custom-checkbox{
     		    float: left;
			    width: 300;
			    font-size: 15px;
			    margin-left: 25px;
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
                        ${user.mail}
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
                    <button class="info-btn-modi" type="button">변경하기</button>
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
            <c:if test="${myInn.size() == 0}">
            	<div class="mypage-status-no-img">
                    <img src="<%=request.getContextPath()%>/resources/css/image/예약내역노.jpg" alt="">
                </div>
            </c:if>
			<c:if test="${myInn.size() != 0}">
			
			
				<div class="page-box">
				<ul class="pagination justify-content-center">
				    <li class="page-item <c:if test="${!pm.prev }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/user/mypage?page=${pm.startPage-1}&type=${pm.cri.type}&search=${pm.cri.search}">Previous</a></li>
				    <c:forEach var= "index" begin="${pm.startPage}" end="${pm.endPage}">
				    	<li class="page-item <c:if test="${pm.cri.page == index}">active</c:if> "><a class="page-link" href="<%=request.getContextPath()%>/user/mypage?page=${index}&type=${pm.cri.type}&search=${pm.cri.search}">${index}</a></li>
				    </c:forEach>
				    <li class="page-item <c:if test="${!pm.next }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/user/mypage?page=${pm.endPage+1}&type=${pm.cri.type}&search=${pm.cri.search}">Next</a></li>
			  	</ul>
			  	</div>

			
			<c:forEach items="${myInn}" var= "myInn" varStatus="status">
				<div class="div-box">
		            <div class="table-responsive">
		            <img src="<%=request.getContextPath()%>/resources/css/image/반려견정보호버.jpg">
		                <table class="table table-bordered">
		                    <thead>
		                    <tr>
		                        <th><input class="inn_num" name="inn_num" type="hidden" value="${myInn.inn_num }">숙박번호</th>
		                        <th class="pet-info"><input class="pet-info-input" type="hidden" value="${myInn.inn_num }" >반려견정보</th>
		                        <th>체크인</th>   
		                        <th>숙박일수</th>
		                        <th>부가서비스</th>
		                        <th>예약자이름</th>
		                        <th>휴대전화</th>
		                        <th>결제유무</th>
		                        <th>환불요청여부</th>
		                    </tr>
		                    </thead>
		                    <tbody>
		                    <tr>
		                        <td><%-- ${status.count} --%>${myInn.inn_num }</td>
		                        <td>${myInn.petnum }</td>
		                        <td>${myInn.inn_st_date }</td>
		                        <td>${myInn.inn_time }</td>
		                        <td>${myInn.inn_service }</td>
		                        <td>${myInn.inn_add_name }</td>
		                        <td>${user.pnum }</td>
		                        <td>${myInn.inn_pay }</td>
		                        <td>${myInn.inn_plz_reIsRe }</td>
		                    </tr>
		                    </tbody>
		                </table>
		               	
		            </div>
	                
	                <div class="mypage-status-pet display-none ${myInn.inn_num }" >
	                    <div class="status-pet-num-box">
	                        <label>반려견번호</label>
	                        <div class="status-pet-num">
	                            ${myInn.petnum }
	                        </div>
	                    </div>
	                    <div class="status-pet-name-box"> 
	                        <label>반려견이름</label>
	                        <div class="status-pet-name">
	                            ${myInn.pname }
	                        </div>
	                    </div>
	                    <div class="status-pet-pcau-box">
	                        <label>* 주의사항 *</label>
	                        <div class="status-pet-pcau">
	                            ${myInn.pcau }
	                        </div>
	                    </div>
	                </div>
	                
					<c:if test="${myInn.inn_plz_reIsRe == 'N'}">
	                 <div class="mypage-status-btn-box">
		                <input type="hidden" class="delete_inn_num" value="${myInn.inn_num }"><button class="mypage-status-btn" type="button">예약취소</button>
		            </div>
	                </c:if>
	                
	                
	  				<c:if test="${myInn.inn_pay == 'N'}">
		  				 <div class="mypage-pay-btn-box">
			                <button class="mypage-pay-btn" type="button">결제하기</button>
			            </div>
	  				</c:if>
	  				
	               	<c:if test="${myInn.inn_pay == 'Y' && myInn.inn_plz_reIsRe == 'N'}">
			            <div class="mypage-re-btn-box">
			            	<a href="<%=request.getContextPath()%>/admin/refund?inn_num=${myInn.inn_num }"><button class="mypage-re-btn" type="button">환불요청</button></a>
			            </div >
		            </c:if>
		            
	               <c:if test="${myInn.inn_plz_reIsRe == 'Y'}">
		               <div class="refund-info-img">
		               		<img src="<%=request.getContextPath()%>/resources/css/image/환불요청중안내.jpg" alt="">	
		               </div>
	               </c:if>
	               
					<c:if test="${myInn.inn_pay == 'N'}">
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
		                
		                
		                <img class="pay-type-img" alt="" src="<%=request.getContextPath()%>/resources/css/image/결제방식.jpg">
		                
		                
		                
						<div class="custom-control custom-checkbox mb-3">
					      <input name="method" type="checkbox" class="custom-control-input1 inn_pay_type" id="customCheck" value="카카오페이" >
					      <label class="custom-control-label1">카카오페이</label>
					      
					      <input name="method" type="checkbox" class="custom-control-input2 inn_pay_type" id="customCheck2" value="카드결제">
					      <label class="custom-control-label2">카드결제</label>
					      
					      <input name="method" type="checkbox" class="custom-control-input3 inn_pay_type" id="customCheck3" value="무통장입금">
					      <label class="custom-control-label3">무통장입금</label>
					    </div>
	                </c:if>
	                
	                <c:if test="${myInn.inn_pay == 'Y' && myInn.inn_plz_reIsRe == 'N'}">
	                	<img class="pay-type-img2" src="<%=request.getContextPath()%>/resources/css/image/결제완료.jpg">
	                </c:if>
				</div>
            </c:forEach>

            </c:if>
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
	
	// 결제완료로 바꿔주는 // parents > 조상 / parent > 부모 / find > 자손 / children > 자식 / prev,next > 형제 
	
	// 체크박스 설정 시 중복 체크를 막게해주는 코드 . 첫줄부터 쓰자면, 체크 박스를 선택할 때 전체 선택이 불가하게 해두고, 선택당한 this만 true값을 가지도록!
	$('.inn_pay_type').click(function(){
		$('.inn_pay_type').prop("checked",false);
		$(this).prop("checked",true);
	});

	
	$('.mypage-pay-btn').click(function(e){
		e.preventDefault();
		var method = $('input[name="method"]:checked').val();
		var input = confirm('* 선택한 결제방식으로 결제를 진행하시겠습니까? *');
		var data = {"inn_pay_type" : method, "inn_num" : $(this).parents('.div-box').find('.inn_num').val()}

		// foreach 안에서 구조적으로 파악하기 쉽게 생각하려면 (하나의 버튼만 생각할게 아니라 화면에서 보여지는 구조를 생각해야한다.)
		// 리스트로 불러오게되면 동일한 클래스가 여러개가 될 수 있기때문에 해당하는 클래스를 지정하기 위해서는 부모와 자식 관계를 잘 생각해야한다. 
		if(method == null) {
			alert(" * 결제방법을 선택하지 않으셨습니다! * ")
		}

			if (input == true){ // 선택 되는거 
	
				$.ajax({
			        async:true,
			        type:'POST',
			        data: JSON.stringify(data),
			        url:"<%=request.getContextPath()%>/updatePay",
			        dataType:"json",
			        contentType:"application/json; charset=UTF-8",
			        success : function(data){
			        	alert('결제가 완료되었습니다');
			        	location.reload();
			        }
		        	
			    }); 
			}
		
	})
	
	 					                     
	
	// 예약 취소 
	$('.mypage-status-btn').click(function(e){
		e.preventDefault();
		var input = confirm('* 예약을 정말 취소하시겠습니까? *');
		var inn_num = $(this).prev().val();

		if (input == true){

			console.log(inn_num);
			$.ajax({
		        async:true,
		        type:'POST',
		        data: JSON.stringify({'inn_num':inn_num}),
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
	
	// 호버 했을 때 반려견 정보 불러오는 토글 
	$('.pet-info').hover(function(){
		var target = '.' + $(this).children().val(); // div각각에 숙박번호에 관한 고유 번호에 대해 변수 설정을 위한 target!
		$(target).slideToggle(500);
		
	})
	
	
	
	
    </script>
    
    