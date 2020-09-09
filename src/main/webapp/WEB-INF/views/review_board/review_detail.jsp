<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<style>
	.review-regi{
            width: 700px;
            margin: 0 auto;
            
            height: 800px;
	    }

        .review-regi input {
            border: 2px solid #ddd; 
        }
        .form-group4 textarea{
            border: 2px solid #ddd; 
        }
        .form-group input{
            font-size: 15px;
        }
        .form-group3 .starRev{
            padding: 13px;
            margin: 0 auto;
            width: 319px;
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
            font-size: 25px;
            color: rgb(124, 124, 124);
        }
        .fas{
        	font-size: 25px;
            color: rgb(255, 74, 74);
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
		    <form action="<%=request.getContextPath() %>/review_board/review_register" method="post" enctype="multipart/form-data">
		
		        <div class="review-regi">
		        	<div>
		        		<img src="<%=request.getContextPath()%>/resources/css/image/" alt="">
		                <input type="text" class="form-control" name="review_num" value= "${review_board.review_num }" readonly id="num">
		        	</div>
		            <div class="form-group1">
		                 <img src="<%=request.getContextPath()%>/resources/css/image/제목.jpg" alt="">
		                 <input type="text" class="form-control" name="review_title" value= "${review_board.review_title }" readonly>
		            </div>
		            <div class="form-group2">
		                <img src="<%=request.getContextPath()%>/resources/css/image/작성자.jpg" alt=""><!-- 로그인 구현을 했다면 필요 없지만, 지금은 아직 안한 상태기때문에 적어준다!  -->
		                <input type="text" class="form-control" name="review_u_mail" value= "${review_board.nickname }" readonly>
		            </div>
					<div>
						<img src="<%=request.getContextPath()%>/resources/css/image/" alt="">
		                <input type="text" class="form-control" name="review_regi" value= "${review_board.review_regi }" readonly>
					</div>
					<div>
						<img src="<%=request.getContextPath()%>/resources/css/image/" alt="">
		                <input type="text" class="form-control" name="review_view" value= "${review_board.review_view }"  readonly>
					</div>
					<div>
						<img src="<%=request.getContextPath()%>/resources/css/image/" alt="">
		                <input type="text" class="form-control btn-like" name="review_up" value= "${review_board.review_up }" readonly >
				      	<button type="button" id="up" class="text-like">추천 <i class="far fa-thumbs-up"></i></button>
					</div>
					
		            <div class="form-group3">
		                <img src="<%=request.getContextPath()%>/resources/css/image/만족도.jpg" alt="">
		                <div class="starRev">
		                    <input class="star" value="${review_board.review_star}" type="hidden">
		                </div>
		            </div>
		
		            <div class="form-group4">
		                <img src="<%=request.getContextPath()%>/resources/css/image/내용.jpg" alt="">
		                <textarea name="review_content" class="form-control" rows="4" id="comment">${review_board.review_content}</textarea>
		            </div>
		
		            <div class="filebox">
		                <input class="upload-name" value="파일선택" disabled="disabled">
		                <label for="ex_file">upload</label>
		                <input type="file" id="ex_file" name="file2" class="form-control upload-hidden">
		            </div>
		        </div>
		</form>
		
		<!-- 이부분은 보드 컨트롤러 부분 참고하기 !!
		<c:if test="${review_board.review_file != null }">
			<a href="<%=request.getContextPath()%>/review_board/download?fileName=${board.file}">${board.oriFile }</a>
		</c:if>  -->
		
		<a href="<%=request.getContextPath()%>/review_board/review_list?page=${cri.page}&search=${cri.search}&type=${cri.type}"><button>목록</button></a>
		<c:if test="${user != null }">
			<a href="<%=request.getContextPath()%>/review_board/review_register"><button>등록</button></a>
			<!-- 수정이랑 삭제는 아직 페이지가 구현이 안되서 일단 여기까지만 !
			<c:if test="${user.mail == review_board.review_u_mail}">
				<a href="<%=request.getContextPath()%>/review_board/modify?num=${review_board.review_num}"><button>수정</button></a>
				<a href="<%=request.getContextPath()%>/review_board/delete?num=${review_board.review_num}"><button>삭제</button></a>
			</c:if> -->
		</c:if>
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
		        url:"<%=request.getContextPath()%>/review_board/up",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
					// 로그인 한 회원이면
			        if(data['isUser']){
				        // 게시글의 추천수가 0보다 크면=>추천수를 증가시켜야하면
				        // => 처음 추천을 누른다면
						if(data['up'] > 0){
							$('input[name=up]').val(data['up'])
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

