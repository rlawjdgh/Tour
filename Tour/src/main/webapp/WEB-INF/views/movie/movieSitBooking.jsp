	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/sit.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/sit2.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/sit3.css">
	
	<style>
		.seat_area .on {
    		background: url(https://www.lottecinema.co.kr/LCHS/Image/Bg/bg_seat01.gif);
		}

		.seat_area .no {
    		background: url(https://www.lottecinema.co.kr/LCHS/Image/Bg/bg_disabled.gif);
    		pointer-events: none;
		}
		 
		.total_slide .total_sum { 
		    float: right;
		    padding-top: 5px;
		    font-size: 14px;
		    color: #fff;
		    text-align: center;
		}
	</style>
	  
	  
	<div class="carousel slide carousel-fade">
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid">
				<div class="carousel-caption">
					<div>
						<h3>────── FACTS & INFO ──────</h3>
						<h1>MOVIE TICKETING</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<form method="post" id="form1" action="/tour/moviePayment"> 
		<div id="container" class="sub">
			<div id="content">
				<div class="seatwrap">
					<div class="seatArea">
						<div class="seatheader"> 
							<h2 class="seatTit Lang-LBL1001">인원/좌석선택</h2>	
						</div>
						
						<div class="selectbox">
							<ul class="personSelect">
								<li> 
									<label>성인</label>
									<div class="select_box selbox1" style="width: 70px;">
										<a href="#0" class="ui_fold_btn show-click1">0</a>
										<ul id="showNum1" style="width: 70px; display: none;">
											<c:forEach var="i" begin="0" end="5" step="1">
												<li><a href='javascript:void(0)' class="click-adult" onclick="show(${i})">${i}</a></li>
											</c:forEach>
										</ul>
									</div>
								</li>
								
								<li> 
									<label>시니어</label>
									<div class="select_box selbox2" style="width: 70px;">
										<a href="#0" class="ui_fold_btn show-click2">0</a>
										<ul id="showNum2" style="width: 70px; display: none;">
						 					<c:forEach var="i" begin="0" end="5" step="1">
												<li><a href='javascript:void(0)' class="click-senior" onclick="show(${i})">${i}</a></li>
											</c:forEach>
										</ul>
									</div>
								</li>
								
								<li>
									<label>장애인</label>
									<div class="select_box selbox3" style="width: 70px;">
										<a href="#0" class="ui_fold_btn show-click3">0</a>
										<ul id="showNum3" style="width: 70px; display: none;">
											<c:forEach var="i" begin="0" end="5" step="1"> 
												<li><a href='javascript:void(0)' class="click-disabled" onclick="show(${i})">${i}</a></li>
											</c:forEach>
										</ul>
									</div>
								</li>
							</ul>
							
							<p class="seat_txt2">
								만 18세 미만의 고객님(영, 유아 포함)은 반드시 부모님 또는 보호자의 동반하여도 관람이 불가합니다. 
								만 18세 이상이지만 초/중/고 재학중 고객님은 영화관람이 불가합니다. 영화 관람 시, 신분증을 지참하여 주시기 바랍니다.
							</p>
						</div>
					</div>
				</div>
				
				<div class="mseat_wrap">
					<div class="mseat_inner">
						<div class="screen_box">
							<strong class="screen_tit">Screen</strong>
							
							<div class="screen_scroll">
								<div class="screen_Fbox seatSet1">
									<div class="seat_Barea">
										<div class="seat_area" style="height: 400px; margin-left: 253px;"></div>
										<span class="w_bottom" style="top:392px; left:696px"> 상영관 출입문 입니다.</span>
									</div>
								</div>
							</div>
						</div> 
					</div>
				</div> 
				 
				<div class="btn_wrap">
					<div class="btn_inner">
						<a href="javascript:void(0);" class="btn_next Lang-LBL1025" title="다음단계">다음단계</a>
					</div>
				</div>
				
				<div class="total_wrap">
		        <div class="total_inner">
				    <div class="total_slide total_list">
					    <ul>
						    <li>
							    <dl>
								    <dt class="total_tit Lang-LBL1026">영화</dt>
								    <dd>
									    <dl class="total_data">
											 <dd>
											    <strong class="movie_name">${movieEnterVO.movieNm}</strong>
										    </dd>
									    </dl>
								    </dd>
							    </dl>
						    </li>
						    <li>
							    <dl>
								    <dt class="total_tit Lang-LBL1027">예매정보</dt>
								    <dd>
									    <dl class="total_data">
									    	<c:forEach var="box" items="${ box }">
											    <dt class="Lang-LBL1028">상영일</dt>
											    <dd class="day_data">${movieEnterVO.day}</dd>
											    <dt class="Lang-LBL1029">상영시간</dt>
											    <dd class="time_data">${box.time}</dd>
											    <dt class="Lang-LBL1030">상영관</dt>
											    <dd class="name_data">${movieEnterVO.locName}<br>${box.boxNum}관</dd>
											    <dt class="Lang-LBL1031">좌석</dt>
											    <dd class="seat_data" id="seat_data"></dd> 
											    
											    
											    <input type="hidden" id="movieNm" value="${movieEnterVO.movieNm}">
											    <input type="hidden" id="day" value="${movieEnterVO.day}">
												<input type="hidden" id="time" value="${box.time}">
												<input type="hidden" id="locName" value="${movieEnterVO.locName}">
												<input type="hidden" id="boxNum" value="${box.boxNum}">
											</c:forEach>
									    </dl>
								    </dd>  
							    </dl>
						    </li> 	
						    
						    <li>
							    <dl>	
								    <dt class="total_tit Lang-LBL1034">총 결제 금액</dt>
								    <dd>
									    <dl class="total_data sum">
										    <dt class="Lang-LBL1035">영화예매</dt>
									    </dl>								
								    </dd>
							    </dl>
							    <strong class="total_sum fixSum"><span id="total">0</span> <em class="Lang-LBL1037">원</em></strong>
						    </li>
					    </ul>
				    </div>
		        </div>
	        </div>
				 
			</div>
		</div>
		
		<input type="hidden" id="adultNum" value=""> 
		<input type="hidden" id="seniorNum" value="">
		<input type="hidden" id="disabledNum" value="">
		
		<input type="hidden" id="boxIdx" value="${movieEnterVO.boxIdx}">
		<input type="hidden" id="people" value="0">
		<input type="hidden" id="price" value="0">
		<input type="hidden" id="seatNum" value="0">

	</form>
	 
	<script>
	
		$(document).ready(function() {
			
			var top = 0;
			var spanTop = 0;
			
			var boxIdx = Number($('#boxIdx').val());
			var day = $('#day').val();
			var movieNm = $('#movieNm').val();
			var seatReady = new Array();
			
			var str = "";

			$.getJSON({
				url : "/tour/ready_seat",
				type: "get",
				data : {
					boxIdx:boxIdx,
					day:day,
					movieNm:movieNm
				},
				success : function(data) {
					$(data).each(function(i,obj) {
						
						msg = obj.seatNum.split(',');
						for(var k = 0; k < msg.length; k++) {
							seatReady.push(msg[k]);
						}
					});
					
					seatReady = $.grep(seatReady,function(n) {
						return n == " " || n; 
					}); 
			 
					// 알파벳   
					for(var i = 0; i < 14; i++) {
						
						var e2 = String.fromCharCode(65 + i);
						str += "<span class='seat_tit' style='left: -30px; top: "+spanTop+"px;'>"+e2+"</span>";
						
						spanTop += 26;
					}
					 
					//좌석 
					for(var i = 0; i < 14; i++) {
						
						var e2 = String.fromCharCode(65 + i);
						var left = 22; 
						var right_left = 438;
						 
						for(var j = 1; j < 17; j++) {
							if(j < 3) {
								str += "<a href='javascript:void(0);' id='"+e2+j+"' class='p0 grNum3' data-seat='"+e2+j+"'";
								str += "style='left: "+left+"px; top: "+top+"px;' title='좌석 번호:"+e2+j+" - 일반석'>"+j+"</a>";
							}
							left += 26;
							
							if(j > 2 && j < 15) {
								str += "<a href='javascript:void(0);' id='"+e2+j+"' class='p0 grNum3' data-seat='"+e2+j+"'";
								str += "style='left: "+left+"px; top: "+top+"px;' title='좌석 번호:"+e2+j+" - 일반석'>"+j+"</a>";
							}
								  
							if(j > 14 && j < 17) { 
								if(j == 16) { 
									right_left = 464;
								}
								str += "<a href='javascript:void(0);' id='"+e2+j+"' class='p0 grNum3' data-seat='"+e2+j+"'";
								str += "style='left: "+right_left+"px; top: "+top+"px;' title='좌석 번호:"+e2+j+" - 일반석'>"+j+"</a>";
							}
							
							$(seatReady).each(function(index, obj) {
		 						if((e2+j) == obj) {
		 							console.log(e2+j);  
		 							str += "<a href='javascript:void(0);' id='"+e2+j+"' class='p0 grNum3 no' data-seat='"+e2+j+"'";
		 							str += "style='left: "+left+"px; top: "+top+"px;' title='좌석 번호:"+e2+j+" - 일반석'>"+j+"</a>"; 
		 						} 
							});   
							 
						}     
						top += 26;         
					}          
					    
					$(".seat_area").html(str);  
				} 
			});      
		});  
		    
		$(function(){
			
			var people;
			var str = new Array;
			var form = $("#form1");

			$(".seat_area").on("click", ".grNum3", function() {
				
				if(${logon == null}) {    
					alert("로그인 후 이용 가능합니다.");
					return false;
				} 
				
				people = Number($('#adultNum').val()) + Number($('#seniorNum').val()) + Number($('#disabledNum').val());	
				     
				if(people != 0) { 
					
					var price =  Number($('#adultNum').val() * 10000) + Number($('#seniorNum').val() * 7000) + 
					Number($('#disabledNum').val() * 5000);
					 
					if((people - str.length) <= 0) {
						alert("좌석이 인원보다 많습니다.");
						return false; 
					}      
					   
					$(this).attr('class','on');
					str.push($(this).data("seat"));
			
					document.getElementById('people').value = people;
					document.getElementById('seatNum').value = str;
					document.getElementById('price').value = price;
					
					$("#seat_data").html(str);  
					$("#total").html(price);
					      
				} else { 
					alert("인원을 선택해 주세요.");
					return false; 
				}
			});     
			
			$(".seat_area").on("click", ".on", function() {
				
				str.splice(str.indexOf($(this).data("seat")),1);
				
				$(this).attr('class','p0 grNum3');
				
				document.getElementById('seatNum').value = str;
				$("#seat_data").html(str);
			}); 
			
			$(".btn_next").on("click", function() {
				
				people = Number($('#adultNum').val()) + Number($('#seniorNum').val()) + Number($('#disabledNum').val());
				var price =  Number($('#adultNum').val() * 10000) + Number($('#seniorNum').val() * 7000) + 
				Number($('#disabledNum').val() * 5000);
				
				if(people != str.length) {
					alert("인원과 좌석이 맞지 않습니다.");
					return false;
				}
				if(price != $('#price').val()) {
					
					alert("금액이 맞지 않습니다.");
					document.getElementById('price').value = price;
					$("#total").html(price);
					
					return false;
				}
				
				form.append("<input type='hidden' name='boxIdx' value='" + $('#boxIdx').val() + "'/>")
				form.append("<input type='hidden' name='movieNm' value='" + $('#movieNm').val() + "'/>")
				form.append("<input type='hidden' name='day' value='" + $('#day').val() + "'/>")
				form.append("<input type='hidden' name='time' value='" + $('#time').val() + "'/>")
				form.append("<input type='hidden' name='locName' value='" + $('#locName').val() + "'/>")
				form.append("<input type='hidden' name='boxNum' value='" + $('#boxNum').val() + "'/>")
				form.append("<input type='hidden' name='people' value='" + $('#people').val() + "'/>")
				form.append("<input type='hidden' name='seatNum' value='" + $('#seatNum').val() + "'/>")
				form.append("<input type='hidden' name='price' value='" + price + "'/>")
				
				form.submit();
			});
	      
		});    
 
		function show(i) {
			
			$(".click-adult").on("click", function() {
				$('.show-click1').html(i);
				document.getElementById('adultNum').value = i; 
			});     
			
			$(".click-senior").on("click", function() {
				$('.show-click2').html(i);
				document.getElementById('seniorNum').value = i;
			});
			
			$(".click-disabled").on("click", function() {
				$('.show-click3').html(i);
				document.getElementById('disabledNum').value = i;
			});
			
		}     
		            
		
		$(".show-click1").on("click", function() {
			$("#showNum1").css("display","block");
		});
		$('#showNum1').mouseleave(function(){
			$("#showNum1").css("display","none");
		});
		
		
		$(".show-click2").on("click", function() {
			$("#showNum2").css("display","block");
		});
		$('#showNum2').mouseleave(function(){
			$("#showNum2").css("display","none");
		});
		
		
		$(".show-click3").on("click", function() {
			$("#showNum3").css("display","block");
		});
		$('#showNum3').mouseleave(function(){
			$("#showNum3").css("display","none");
		});
		
		
	</script>
	
	
<%@include file="../includes/footer.jsp"%>