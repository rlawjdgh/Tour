<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp" %>
<html>
<head>
	<meta charset="UTF-8">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
    <!-- <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5"> -->
<title>Home</title>

	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/carousel.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script>
		$(function(){
			
			var d = new Date();
			var yy = d.getFullYear();
			var mm = d.getMonth() + 1;
			var dd = d.getDate() - 1;
			var today = `${yy}${mm}${dd}`;
			
			if(mm<10){
				mm="0"+mm;
			}
			
			if(dd<10){
				dd = "0"+dd;
			}
			
			$(document).ready(function() {
				
				var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=430156241533f1d058c603178cc3ca0e&targetDt=";
				url+= yy+mm+dd;
				
				// console.log(url);
				
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
						
						var movieList = new Array;
						var movieInfo = new Array;
						
						$(data).find("dailyBoxOffice").each(function(){

							movieList.push($(this).find("movieNm").text());
							movieInfo.push($(this).find("movieCd").text());
						});
						
						
						for(var i = 0; i < 4; i++) {
							$( '#movieNm'+[i] ).text( movieList[i] );
							
							/* 
								$('#movieInfo'+[i]).click(function () {
								console.log("movieInfo : " + movieInfo[i]);
								location.href="MovieInfo?movieCd="+movieInfo[i];
							}); 
							
							movieInfo[4]의 값만 넘어가짐.. 왜 그러는지는 모르겠음
							
							*/
						}
						
						
						$('#movieInfo'+[0]).click(function () {
							location.href="/tour/movieInfo?movieCd="+movieInfo[0];
						});
						
						$('#movieInfo'+[1]).click(function () {
							location.href="/tour/movieInfo?movieCd="+movieInfo[1];
						});
						
						$('#movieInfo'+[2]).click(function () {
							location.href="/tour/movieInfo?movieCd="+movieInfo[2];
						});
						
						$('#movieInfo'+[3]).click(function () {
							location.href="/tour/movieInfo?movieCd="+movieInfo[3];
						});
						
						
					},
					error:function(){
						alert('실패');
					}
				});
			});
		});
	</script>
    
</head>
<body>
	
	<blockquote class="blockquote text-center">
  		<h1>Moive</h1>
	</blockquote>
	
	<hr size="4px" width="170px">
	
	<div class="col text-center" style="padding-bottom: 50px;"> 
		<button type="button" class="btn btn-secondary btn-lg">Box Office</button>
		<button type="button" class="btn btn-secondary btn-lg">Latest Film</button>
		<button type="button" class="btn btn-secondary btn-lg">Coming Soon</button>
	</div>
	
	<div style="padding-left: 1500px;">
		<button type="button" class="btn btn-link">MORE</button>
	</div>
	
	<!-- 영화 정보 4개 만들 예정 -->
	<div class="row justify-content-center">
		<div class="col-sm-2">
			<div class="card" style="width: 18rem;">
		  	<img class="card-img-top" src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" alt="Card image cap">
				<div class="card-body">
		   			<h5 class="card-title" id="movieNm0"></h5>
		       		<a href="#" class="card-link" id="movieInfo0">상세보기</a>
		   			<a href="#" class="card-link">예매하기</a>
				</div>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="card" style="width: 18rem;">
		  	<img class="card-img-top" src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" alt="Card image cap">
				<div class="card-body">
		   			<h5 class="card-title" id="movieNm1"></h5>
		       		<a href="#" class="card-link" id="movieInfo1">상세보기</a>
		   			<a href="#" class="card-link">예매하기</a>
				</div>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="card" style="width: 18rem;">
		  	<img class="card-img-top" src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" alt="Card image cap">
				<div class="card-body">
		   			<h5 class="card-title" id="movieNm2"></h5>
		       		<a href="#" class="card-link" id="movieInfo2">상세보기</a>
		   			<a href="#" class="card-link">예매하기</a>
				</div>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="card" style="width: 18rem;">
		  	<img class="card-img-top" src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" alt="Card image cap">
				<div class="card-body">
		   			<h5 class="card-title" id="movieNm3"></h5>
		       		<a href="#" class="card-link" id="movieInfo3">상세보기</a>
		   			<a href="#" class="card-link">예매하기</a>
				</div>
			</div>
		</div>
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
	
</body>
</html>
