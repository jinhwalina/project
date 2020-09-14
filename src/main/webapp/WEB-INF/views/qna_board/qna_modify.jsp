<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <style>
		.qna-regi{
            width: 700px;
            margin: 0 auto;

            height: 500px;
	    }
        .q-group1{
            height: 40px;
            float: left;
            width: 610px;
            margin-bottom: 10px;
            margin-top:10px;
        }
		
		/* 게시판쪽 css*/
		.q-detail-box{
			margin-top:15px;
			width: 100%;
			height: 80px;
		}
		
		.q-mail-img,.q-title-img,.q-regi-img,.q-view-img,.q-num-img{
			width: 100px;
			height: 40px;
			margin: 0;
			float: left;
		}
		.q-num,.q-view,.q-mail{
			width: 100px;
			border: 2px solid #ddd;
			height: 40px;
			float: left;
			text-align:center;
			font-size:15px;
			font-weight:600;
        }
        .q-view-img{
			margin-left: 11px;
		}
		.q-select-img{
            float: left;
		}
		.q-title{
			width: 308px;
			border: 2px solid #ddd;
			height: 40px;
			float: left;
			text-align:center;
			font-size:15px;
			font-weight:600;
		}
		
		.q-regi{
			width: 200px;
			border: 2px solid #ddd;
			height: 40px;
			float: left;
			text-align:center;
			font-size:15px;
			font-weight:600;
		}
		.q-select{
			width: 190px;
			border: 2px solid #ddd;
			height: 40px;
			float: left;
			text-align:center;
			font-size:15px;
			font-weight:600;
		}
		.q-mail{
			width: 190px;
			border: 2px solid #ddd;
			height: 40px;
		}
		.q-content{
			width: 100%;
			border: 2px solid #ddd;
			padding: 10px;
		}

		/* 버튼 쪽 css*/
		.fa-pencil-alt{
			color: rgb(255, 255, 255);
			font-size: 20px;
		}
		.fa-stream{
			color: rgb(255, 255, 255);
			font-size: 20px;
        }

		.q-list,.q-write,.q-modi,.q-del{
			line-height: 30px;
			height: 39px;
			width: 100px;
			border: none;
			font-size: 15px;
			background-color: rgb(255, 228, 196);
    		color: rgb(170, 170, 170);
			float: right;
			margin-top:10px;
		}
        .q-modi,.q-del{
			line-height: 30px;
			height: 39px;
			border: none;
			font-size: 15px;
			background-color: rgb(255, 228, 196);
    		color: rgb(170, 170, 170);
			float: right;
			margin-top:10px;
		}

		.q-list,.-modi,.q-write{
			margin-left: 1px;
		}
		.q-del{
			margin-right:1px;
		}
		.q-list:hover,.q-write:hover,.q-modi:hover,.q-del:hover{
			color: rgb(109, 109, 109);
		}
			
		}
</style>


<c:if test="${qna_board ne null }">

	<c:if test="${qna_board.qna_isDel == 'Y'.charAt(0)}">
		<h1>해당 게시물은 삭제 되었습니다.</h1>
	</c:if>
		<c:if test="${qna_board.qna_isDel == 'N'.charAt(0)}">
			<form action="<%=request.getContextPath() %>/qna_board/qna_register" method="post">
					
			  <div class="qna-regi">
			  
			      <div class="q-detail-box">
			          <img src="<%=request.getContextPath()%>/resources/css/image/질문글상세보기.jpg" alt="">
			          <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
			      </div>
				
				  
			      <!-- 그룹 박스 0 ( 박스는 없지만 구분하기 위해) -->
			      
			      <div class="q-group">
			     	<div class="q-num-box">
						<div class="q-num-img">
							<img src="<%=request.getContextPath()%>/resources/css/image/글번호.jpg" alt="">
						</div>	
						<input type="text" class="q-num" name="qna_num" value= "${qna_board.qna_num }" readonly id="num">
					</div>
					
					<div class="q-view-box">
						<div class="q-view-img">
							<img src="<%=request.getContextPath()%>/resources/css/image/조회수.jpg" alt="">
						</div>
						<input type="text" class="q-view" name="qna_view" value= "${qna_board.qna_view }"  readonly>
					</div>
		      
			      </div>
			      
			       <!-- 그룹 박스 1 -->
			      <div class="q-group1">
			          <div class="q-mail-box">
			              <div class="q-mail-img">
			                  <img src="<%=request.getContextPath()%>/resources/css/image/작성자2.jpg" alt="">
			              </div>
			              <input type="text" class="q-mail" name="qna_u_mail" value= "${qna_board.nickname }" readonly>
			          </div>
			          
			          <div class="q-regi-box">
							<div class="q-regi-img">
								<img src="<%=request.getContextPath()%>/resources/css/image/등록일.jpg" alt="">
							</div>
							<input type="text" class="q-regi" name="qna_regi" value= "${qna_board.qna_regi }" readonly>
						</div>
			      </div>
			      
			      <!-- 그룹박스 2 -->
			      <div class="q-group2">
			          <div class="q-select-box">
			              <div class="q-select-img">
			                  <img src="<%=request.getContextPath()%>/resources/css/image/말머리.jpg" alt=""> <!--말머리 이미지 만들어서 추가하기-->
			              </div>
			              <select class="q-select" name="qna_select" > 
			                  <option value="" selected>질문글과 예약변경</option>
			                  <option value="질문있어요!">질문있어요!</option>
			                  <option value="예약변경할래요!">예약변경요청</option>
			                </select>
			          </div>
			
			          <div class="q-title-box">
			              <div class="q-title-img">
			                  <img src="<%=request.getContextPath()%>/resources/css/image/제목2.jpg" alt="">
			              </div>
			              <input type="text" class="q-title" name="qna_title" value= "${qna_board.qna_title }" >
			          </div>
			      </div>
			
			      <div class="q-content-box">
			          <div class="q-content-img"> 
			              <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
			          </div>
			          <textarea name="qna_content" class="q-content" rows="4" id="comment" >${qna_board.qna_content }</textarea>
			      </div>
			      
			      <a href="<%=request.getContextPath()%>/qna_board/qna_list?page=${cri.page}&search=${cri.search}&type=${cri.type}"><button type="button" class="q-list">LIST <i class="fas fa-stream"></i></button></a>
			      <c:if test="${user != null }">
				  	<c:if test="${user != null }">
						<a href="<%=request.getContextPath()%>/review_board/review_register"><button type="button" class="q-write">WRITE <i class="fas fa-pencil-alt"></i></button></a>
						<button type="submit" class="q-modi">수정</button>
					</c:if>
				  </c:if>
			  </div>
			            
			</form>
		</c:if>
</c:if>
