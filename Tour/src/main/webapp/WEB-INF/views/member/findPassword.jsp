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
	<h1>비밀번호 찾기</h1><br>  
	ID : <input type="text" id="id"><br> 
	E-MAIL : <input type="text" id="email"><br><br>
	
	<input type="button" id="click" value="찾기"><br>
	
	
	<script type="text/javascript">
	 
		$("#click").on("click", function() {
			
			$.ajax({
				url : '/tour/getPassword',
				type : 'get',
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},  
				success : function(result) {
					if(result == "notexist") {
						alert("아아디 및 이메일이 잘못되었습니다");
					} else {
						alert("비밀번호는 이메일에서 확인하실 수 있습니다");
						self.close(); 
					}
				}
			});
		}); 
	</script> 
</body>
</html>  