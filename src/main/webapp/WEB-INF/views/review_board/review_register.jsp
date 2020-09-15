<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
        .review-regi{
            width: 700px;
            margin: 0 auto;
            height: 800px;
        }
        .review-regi-box{
            margin-bottom: 10px;
        }
        .r-mail-img,.r-title-img{
			width: 100px;
			height: 40px;
			margin: 0;
			float: left;
            margin-bottom: 10px;
		}
        .r-mail{
			width: 180px;
			border: 2px solid #ddd;
			height: 40px;
			float: left;
			text-align:center;
			font-size:15px;
			font-weight:600;
		}
        .r-title{
			width: 317px;
			border: 2px solid #ddd;
			height: 40px;
			float: left;
			text-align:center;
			font-size:15px;
			font-weight:600;
		}   
        .r-content{
			width: 100%;
			border: 2px solid #ddd;
			padding:10px;
		}
    
        .filebox{
            float: left;
            margin-top: 10px;
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
            color: rgb(255, 74, 74);
        }
        .starRev{
            padding: 13px;
            margin: 0 auto;
            width: 319px;
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
			width: 88px;
			border: none;
			font-size: 15px;
			background-color: rgb(255, 228, 196);
    		color: rgb(170, 170, 170);
			float: right;
			margin-top:10px;
        }

		.r-list,.r-write{
			margin-left: 1px;
		}
		.r-list:hover,.r-write:hover{
			color: rgb(109, 109, 109);
		}

    </style>

<form action="<%=request.getContextPath() %>/review_board/review_register" method="post" enctype="multipart/form-data">

        <div class="review-regi">
            <div class="review-regi-box">
                <img src="<%=request.getContextPath()%>/resources/css/image/게시글작성하기.jpg" alt="">
                <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
            </div>
            
            <div class="r-group">
                <div class="r-mail-box">
                    <div class="r-mail-img">
                        <img src="<%=request.getContextPath()%>/resources/css/image/작성자2.jpg" alt="">
                    </div>
                    <input type="text" class="r-mail" name="review_u_mail" value= "${user.nickname } " readonly>
                </div>

                <div class="r-title-box">
                    <div class="r-title-img">
                        <img src="<%=request.getContextPath()%>/resources/css/image/제목2.jpg" alt="">
                    </div>
                    <input type="text" class="r-title" name="review_title" value= "${review_board.review_title }" >
                </div>
            </div>

            <div class="r-group2">
                <img src="<%=request.getContextPath()%>/resources/css/image/만족도.jpg" alt="">
                <div class="starRev">
                    <i class="far fa-heart starR "></i>
                    <input value="1" type="hidden">
                    
                    <i class="far fa-heart starR"></i>
                    <input value="2" type="hidden">

                    <i class="far fa-heart starR"></i>
                    <input value="3" type="hidden">

                    <i class="far fa-heart starR"></i>
                    <input value="4" type="hidden">

                    <i class="far fa-heart starR"></i>
                    <input value="5" type="hidden">

                    <i class="far fa-heart starR"></i>
                    <input value="6" type="hidden">

                    <i class="far fa-heart starR"></i>
                    <input value="7" type="hidden">

                    <i class="far fa-heart starR"></i>
                    <input value="8" type="hidden">

                    <i class="far fa-heart starR"></i>
                    <input value="9" type="hidden">

                    <i class="far fa-heart starR"></i>
                    <input value="10" type="hidden">

                    <input class="starRev-cnt" name="review_star" value="0" type="hidden">
                </div>
            </div>

            <div class="r-content-box">
                <div class="r-content-img">
                    <img src="<%=request.getContextPath()%>/resources/css/image/내용.jpg" alt="">
                    <img src="<%=request.getContextPath()%>/resources/css/image/절취선2.jpg" alt="">
                </div>
                <textarea name="review_content" class="r-content" rows="4" id="comment" >${review_board.review_content}</textarea>
            </div>

            <div class="filebox">
                <img src="<%=request.getContextPath()%>/resources/css/image/첨부파일요청.jpg" alt="">
                <input class="upload-name" value="파일을 선택해주세요 :)" disabled="disabled">
                <label for="ex_file">upload</label>
                <input type="file" id="ex_file" name="file2" class="form-control upload-hidden">
            </div>
            

            <a href="<%=request.getContextPath()%>/review_board/review_list?page=${cri.page}&search=${cri.search}&type=${cri.type}"><button type="button" class="r-list">LIST <i class="fas fa-stream"></i></button></a>
			<button type="submit" class="r-write">WRITE <i class="fas fa-pencil-alt"></i></button>
      		<button type="submit" hidden="" class="r-write">WRITE <i class="fas fa-pencil-alt"></i></button>
        </div>
</form>

<script>

        // 별점 평가 ! 
        $('.starRev i').click(function(){
            $(this).parent().children('i').removeClass('fas').addClass('far');
            $(this).addClass('fas').prevAll('i').addClass('fas');
            $('.starRev-cnt').val($(this).next().val());
            
            //console.log($('.starRev-cnt').val());
            //선택한 별점에 해당하는 값(콘솔에 선택자에 담긴 val값을 확인하기)
        });

        // 파일 업로드 관련 
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
        });




</script>