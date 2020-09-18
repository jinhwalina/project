<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <style>
		.qna-regi{
            width: 700px;
            margin: 0 auto;
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
			
		 /*집에서 한 코드*/
        .no-reply-img{
            height: 70px;
        }
        .reply-num-img,.reply-num,.reply-writer-img,.reply-writer,.reply-regi-img,.reply-regi{
            float: left;
        }
        .reply-num-img{
            margin-left: 19px;
        }
        .reply-num{
            border: none;
            border-bottom: 2px solid #ddd;
            width: 60px;
            margin-left: 12px;
            margin-right: 30px;
            text-align: center;
        }
        .reply-writer{
            border: none;
            border-bottom: 2px solid #ddd;
            width: 130px;
            margin-left: 12px;
            margin-right: 30px;
            text-align: center;
            
        }
        .reply-regi{
            border-bottom: 2px solid #ddd;
            width: 180px;
            margin-left: 12px;
            text-align: center;
        }
        .reply-content-img>img{
            margin-top: 10px;
        }
        .reply-list2{
            margin-top: 10px;
        }
        .reply-content{
			border: 2px solid #ddd;
			padding:10px;
            margin-top: 10px;
            margin-left: 19px;
            width: 570px;
            float: left;
        }  
        .reply-qna-num{
            border: none;
           
        }

        /*댓글 쓰기*/
        .reply-writer-img2{
            margin-left: 19px;
            margin-top:25px;
            
        }
        .reply-writer2{
            border: none;
            border-bottom: 2px solid #ddd;
            width: 150px;
            margin-left: 12px;
            margin-right: 195px;
            text-align: center;
        }
        .reply-content2{
            border: 2px solid #ddd;
			padding:10px;
            margin-top: 10px;
            margin-left: 19px;
            width: 658px;
        }
        .replyWriteBtn{
            float: right;
            margin-top: 5px;
            margin-right: 23px;
            border:none;
            width: 88px;
			font-size: 15px;
			background-color: rgb(255, 228, 196);
    		color: rgb(170, 170, 170);
            cursor: pointer;
        }
        .replyDeleteBtn2{
            margin-top: 10px;
            margin-right: 23px;
            border:none;
            width: 88px;
			font-size: 15px;
			height: 48px;
			background-color: rgb(255, 228, 196);
    		color: rgb(170, 170, 170);
            cursor: pointer;

        }
        
        .replyWriteBtn:hover,.replyDeleteBtn2:hover{
            color: rgb(109, 109, 109);
        }
        .replyBtn-box{
        	margin-bottom: 50px;
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
				    <!-- 조건 써줄 때 list 같은 경우는 그냥 속성 명으로 써주는게 아니라 size() 로 설정해줘야한다. -->
						<!-- 댓글 없을 때-->
		            <div class="no-reply-img">
		                <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg">
		            </div>


					<c:if test="${replyList.size() != 0 }">
						<!-- 댓글 -->
						 <div id="readReply" class="readReply">
			              <div class="reply-wrap">
				              <c:forEach items="${replyList}" var="replyList" varStatus="status">
				                  <div class="reply-list">
				                       <div class="reply-list1">
				                           <div class="reply-num-img">
				                               <img src="<%=request.getContextPath()%>/resources/css/image/댓글번호.jpg" alt="">
				                           </div>
				                           <div class="reply-num">
				                               ${status.count} <!-- 이 속성은 원래 기본으로 있는 속성에서 사용해준것!  -->
				                           </div>
				   
				                           <div class="reply-writer-img">
				                               <img src="<%=request.getContextPath()%>/resources/css/image/댓글작성자.jpg" alt="">
				                           </div>
				                           <div class="reply-writer">
				                              ${replyList.reply_writer}
				                           </div>
				   
				                           <div class="reply-regi-img">
				                               <img src="<%=request.getContextPath()%>/resources/css/image/댓글작성일.jpg" alt="">
				                           </div>
				                           <div class="reply-regi">
				                               ${replyList.reply_regi}
				                           </div>
				                       </div>
				                       <div class="reply-list2">
				                           <div>
				                               <textarea class="reply-content" name="reply-content" rows="1" readonly>${replyList.reply_content}</textarea>
				                           </div>
				                           
				                           <div>
								        		<input type="hidden" value="${replyList.reply_num }"><button class="<c:if test="${user.nickname == replyList.reply_writer}">replyDeleteBtn</c:if> replyDeleteBtn2 " type="button">DELETE</button>
								        		
								        	</div>
								        	
				                       </div>
								        
				                       
				                  </div>   
				              </c:forEach> <!-- list는 배열이라고 생각하자. 배열은 forEach로 풀어준다고 (?) 풀어써주는 역할을 한다. -->
			              </div>
			           </div> 
					</c:if>	
					
					
					<!-- 댓글 쓰기  -->
				        <input type="hidden" id="reply_qna_num" name="reply_qna_num" value="${qna_board.qna_num}" /> 
				
				        <div class="reply-writer-img2">
				            <img src="<%=request.getContextPath()%>/resources/css/image/댓글작성자.jpg" alt="">
				            <input class="reply-writer2" type="text" id="reply_writer" name="reply_writer" value= "${user.nickname }" readonly />
				            
				            <img src="<%=request.getContextPath()%>/resources/css/image/댓글내용.jpg" alt="">
				        </div>
				        <input class="reply-content2" type="text" id="reply_content" name="reply_content" />
				
				        <div class="replyBtn-box">
				            <button type="button" class="replyWriteBtn">REPLY</button>
				        </div>

			  </div>
		</c:if>
</c:if>


<script>
	var reply_qna_num = $('#reply_qna_num').val();
	
	
	$(".replyWriteBtn").on("click", function(){
		  var formObj = $("form[name='replyForm']");
		  formObj.attr("action", "/qna_board/replyWrite");
		  formObj.submit();
	});

	// 댓글 관련 ajax 처리 
	$('.replyWriteBtn').click(function(){
		var reply_content = $('#reply_content').val()
		var data = {"reply_qna_num": $('#reply_qna_num').val(), "reply_content": reply_content} 
		
		$.ajax({ 
	        async:true,
	        type:'POST',
	        data:JSON.stringify(data),
	        url:"<%=request.getContextPath()%>/writeReply",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){
		        alert("* 댓글 등록이 완료되었습니다 *")
		       <%--  var str = '';
				for(var i = 0; i<data["list"].length; i++){
					str += 
						'<div class="reply-num-img">' +
					        '<img src="<%=request.getContextPath()%>/resources/css/image/댓글번호.jpg" alt="">' +
					    '</div>' +
	
					    '<div class="reply-num">' + 
					        data["list"][i]["reply_num"] +
					    '</div>' + 
	
					    '<div class="reply-writer-img">' +
					        '<img src="<%=request.getContextPath()%>/resources/css/image/댓글작성자.jpg" alt="">' +
					    '</div>' +
					    '<div class="reply-writer">' +
					        data["list"][i]["reply_writer"] +
					    '</div>' + 
	
					    '<div class="reply-regi-img">' +
					        '<img src="<%=request.getContextPath()%>/resources/css/image/댓글작성일.jpg" alt="">' +
					    '</div>' +
					    '<div class="reply-regi">' + 
					        data["list"][i]["reply_regi"] +
					    '</div>' + 
					    '<div>' +
					        '<textarea class="reply-content" name="reply-content" rows="1">' + data["list"][i]["reply_content"] + '</textarea>' +
					    '</div>' +
					    '<div>' +
	        				'<button type="button" class="replyDeleteBtn">DELETE</button>' +
	        			'</div>'
		        	
				}
				$('.reply-wrap').html(str + '');
				$('.reply-content2').val(''); --%>
				location.reload(); // 화면 자체를 새로고침 해주는 역할. 
	        }
	    });
	})
	// 댓글 삭제 
	/* function del(obj){
		obj.click(function(e){
			e.preventDefault();
			var input = confirm('삭제하시겠습니까?');
			if (input == true){
				alert('삭제하였습니다');
				console.log($(obj).parents('.reply-list').find('.reply-num').text());
				console.log(reply_qna_num);
			}
		})
	}
	del($('.replyDeleteBtn')); */

	// 댓글 삭제
	$('.replyDeleteBtn').click(function(e){
		e.preventDefault();
		var input = confirm('댓글을 삭제하시겠습니까?');
		var data = $(this).prev().val(); 

		if (input == true){

			console.log(data);
			$.ajax({
		        async:true,
		        type:'POST',
		        data: data,
		        url:"<%=request.getContextPath()%>/deleteReply",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
		        	alert('삭제하였습니다 :)');
		        	location.reload();
		        }
	        	
		    });
		}
		

		
	})
	
	
	
</script>

