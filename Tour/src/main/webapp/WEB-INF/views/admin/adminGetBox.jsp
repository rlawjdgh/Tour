<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head> 
<body>
	<h3>${locName}</h3> 
	<div id="box"></div><br>
	 
	<input type="text" id="boxNum" style="width: 40px;"> 관  /  
	<input type="text" id="time" style="width: 100px;"> 
	     
	<input type="hidden" id="locIdx" value="${locIdx}"><br>
	<button id="addBox">추가하기</button>
 
	<script>	
		$(function(){
			
			var str = "";
			
			$.getJSON({
				url : "/tour/loading_box", 
				data : {locIdx:$('#locIdx').val()},
				type : "get",
				success : function(data) {
					$(data).each(function(i,obj) { 
						str += obj.boxNum +"관 / " + obj.time;
						str += "<br>";  
					});  
					$("#box").html(str); 
				}
			}); 
		});	 
		
		$("#addBox").on("click", function() { 
			
			if($("#time").val() == "") {
				alert("상영시간을 입력하세요");  
				return false; 
			} 
			
			if($("#boxNum").val() == "") {
				alert("상영관을 입력하세요");  
				return false;
			} 
			 
			$.ajax({ 
				url : "/tour/addBox",  
				data : {
					locIdx:$('#locIdx').val(), 
					boxNum:$('#boxNum').val(),
					time:$('#time').val() 
				},
				type : "get",
				success : function(data) {
					if(data == "no") {
						alert("상영관이 존재합니다"); 
					} else {
						alert("완료");  
						self.close();  
						opener.parent.location.reload();  
					 } 
				}
			}); 
		});
	</script>
</body> 
</html>