<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/innDo.css">

<form method="post" >
    <div class="inn">
        <div class="inn-date">
            <div class="inn-date-img"><img src="<%=request.getContextPath()%>/resources/css/image/예약날짜요청.jpg" alt=""></div>

            <!--데이트 피커 관련 HTML-->
            <div id="date" class="datepicker">
              <img src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">
            </div>
            <div class="inn-date-text float_box">
              <label for="">체크인</label>
              <input type="text" id="from_value" name="inn_st_date" readonly/>
              
              
              <label for="">체크아웃</label>
              <input type="text" id="to_value" name="to_value" readonly/>
              
              
              <label for="">숙박일수</label>
              <input type="text" id="inn-date-cnt" class="inn-date-cnt" name="inn_time" readonly/>
              <label for="">일</label>
              
              
              <div class="pickup-box">
                <label for="">부가서비스(픽업)이용여부</label>
                <select class="pickup" name="inn_service"> 
                  <option value="" selected>선택해주세요</option>
                  <option value="이용">이용하겠습니다</option>
                  <option value="미이용">괜찮습니다 :)</option>
                </select>
              </div>
              
              <input type="hidden" class="innPrice" name="inn_total_price" >
              
            </div>
            <div class="inn-info-ment">
              <img src="<%=request.getContextPath()%>/resources/css/image/예약안내문구.jpg" alt="">
            </div>

        </div>

        <div class="inn-user">
          <div class="inn-user-img"><img src="<%=request.getContextPath()%>/resources/css/image/보호자정보.jpg" alt=""></div>
          <img src="<%=request.getContextPath()%>/resources/css/image/절취선.jpg" alt="">

          <div class="inn-user-box">
            <input type="text" name="inn_add_name" class="name" value= "${user.name }" placeholder="성명">
            <input type="text" name="inn_add_num" class="phone" value= "${user.pnum }" placeholder="연락처 ( '-' 없이 입력해주세요 :)">
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
              <option value="유">유</option>
              <option value="무">무</option>
            </select>
            
            
            <select class="psur" name="psur"> 
              <option value="" selected>중성화유무</option>
              <option value="유">유</option>
              <option value="무">무</option>
            </select>
            <label for="" id="" class="inn_error"></label>
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

  <c:forEach items="${list}" var="date">
  	<input type="hidden" class="tt" value="${date}">
  	<!-- 이부분도 원래는 hidden 처리 해주는게 맞음. -->
  </c:forEach>


  
