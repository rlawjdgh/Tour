<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	var keyword = "${keyword}";

	var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=430156241533f1d058c603178cc3ca0e&movieNm=";
	url+=keyword;
	
	$.ajax({
		url:url,
		type:"get",
		success:function(data){
			console.log(data);
			var str="";
			
			/* if(data.movieListResult.searchMovieList==""){
				alert("데이터가 없습니다.");
			} */
			
			$.each(data.movieListResult.movieList,function(index,item){ 
				str+="<li><div class='card mb-3'><div class='row no-gutters'>";
				str+="<div class='col-md-2'><img src='...' class='card-img' alt='...'></div>";
				str+="<div class='col-md-5'><div class='card-body'>";
				str+="<a class='card-title result-one' href='#' data-moviecode='" + item.movieCd + "'><h5>"+ item.movieNm + "(" + item.movieNmEn +")" + "</h5></a>";
				str+="<p class='card-text lead'>";
				str+="국가 : " + item.nationAlt + "<br>";
				str+="장르 : " + item.genreAlt + "<br>";
				str+="개봉 : " + item.prdtYear + "</p>";
				str+="</div></div></div></div></li>";				
			});
			$(".result-list").append(str);
		},
		error:function(){
			alert('실패');
		}
	});
	
	$(".result-list").on("click",".result-one", function(){
		var code =$(this).data("moviecode");
		console.log("~~");
		var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=430156241533f1d058c603178cc3ca0e&movieCd=";
		url+=code;
		
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
				var openDt = $("<input type='hidden' name='openDt' value='" + $(data).find("prdtYear").text() + "'/>");
				var genreNm = $("<input type='hidden' name='genreNm' value='" + $(data).find("genreNm").text() + "'/>"); // 영화 장르
				
				form.append(movieNm).append(showTm).append(director).append(people).append(openDt).append(genreNm);
				form.submit();
			},
			error:function(){
				alert('에러발생');
			}
		});
		
	});
	
});

</script>
</head>
<body>
<div class="container mt-5">
	<p>"${keyword }" 검색결과</p>
	<div class="result justify-content-center">
		<ul class="result-list"></ul>
	</div>
</div>
</body>
</html>