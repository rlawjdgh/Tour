<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		init();	
		$("#bt1").click(function(){
			var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=430156241533f1d058c603178cc3ca0e&targetDt=";
			
			url+= $("#txtYear").val()+$("#selMon").val()+$("#selDay").val();
			/* console.log(url); */
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
						//순위
						str+=$(this).find("rank").text()+" 위";
						//증감
						var rankInten=parseInt($(this).find("rankInten").text());
						if(rankInten>0)
							str=str+"(▲";
							else if(rankInten<0)
								str=str+"(▼";
								else
									str=str+"("
						str=str+rankInten+") : ";
						//영화이름
						var movieNm=$(this).find("movieNm").text()+"<br>";
						str+="<a href='#' onclick='show("+$(this).find("movieCd").text()+")'>"+movieNm+"</a>";
						
						$("#msg").html(str);
					});
				},
				error:function(){
					alert('실패');
				}
			});
		});
	});
			
	function show(movieCd){
		var url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?key=430156241533f1d058c603178cc3ca0e&movieCd=";
		url+=movieCd;
		console.log(url);
		
		$.ajax({
			url:url,
			type:"get",
			success:function(data){
				var str="<ul>";
				
				var movieNm = $(data).find("movieNm").text();
				var movieNmEn = $(data).find("movieNmEn").text();
				var showTm = $(data).find("showTm").text();
				var director = $(data).find("director").find("peopleNm").text();
				
				var length = $(data).find("actor").find("peopleNm").length;
				var people = "";
				$(data).find("actor").each(function(index){
					if(index==length-1){
						people += $(this).find("peopleNm").text();
					}else{
						people += $(this).find("peopleNm").text()+",";
					}
				});
				str+="<li>영화제목 : " + movieNm + "<li><br>";
				str+="<li>영어제목 : " + movieNmEn + "<li><br>";
				str+="<li>상영시간 : " + showTm+ "분<li><br>";
				str+="<li>감독 : " + director+ "<li><br>";
				str+="<li>출연배우 : " + people + "<li><br>"
				$(".box3").html(str);	
			},
			error:function(){
				alert('에러발생');
			}
		});
	}
			
	function init(){
		//오늘 날짜 확인
		var newDate = new Date();
		var year = newDate.getFullYear();
		var month = newDate.getMonth()+1; //0~11사이로 가져오기 때문에 +1
		var day = newDate.getDate()-1;	//어제날짜로만 조회가능하기 때문에 -1
		
		//year값을 txtYear 안에 보여주기
		$("#txtYear").val(year);
		
		//month 값을 selMon 안에
		if(month<10){
			month="0"+month;
		}
			$("#selMon").val(month);
		//day 값을 selDay안에 
		if(day<10){
			day = "0"+day;
		}
		$("#selDay").val(day);
	}
</script>
<title>Insert title here</title>
<style>
	body{margin:10px;}
	.box{width:400px; background-color: green; color:white; padding:15px; text-align:center}
	.box2{width:400px; display:block; margin-top:15px; text-align: center;}
	#msg{border-radius: 5px; border: 2px solid #73AD21; padding:10px; padding-left: 20px; margin-top: 15px; 
		width:400px; height:200px; font-size: 14px; text-align: left; overflow:  auto;}
	ul{list-style-type:none;}
	a{text-decoration: none; color: black;}
	.box3{text-align: left;}
</style>
</head>
<body>
	<div class="box1">일별 박스오피스</div>
	<div class="box2">
		<input type="text" name="txtYear" id="txtYear" size="6" />년
		<select id="selMon">
			<option value="01">1월</option>
			<option value="02">2월</option>
			<option value="03">3월</option>
			<option value="04">4월</option>
			<option value="05">5월</option>
			<option value="06">6월</option>
			<option value="07">7월</option>
			<option value="08">8월</option>
			<option value="09">9월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="12">12월</option>
		</select>
		<select id="selDay">
			<option value="01">1일</option>
			<option value="02">2일</option>
			<option value="03">3일</option>
			<option value="04">4일</option>
			<option value="05">5일</option>
			<option value="06">6일</option>
			<option value="07">7일</option>
			<option value="08">8일</option>
			<option value="09">9일</option>
			<option value="10">10일</option>
			<option value="11">11일</option>
			<option value="12">12일</option>
			<option value="13">13일</option>
			<option value="14">14일</option>
			<option value="15">15일</option>
			<option value="16">16일</option>
			<option value="17">17일</option>
			<option value="18">18일</option>
			<option value="19">19일</option>
			<option value="20">20일</option>
			<option value="21">21일</option>
			<option value="22">22일</option>
			<option value="23">23일</option>
			<option value="24">24일</option>
			<option value="25">25일</option>
			<option value="26">26일</option>
			<option value="27">27일</option>
			<option value="28">28일</option>
			<option value="29">29일</option>
			<option value="30">30일</option>
			<option value="31">31일</option>
		</select>
		<input type="button" value="확인" id="bt1" />
		<div id="msg"></div>
		<div class="box3"></div>
	</div>


</body>
</html>