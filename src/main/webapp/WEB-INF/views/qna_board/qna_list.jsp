<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

    .qna{
        margin: 50px;
        border: solid 1px black;
        height: 800px;
    }
    .qna-box{
        width: 1000px;
        height: 600px;
        margin: 0 auto;
    }
    .qna-img{
        width: 700px;
        height: 60px;
        margin: 0 auto;

    }
    .qna-list{
        
        height: 400px;
        margin: 0 auto;
    }
    .qna-list>.table{
        text-align: center;
    }
    .btn-success {
	    color: darkgrey;
	    background-color: white;
	    width: 82px;
	    height:38px;
	    border: 2px solid #ddd;
	}
	.btn-success:hover{
	    color: black;
	    background-color:white;
	    border: 2px solid #ddd;
	}
	.input-group>select {
	    width: 200px;
	    height: 38px;
	    border-right: 1px solid #ddd;
	}
	.serplz{
		border: 2px solid #ddd;
		border-right: 1px;
		
	}
		.q-write{
		border: 2px solid #ddd;
		height: 38px;
		color: darkgrey;
		background-color: white;
		border-left: 1px;
		font-size: 1rem;
	}
	.q-write:hover{
		border: 2px solid #ddd;
		height: 38px;
		color: black;
		background-color: white;
		border-left: 1px;
		font-size: 1rem;
	}
	
	/* 모달창 관련 css */
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
    th{
    	color:rgb(131, 131, 131);
    }
	td>a{
		color: rgb(85, 85, 85);
	    font-size: 16;
	    line-height: 1.5;
	    font-weight: 700;
	}
	td>a:hover{
		color:black;
		text-decoration: none;
	}
	.td-num2{
		color:darkgrey;
		font-weight:bold;
	}
	.td-select{
		color: rgb(255, 189, 108);
		font-weight:bold;
	}
	
	span>i{
		color: coral;
		font-size: 13px;
	}
	.reply-cnt{
		color: darkgrey;
		font-size:13px;
		font-weight: bold;
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

</style>


    <div class="qna">
            <div class="qna-box">
                <div class="qna-img"><img src="<%=request.getContextPath()%>/resources/css/image/질문답변게시판.jpg" alt=""></div>

                <div class="qna-list">
                    <table class="table table-borderless">
                        <thead>
                          <tr>
                            <th>글번호</th>
                            <th>말머리</th>
                            <th>제목</th>
                            <!-- <th>댓글<i class="fas fa-pencil-alt"></i></th> -->
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>조회수</th>
                          </tr>
                        </thead>

                        <tbody>
                        	
                            <c:if test="${list.size() != 0}">
                                  <!--  var의 역할은 list에서 꺼내왔을때 뭐라고 부를 지 붙여 줄 이름  -->
                                <c:forEach var="qna_board" items="${list}">
                                    <tr>
                                        <td class="td-num2">${qna_board.qna_num}</td>
                                        <td class="td-select">${qna_board.qna_select}</td>
                          
                                        <td <c:if test="${user.mail != qna_board.qna_u_mail && user.auth != 'ADMIN'}">class="qna-title-modal"</c:if>>
                                        	<!-- td안에 들어가있는 c:if가 안에서 제어를 해준다.  -->
                                        	
                                            <a href="<%=request.getContextPath()%>/qna_board/qna_detail?num=${qna_board.qna_num}">
                                                ${qna_board.qna_title} 
                                            </a>
                                            <span class="reply-cnt"><i class="fas fa-pencil-alt"></i>__${qna_board.qna_recnt }</span>
                                        </td>
                                        <%-- <td>${qna_board.qna_recnt }</td>  --%>
                                        <td>${qna_board.qna_u_mail}</td>                                
                                        <td>${qna_board.qna_regi}</td>
                                        <td>${qna_board.qna_view}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${list.size() == 0}">
                                <tr>
                                    <td colspan="5"> 등록된 게시글이 없습니다. </td>
                                </tr>
                            </c:if>
                         
                        </tbody>
                    </table>
                    
                    <!-- 페이지네이션 start -->
                    <ul class="pagination justify-content-center">
					    <li class="page-item <c:if test="${!pm.prev }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/qna_board/qna_list?page=${pm.startPage-1}&type=${pm.cri.type}&search=${pm.cri.search}">Previous</a></li>
					    <c:forEach var= "index" begin="${pm.startPage}" end="${pm.endPage}">
					    	<li class="page-item <c:if test="${pm.cri.page == index}">active</c:if> "><a class="page-link" href="<%=request.getContextPath()%>/qna_board/qna_list?page=${index}&type=${pm.cri.type}&search=${pm.cri.search}">${index}</a></li>
					    </c:forEach>
					    <li class="page-item <c:if test="${!pm.next }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/qna_board/qna_list?page=${pm.endPage+1}&type=${pm.cri.type}&search=${pm.cri.search}">Next</a></li>
				  	</ul>
				  	<!-- 페이지네이션  end -->
				  	
				  	<!-- 검색 박스 start -->
                    <form action="<%=request.getContextPath()%>/qna_board/qna_list">
					  	<div class="input-group mb-3">
					  		<select class="from-control selplz" name="type">
					  			<option value="0" <c:if test="${pm.cri.type == 0 }">selected</c:if>>전체</option>
					  			<option value="1" <c:if test="${pm.cri.type == 1 }">selected</c:if>>작성자</option>
					  			<option value="2" <c:if test="${pm.cri.type == 2 }">selected</c:if>>제목</option>
					  			<option value="3" <c:if test="${pm.cri.type == 3 }">selected</c:if>>내용</option>
					  		</select>
					    	<input type="text" class="form-control serplz" placeholder="검색어를 입력해주세요 :)" name="search" value="${pm.cri.search}">
					    	<div class="input-group-append">
					   			<button class="btn btn-success" type="submit">SERACH</button>
					   			
					   			<a href="<%=request.getContextPath()%>/qna_board/qna_register" ><button class="q-write" type="button" >WRITE <i class="fas fa-pencil-alt"></i></button></a>
					   			
					    	</div>
					  	</div>
				  	</form>
				  	<!-- 검색 박스 end -->
				  	
                </div>
            </div>
        </div>
        
           
        
	        <script>
	        // a태그로 동작을 안하게 
				$('.qna-title-modal>a').click(function(){
					alert("* 본인이 작성한 게시글만 열람 가능합니다 ! *")
	               return false;
	           })
	        </script>

        
        
        
        
        