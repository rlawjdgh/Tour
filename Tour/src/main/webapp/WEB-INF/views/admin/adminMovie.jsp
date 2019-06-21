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
	${movieNm}<br>
	<form method="POST" enctype="multipart/form-data" id="upload" action="/tour/upload">
		유튜브 링크 : <input type="text" id="youtube"><br>
		사진 : <input type="file" id="photo"><br><br>
		<input type="button" id="click" value="저장하기" onclick="return false;"><br>
		 
		<input type="hidden" id="movieNm" value="${movieNm}">
	</form>
	 
	
	<script type="text/javascript"> 
	
		$(function(){ 
	
			var youtube = $('#youtube');
			var photo = $('#photo');
			var upload = $('#upload'); 
			
			$("#click").on("click",function() { 
				
				if( youtube.val() == '' ) {
		            alert('링크를 작성해주세요');
		            youtube.focus();
		            return false;
		        } 
				if( photo.val() == '' ) {
		            alert('전송할 사진을 등록하세요');
		            return false; 
		        }
				
				
				var formData = new FormData($("#upload")[0]);
				formData.append("movieNm", $('#movieNm').val());
				formData.append("youtube", $('#youtube').val());
				formData.append("photo", $("#photo")[0].files[0]);

				$.ajax({ 
					type : 'post',
					url : '/tour/upload',
					data : formData,
					processData : false,
					contentType : false,
					success : function(data) {
						if(data == "ready") {
							alert($('#movieNm').val() +" 이(가) 추가되어있습니다.");
							return false; 
						} else { 
							alert("업로드 완료");
							opener.parent.location.reload(); 
							self.close(); 	
						}
					} 
				});
			});
		}); 
	</script>
</body>
</html>   