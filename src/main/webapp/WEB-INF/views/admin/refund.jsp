<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    .refund{
    	width: 800px;
    	height: 600px;
    	border: 1px solid black;
    	margin: 0 auto;
    }
    .refund-box-img{
    	margin:0 auto;
    	width:700px;
    }
    </style>
    
  	<div class="refund">
  		<div class="refund-box-img">
  			<img src="<%=request.getContextPath()%>/resources/css/image/환불요청페이지.jpg">
  			<img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg">
  		</div>
  		여기서 보여질 항목은 숙박번호, 예약한 사람, 결제한 금액 ( 환불받을 금액 ), 결제수단 (innVo)
  		
  	</div>
  	
  	<div class="page-box">
		<ul class="pagination justify-content-center">
		    <li class="page-item <c:if test="${!pm.prev }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/admin/refund?page=${pm.startPage-1}&type=${pm.cri.type}&search=${pm.cri.search}">Previous</a></li>
		    <c:forEach var= "index" begin="${pm.startPage}" end="${pm.endPage}">
		    	<li class="page-item <c:if test="${pm.cri.page == index}">active</c:if> "><a class="page-link" href="<%=request.getContextPath()%>/admin/refund?page=${index}&type=${pm.cri.type}&search=${pm.cri.search}">${index}</a></li>
		    </c:forEach>
		    <li class="page-item <c:if test="${!pm.next }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/admin/refund?page=${pm.endPage+1}&type=${pm.cri.type}&search=${pm.cri.search}">Next</a></li>
	  	</ul>
	</div>
	
	${refund}