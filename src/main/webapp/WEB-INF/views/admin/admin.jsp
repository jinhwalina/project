<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.admin{
		margin:0 auto;
		margin-top:20px;
		width:900px;
	}
	.admin-img{
		margin:0 auto;
		width:700px;
	}
	
	 .admin-status-img{
            width: 150px;
            height: 30spx;
            margin: 0 auto;
        }
        .admin-status-img2{
        	width: 350px;
            height: 30spx;
            margin: 0 auto;
        }
        
        /* 예약 목록 쪽 css */
        .admin-status-img{
            width: 150px;
            height: 30spx;
            margin: 0 auto;
        }
        .admin-status-pet{
        	height:77px;
        }
        .admin-status-no-img{
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
            width: 500px;
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
            width: 600px;
            height: 40px;
            border: 2px solid #ddd;
            line-height: 35px;
            padding-left: 10px ;
            font-size:15px;
            font-weight:500;
        }
        
        /* 페이지 네이션 */
       	.page-link{
       		color:darkgrey;
       		font-size:13px;
       		
       	}
       	.justify-content-center{
       		margin-top: 50px;
       	}
       	.page-link:hover{
       		background-color:white;
       		color:black;
       	}
       	.page-item.active .page-link{
       	    background-color: silver;
    		border-color: silver;
       	}
       	/* 버튼 */
       	.admin-status-btn{
       		line-height: 30px;
			height: 39px;
			width: 88px;
			border: none;
			font-size: 15px;
			background-color: rgb(255, 228, 196);
    		color: rgb(170, 170, 170);
			float: right;
       	}
       	.inn_service,.inn_time,.inn_st_date,.pcau{
       		border:none;
       		text-align:center;
       		color:fe6061;
       		font-weight:bold;
       	}
    	.inn_service{
    		width:85px;
    	}
    	.inn_st_date{
    		width:95px;
    	}
    	.inn_time{
    		width:50px;
    	}
    	.pcau{
    		height: 35px;
    		width: 580px;
    	}
</style>
<div class="admin">
	<div class="admin-img">
	    <img src="<%=request.getContextPath()%>/resources/css/image/관리자페이지입니다.jpg" alt="">
	    <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
	</div>
	

	 <div class="admin-status-img">
         <img src="<%=request.getContextPath()%>/resources/css/image/예약현황.jpg" alt="">
     </div>
     <div class="admin-status-img2">
      	<img src="<%=request.getContextPath()%>/resources/css/image/예약현황안내.jpg" alt="">
     </div>
     
     
     <c:forEach items="${adminInn}" var= "adminInn" varStatus="status">
	            <div class="table-responsive">
	            
	                <table class="table table-bordered">
	                    <thead>
	                    <tr>
	                        <th>숙박번호</th>
	                        <th>체크인</th>   
	                        <th>숙박일수</th>
	                        <th>부가서비스</th>
	                        <th>예약자이름</th>
	                        <th>휴대전화</th>
	                        <th>결제유무</th>
	                        <th>환불유무</th>
	                    </tr>
	                    </thead>
	                    <tbody>
	                    <tr>
	                        <td><%-- ${status.count} --%>${adminInn.inn_num }</td>
	                        <td><input type="text" name="inn_st_date" class="inn_st_date" value="${adminInn.inn_st_date }"></td>
	                        <td><input type="text" name="inn_time" class="inn_time" value="${adminInn.inn_time }"></td>
	                        <td><input type="text" name="inn_service" class="inn_service" value="${adminInn.inn_service }"></td>
	                        <td>${adminInn.inn_add_name }</td>
	                        <td>${adminInn.inn_add_num }</td>
	                        <td>${adminInn.inn_pay }</td>
	                        <td>${adminInn.inn_reIsRe }</td>
	                    </tr>
	                    </tbody>
	                </table>
	               	
	            </div>
                
                <div class="admin-status-pet" >
                    <div class="status-pet-num-box">
                        <label>반려견번호</label>
                        <div class="status-pet-num">
                            ${adminInn.petnum }
                        </div>
                    </div>
                    <div class="status-pet-name-box"> 
                        <label>반려견이름</label>
                        <div class="status-pet-name">
                            ${adminInn.pname }
                        </div>
                    </div>
                    <div class="status-pet-pcau-box">
                        <label>* 주의사항 *</label>
                        <div class="status-pet-pcau">
                        	<input type="text" name="pcau" class="pcau" value="${adminInn.pcau }">
                        </div>
                    </div>
                </div>
                
	            
                <div class="admin-status-btn-box">
	                <input class="adminPet_num" type="hidden" value="${adminInn.petnum }"><button class="admin-status-btn" type="button">예약변경</button>
	            </div>

            </c:forEach>
        </div>
     



<ul class="pagination justify-content-center">
	<li class="page-item <c:if test="${!pm.prev }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/admin/admin?page=${pm.startPage-1}&type=${pm.cri.type}&search=${pm.cri.search}">Previous</a></li>
	<c:forEach var= "index" begin="${pm.startPage}" end="${pm.endPage}">
		<li class="page-item <c:if test="${pm.cri.page == index}">active</c:if> "><a class="page-link" href="<%=request.getContextPath()%>/admin/admin?page=${index}&type=${pm.cri.type}&search=${pm.cri.search}">${index}</a></li>
	</c:forEach>
	<li class="page-item <c:if test="${!pm.next }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/admin/admin?page=${pm.endPage+1}&type=${pm.cri.type}&search=${pm.cri.search}">Next</a></li>
</ul>

<script>


// 숙박정보 수정 
$('.admin-status-btn').click(function(e){
	e.preventDefault();
	var input = confirm('숙박정보를 수정하시겠습니까 ?');
	var petnum = $(this).prev().val();
	var inn_st_date = $(this).parent('.admin-status-btn-box').prev().prev().find('.inn_st_date').val();
	var inn_time = $(this).parent('.admin-status-btn-box').prev().prev().find('.inn_time').val();
	var inn_service = $(this).parent('.admin-status-btn-box').prev().prev().find('.inn_service').val();
	var pcau = $(this).parent('.admin-status-btn-box').prev().find('.pcau').val();
	var data = {"petnum":petnum, "inn_st_date":inn_st_date, "inn_time":inn_time, "inn_service":inn_service,"pcau":pcau}
	
		console.log(data);
	
		if (input == true){
			
			$.ajax({
		        async:true,
		        type:'POST',
		        data: JSON.stringify(data),
		        url:"<%=request.getContextPath()%>/adminInnUpdate",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(){
		        	alert('수정이 완료되었습니다 :)');
		        	location.reload();
		        }
	        	
		    });
		}
		
})

</script>
