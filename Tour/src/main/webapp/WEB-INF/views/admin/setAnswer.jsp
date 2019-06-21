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
	
	
	문의내용:
	<br><textarea rows="6px;" cols="70px;" style="resize: none;" disabled="disabled">${content}</textarea><br>  
	답변 : <br>  
	<textarea rows="40px;" cols="70px;" id="answer" style="resize: none;"></textarea><br>  
	<input type="button" id="click" value="답변하기" onclick="return false;"><br> 
		    
	<input type="hidden" id="idx" value="${idx}">    
	<input type="hidden" id="email" value="${email}">
	<input type="hidden" id="title" value="${title}"> 
	<input type="hidden" id="content" value="${content}">  
	    
	  
	<script type="text/javascript">   
	
		$(function(){  
	
			
			 $("#click").on("click",function() { 

				 $.ajax({
					url : '/tour/answerEmail',
					type : 'get',
					data : {
						idx : $("#idx").val(),
						email : $("#email").val(),
						title : $("#title").val(), 
						content : $("#content").val(),
						answer : $("#answer").val()	
					}, 
					dataType : 'text',
					success : function(result) { 
						 if(result == "emailSuccess") {
							alert("완료"); 
							self.close();  
							opener.parent.location.reload();  
						 } 
					}
				}); 
			});  
		}); 
	</script>
</body>
</html>   