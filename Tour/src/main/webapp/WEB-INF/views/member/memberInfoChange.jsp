<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberInfo.css">
</head>
<body>
	<div id="mast-head">
		<div class="container">
			<h1 class="title" id="mastHeadTitle">회원정보변경</h1>
		</div>	
	</div>
	
	<div id="mast-body">
		<div class="container"> 
		 
			<div class="headline __high">
				회원정보를<br>정확하게 입력해주세요.
			</div>
			
			<div class="section __half">
				<h3 class="subject __underline">
					<em>회원정보입력</em>
		        </h3>
	        
		        <div class="row">
	          		<div class="col-md">
	            		<label>이름</label>
	          		</div>
	          		<div class="col-md">
	            		<div class="ui-input __disable">
	              			<label>${logon.name }</label>
	            		</div>
	          		</div>
        		</div>
        	
	        	<div class="row">
	          		<div class="col-md">
	            		<label>E-Mail </label>
	          		</div> 
	          		<div class="col-md">
	            		<div class="ui-input __disable">
	              			<label>${logon.email }</label>
	            		</div>
	          		</div>
	        	</div>
        	
	        	<div class="row">
		        	<div class="col-md">
		            	<label>휴대폰 번호</label>
		          	</div>
		           	<div class="col-md">				
		        		<div class="form-wrap __mobile __x4">
		        			<div class="inner">
			        			<div class="ui-input active">
		              				<input type="tel" value="0${logon.phone }" style="width: 150px;" id="phone">  
		                	 	</div>
		              		</div>
		             	</div> 
		          	</div>
		      	</div> 
        	   
	        	<div class="row">  
		        	<div class="col-md"> 
		            	<label>비밀번호</label><br><br>  
		            	<label>비밀번호 변경</label>  
		          	</div>   
		           	<div class="col-md">				  
		        		<div class="form-wrap __mobile __x4">
		        			<div class="inner">
			        			<div class="ui-input active">
		              				<input type="password" value="${logon.password }" style="width: 150px;" id="nowPass">  
		                	 	</div>
		                	 	<br><br>  
		                	 	<div class="ui-input active">  
		              				<input type="password" value="" style="width: 150px;" id="newPass"> 		                			 
		                	 	</div>  
		                	 	
			                	 	<div class="ui-input active">
		              				<input type="password" placeholder="비밀번호 확인" style="width: 150px;" id="confirmPass">     
	                			</div>  
		              		</div>    
		             	</div>  
		          	</div>
		      	</div>  
			</div>  
		</div> 
       	
       	<div class="section __half __center"> 
			<button type="button" class="ui-button __square-large __black" id="prev" onclick="return false;">취소</button>
			<button type="button" class="ui-button __square-large __blue" id="next" onclick="return false;">확인</button>
		</div>
	</div> 
	
	<input type="hidden" id="email" value="${logon.email}">
	
	
	<script type="text/javascript">
	
		$("#prev").click(function(){	
			window.history.back();
		});
		
		$(function(){
			
			var phone = $('#phone');
			var nowPass = $('#nowPass');
			var newPass = $('#newPass');
			var confirmPass = $('#confirmPass');
			var goPass = ""; 
			
			
			
			$("#next").click(function(){	
				
				var regPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
				
				if( phone.val() == '' ){
		            alert('전화번호를 입력 해 주세요');
		            phone.focus();
		            return false;
		        } else {
		            if(!regPhone.test(phone.val())) {
		                alert('전화번호를 정확히 입력 해 주세요');
		                phone.focus();
		                return false;
		            }
		        }
				
				if(nowPass.val() != ${logon.password}) { 
					alert("현재 비밀번호가 일치하지 않습니다");
					nowPass.focus();
				} else if(newPass.val() == '' ) { 
					goPass = nowPass.val();
				} else if(newPass.val() != confirmPass.val()) {
					alert("바꿀 비밀번호와 확인한 비밀번호가 일치하지 않습니다");
					newPass.focus(); 
				} else { 
					goPass = confirmPass.val();
				}
				  
				$.ajax({
					url : "/tour/reInsert",
					data : {
						idx : ${logon.idx},
						password : goPass,
						phone : phone.val(),
						email : $("#email").val()
					},
					type : "post", 
					success : function(data) {
						
						if(data == "clear") {
							alert("변경되었습니다. 다시 로그인 해주세요"); 
							$(location).attr('href', "/tour/"); 
						} else {
							alert("실패"); 
						}
					}
				});
				  
			}); 
		}); 
	</script>
	
</body>
</html>