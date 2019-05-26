<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/sit.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/sit2.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/sit3.css">
	
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
	
	<form method="post" id="form1">
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
											<c:forEach var="i" begin="0" end="8" step="1">
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
											<c:forEach var="i" begin="0" end="8" step="1">
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
											<c:forEach var="i" begin="0" end="8" step="1">
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
										<div class="seat_area" style="height: 284px; margin-left: 253px;"></div>
										<span class="w_center" style="top:0px;left:731px"> 상영관 출입문 입니다.</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="btn_wrap">
					<div class="btn_inner">
						<a href="javascript:void(0);" class="btn_next Lang-LBL1025" title="결제하기">결제하기</a>
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
											    <dd class="seat_data"></dd>
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
							    <strong class="total_sum fixSum"><span>0</span> <em class="Lang-LBL1037">원</em></strong>
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
	</form>
	
	<script>
	
		$(document).ready(function() {
			
			var spanTop = 0;
			var sideTop = 26;
			
			var str = "";
			
			// 알파벳
			for(var i = 0; i < 11; i++) {
				
				var e2 = String.fromCharCode(65 + i);
				str += "<span class='seat_tit' style='left: -30px; top: "+spanTop+"px;'>"+e2+"</span>";
				
				spanTop += 26;
			}
			
			// 왼쪽 좌석
			for(var i = 1; i < 11; i++) {
				
				var e2 = String.fromCharCode(65 + i);
				var left_left = 22;
				
				for(var j = 1; j < 3; j++) {
					left_left += 26;
					str += "<a href='javascript:void(0);' class='p0 grNum3' data-seat='"+e2+j+"'";
					str += "style='left: "+left_left+"px; top: "+sideTop+"px;' title='좌석 번호:"+e2+j+" - 일반석'>"+j+"</a>";
				}
				sideTop += 26;
			}
			
			spanTop = 0;
			
			// 중앙 좌석
			for(var i = 0; i < 11; i++) {
				
				var middle_left = 92;
				var e2 = String.fromCharCode(65 + i);
				
				for(var j = 3; j < 15; j++) {
					
					middle_left += 26;
					str += "<a href='javascript:void(0);' class='p0 grNum3' data-seat='"+e2+j+"'";
					str += "style='left: "+middle_left+"px; top: "+spanTop+"px;' title='좌석 번호:"+e2+j+" - 일반석'>"+j+"</a>";
				}
				spanTop += 26;
			}
			
			sideTop = 26;
			
			// 오른쪽 좌석
			for(var i = 1; i < 11; i++) {
				
				var e2 = String.fromCharCode(65 + i);
				var top_left = 422;
				
				for(var j = 15; j < 17; j++) {
					top_left += 26;
					str += "<a href='javascript:void(0);' class='p0 grNum3' data-seat='"+e2+j+"'";
					str += "style='left: "+top_left+"px; top: "+sideTop+"px;' title='좌석 번호:"+e2+j+" - 일반석'>"+j+"</a>";
				}
				sideTop += 26;
			}
			
			$(".seat_area").html(str);
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
		
		
		
		// 이거 왜 for문으로 안되는지 모르겠음
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