<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

    .review{
        margin: 50px;
        border: solid 1px black;
        height: 800px;
    }
    .review-box{
        width: 1000px;
        height: 600px;
        margin: 0 auto;
    }
    .review-img{
        width: 700px;
        height: 60px;
        margin: 0 auto;

    }
    .review-list{
        border: solid 1px;
        width: 800px;
        height: 400px;
        margin: 0 auto;
    }
    .review-list>.table{
        text-align: center;
    }

</style>

<!-- 후기 게시판 ( 제목, 작성자, 내용, 첨부파일, 별점평가 자리) -->

        <div class="review">
            <div class="review-box">
                <div class="review-img"><img src="<%=request.getContextPath()%>/resources/css/image/후기게시판입니다.jpg" alt=""></div>

                <div class="review-list">
                    <table class="table table-borderless">
                        <thead>
                          <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>조회수</th>
                          </tr>
                        </thead>

                        <tbody>
                        	
                            <c:if test="${list.size() != 0}">
                                  <!--  var의 역할은 list에서 꺼내왔을때 뭐라고 부를 지 붙여 줄 이름  -->
                                <c:forEach var="review_board" items="${list}">
                                    <tr>
                                        <td>${review_board.review_num}</td>
                                        <td>
                                            <a href="">
                                                ${review_board.review_title}
                                            </a>
                                        </td>
                                        <td>${review_board.review_u_mail}</td>
                                        <td>${review_board.review_regi}</td>
                                        <td>${review_board.review_view}</td>
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
					    <li class="page-item <c:if test="${!pm.prev }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/review_board/review_list?page=${pm.startPage-1}&type=${pm.cri.type}&search=${pm.cri.search}">Previous</a></li>
					    <c:forEach var= "index" begin="${pm.startPage}" end="${pm.endPage}">
					    	<li class="page-item <c:if test="${pm.cri.page == index}">active</c:if> "><a class="page-link" href="<%=request.getContextPath()%>/review_board/review_list?page=${index}&type=${pm.cri.type}&search=${pm.cri.search}">${index}</a></li>
					    </c:forEach>
					    <li class="page-item <c:if test="${!pm.next }">disabled</c:if>" ><a class="page-link" href="<%=request.getContextPath()%>/review_board/review_list?page=${pm.endPage+1}&type=${pm.cri.type}&search=${pm.cri.search}">Next</a></li>
				  	</ul>
				  	<!-- 페이지네이션  end -->
				  	
				  	<!-- 검색 박스 start -->
                    <form action="<%=request.getContextPath()%>/review_board/review_list">
				  	<div class="input-group mb-3">
				  		<select class="from-control" name="type">
				  			<option value="0" <c:if test="${pm.cri.type == 0 }">selected</c:if>>전체</option>
				  			<option value="1" <c:if test="${pm.cri.type == 1 }">selected</c:if>>작성자</option>
				  			<option value="2" <c:if test="${pm.cri.type == 2 }">selected</c:if>>제목</option>
				  			<option value="3" <c:if test="${pm.cri.type == 3 }">selected</c:if>>내용</option>
				  		</select>
				    	<input type="text" class="form-control" placeholder="검색어를 입력해주세요 :)" name="search" value="${pm.cri.search}">
				    	<div class="input-group-append">
				   			<button class="btn btn-success" type="submit">검색</button>  
				    	</div>
				  	</div>
				  	</form>
				  	<!-- 검색 박스 end -->
				  	
                </div>
            </div>
        </div>
