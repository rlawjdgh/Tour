<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/sit.css">
	
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
									<label for="person0">성인</label>
									<div class="select_box selbox1" style="width: 70px;"></div>
								</li>
								
								<li>
									<label for="person1">시니어</label>
									<div class="select_box selbox2" style="width: 70px;"></div>
								</li>
								
								<li>
									<label for="person2">장애인</label>
									<div class="select_box selbox3" style="width: 70px;"></div>
								</li>
							</ul>
							
							<p class="seat_txt2" style="">
								만 18세 미만의 고객님(영, 유아 포함)은 반드시 부모님 또는 보호자의 동반하여도 관람이 불가합니다. 
								만 18세 이상이지만 초/중/고 재학중 고객님은 영화관람이 불가합니다. 영화 관람 시, 신분증을 지참하여 주시기 바랍니다.
							</p>
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
	
		$(function(){
			
			$(document).ready(function() {
				
				for(var i = 1; i < 4; i++) {
					var str = "";
					
					str += "<a href='#0' class='ui_fold_btn show-click"+i+"'>0</a>";
					str += "<ul id='showNum"+i+"' style='width: 70px; display: none;'>";
					for(var j = 0; j < 9; j++) {
						str += "<li><a href='javascript:void(0)' class='click-person"+j"'>"+j+"</a></li>";
					}
					
					$('.selbox'+i).html(str);
				}
			});
		});
		
		/* for(var i = 1; i < 4; i++) {
			$('.selbox'+i+').on("click", ".show-click'+i+'", function() {
				$("#showNum"+i+"").css("display","block");
			});
		} */
		
	</script>
	
	
<%@include file="../includes/footer.jsp"%>