<script>
var disabledDays = []
	$(function() {
	  // 위의 예제 코드랑 이어지는 코드 ( 블록 처리 하게끔 날짜 지정하는것 )
	  $('.tt').each(function(){
	    //disabledDays.push($(this).val()) > 일단 오류 수정이 안됐기때문에 주석 처리 해두기 
	  })
 			var edd;
  			var sdd;
            var cnt = 0;
            var dates = $( "#date" ).datepicker({
                dateFormat: 'yy-mm-dd',
                
                onSelect: function(dateText, inst) {
                    //set value
                    if(cnt == 0){
                    	 $("#from_value").val(dateText);
                         sdd = dateText;
						// minDate 시작 날짜를 선택했을때, 시작 날짜 이전의 날짜들은 블록 처리 해버리고, maxDate 마지막 날짜 선택했을 때 이후 날짜들도 블록 처리 해주는 코드 .
                        var option =  "minDate";
						instance = $( this ).data( "datepicker" ),
						date = $.datepicker.parseDate(
						    instance.settings.dateFormat ||
						    $.datepicker._defaults.dateFormat,
						    dateText, instance.settings );
						dates.datepicker( "option", option, date );
						
						var i = 1;
						var tmp = new Date(date);
						while(i<32){ // 32번 반복 
							tmp.setDate(tmp.getDate()+1)
							var tmpDay = getDates(tmp.getFullYear(),tmp.getMonth()+1,tmp.getDate());
							if(disabledDays.indexOf(tmpDay) != -1){
								break;
							}
							i++;
						}
						if(i<32){
							
							for(var j=0; j<disabledDays.length; j++)
								disableSomeDay(new Date(disabledDays[j]))
						 var option =  "maxDate";
							instance = $( this ).data( "datepicker" ),
							date = $.datepicker.parseDate(
							    instance.settings.dateFormat ||
							    $.datepicker._defaults.dateFormat,
							    dateText, instance.settings );
							dates.datepicker( "option", option, tmp );
						}
						cnt++;
                    }
                    else{
                    	$("#to_value").val(dateText);
                    	edd = dateText;
        	            var ar1 = sdd.split('-');
        	            var ar2 = edd.split('-');
        	            var da1 = new Date(ar1[0], parseInt(ar1[1]-1), ar1[2]); // 달 같은 경우 -1 해주기.
        	            var da2 = new Date(ar2[0], parseInt(ar2[1]-1), ar2[2]);
        	            var dif = da2 - da1;
        	            var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
                    	$("#inn-date-cnt").val(dif/cDay);
                    	var option = "maxDate",
   						instance = $( this ).data( "datepicker" ),
   						date = $.datepicker.parseDate(
   						    instance.settings.dateFormat ||
   						    $.datepicker._defaults.dateFormat,
   						    dateText, instance.settings );
   						dates.datepicker( "option", option, date );
   						cnt++;
                    }
                        
                    //set the min or max date
                    /*
                    var option = cnt == 0 ? "minDate" : "maxDate",
                    instance = $( this ).data( "datepicker" ),
                    date = $.datepicker.parseDate(
                        instance.settings.dateFormat ||
                        $.datepicker._defaults.dateFormat,
                        dateText, instance.settings );
                    dates.datepicker( "option", option, date );
                    cnt++;
                    */ 
                },
                beforeShowDay: disableSomeDay,
                minDate: 0 // 오늘날짜 이 전은 다 블록 지정하기 
               
              

            });
            
            
            // 블록 처리 될 날짜에 +1 해주는 쿼리문 만들기. 날! 에만 더하기 1을 해줄 경우.. 단순히 날짜가 밀리는거라 상관이 없나..? 9월 30에 1을 더해줄 경우에는 31일이 되는데 이렇게 되면 없는 날짜가 됨.. 
			function addDay(){
				disabledDay(dates)
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

            // 값을 넣지 않고 건너 뛸 경우 처리해주는 쿼리문! 
            $("form").validate({ // form태그의 유효성을 검사하겠다. submit 될 때 동작함. 
                rules: { // 규칙 
                    inn_st_date: { 
                        required : true 
                    }, 
                    to_value: { 
                        required : true 
                    }, 
                    inn_service: { 
                        required : true 
                    }, 
                    inn_add_name: { 
                        required : true 
                    }, 
                    inn_add_num: { 
                        required : true 
                    }, 
                    ptype: { 
                        required : true 
                    },
                    pname: { 
                        required : true 
                    },
                    pgender: { 
                        required : true 
                    },
                    pino: { 
                        required : true 
                    },
                    psur: { 
                        required : true 
                    },
                    pcau: { 
                        required : true 
                    }
                    
                }, 
                //규칙체크 실패시 출력될 메시지 
                messages : { 
                    inn_st_date: { 
                        required : ""
                    },
                    to_value: { 
                        required : ""
                    },
                    inn_service: { 
                        required : ""
                    },
                    inn_add_name: { 
                        required : ""
                    },
                    inn_add_num: { 
                        required : ""
                    },
                    ptype: { 
                        required : ""
                    },
                    pname: { 
                        required : ""
                    },
                    pgender: { 
                        required : ""
                    },
                    pino: { 
                        required : ""
                    },
                    psur: { 
                        required : ""
                    },
                    pcau: { 
                        required : ""
                    }
                    
                } 
            }); 
        	$.validator.addMethod( 
        		    "regex", 
        		    function(value, element, regexp) { 
        		        var re = new RegExp(regexp); 
        		        return this.optional(element) || re.test(value); 
        		    }, 
        		    "Please check your input." 
        		); 
    		
			// 데이터 형식 맞게 고쳐지게하는 코드 
            

        });
		function getDates(year,month,day){
		   if(month < 10)
		       month = '0'+month;
		   if(day < 10)
		       day = '0'+day;
		return year + '-' + month + '-' + day
   }
  function disableSomeDay(date){
      var month = date.getMonth();
      var dates = date.getDate();
      var year = date.getFullYear();

        //if($.inArray(year + '-' + (month+1) + '-' + dates,disabledDays) != -1){
        //console.log(disabledDays.indexOf(year + '-' + (month+1) + '-' + dates))
        if(disabledDays.indexOf( getDates(year, (month+1), dates)) != -1)
          return [false];
        else
          return [true];
    }
  // ui-datepicker-prev , ui-datepicker-next 이전 이후 버튼

  // 달이 넘어갈때 정보 받아오는 ajax ( 현재는 샘플코드 )
  
  // 숙박 금액3 / 숙박 일수 inn_time / 부가서비스 이용 여부 inn_service / 토탈 금액 
  // 예약하기 버튼을 호버할때 최종 금액에 대한 계산을 해주고 hidden으로 정보 보내줌.
  // 
  
  $('.inn-btn-enter').hover(function(){
		var inn_price, inn_service, inn_total_price;
		inn_price=30000;
		inn_service=20000;
		if($('.pickup').val() != "이용"){
			 inn_service = 0;
		}
		inn_total_price = inn_service + (inn_price * $('.inn-date-cnt').val());
		
		$('.innPrice').val(inn_total_price);
  })
  
  

</script>




















