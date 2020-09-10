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
            color: rgb(255, 74, 74);
        }
</style>


<form action="<%=request.getContextPath() %>/review_board/review_register" method="post" enctype="multipart/form-data">

        <div class="review-regi">
            <div class="form-group1">
                 <img src="<%=request.getContextPath()%>/resources/css/image/제목.jpg" alt="">
                 <input type="text" class="form-control" name="review_title" value= "${review_board.review_title }">
            </div>
            <div class="form-group2">
                <img src="<%=request.getContextPath()%>/resources/css/image/작성자.jpg" alt=""><!-- 로그인 구현을 했다면 필요 없지만, 지금은 아직 안한 상태기때문에 적어준다!  -->
                <input type="text" class="form-control" name="review_u_mail" value= "${user.nickname }" readonly>
            </div>

            <div class="form-group3">
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

            <div class="form-group4">
                <img src="<%=request.getContextPath()%>/resources/css/image/내용.jpg" alt="">
                <textarea name="review_content" class="form-control" rows="4" id="comment">${review_board.review_content}</textarea>
            </div>

            <div class="filebox">
                <input class="upload-name" value="파일을 선택해주세요 :)" disabled="disabled">
                <label for="ex_file">upload</label>
                <input type="file" id="ex_file" name="file2" class="form-control upload-hidden">
            </div>
            
            <a href="<%=request.getContextPath()%>/review_board/review_list" class="review-regi-del" type="submit">취소</a>
            <button class="review-regi-btn" type="submit">등록</button> 
            <button type="submit" hidden="" class="enter3"></button>
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