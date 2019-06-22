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
	
	
	문의내용: ${title}  
	<br><textarea rows="6px;" cols="70px;" style="resize: none;" disabled="disabled">${content}</textarea><br>  
	답변 : <br>  
	<textarea rows="40px;" cols="70px;" style="resize: none;" disabled="disabled">${answer}</textarea><br>  
	<input type="button" id="click" value="확인" onclick="return false;"><br>  
	    
	  
	<script type="text/javascript">   
	
		$(function(){  
			$("#click").on("click",function() { 
				self.close();  
			});   
		}); 
	</script>
</body>
</html>   