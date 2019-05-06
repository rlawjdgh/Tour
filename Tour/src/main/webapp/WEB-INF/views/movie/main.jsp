<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp" %>

	<!-- 사진 슬라이드(슬라이드는 안됌)...???? -->
	<div id="carousel-2" class="carousel slide carousel-fade" data-ride="carousel" data-interval="6000">
        <ol class="carousel-indicators">
            <li data-target="#carousel-2" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-2" data-slide-to="1"></li>
            <li data-target="#carousel-2" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          
            <div class="carousel-item active">
                <a href="https://bootstrapcreative.com/">

                 <img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid">

                    <div class="carousel-caption">
                        <div>
                            <h2>Digital Craftsmanship</h2>
                            <p>We meticously build each site to get results</p>
                            <span class="btn btn-sm btn-outline-secondary">Learn More</span>
                        </div>
                    </div>
                </a>
            </div>
             
            <div class="carousel-item">
                <a href="https://bootstrapcreative.com/">
                 <img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid">

                    <div class="carousel-caption justify-content-center align-items-center">
                        <div>
                            <h2>Every project begins with a sketch</h2>
                            <p>We work as an extension of your business to explore solutions</p>
                            <span class="btn btn-sm btn-outline-secondary">Our Process</span>
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="carousel-item">
                <a href="https://bootstrapcreative.com/">
  
                 <img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid">


                    <div class="carousel-caption justify-content-center align-items-center">
                        <div>
                            <h2>Performance Optimization</h2>
                            <p>We monitor and optimize your site's long-term performance</p>
                            <span class="btn btn-sm btn-secondary">Learn How</span>
                        </div>
                    </div>
                </a>
            </div>
            
        </div>
       
        <a class="carousel-control-prev" href="#carousel-2" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carousel-2" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
	
	
	
	<blockquote class="blockquote text-center">
  		<h1>Moive</h1>
	</blockquote>
	
	<hr size="4px" width="170px">
	
	<div class="col text-center" style="padding-bottom: 50px;"> 
		<button type="button" class="btn btn-secondary btn-lg">Box Office</button>
		<button type="button" class="btn btn-secondary btn-lg">Latest Film</button>
		<button type="button" class="btn btn-secondary btn-lg">Coming Soon</button>
	</div>
	
	<div style="padding-left: 1520px;">
		<button type="button" class="btn btn-link">MORE</button>
	</div>
	
	<!-- 영화 정보 4개 만들 예정 -->
	<div class="row justify-content-center">
		<div class="col-sm-2">
			<div class="card" style="width: 18.7rem;">
		  	<img class="card-img-top" src="#" alt="Card image cap">
				<div class="card-body" style="height: 101px;">
		   			<h5 class="card-title" id="movieNm0"></h5>
		       		<a href="#" class="card-link" id="movieInfo0">상세보기</a>
		   			<a href="#" class="card-link">예매하기</a>
				</div>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="card" style="width: 18.7rem;">
		  	<img class="card-img-top" src="#" alt="Card image cap">
				<div class="card-body" style="height: 101px;">
		   			<h5 class="card-title" id="movieNm1"></h5>
		       		<a href="#" class="card-link" id="movieInfo1">상세보기</a>
		   			<a href="#" class="card-link">예매하기</a>
				</div>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="card" style="width: 18.7rem;">
		  	<img class="card-img-top" src="#" alt="Card image cap">
				<div class="card-body" style="height: 101px;">
		   			<h5 class="card-title" id="movieNm2"></h5>
		       		<a href="#" class="card-link" id="movieInfo2">상세보기</a>
		   			<a href="#" class="card-link">예매하기</a>
				</div>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="card" style="width: 18.7rem;">
		  	<img class="card-img-top" src="#" alt="Card image cap">
				<div class="card-body" style="height: 101px;">
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
			
			var movieList = new Array;
			var movieInfo = new Array;
			
			$(document).ready(function() {
				
				var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=dedf3e37049fc0fb419590fb9807a649&targetDt=";
				url+=yy+mm+dd /* 20190424 */;
				
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
						
						$(data).find("dailyBoxOffice").each(function(){
	
							movieList.push($(this).find("movieNm").text());
							movieInfo.push($(this).find("movieCd").text());
						});
						
						
						for(var i = 0; i < 4; i++) {
							$( '#movieNm'+[i] ).text( movieList[i] );
						}
						
						
						$('#movieInfo'+[0]).click(function () {
							$("#movieInfo"+[0]).attr("onClick", show(movieInfo[0]));
						});
						
						$('#movieInfo'+[1]).click(function () {
							$("#movieInfo"+[1]).attr("onClick", show(movieInfo[1]));
						});
						
						$('#movieInfo'+[2]).click(function () {
							$("#movieInfo"+[2]).attr("onClick", show(movieInfo[2]));
						});
						
						$('#movieInfo'+[3]).click(function () {
							$("#movieInfo"+[3]).attr("onClick", show(movieInfo[3]));
						});
									
					},
					error:function(){
						alert('실패');
					}
				});
			});
			
			function show(movieCd) {
				var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=dedf3e37049fc0fb419590fb9807a649&movieCd=";
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
						//form.attr('method', 'post'); 
						form.appendTo('body'); 
	
						var movieNm = $("<input type='hidden' name='movieNm' value='" + $(data).find("movieNm").text() + "'/>");
						var showTm = $("<input type='hidden' name='showTm' value='" + $(data).find("showTm").text() + "'/>");
						var director = $("<input type='hidden' name='director' value='" + $(data).find("director").find("peopleNm").text() + "'/>");
						var people = $("<input type='hidden' name='people' value='" + howPeople + "'/>");
						var openDt = $("<input type='hidden' name='openDt' value='" + $(data).find("openDt").text() + "'/>");
						var genreNm = $("<input type='hidden' name='genreNm' value='" + $(data).find("genreNm").text() + "'/>"); // 영화 장르
						
						form.append(movieNm).append(showTm).append(director).append(people).append(openDt).append(genreNm);
	
						form.submit();
				
					},
					error:function(){
						alert('에러발생');
					}
				});
			}
		});
	</script>

<%@include file="../includes/footer.jsp" %>  