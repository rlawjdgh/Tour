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
  		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#" onclick="return false;" style="pointer-events: none;">MAGACGV</a>
  		 
	  	<ul class="navbar-nav px-3">
	    	<li class="nav-item text-nowrap">
      			<a class="nav-link" href="#" onclick="return false" id="logout">Sign out</a>
    		</li> 
  		</ul>
	</nav>  
		
	<div class="container-fluid"  style="padding-top: 40px;">
  		<div class="row">
  		 
    		<nav class="col-md-2 d-none d-md-block bg-light sidebar"> 
      			<div class="sidebar-sticky">
        			<ul class="nav flex-column">
          				<li class="nav-item">
            				<a class="nav-link active" href="#" onClick="return false;" id="main">영화</a>
          				</li>
          				
          				<li class="nav-item">
            				<a class="nav-link" href="#">문의사항</a>
          				</li>
          				
          				<li class="nav-item"> 
            				<a class="nav-link" href="#">상영관 추가하기</a>
          				</li>
          				
          				<li class="nav-item"> 
            				<a class="nav-link" href="#" id="member">회원정보 관리</a> 
          				</li>
    				</ul>
				</div> 
 			</nav> 

    		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      			<h2>Member Info</h2>
      				<div class="table-responsive" id="msg"></div> 
			</main> 
  		</div> 
	</div>
	
	<script type="text/javascript">
		$(function() {
			
			var str="";
			
			$.getJSON({ 
				url:"/tour/adminGetMember",
				type:"get",
				success:function(data) {
					
					str = "<table class='table table-striped table-sm'>"; 
					str += "<thead>";
					str += "<tr>";
					str += "<th>이름</th>";
					str += "<th>아이디</th>";
					str += "<th>이메일</th>";
					str += "<th>전화번호</th>"; 
					str += "<th>포인트</th>";  
					str += "</tr>";
					str += "</thead>";  
					str += "<tbody>"; 
					
					console.log(data); 

					$(data).each(function(i,obj) {  
						
						if(obj.idx > ++i) { 
							
							str += "<tr>"; 		 
							str += "<td>"+obj.name+"</td>"; 
							str += "<td>"+obj.id+"</td>";
							str += "<td>"+obj.email+"</td>";
							str += "<td>"+obj.phone+"</td>";
							str += "<td>"+obj.point+"</td>";
							str += "<td><button type='button' data-idx='"+obj.idx+"' id='button'>삭제</button></td>";		 
							str +="</tr>";  	
						}
					});	  
					  
					str += "</tbody>";  
					str += "</table>"; 
					 
					$("#msg").html(str);
				} 
			});
			
			
			$("#msg").on("click", "#button", function() {
				
				$.ajax({
					url : '/tour/removeMember',
					type : 'get',
					data : { idx : $(this).data("idx") }, 
					success : function(result) { 
						if (result == "clear") {
							console.log(result);
							
							alert("삭제완료");
							location.reload(); 
						}
					}
				});
			});
			 
		});
		
		$("#logout").on("click", function() { 
			 $(location).attr('href', '/tour/logout'); 
		});
		
		$("#main").on("click", function() { 
			$(location).attr('href', '/tour/adminMain');    
		});
	</script>
</body> 
</html>