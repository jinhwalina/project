<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/innDo.css">
	<script src="datepicker.js"></script>
	
<form method="post" >
    <div class="inn">
        <div class="inn-date">
            <div class="inn-date-img"><img src="<%=request.getContextPath()%>/resources/css/image/예약날짜요청.jpg" alt=""></div>

            <!--데이트 피커 관련 HTML-->
            <div id="date" class="datepicker">
              <img src="절취선.jpg" alt="">
            </div>
            <div class="inn-date-text">
              <label for="">체크인</label>
              <input type="text" id="from_value" name="inn_st_date"/>
              <label for="">체크아웃</label>
              <input type="text" id="to_value" name="to_value"/>
              <label for="">숙박일수</label>
              <input type="text" id="inn-date-cnt" class="inn-date-cnt" name="inn_time"/>
              <label for="">일</label>
              <div class="pickup-box">
                <label for="">부가서비스(픽업)이용여부</label>
                <select class="pickup" name="inn_service"> 
                  <option value="" selected>선택해주세요</option>
                  <option value="20000">이용하겠습니다</option>
                  <option value="0">괜찮습니다 :)</option>
                </select>
              </div>
              
              
            </div>
            <div class="inn-info-ment">
              <img src="<%=request.getContextPath()%>/resources/css/image/예약안내문구.jpg" alt="">
            </div>
            
            


        </div>

        <div class="inn-user">
          <div class="inn-user-img"><img src="<%=request.getContextPath()%>/resources/css/image/보호자정보.jpg" alt=""></div>
          <img src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">

          <div class="inn-user-box">
            <input type="text" name="name" class="name" placeholder="성명">
            <input type="text" name="phone" class="phone" placeholder="연락처 ( '-' 없이 입력해주세요 :)">
          </div>
        </div>

        <div class="inn-pet">
          <div class="inn-pet-img"><img src="<%=request.getContextPath()%>/resources/css/image/반려견정보.jpg" alt=""></div>
          <img src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">
          <div class="inn-pet-box">
            <input type="text" name="ptype" class="ptype" placeholder="동물종명(ex : 말티즈, 웰시코기 등)">
            <input type="text" name="pname" class="pname" placeholder="이름">
            
            <select class="pgender" name="pgender"> 
              <option value="" selected>성별선택</option>
              <option value="여">여</option>
              <option value="남">남</option>
            </select>
            
            <select class="pino" name="pino"> 
              <option value="" selected>접종유무</option>
              <option value="1">유</option>
              <option value="0">무</option>
            </select>
            
            <select class="psur" name="psur"> 
              <option value="" selected>중성화유무</option>
              <option value="1">유</option>
              <option value="0">무</option>
            </select>
            <br>
            <label for="" class="pcau-ment">* 요청사항, 주의해야 할 사항들을 꼼꼼히 적어주세요 (ex: 성격, 좋아하는 놀이, 음식 등)*</label>
            <div class="pcau"><textarea name="pcau" id="pcau" cols="80" rows="2" ></textarea></div>

          </div>
        </div>

        <div class="inn-btn-box">
          <div class="inn-cancel">
            <a class="inn-a-cancel" href="<%=request.getContextPath()%>/">취소</a>
          </div>
          <div class="inn-enter">
              <button class="inn-btn-enter">예약하기</button>
              <button type="submit" hidden="" class="enter3"></button>
          </div>
        </div>

    </div>

  </form>

  <!-- 예제 설명을 위한 코드 (블록 처리가 필요한 날짜 지정)
  이렇게 써준 코드를 hidden 처리해서 정보를 보내준다-->
  
  <input type="text" name="pname" class="tt" value="2020-9-6">
  <input type="text" name="pname" class="tt" value="2020-9-10">


  
<script>
  var disabledDays = []
$(function() {
  // 위의 예제 코드랑 이어지는 코드 ( 블록 처리 하게끔 날짜 지정하는것 )
  $('.tt').each(function(){
    disabledDays.push($(this).val())
  })
// 한 달력에서 범위 지정해주는 코드
            var cnt = 0;
            var dates = $( "#date" ).datepicker({
                dateFormat: 'yy-mm-dd',
                
                onSelect: function(dateText, inst) {
                    //set value
                    if(cnt == 0)
                        $("#from_value").val(dateText);
                    else
                        $("#to_value").val(dateText);
                    //set the min or max date
                    var option = cnt == 0 ? "minDate" : "maxDate",
                    instance = $( this ).data( "datepicker" ),
                    date = $.datepicker.parseDate(
                        instance.settings.dateFormat ||
                        $.datepicker._defaults.dateFormat,
                        dateText, instance.settings );
                    dates.datepicker( "option", option, date );
                    cnt++; 
                },
                beforeShowDay: disableSomeDay,
               
              

            });
            

            function disableSomeDay(date){
              var month = date.getMonth();
              var dates = date.getDate();
              var year = date.getFullYear();
              
              
                //if($.inArray(year + '-' + (month+1) + '-' + dates,disabledDays) != -1){
                console.log(disabledDays.indexOf(year + '-' + (month+1) + '-' + dates))
                if(disabledDays.indexOf(year + '-' + (month+1) + '-' + dates) != -1)
                  return [false];
                else
                  return [true];
                

            }
            // var dates = $( "#from, #to" ).datepicker({
            //     dateFormat: 'yy-mm-dd',
            //     onSelect: function(dateText, inst) {
            //         //set value
            //         $("#" + this.id + "_value").val(dateText);
            //         //set the min or max date
            //         var option = this.id == "from" ? "minDate" : "maxDate",
            //         instance = $( this ).data( "datepicker" ),
            //         date = $.datepicker.parseDate(
            //             instance.settings.dateFormat ||
            //             $.datepicker._defaults.dateFormat,
            //             dateText, instance.settings );
            //         dates.not( this ).datepicker( "option", option, date );
            //         console.log($('#from').datepicker( "option" ,"minDate"));
            //         console.log($('#from').datepicker( "option" ,"maxDate"));
            //     }
            // });

          

        });


</script>