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
	제목 : <input type="text" id="title"><br> 
	내용 <br>
	<textarea rows="10" cols="50" id="content"></textarea><br><br>
	<input type="button" id="click" value="등록하기"><br>
	
	<input type="hidden" id="email" value="${logon.email }">
	<input type="hidden" id="idx" value="${logon.idx }">
	
	<script type="text/javascript">
	 
		$("#click").on("click", function() {
			
			$.ajax({
				url : '/tour/setNotice',
				type : 'get',
				data : {memberIdx : Number($("#idx").val()), 
						email : $("#email").val(),
						title : $("#title").val(), 
						content : $("#content").val()}, 
				success : function(result) {
					if (result == "clear") {
						console.log(result);
						
						alert("답변은 이메일로 확인하실 수 있습니다."); 
						self.close();  
					}
				}
			});
		}); 
	</script> 
</body>
</html> 