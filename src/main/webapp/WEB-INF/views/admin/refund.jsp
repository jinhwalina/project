<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <style>
 	/* 페이지 네이션 */
 	.page-box{
 		margin-top:10px;
 	}
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
    .refund{
    	width: 1000px;
    	height:800px;
    	margin: 0 auto;
    }
    .refund-box-img{
    	margin:0 auto;
    	width:700px;
    	margin-top:30px;
    }
    .table-bordered{
        text-align: center;
        margin-top: 10px ;
    }
    .refund-box-img2{
        width: 350px;
        margin-left: 25px;
   		margin-top: -2px;   
    }
    
    .refund-box2-img{
        border: 1px solid black;
        width: 250px;
        height: 30px;
    }

    .refund-price-box{
        width: 515px;
        height: 55px;
        border: 3px solid rgb(255, 165, 165);
        float: left;
        margin-bottom:10px;
        margin-top: -7px;
    }
    .refund-price{
        border-bottom: 3px solid #ddd;
        width: 150px;
        text-align: center;
        font-size: 25px;
        font-weight: bold;
        color: rgb(114, 114, 114);
        float: left;
    }
    .refund-price-img,.refund-price-img2{
        float: left;
        margin-top:10px;
    }
    
    .refund-box-img3{
	    margin-top: -10px;
	    margin-left: 335px;
	    margin-bottom: 10px;
    }
    
    .refund-price-img{
        margin-left: 3px;
    }
    .refund-info-img{
        margin-top: -10px;
        margin-left: 70px;
    }
    .refund-infoBtn{
        line-height: 30px;
        height: 31px;
        width: 150px;
        border: none;
        font-size: 15px;
        background-color: rgb(255, 228, 196);
        color: rgb(170, 170, 170);
        margin-left: 170px;
    }
    .refund-infoBtn:hover{
        color: rgb(109, 109, 109);
    }
        .refund-user-infoBtn{
        line-height: 30px;
        height: 30px;
        width: 85px;
        border: none;
        font-size: 15px;
        background-color: rgb(255, 228, 196);
        color: rgb(170, 170, 170);
        float: right;
        margin-top: -20px;
        margin-right:19px;
    }
    .refund-user-infoBtn:hover{
        color: rgb(109, 109, 109);
        cursor:pointer;
    }
    
    .refund-plz-btn{
    	line-height: 30px;
        height: 30px;
        width: 85px;
        border: none;
        font-size: 15px;
        background-color: rgb(255, 228, 196);
        color: rgb(170, 170, 170);
        margin-top:5px;
        text-align: center;
    }
    .refund-plz-btn:hover{
    	color: rgb(109, 109, 109);
    }
    /* 환불 요청 칸*/
    .refund-user-info{
        width: 515px;
        height: 112px;
        float: left;
        border: 3px solid rgb(255, 165, 165);
        margin-bottom:15px;
    }
    .refund-user-info-text,.refund-user-info-text2,.refund-user-info-text3{
        border: 2px solid #ddd;
    }
    .refund-user-info-img{
    	margin-top: 6px;
    }
    .refund-user-info-box{
        float: left;
        width: 130px;
        margin-left: 20px;
    }
    .refund-user-info-box2{
        float: left;
        width: 130px;
    }
    .refund-user-info-box3{
        float: left;
        width: 210px;
    }
    .refund-user-info-text{
        width: 110px;
        text-align: center;
    }
    .refund-user-info-text2{
        width: 110px;
        text-align: center;
    }
    .refund-user-info-text3{
        width: 210px;
        text-align: center;
    }
    
    .refund-box-img-in{
    	width:350px;
    	margin-left:170px;
    	margin-top:20px;
    }
    </style>

  	<div class="refund">
  	
        <div class="refund-box-img">
            <img src="<%=request.getContextPath()%>/resources/css/image/환불요청페이지.jpg">
            <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg">
            <c:if test="${user.auth == 'ADMIN' && refund.size() == 0}">
            	<img class="refund-box-img-in" src="<%=request.getContextPath()%>/resources/css/image/환불요청존재노.jpg">
            </c:if>
        </div>
		
        <c:if test="${user.auth == 'ADMIN' && refund.size() != 0}"> 
	        <div class="page-box">
				<ul class="pagination justify-content-center">
				    <li class="page-item <c:if test="${!pm.prev }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/admin/refund?page=${pm.startPage-1}&type=${pm.cri.type}&search=${pm.cri.search}">Previous</a></li>
				    <c:forEach var= "index" begin="${pm.startPage}" end="${pm.endPage}">
				    	<li class="page-item <c:if test="${pm.cri.page == index}">active</c:if> "><a class="page-link" href="<%=request.getContextPath()%>/admin/refund?page=${index}&type=${pm.cri.type}&search=${pm.cri.search}">${index}</a></li>
				    </c:forEach>
				    <li class="page-item <c:if test="${!pm.next }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/admin/refund?page=${pm.endPage+1}&type=${pm.cri.type}&search=${pm.cri.search}">Next</a></li>
			  	</ul>
			</div>
		</c:if>
        <c:forEach items="${refund}" var= "refund" varStatus="status">
		
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th><input class="inn_num" name="inn_num" type="hidden" value="${refund.inn_num }">숙박번호</th>
                    <th>체크인날짜</th>
                    <th>예약자이름</th>
                    <th>휴대전화</th>
                    <th>결제유무</th>
                    <th>결제수단</th>
                    <th>환불여부</th>
                    <th>환불요청여부</th>
                    <th>예약여부</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${refund.inn_num }</td>
                    <td>${refund.inn_st_date }</td>
                    <td>${refund.inn_add_name }</td>
                    <td>${refund.inn_add_num }</td>
                    <td>${refund.inn_pay }</td>
                    <td>${refund.inn_pay_type }</td>
                    <td>${refund.inn_reIsRe }</td>
                    <td>${refund.inn_plz_reIsRe }</td>
                    <td>${refund.inn_isRe }</td>
                </tr>
                </tbody>
            </table>   
        </div>

        <div class="refund-box2">
            <c:if test="${ refund.inn_reIsRe == 'N'}">
	            <div class="refund-price-box">
	                <div class="refund-price-img">
	                	<c:if test="${user.auth == 'USER'}">
	                    	<img src="<%=request.getContextPath()%>/resources/css/image/환불금액.jpg" alt="">
	                    </c:if>
	                    <c:if test="${user.auth == 'ADMIN' && refund.inn_pay_type == '무통장입금'}">
	                    	<img src="<%=request.getContextPath()%>/resources/css/image/환불금액2.jpg" alt="">
	                    </c:if>
	                    <c:if test="${user.auth == 'ADMIN' && refund.inn_pay_type != '무통장입금'}">
	                    	<img src="<%=request.getContextPath()%>/resources/css/image/환불금액3.jpg" alt="">
	                    </c:if>
	                    
	                </div>
	                <div class="refund-price">
	                    ${refund.inn_total_price }
	                </div>
	                <div class="refund-price-img2">
	                    <img src="<%=request.getContextPath()%>/resources/css/image/결제금액2.jpg" alt="">
	                </div> 
	            </div>
            </c:if>
            
			<c:if test="${user.auth == 'ADMIN' && refund.inn_reIsRe == 'N' }">
	            <div class="refund-info-box">
	                <img class="refund-info-img" src="<%=request.getContextPath()%>/resources/css/image/환불요청건처리.jpg" alt="">
	                <input class="refund_inn_num" type="hidden" value="${refund.inn_num }"><button type="button" class="refund-infoBtn">네, 처리하겠습니다!</button>
	            </div>
            </c:if>
            
            <c:if test="${user.auth == 'USER' && refund.inn_reIsRe == 'N'}">
            	<img class="refund-box-img2" src="<%=request.getContextPath()%>/resources/css/image/환불요청건처리2.jpg" alt="">
            	<button type="button" class="refund-plz-btn">요청하기</button>
            </c:if>
            
            <c:if test="${refund.inn_reIsRe == 'Y'}">
             	<img class="refund-box-img3" src="<%=request.getContextPath()%>/resources/css/image/환불요청완료.jpg" alt="">
            </c:if>
            
            
            <c:if test="${refund.inn_pay_type == '무통장입금' && refund.inn_reIsRe == 'N' }">
	           <div class="refund-user-info">

	               <div class="refund-user-info-img">
	               		<c:if test="${user.auth == 'USER'}">
	                   		<img src="<%=request.getContextPath()%>/resources/css/image/무통장입금안내.jpg" alt="">
	                   </c:if>
	                   <c:if test="${user.auth == 'ADMIN'}">
	                   		<img class="" src="<%=request.getContextPath()%>/resources/css/image/환불처리할계좌.jpg" alt="">
	                   </c:if>
	               </div>


	               <div class="refund-user-info-box">
	                   <label>예금주</label>
	                   <div>
	                       <input class="refund-user-info-text" type="text" name="" class="" value="${refund.refund_name }" <c:if test="${user.auth == 'ADMIN'}">readonly</c:if> >
	                   </div>
	               </div>
	               
	               <div class="refund-user-info-box2">
	                   <label>은행명</label>
	                   <div>
	                       <input class="refund-user-info-text2" type="text" name="" class="" value="${refund.refund_acc }" <c:if test="${user.auth == 'ADMIN'}">readonly</c:if>>
	                   </div>
	               </div>
	              
	               <div class="refund-user-info-box3">
	                   <label>계좌번호</label>
	                   <div>
	                       <input class="refund-user-info-text3" type="text" name="" class="" value="${refund.refund_accNum }" placeholder="' - ' 없이 입력해주세요 :)" <c:if test="${user.auth == 'ADMIN'}">readonly</c:if>>
	                   </div>
	               </div>
	           </div>
            </c:if>

        </div>
		
        </c:forEach>
        
    </div>
    <script>

    // 무통장 입금 시 숙박번호로 연결된 환불계좌 내용이 등록된다.
    $('.refund-plz-btn').click(function(e){
		e.preventDefault();
		var reName = $(this).next().find('.refund-user-info-text').val();
		var reAcc = $(this).next().find('.refund-user-info-text2').val();
		var reAccNum = $(this).next().find('.refund-user-info-text3').val();
		var innNum = $(this).parents('.refund-box2').prev().find('.inn_num').val();
		var data = {"inn_num" : innNum, "refund_name": reName, "refund_acc" : reAcc, "refund_accNum": reAccNum}
		
			 $.ajax({
		        async:true,
		        type:'POST',
		        data: JSON.stringify(data),
		        url:"<%=request.getContextPath()%>/insertRefund",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
		        	alert('요청이 완료되었습니다!');
		        	window.location.href = "<%=request.getContextPath()%>/user/mypage";

		        },
		        error:function(request,status,error){
		            alert("환불요청 진행중입니다!");
	           }

	        
		    }); 
	    

	})
	
	// 관리자 입장에서 환불요청 처리 
	$('.refund-infoBtn').click(function(e){
		e.preventDefault();
		var data = $(this).prev().val();

			$.ajax({
		        async:true,
		        type:'POST',
		        data: data,
		        url:"<%=request.getContextPath()%>/updateRefund2",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
		        	alert('환불처리가 완료되었습니다!');
		        	location.reload();
		        }
	        	
		    });
		
	})


    </script>