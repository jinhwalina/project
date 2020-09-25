<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<style>
		.review-regi{
            width: 700px;
            margin: 0 auto;
            height: 450px;
	    }

        /* 별점평가 관련 css*/
        .far{
            font-size: 27px;
            color: rgb(124, 124, 124);
        }
        .fas{
        	font-size: 27px;
            color: rgb(255, 74, 74);
        }
		.r-star-box .starRev{
			height: 40px;
			float: left;
			margin-left: 11px;
    		margin-top: 5;
        }
		/* 집에서 작업한 코드 */
		/* 게시판쪽 css*/
		.r-detail-box{
			margin-top:20px;
			width: 100%;
			height: 80px;
		}
		.group1,.group2{
			margin-bottom: 10px;
		}
		.group3{
			margin-bottom: 20px;
		}
		.group2{
			width: 700px;
			height: 42px;
		}
		.r-num-img,.r-view-img,.r-mail-img,.r-title-img,.r-star-img,.r-regi-img{
			width: 100px;
			height: 40px;
			margin: 0;
			float: left;
		}
		.r-up-img{
			width: 200px;
			height: 40px;
			margin: 0;
			float: left;
		}
		.r-num, .r-view, .r-mail{
			width: 100px;
			border: 2px solid #ddd;
			height: 40px;
			float: left;
			text-align:center;
			font-size:15px;
			font-weight:600;
			
		}
		.r-view-img,.r-up-img{
			margin-left: 11px;
		}
		.r-star-img{
			margin-left: 15px;
		}
		.r-regi-img{
			margin-left: 15px;
		}
		.r-title{
			width: 282px;
			border: 2px solid #ddd;
			height: 40px;
			float: left;
			text-align:center;
			font-size:15px;
			font-weight:600;
		}
		.r-regi{
			width: 200px;
			border: 2px solid #ddd;
			height: 40px;
			float: left;
			text-align:center;
			font-size:15px;
			font-weight:600;
		}
		.r-mail{
			width: 150px;
			border: 2px solid #ddd;
			height: 40px;
		}
		.text-like{
			height: 40px;
			background-color: white;
			border: none;
		}
		.fa-thumbs-up{
			color: rgb(0, 0, 0);
		}
		.r-content{
			width: 100%;
			border: 2px solid #ddd;
			padding:10px;
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
		.r-list,.r-write,.r-modi,.r-del{
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
        .r-modi,.r-del{
			line-height: 30px;
			height: 39px;
			width: 65px;
			border: none;
			font-size: 15px;
			background-color: rgb(255, 228, 196);
    		color: rgb(170, 170, 170);
			float: right;
			margin-top:10px;
		}

		.r-list,.r-modi,.r-write{
			margin-left: 1px;
		}
		.r-list:hover,.r-write:hover,.r-modi:hover,.r-del:hover{
			color: rgb(109, 109, 109);
		}
		
		/**/
		.r-file{
			width: 150px;
			border: 2px solid #ddd;
			height: 40px;
		}
		.r-file-img{
			width:200px;
			height:40px;
			float:left;
			margin-top:6px;
		}
		.r-file-box{
			margin-top:10px;
			height:40px;
			width:150px;
			border:2px solid #ddd;
			float: left;
			overflow: hidden;
		}
		.r-file-d{
			margin:10px;
			font-size:12px;
			line-height:40px;
			color:grey;
		}
		.r-file-d:hover{
			margin:10px;
			font-size:12px;
			line-height:40px;
			color:black;
		}
		.r-file-none{
			border: none;
		    font-size: 15px;
		    line-height: 35px;
		    margin-left: 52px;
		    color:#ddd;
		    font-weight:bold;
		}
	
</style>

<c:if test="${review_board eq null }">
	<h1>해당 게시물은 없는 게시물입니다.</h1>
</c:if>   

<c:if test="${review_board ne null }">
	<c:if test="${review_board.review_isDel == 'Y'.charAt(0)}">
		<h1>해당 게시물은 삭제 되었습니다.</h1>
	</c:if>
		<c:if test="${review_board.review_isDel == 'N'.charAt(0)}">
		    <form action="<%=request.getContextPath() %>/review_board/review_delete" method="get" enctype="multipart/form-data">
		
		        <div class="review-regi">
		        
					<div class="r-detail-box">
						<img src="<%=request.getContextPath()%>/resources/css/image/게시글상세보기.jpg" alt="">
						<img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
					</div>
					
					<!-- 그룹박스 1-->
					<div class="group1"> 
						<div class="r-num-box">
							<div class="r-num-img">
								<img src="<%=request.getContextPath()%>/resources/css/image/글번호.jpg" alt="">
							</div>	
							<input type="text" class="r-num" name="review_num" value= "${review_board.review_num }" readonly id="num">
						</div>

						<div class="r-view-box">
							<div class="r-view-img">
								<img src="<%=request.getContextPath()%>/resources/css/image/조회수.jpg" alt="">
							</div>
							<input type="text" class="r-view" name="review_view" value= "${review_board.review_view }"  readonly>
						</div>

						<div class="r-up-box">
							<div class="r-up-img">
								<img src="<%=request.getContextPath()%>/resources/css/image/게시글좋아요.jpg" alt="">
							</div>
							<button type="button" id="up" name="up" class="text-like">LIKE <i class="far fa-thumbs-up"></i></button>
						</div>
					</div>

					<!-- 그룹 박스 2 ( 박스는 없지만 구분하기 위해) -->
					<div class="group2">
						<div class="r-mail-box">
							<div class="r-mail-img">
								<img src="<%=request.getContextPath()%>/resources/css/image/작성자2.jpg" alt="">
							</div>
							<input type="text" class="r-mail" name="review_u_mail" value= "${review_board.nickname }" readonly>
						</div>

						<div class="r-star-box">
							<div class="r-star-img">
								<img src="<%=request.getContextPath()%>/resources/css/image/만족도2.jpg" alt="">
							</div>				
							<div class="starRev">
								<input class="starRev-cnt" name="starRev-cnt" value="0" type="hidden">
							</div>
							<input class="star" value="${review_board.review_star}" type="hidden">
						</div>
					</div>
					
					<!-- 그룹박스 3 -->
					<div class="group3">
						<div class="r-title-box">
							<div class="r-title-img">
								<img src="<%=request.getContextPath()%>/resources/css/image/제목2.jpg" alt="">
							</div>
							<input type="text" class="r-title" name="review_title" value= "${review_board.review_title }" readonly>
						</div>

						<div class="r-regi-box">
							<div class="r-regi-img">
								<img src="<%=request.getContextPath()%>/resources/css/image/등록일.jpg" alt="">
							</div>
							<input type="text" class="r-regi" name="review_regi" value= "${review_board.review_regi }" readonly>
						</div>
					</div>

					<div class="r-content-box">
						<div class="r-content-img"> 
							<img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
						</div>
						<textarea name="review_content" class="r-content" rows="4" id="comment" readonly>${review_board.review_content}</textarea>
					</div>

					<!-- 첨부파일 관련 css  -->	
						<c:if test="${review_board.review_file != null }">
							<div class="r-file-img">
								<img src="<%=request.getContextPath()%>/resources/css/image/첨부파일.jpg" alt="">
							</div>
							<div class="r-file-box">
								<c:if test="${review_board.review_file != null }">	
									<a class="r-file-d" href="<%=request.getContextPath()%>/review_board/review_download?fileName=${review_board.review_file}">${review_board.oriFile}</a>
								</c:if>
							</div>
						</c:if>
						<c:if test="${review_board.review_file == null }">
							<div class="r-file-img">
								<img src="<%=request.getContextPath()%>/resources/css/image/첨부파일노.jpg" alt="">
							</div>
							<div class="r-file-box">
								<c:if test="${review_board.review_file == null }">	
									<input class="r-file-none" type="text" value="F I L E" readonly>
								</c:if>
							</div>
						</c:if>

					
					
					<a href="<%=request.getContextPath()%>/review_board/review_list?page=${cri.page}&search=${cri.search}&type=${cri.type}"><button type="button" class="r-list">LIST <i class="fas fa-stream"></i></button></a>
					<c:if test="${user != null }">
						<a href="<%=request.getContextPath()%>/review_board/review_register"><button type="button" class="r-write">WRITE <i class="fas fa-pencil-alt"></i></button></a>
						<c:if test="${user.mail == review_board.review_u_mail}">
							<a href="<%=request.getContextPath()%>/review_board/review_modify?num=${review_board.review_num}"><button type="button" class="r-modi">수정</button></a>
							<a href="<%=request.getContextPath()%>/review_board/review_delete?num=${review_board.review_num}"><button type="button" class="r-del">삭제</button></a>
						</c:if> 
					</c:if>
				</div>
		</form>
		
		 
		
	</c:if>
</c:if>

<script>

	$(function(){
		$('#up').click(function(){ 
			var num = $('#num').val();
			$.ajax({
		        async:true,
		        type:'POST',
		        data:num,
		        url:"<%=request.getContextPath()%>/review_board/review_up",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
					// 로그인 한 회원이면
			        if(data['isUser']){
				        // 게시글의 추천수가 0보다 크면=>추천수를 증가시켜야하면
				        // => 처음 추천을 누른다면
						if(data['up'] > 0){
							$('input[name=up]').val(data['up'])
							alert(" * 추천해주셔서 감사합니다 :) * ") 
						}
						// 이미 추천을 눌렀다면
						else{
							alert('이미 추천 하셨습니다!')
						}
					// 로그인하지 않았으면
					}else{
						alert('추천은 로그인을 해야 가능합니다.')
					}
		        }
		    });
		})

		var i = 1;
		var tmp = $('.star').val();
		// 받은 별점 ( 색칠되어진 별에대한 반복문 ) 
		for(i=1; tmp>=i; i++){
			$('.starRev').append('<i class="fas fa-heart starR"></i> ');
			//console.log(i);
		}
		// 최대 설정할수있는 별점 중 색칠된 나머지에 해당하는 별에대한 반복문 
		for(i=tmp; i<10; i++){
			$('.starRev').append('<i class="far fa-heart starR"></i> ');
		}
		// 이렇게 설정해주게되면 색칠된 별 + 아닌 별 > 전체 별이 완성된다. 

	})
</script>

