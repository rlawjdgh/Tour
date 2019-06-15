<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp" %>

	
	<!-- 사진 슬라이드(슬라이드는 안됨)...???? -->
	<div id="carouselExampleCaptions" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleCaptions" data-slide-to="0"class="active"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="#" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>First slide label</h5>
					<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Second slide label</h5>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Praesent commodo cursus magna, vel scelerisque nisl
						consectetur.</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev"> 
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
			<span class="sr-only">Previous</span>
		</a> 
		<a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> 
			<span class="sr-only">Next</span>
		</a>
	</div>

	<blockquote class="blockquote text-center">
		<h1>Moive</h1>
	</blockquote>

	<hr size="4px" width="170px">
	 
	<div style="padding-left: 1340px;">
		<button type="button" class="btn btn-link show-more">MORE</button>
	</div>
	
	<!-- 순위권 영화 목록 -->
	<div class="row justify-content-center mvList" style="width: 100%"> 
		<c:forEach var="i" begin="0" end="4" step="1">  
			<div class="col-sm-2">  
				<div class="card" style="width:15rem;">    
			  		<img class="card-img-top" src="#" alt="img-thumbnail" id="src${i}" style="width: 239px; height: 250px;"> 
					<div class="card-body" style="height: 101px;" id="movieCode">  
			   			<h5 class="card-title" id="movieNm${i}" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></h5>
			       		<a href="#" class="card-link" id="movieInfo${i}" onclick="return false">상세보기</a>
			   			<a href="#" class="card-link" id="movieBook${i}" onclick="return false">예매하기</a>
					</div>
				</div>  
			</div>   
		</c:forEach>
	</div>   
	
	<div class="row justify-content-center mvList hiding" style="padding-top: 40px; width: 100%;">
		<c:forEach var="i" begin="5" end="9" step="1">
			<div class="col-sm-2">
				<div class="card" style="width:15rem;">
			  		<img class="card-img-top" src="#" alt="img-thumbnail" id="src${i}" style="width: 239px; height: 250px;">
					<div class="card-body" style="height: 101px;" id="movieCode">
			   			<h5 class="card-title" id="movieNm${i}" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"></h5>
			       		<a href="#" class="card-link" id="movieInfo${i}" onclick="return false">상세보기</a>
			   			<a href="#" class="card-link" onclick="return false">예매하기</a>
					</div> 
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div class="container marketing">		
		<hr class="featurette-divider">
		
  		<h1 style="text-align:center; padding-bottom: 20px;">Coming Soon</h1>
		
		<div class="row featurette">
      		<div class="col-md-7 order-md-2">
        		<h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        		<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
      		</div>
      		
	      	<div class="col-md-5 order-md-1">
	        	<svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500">
	        		<title>Placeholder</title>
	        		<rect width="100%" height="100%" fill="#eee"></rect>
	        		<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
	        	</svg>
	      	</div>
    	</div>
	</div>
	
	<script>
		$(function(){
			
			var switch1 = 0;
			$(".hiding").css("display","none");		
			$(".show-more").on("click",function(){
				if(switch1==0){
					$(".hiding").fadeIn(500);
					$(".show-more").html("HIDE");
					switch1 = !switch1;
				}else{
					$(".hiding").fadeOut(500);
					$(".show-more").html("MORE");
					switch1 = !switch1;
				}
			});
			
			var d = new Date();
			var yy = d.getFullYear();
			var mm = d.getMonth() + 1;
			var dd = d.getDate() - 1;
			var today = `${yy}${mm}${dd}`;
			
			if(mm<10){mm="0"+mm;}
			if(dd<10){dd = "0"+dd;}
			
			//박스오피스 얻어오기
			var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=d3d73e7d0bdba4769f78b1222bf012b9&targetDt=";
			url+=yy+mm+dd 
			
			$.ajax({
				url:url,
				type:"get",
				success:function(data){
					console.log(data);
					var str="";
						
					if(data.boxOfficeResult.dailyBoxOfficeList==""){
						alert("데이터가 없습니다.");
						$("#msg").html(str);
					}
					
					$.each(data.boxOfficeResult.dailyBoxOfficeList,function(index,item){ //boxOfficeResult : json안에 젤 바깥 키
					
						$.getJSON({ 
							url : "/tour/uploadOne",
							data : {movieNm: item.movieNm},
							type : "get", 
							success : function(result) {
								console.log(result);
								$(result).each(function(i,obj) { 
									$("#src"+index).attr('src', '${ pageContext.request.contextPath }/resources/upload/'+obj.filename);
								});					   
							} 
						});
						 
						$("#movieNm"+index).text( item.movieNm );
						
						$('#movieInfo'+index).click(function() {
							$("#movieInfo"+index).attr("onClick", show(item.movieCd));
						});
						$('#movieBook'+index).click(function() {
							$("#movieInfo"+index).attr("onClick", book(item.movieNm));
						});
						
					});
								
				},
				error:function(){
					alert('실패');
				}
			});
	
			function show(movieCd){
				console.log(movieCd);
				var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=d3d73e7d0bdba4769f78b1222bf012b9&movieCd=";
				url+=movieCd;
				
				$.ajax({
					url:url, 
					type:"get",
					success:function(data){
						var length = $(data).find("actor").find("peopleNm").length; 
						var howPeople = ""; 
						$(data).find("actor").each(function(index){
							if(index==length-1){
								howPeople += $(this).find("peopleNm").text();
							}else{
								howPeople += $(this).find("peopleNm").text()+", ";
							}
						});
						
						var form = $('<form></form>'); 
						form.attr('action', '/tour/movieInfo'); 
						form.attr('method', 'get'); 
						form.appendTo('body'); 
	
						var movieNm = $("<input type='hidden' name='movieNm' value='" + $(data).find("movieNm").text() + "'/>");
						var showTm = $("<input type='hidden' name='showTm' value='" + $(data).find("showTm").text() + "'/>");
						var director = $("<input type='hidden' name='director' value='" + $(data).find("director").find("peopleNm").text() + "'/>");
						var people = $("<input type='hidden' name='people' value='" + howPeople + "'/>");
						var openDt = $("<input type='hidden' name='openDt' value='" + $(data).find("openDt").text() + "'/>");
						var genreNm = $("<input type='hidden' name='genreNm' value='" + $(data).find("genreNm").text() + "'/>");
						
						form.append(movieNm).append(showTm).append(director).append(people).append(openDt).append(genreNm);
	
						form.submit();
				
					},
					error:function(){
						alert('에러발생');
					}
				});
			}
			
			function book(movieNm) {
				var form = $('<form></form>'); 
				form.attr('action', '/tour/movieTicketing'); 
				form.attr('method', 'get'); 
				form.appendTo('body');

				var movieNm = $("<input type='hidden' name='movieNm' value='" + movieNm + "'/>");
				
				form.append(movieNm);
				form.submit();
			}
		});
	</script>

<%@include file="../includes/footer.jsp" %>  