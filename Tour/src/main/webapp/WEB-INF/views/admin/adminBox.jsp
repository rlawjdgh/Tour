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
            				<a class="nav-link" href="#" id="notice" onClick="return false;">문의사항</a>
          				</li>
          				
          				<li class="nav-item"> 
            				<a class="nav-link" href="#" onClick="return false;">상영관 추가하기</a>
          				</li>
          				
          				<li class="nav-item"> 
            				<a class="nav-link" href="#" id="member" onClick="return false;">회원정보 관리</a> 
          				</li>
    				</ul>
				</div> 
 			</nav> 

    		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4"> 
      			<h2>Movie Box</h2> 
      				<div class="table-responsive">
      					<table class="table table-striped table-sm">
      						<thead>
      							<tr>
      								<th>지역</th>    
      								<th>위치</th> 
      							</tr>
      							<button id="addArea">지역 추가하기</button>
      						</thead>   
      						
      						<tbody id="msg"></tbody>
      					</table> 
      				</div> 
			</main> 
  		</div> 
	</div>
	
	<script type="text/javascript">
		$(function() {
			
			var str="";
			 
			$.getJSON({ 
				url:"/tour/adminGetArea",
				type:"get",
				success:function(data) {  
					$(data).each(function(i,obj) { 
						
						$.getJSON({  
							url : "/tour/click_loc", 
							data : {areaIdx:obj.idx}, 
							type : "get",  
							success : function(result) { 
								
								str += "<tr>";    
								str += "<td>"+obj.name+"</td>"; 
								str += "<td>";
								 
								$(result).each(function(j,item) { 
									console.log(item); 
									str += "<button type='button'id='button' data-locidx='"+item.idx+"' data-locname='"+item.locName+"' class='btn btn-link'>"+item.locName+"</button>";
									str += "<div style='padding-bottom: 10px;'></div>"; 
									          
								});
								str += "<button type='button' class='btn btn-outline-success' data-locnum='"+obj.idx+"' data-name='"+obj.name+"'id='addLoc'>추가하기</button>";
								str += "</td>";    
								str +="</tr>";
								 
								$("#msg").html(str);  
							} 
						});   
					});	  		       
					
				} 
			});
		});
		
		$("#msg").on("click", "#button", function() {		 
			
			var popUrl = '/tour/adminGetBox?locIdx='+$(this).data("locidx") +"&locName="+$(this).data("locname"); 
			var popOption = "width=500, height=360, resizable=no, scrollbars=no, status=no;";   
  
			window.open(popUrl,"",popOption);
		}); 
		
		$("#msg").on("click", "#addLoc", function() {
			
			
			var location = prompt($(this).data("name") + ": 위치를 입력 해 주세요"+"");
			
			if(location == '') {
				alert("위치를 입력 해 주세요");
				return false;
			} else { 
				$.ajax({
					url : "/tour/addLocation", 
					data : {
						locNum : $(this).data("locnum"),
						locName : location 
					}, 
					type : "get", 
					success : function(data) { 
						if(data == 'no'){
							alert("그 지역에 영화관이 있습니다"); 
						} else {
							alert("완료");
							history.go(0);
						}    
					}   
				}); 
			}
		});  
		
		$("#addArea").on("click", function() { 

			var area = prompt("지역을 입력 해 주세요"+"");
			
			if(area == '') {
				alert("지역를 입력 해 주세요");
				return false;
			} else { 
				$.ajax({
					url : "/tour/addArea", 
					data : {name : area}, 
					type : "get", 
					success : function(data) { 
						if(data == 'no'){
							alert("그 지역이 존재합니다"); 
						} else {
							alert("완료");
							history.go(0);
						}    
					}   
				}); 
			}
		});
		
		
		
		$("#logout").on("click", function() { 
			 $(location).attr('href', '/tour/logout'); 
		});
		
		$("#main").on("click", function() { 
			$(location).attr('href', '/tour/adminMain');    
		});
		
		$("#notice").on("click", function() { 
			$(location).attr('href', '/tour/adminNotice');   
		});
		
		$("#member").on("click", function() { 
			$(location).attr('href', '/tour/adminMemberInfo');   
		}); 
	</script>
</body> 
</html>