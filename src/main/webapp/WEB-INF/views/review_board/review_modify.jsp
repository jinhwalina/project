<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
		.review-regi{
            width: 700px;
            margin: 0 auto;

            height: 500px;
	    }
		.filebox{
			float: left;
		}
        .filebox label { 
            display: inline-block; 
            padding: .5em .75em; 
            color: #999; 
            font-size: inherit; 
            line-height: normal; 
            vertical-align: middle; 
            background-color: #fdfdfd; 
            cursor: pointer; 
            border: 2px solid #ebebeb; 
            border-bottom-color: #e2e2e2; 
            border-radius: .25em; 
            margin: 0;
			/*margin-right: 117px;*/
			
        } 
        .filebox input[type="file"] { 
            /* 파일 필드 숨기기 */ 
            position: absolute; 
            width: 1px; 
            height: 1px; 
            padding: 0; 
            margin: -1px; 
            overflow: hidden; 
            clip:rect(0,0,0,0); 
            border: 0; 
        }
        /* named upload */ 
        .filebox .upload-name { 
            display: inline-block; 
            padding: .5em .75em; 
            /* label의 패딩값과 일치 */ 
            font-size: inherit; 
            font-family: inherit; 
            line-height: normal; 
            vertical-align: middle; 
            background-color: #f5f5f5; 
            border: 2px solid #ebebeb; 
            border-bottom-color: #e2e2e2; 
            border-radius: .25em; 
            -webkit-appearance: none; 
            /* 네이티브 외형 감추기 */ 
            -moz-appearance: none; 
            appearance: none;
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
			margin-top:15px;
			width: 100%;
			height: 80px;
		}
		.group1,.group2{
			margin-bottom: 10px;
		}
		.group1{
			    height: 45px;
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
		}
		.r-regi{
			width: 200px;
			border: 2px solid #ddd;
			height: 40px;
			float: left;
		}
		.r-mail{
			width: 150px;
			border: 2px solid #ddd;
			height: 40px;
		}
		.text-like{
			height: 40px;
			border: 2px solid #ddd;
			background-color: white;
		}
		.fa-thumbs-up{
			color: rgb(0, 0, 0);
		}
		.r-content{
			width: 100%;
			border: 2px solid #ddd;
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
		.r-list,.r-write{
			line-height: 30px;
			height: 39px;
			width: 130px;
			border: none;
			font-size: 15px;
			background-color: rgb(255, 228, 196);
    		color: rgb(170, 170, 170);
			float: right;
		}
		.r-list{
			margin-left: 1px;
		}
		.r-list:hover,.r-write:hover{
			color: rgb(109, 109, 109);
			
		}
	
</style>

<c:if test="${review_board ne null }">

	<c:if test="${review_board.review_isDel == 'Y'.charAt(0)}">
		<h1>해당 게시물은 삭제 되었습니다.</h1>
	</c:if>
	
		<c:if test="${review_board.review_isDel == 'N'.charAt(0)}">
		    <form action="<%=request.getContextPath() %>/review_board/review_modify" method="get" enctype="multipart/form-data">
		
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
							<input type="text" class="r-num" name="review_num" value= "${review_board.review_num }" readonly id="num" readonly>
						</div>

						<div class="r-view-box">
							<div class="r-view-img">
								<img src="<%=request.getContextPath()%>/resources/css/image/조회수.jpg" alt="">
							</div>
							<input type="text" class="r-view" name="review_view" value= "${review_board.review_view }"  readonly>
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
								<img src="<%=request.getContextPath()%>/resources/css/image/등록일.jpg" alt=""  >
							</div>
							<input type="text" class="r-regi" name="review_regi" value= "${review_board.review_regi }" readonly>
						</div>
					</div>

					<div class="r-content-box">
						<div class="r-content-img"> 
							<img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
						</div>
						<textarea name="review_content" class="r-content" rows="4" id="comment">${review_board.review_content}</textarea>
					</div>

					<!-- 그룹박스 4-->
					<c:if test="${review_board.review_file != null }">
						<div class="group4">
							<div class="filebox">
								<input class="upload-name" value="파일을 선택해주세요 :)" disabled="disabled">
								<label for="ex_file">upload</label>
								<input type="file" id="ex_file" name="file2" value="${review_board.review_file }" class="form-control upload-hidden">
							</div>
						</div>
					</c:if>
					
					
					<a href="<%=request.getContextPath()%>/review_board/review_list?page=${cri.page}&search=${cri.search}&type=${cri.type}"><button type="button" class="r-list">LIST <i class="fas fa-stream"></i></button></a>
					<c:if test="${user != null }">
						<a href="<%=request.getContextPath()%>/review_board/review_register"><button type="button" class="r-write">WRITE <i class="fas fa-pencil-alt"></i></button></a>
						<c:if test="${user.mail == review_board.review_u_mail}">
							<a href="<%=request.getContextPath()%>/review_board/review_"><button type="button" class="r-modi">수정</button></a>
						</c:if> 
					</c:if>
				</div>
		</form>
		
	
		</c:if>
		
	</c:if>

 
<script>

	$(function(){
		var i = 1;
		var tmp = $('.star').val();
		//console.log(tmp);
		
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

		
        /* 파일 업로드 관련 
        $(document).ready(function(){ 
            var fileTarget = $('.filebox .upload-hidden'); 
            fileTarget.on('change', function(){ // 값이 변경되면 
                if(window.FileReader){ // modern browser 
                    var filename = $(this)[0].files[0].name;
            } 
            else { // old IE 
                var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
            } // 추출한 파일명 삽입 
                $(this).siblings('.upload-name').val(filename);
            }); 
        });*/
		
	})
</script>
    