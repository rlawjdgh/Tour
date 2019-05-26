<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/ticketing.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/box.css">

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

	<div class="container">
		<div class="ticket_inner">
			<div class="ticket_step">
				<div class="ticket_left">
					<dl class="theater_header">					
						<dt>
							<button type="button" class="btn btn-outline-danger">날짜선택</button>
							<!-- 날짜선택 : <input type="text" style="width: 180px; height: 30px;"> -->
						</dt>       
                    </dl>
                    
                    <dl class="ticket_My">
                    	<dt>영화관</dt>
                    </dl>
                    
                    <div class="theater_cont">
                    	<div class="tab_srcoll">
                    		
                    		<ul class="theater_zone">
                    			<c:forEach var="area" items="${area}">
                   					<li class="theater_zone">
                   						<button type="button" class="btn btn-secondary" onclick="areaClick( ${ area.idx } );">${area.name}</button><br>
                   					</li>
                   				</c:forEach>
                   				
                   				<div class="area_cont on locNum"></div>
                    		</ul>
                    	</div>
                    </div>  	
				</div>
				
				<div class="ticket_right">
					<dl class="theater_header">
						<dt class="Lang-LBL0011">영화</dt>
					</dl>
					
					<div class="movie_cont">
						<div class="scroll_bar" style="overflow: auto;">
							<ul class="movie_list">
								<li style="padding-bottom: 15px;">
									<div id="msg"></div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
	
			<div class="selectMv_Area">
				<dl class="txtdate">
					<dt class="Lang-LBL0015">상영일 : </dt>
					<dd><div id="box1"></div></dd>
				</dl>
				
				<dl class="txtCin">
					<dt class="Lang-LBL0015">영화관 : </dt>
					<dd><div id="box2" class="loc"></div></dd>
				</dl>
				
				<dl class="txtName">
					<dt class="Lang-LBL0015">영화 : </dt>
					<dd><div id="box3"></div></dd>
				</dl>
				<button type="button" class="btn btn-outline-success" id="btnOk">확인</button>
			</div>
		</div>	
		
		<div class="time_inner">
			<div class="time_stop">
				<h3 class="sub_tit02">
					<span class="Lang-LBL0020">상영시간</span>
					<span class="sub_etc Lang-LBL0021">예고편 상영 등으로 시작이 10여분 정도 차이 날 수 있습니다.</span>
				</h3>
			</div>
			
			<div class="time_noData" id="box4" style="display: block;">
				<span class="noData Lang-LBL0027">상영시간이 조회되지 않았습니다.</span>
			</div>
			
			<div class="time_box time_list02" id="box5" style="display: none;"></div>
		</div>
	</div>
	
	<input type="hidden" id="click-today" value="2019-05-20">
	<input type="hidden" id="click-locIdx" value="">
	<input type="hidden" id="click-locName" value="">
	<input type="hidden" id="click-movieNm" value="">
	
	
	<script>
	
		$(function(){
			
			var d = new Date();
			var yy = d.getFullYear();
			var mm = d.getMonth() + 1;
			var dd = d.getDate() - 1;
		
			var ddd = d.getDate();
			
			if(mm<10){
				mm="0"+mm;
			}			
			if(dd<10){
				dd = "0"+dd;
			}
			if(ddd<10){
				dd = "0"+dd;
			}
			
			$(document).ready(function() {

				// $("#box1").html(mm +"월" + ddd+"일");
				$("#box1").html("05월20일");
				
				var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=d3d73e7d0bdba4769f78b1222bf012b9&targetDt=";
				url+=yy+mm+dd;
				
				$.ajax({
					url:url,
					type:"get",
					success:function(data){
						console.log(data);
						var str="";
						
						if($(data).find("dailyBoxOffice").text()==""){
							alert("데이터가 없습니다.");
							$("#msg").html(str);
						}
						
						$(data).find("dailyBoxOffice").each(function(){
							
							var movieNm=$(this).find("movieNm").text();
							str +="<a href='#' onclick='show("+$(this).find("movieCd").text()+"); return false;'>"+movieNm+"</a><br><br>";
							$("#msg").html(str);
						});
					},
					error:function(){
						alert('실패');
					}
				});
				
				$.getJSON({
					url : "/tour/ready_loc",
					data : {areaIdx:1},
					type : "get",
					success : function(data) {
						
						console.log(data);
						var str = "";
						
						str+= "<ul class='area_list'>";
						$(data).each(function(i,obj){
							str += "<li><button class='btn btn-outline-primary loc' data-name='"+obj.locName+"' data-locidx='"+obj.idx+"'>"+obj.locName+"</button></li>";
						});	
						str+="</ul>";
						
						$(".locNum").html(str);
					} 
				});
				
			});
		});
		
		function show(movieCd){
	
			var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=d3d73e7d0bdba4769f78b1222bf012b9&movieCd=";
			url+=movieCd;
			
			$.ajax({
				url:url,
				type:"get",
				success:function(data){
		
					var movieNm = $(data).find("movieNm").text();
					$("#box3").html(movieNm);
					document.getElementById('click-movieNm').value = movieNm;
	
				},
				error:function(){
					alert('에러발생');
				}
			});
		};
		
		function areaClick(areaIdx){
			
			$.getJSON({
				url : "/tour/click_loc",
				data : {areaIdx:areaIdx},
				type : "get",
				success : function(data) {
					
					console.log(data);
					var str = "";
					
					str+= "<ul class='area_list'>";
					$(data).each(function(i,obj){
						str += "<li><button class='btn btn-outline-primary loc' data-name='"+obj.locName+"' data-locidx='"+obj.idx+"'>"+obj.locName+"</button></li>";
					});	
					str+="</ul>";
					
					$(".locNum").html(str);
				} 
			});	
		};
		
		$(".locNum").on("click", ".loc", function() {
			
			var locIdx = $(this).data("locidx");
			var locName = $(this).data("name");
			document.getElementById('click-locName').value = locName;
			document.getElementById('click-locIdx').value = locIdx;
			
			$("#box2").html(locName);
		});
		
		$("#btnOk").on("click", function() {
			
			if($('#click-today').val() == "") {
				alert("날짜를 선택해주세요.");
				return false;
			}
			if($('#click-locName').val() == "") {
				alert("위치를 지정해주세요");
				return false;
			}
			if($('#click-movieNm').val() == "") {
				alert("영화를 선택해 주세요");
				return false;
			}
			
			$("#box4").css("display","none");
			$("#box5").css("display","block");
			
			$.getJSON({
				url : "/tour/loading_box",
				data : {locIdx:$('#click-locIdx').val()},
				type : "get",
				success : function(data) {
					console.log(data);
					
					if(data.length == 0) {
						$("#box4").css("display","block");
						$("#box5").css("display","none");
					}
					
					var str = "";
					
					str += "<div class='time_aType time1005'>";
					str += "<h5 class='time_tit'>"+$('#click-locName').val();
					str += "</h5>";
					str += "<dl class='time_line movie14156'>";
					str += "<dt>"+$('#click-movieNm').val();+"</dt>";
					str += "<dd>";
					str += "<ul class='theater_time list14122' screendiv='100'>";
					$(data).each(function(i,obj){
						str += "<li>"
						str += "<a href='javascript:void(0);' class='time_active t0' title='화면이동' data-boxidx='"+obj.idx+"'>";
						str += "<span class='cineD2'><em>"+obj.boxNum+"관</em></span>";
						str += "<span class='clock'>"+obj.time+"~</span>";
						str += "</li>"
					});
					str += "</ul>";
					str += "</dd>";
					str += "</dl>";
					str += "</div>";
					
					$("#box5").html(str);
				}
			});
		});
		
		$("#box5").on("click", ".t0", function() {
			
			/* if(${logon == null}) {
			alert("로그인 후 이용 가능합니다.");
			return false;
			} */
			
			var form = $('<form></form>'); 
			form.attr('action', '/tour/movieSitBooking'); 
			form.attr('method', 'get'); 
			form.appendTo('body'); 
			
			var day = $("<input type='hidden' name='day' value='"+$('#click-today').val()+"'/>");
			var boxIdx = $("<input type='hidden' name='boxIdx' value='"+$(this).data("boxidx")+"'/>");
			var locName = $("<input type='hidden' name='locName' value='"+$('#click-locName').val()+"'/>");
			var movieNm = $("<input type='hidden' name='movieNm' value='"+$('#click-movieNm').val()+"'/>");
			
			form.append(day).append(boxIdx).append(locName).append(movieNm);

			form.submit();
		});
	
	</script>


<%@include file="../includes/footer.jsp"%>
