<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
 
	<div class="container marketing">		
		<hr class="featurette-divider">
		 
  		<h1 style="text-align:center; padding-bottom: 20px;">Recommend Movie</h1> 
		
		<div class="row featurette">
      		<div class="col-md-7 order-md-2">    
        		<h2 class="featurette-heading" style="padding-bottom: 15px;"></h2>  
        		<div class="lead"></div><br>
	        	<button type="button" class="btn btn-primary" id="booking">예매하기</button> 
      		</div>    
      		
	      	<div class="col-md-5 order-md-1"> 
	        	<img src="#" style="width: 450px; height: 450px;" id="coming">   
	      	</div>
    	</div>   
	</div>
	
	<input type="hidden" id="movieNm" value="">
	
	<script> 
		var d = new Date();
		var yy = d.getFullYear();
		var mm = d.getMonth() + 1;
		var dd = d.getDate() - 1;
		var today = `${yy}${mm}${dd}`;
		
		var rnd = Math.floor(Math.random() * 10);
		var arr = new Array();
		var movieCd = new Array();
		
		 
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
				
				$.each(data.boxOfficeResult.dailyBoxOfficeList,function(index,item){
					
					arr.push(item.movieNm);
					movieCd.push(item.movieCd); 
					
					$.getJSON({ 
						url : "/tour/uploadOne",
						data : {movieNm: arr[rnd]},
						type : "get", 
						success : function(result) {			 
							$(result).each(function(i,obj) { 
								$("#coming").attr('src', '${ pageContext.request.contextPath }/resources/upload/'+obj.filename);
							});			 	 	    
						}   
					});
				});
				 
				document.getElementById('movieNm').value = arr[rnd];
				$(".featurette-heading").text( arr[rnd] );
				show(movieCd[rnd]); 
			}, 
			error:function(){
				alert('실패');
			} 
		});
		
		function show(movieCd){
			
			str = "";
			 
			var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=d3d73e7d0bdba4769f78b1222bf012b9&movieCd=";
			url+=movieCd;
			
			$.ajax({
				url:url, 
				type:"get",
				success:function(data) {
					
					var length = $(data).find("actor").find("peopleNm").length; 
					var howPeople = ""; 
					$(data).find("actor").each(function(index) {
						if(index==length-1){
							howPeople += $(this).find("peopleNm").text();
						}else{
							howPeople += $(this).find("peopleNm").text()+", ";
						} 
					});
					    
					str = "장르 : " + $(data).find("genreNm").text() 
						+ "<br>개봉연도 : " + $(data).find("openDt").text()
						+ "<br>상영시간 : " + $(data).find("showTm").text() + " min" 
						+ "<br>감독 : " + $(data).find("director").find("peopleNm").text() 
						+ "<br>배우 : " + howPeople;  
					    
					$(".lead").html( str );  
				}, 
				error:function(){
					alert('에러발생');
				}	  
			});
		} 
	
		
		$("#booking").on("click", function() {
			$(location).attr('href', '/tour/movieTicketing?movieNm='+arr[rnd]);
			 
		});
	  
	</script>

