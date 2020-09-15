<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <style>
		.qna-regi{
            width: 700px;
            margin: 0 auto;

            height: 700px;
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

<c:if test="${qna_board eq null }">
	<h1>해당 게시물은 없는 게시물입니다.</h1>
</c:if>   

<c:if test="${qna_board ne null }">
	<c:if test="${qna_board.qna_isDel == 'Y'.charAt(0)}">
		<h1>해당 게시물은 삭제 되었습니다.</h1>
	</c:if>
		<c:if test="${qna_board.qna_isDel == 'N'.charAt(0)}">

					
			  <div class="qna-regi">
			  
			      <div class="q-detail-box">
			          <img src="<%=request.getContextPath()%>/resources/css/image/질문글상세보기.jpg" alt="">
			          <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
			      </div>
				
				  <!--  글번호 조회수 말머리
						작성자 등록일
						제목-->
			      <!-- 그룹 박스 1 ( 박스는 없지만 구분하기 위해) -->
			      
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
			                  <option value="" selected>${qna_board.qna_select }</option>

			                </select>
			          </div>
			
			          <div class="q-title-box">
			              <div class="q-title-img">
			                  <img src="<%=request.getContextPath()%>/resources/css/image/제목2.jpg" alt="">
			              </div>
			              <input type="text" class="q-title" name="qna_title" value= "${qna_board.qna_title }" readonly>
			          </div>
			      </div>
			
			      <div class="q-content-box">
			          <div class="q-content-img"> 
			              <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
			          </div>
			          <textarea name="qna_content" class="q-content" rows="4" id="comment" readonly>${qna_board.qna_content }</textarea>
			      </div>
			      
			      <a href="<%=request.getContextPath()%>/qna_board/qna_list?page=${cri.page}&search=${cri.search}&type=${cri.type}"><button type="button" class="q-list">LIST <i class="fas fa-stream"></i></button></a>
			      <c:if test="${user != null }">
				  	<a href="<%=request.getContextPath()%>/qna_board/qna_register"><button type="button" class="q-write">WRITE <i class="fas fa-pencil-alt"></i></button></a>
					  <c:if test="${user.mail == qna_board.qna_u_mail}">
						  <a href="<%=request.getContextPath()%>/qna_board/qna_modify?num=${qna_board.qna_num}"><button type="button" class="q-modi">수정</button></a>
						  <a href="<%=request.getContextPath()%>/qna_board/qna_delete?num=${qna_board.qna_num}"><button type="button" class="q-del">삭제</button></a>
					  </c:if> 
				  </c:if>
				  
				   <!-- 댓글 관련 jsp -->
				    <c:if test="${replyList.size() == 0 }"> <!-- 조건 써줄 때 list 같은 경우는 그냥 속성 명으로 써주는게 아니라 size() 로 설정해줘야한다. -->
						<div>
							<img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg">
						</div>
					</c:if>
					
					<c:if test="${replyList.size() != 0 }">
						<!-- 댓글 -->
						 <div id="readReply">
							 <div>
								<img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg">
							</div>
						  
						    <c:forEach items="${replyList}" var="replyList">
						      
						      ${replyList.reply_num }
						        <p>
								        작성자 : ${replyList.reply_writer}<br />
								        작성 날짜 : ${replyList.reply_regi}
						        </p>
						
						        <p>${replyList.reply_content}</p>
						      
						    </c:forEach> <!-- list는 배열이라고 생각하자. 배열은 forEach로 풀어준다고 (?) 풀어써주는 역할을 한다. -->
						  
						</div> 
					</c:if>	
					
					<!-- 댓글 쓰기  -->
					  <input type="hidden" id="reply_qna_num" name="reply_qna_num" value="${qna_board.qna_num}" /> 
					  <div>
					    <label for="reply_writer">댓글 작성자</label><input type="text" id="reply_writer" name="reply_writer" value= "${qna_board.nickname }" readonly />
					    <br/>
					    <label for="reply_content">댓글 내용</label><input type="text" id="reply_content" name="reply_content" />
					  </div>
					  <div>
					 	 <button type="button" class="replyWriteBtn">작성</button>
					  </div>

			  </div>
		</c:if>
</c:if>


<script>
	$(".replyWriteBtn").on("click", function(){
		  var formObj = $("form[name='replyForm']");
		  formObj.attr("action", "/qna_board/replyWrite");
		  formObj.submit();
	});

	// 댓글 관련 ajax 처리 
	$('.replyWriteBtn').click(function(){
		var reply_content = $('#reply_content').val()
		var data = {"reply_qna_num": $('#reply_qna_num').val(), "reply_content": reply_content} 
		console.log(data)
		$.ajax({
	        async:true,
	        type:'POST',
	        data:JSON.stringify(data),
	        url:"<%=request.getContextPath()%>/writeReply",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){
		        var str = '';
				for(var i = 0; i<data["list"].length; i++){
					str += 
					'<li>'+
				        '<p>'+
					        '작성자 : '+ data["list"][i]["reply_writer"] + '<br />'+
					        '작성 날짜 : '+data["list"][i]["reply_regi"]+
			        	'</p>'+
			        	'<p>'+data["list"][i]["reply_content"]+'</p>'+
			      	'</li>'
				}
				$('.replyList').html(str);
	        }
	    });
	})

	
</script>