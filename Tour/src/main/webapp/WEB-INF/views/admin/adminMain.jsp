<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
  		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#" onclick="return false;">MAGACGV</a>
  		
	  	<ul class="navbar-nav px-3">
	    	<li class="nav-item text-nowrap">
      			<a class="nav-link" href="#">Sign out</a>
    		</li> 
  		</ul>
	</nav> 
		
	<div class="container-fluid"  style="padding-top: 40px;">
  		<div class="row">
  		 
    		<nav class="col-md-2 d-none d-md-block bg-light sidebar"> 
      			<div class="sidebar-sticky">
        			<ul class="nav flex-column">
          				<li class="nav-item">
            				<a class="nav-link active" href="#">영화</a>
          				</li>
          				
          				<li class="nav-item">
            				<a class="nav-link" href="#">문의사항</a>
          				</li>
          				
          				<li class="nav-item"> 
            				<a class="nav-link" href="#">상영관 추가하기</a>
          				</li>
          				
          				<li class="nav-item"> 
            				<a class="nav-link" href="#">회원정보 관리</a> 
          				</li>
    				</ul>
				</div> 
 			</nav> 

    		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      			<h2>Info</h2>
      				<div class="table-responsive" id="msg"></div> 
			</main> 
  		</div> 
	</div>
	
	<script type="text/javascript">
		$(function() {
			
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
				success:function(data) {
					 
					var str="";
						
					if(data.boxOfficeResult.dailyBoxOfficeList==""){
						alert("데이터가 없습니다.");
						$("#msg").html(str);
					}
					
					str = "<table class='table table-striped table-sm'>"; 
					str += "<thead>";
					str += "<tr>";
					str += "<th>#</th>";
					str += "<th>영화제목</th>";
					str += "</tr>";
					str += "</thead>";
					str += "<tbody>"; 

					$.each(data.boxOfficeResult.dailyBoxOfficeList,function(index,item) {
						
						str += "<tr>";
						 
						str += "<td>";
						str += item.rank +" 위";
						var rankInten=parseInt(item.rankInten);
						if(rankInten>0)
							str=str+"(▲";
							else if(rankInten<0)
								str=str+"(▼";
								else
									str=str+"(" 
						str=str+rankInten+")";  
						str += "</td>"; 
						
						str +="<td>";
						str+="<a href='#' data-moviecd='"+item.movieCd+"' data-movienm='"+item.movieNm+"' onclick='return false;' class='clickMovie'>"+item.movieNm+"</a>"; 
						str +="</td>"; 
						
						str +="</tr>";
					});
					  
					str += "</tbody>";  
					str += "</table>"; 
					 
					$("#msg").html(str);
				},
				error:function(){
					alert('실패'); 
				}
			});
			
			
			$("#msg").on("click", ".clickMovie", function() {  
				
				movieCd = $(this).data("moviecd");
				movieNm = $(this).data("movienm");
				
				var popUrl = "/tour/adminMovie?movieCd="+movieCd+"&movieNm="+movieNm;
				var popOption = "width=500, height=360, resizable=no, scrollbars=no, status=no;";

				window.open(popUrl,"",popOption);
			});
			
		});
	</script>
</body> 
</html>