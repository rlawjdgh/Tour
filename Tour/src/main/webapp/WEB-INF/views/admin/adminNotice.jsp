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
            				<a class="nav-link" href="#" onClick="return false;" id="notice">문의사항</a>
          				</li>
          				
          				<li class="nav-item"> 
            				<a class="nav-link" href="#" onClick="return false;">상영관 추가하기</a>
          				</li>
          				
          				<li class="nav-item"> 
            				<a class="nav-link" href="#" onClick="return false;" id="member">회원정보 관리</a> 
          				</li>
    				</ul>
				</div> 
 			</nav> 

    		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      			<h2>Notice</h2>  
      			<Button class="noAnswer" id="noticeBtn">미처리</Button> 
      				<div class="table-responsive" id="msg"></div> 
			</main>  
  		</div> 
	</div>
	
	<script type="text/javascript"> 
	
		$("#noticeBtn").on("click", function() {
			if( $(this).html() == '미처리' ) {
			      $(this).html('전체보기');
			      $(this).attr('class','noAnswer');
			      
			    } 
			    else {
			      $(this).html('미처리'); 
			      $(this).attr('class','allAnswer');
			    }  
		});
	
		$(document).ready(function() {
			
			$(".px-4").on("click", ".noAnswer", function() {
			
				var str="";  
				 
				$.getJSON({ 
					url:"/tour/adminGetNotice",
					type:"get",
					success:function(data) {
						
						str = "<table class='table table-striped table-sm'>"; 
						str += "<thead>";
						str += "<tr>";
						str += "<th>번호</th>";
						str += "<th>아이디</th>";
						str += "<th>제목</th>"; 
						str += "<th>이메일</th>";					 
						str += "<th>진행사항</th>";		 			
						str += "</tr>";
						str += "</thead>";  
						str += "<tbody>"; 
						
						console.log(data); 
	
						$(data).each(function(i,obj) {  
								 
							if(obj.done == 0) {
								 
								str += "<tr>"; 		 
								str += "<td>"+obj.memberIdx+"</td>"; 
								str += "<td>"+obj.id+"</td>";
								str += "<td>"+obj.title+"</td>";
								str += "<td>"+obj.email+"</td>";
								str += "<td><button type='button' data-idx='"+obj.idx+"' data-email='"+obj.email+"'"; 
								str += "data-title='"+obj.title+"' data-content='"+obj.content+"' id='button' onclick='return false;'>답변하기</button></td>";		 
								str +="</tr>"; 
							}    
						});	  
						   
						str += "</tbody>";  
						str += "</table>"; 			 
						$("#msg").html(str);
					} 
				});
			}); 
			
			$('.noAnswer').trigger('click');  
		});
		 
		
		$(".px-4").on("click", ".allAnswer", function() {	 
			  
			var str=""; 
			
			$.getJSON({
				url:"/tour/adminGetNotice",
				type:"get",
				success:function(data) {
					
					str = "<table class='table table-striped table-sm'>"; 
					str += "<thead>";
					str += "<tr>";
					str += "<th>번호</th>";
					str += "<th>아이디</th>";
					str += "<th>제목</th>"; 
					str += "<th>이메일</th>";					
					str += "<th>진행사항</th>";		 			
					str += "</tr>";
					str += "</thead>";  
					str += "<tbody>"; 

					$(data).each(function(i,obj) {  	
							 
						str += "<tr>"; 		 
						str += "<td>"+obj.memberIdx+"</td>"; 
						str += "<td>"+obj.id+"</td>";
						str += "<td>"+obj.title+"</td>";
						str += "<td>"+obj.email+"</td>";
						if(obj.done == 1) {
							str += "<td><button type='button' data-title='"+obj.title+"' data-content='"+obj.content+"'";
							str += "data-answer='"+obj.answer+"'id='answerButton'>완료</button></td>";
							str +="</tr>";   
						} else { 
							str += "<td><button type='button' data-idx='"+obj.idx+"' data-email='"+obj.email+"'";
							str += "data-title='"+obj.title+"' data-content='"+obj.content+"' id='button'>답변하기</button></td>";		 
							str +="</tr>";  
						} 
						   
					});	   
					   
					str += "</tbody>";  
					str += "</table>"; 
					 
					$("#msg").html(str);
				}  
			}); 
			 
			$(this).html('미처리');
			$(this).attr('class','noAnswer');
		});
		
		
		$("#msg").on("click", "#answerButton", function() {
			
			title = $(this).data("title"); 
			content = $(this).data("content"); 
			answer = $(this).data("answer"); 
			 
			var popUrl = "/tour/reviewAnswer?title="+title+"&content="+content+"&answer="+answer; 
			var popOption = "width=500, height=360, resizable=no, scrollbars=no, status=no;";  
 
			window.open(popUrl,"",popOption); 
		});
		
		$("#msg").on("click", "#button", function() {
			
			idx = Number($(this).data("idx")); 
			email = $(this).data("email"); 
			title = $(this).data("title");  
			content = $(this).data("content");
			 
			var popUrl = "/tour/setAnswer?idx="+idx+"&email="+email+"&content="+content+"&title="+title;
			var popOption = "width=500, height=360, resizable=no, scrollbars=no, status=no;";  

			window.open(popUrl,"",popOption); 
		});
		
		
		
		$("#logout").on("click", function() { 
			 $(location).attr('href', '/tour/logout'); 
		});
		
		$("#main").on("click", function() { 
			$(location).attr('href', '/tour/adminMain');    
		});
		
		$("#member").on("click", function() { 
			$(location).attr('href', '/tour/adminMemberInfo');   
		});
	</script>
</body>  
</html>