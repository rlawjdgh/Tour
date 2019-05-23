<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp" %>

	<div id="carousel-2" class="carousel slide carousel-fade" data-ride="carousel" data-interval="6000">
        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
				<img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid">
          		<div class="carousel-caption">
              		<div>
                  		<h3>──────  INTERFACE ELEMENTS  ──────</h3>
                  		<h1>LOGIN FORM</h1>   
              		</div>
          		</div>
            </div>
   		</div>
   	</div>
   	
   	<blockquote class="blockquote text-center">
  		<h1>User Register</h1>
	</blockquote>
	
	<hr size="4px" width="170px">
   	
	<div class="container">
		<div class="row">
			<div class="col-md-12 order-md-1">
				<form class="needs-validation" method="post" id="regist" action="/tour/registMember">
					<div class="row">
       		
						<div class="col-md-6 mb-3">
         					<label>Name</label>
         					<input type="text" class="form-control" id="name">
      	 				</div>
      	 				
      	 				<div class="col-md-6 mb-3">
							<label>ID</label>
							<div class="input-group">
	         					<input type="text" class="form-control" id="id">
	         					<span class="input-group-btn">
	        						<button type="button" class="btn btn-outline-danger" id="check_id">중복체크</button>
	      						</span>
	      					</div>
       					</div>
     				</div>
     				
     				<div class="mb-3">
       					<label>E-mail</label>
       					<div class="input-group">
       						<input type="email" class="form-control" id="email">
       						<span class="input-group-btn">
	        					<button type="button" class="btn btn-outline-danger">인증하기</button>
	      					</span>
       					</div>
     				</div>

					<div class="mb-3">
       					<label>Password</label>
       					<input type="password" class="form-control" id="password">
     				</div>

     				<div class="mb-3">
       					<label>Confirm Password</label>
       					<input type="password" class="form-control" id="confirm-Pass">
     				</div>

     				<div class="mb-3">
       					<label>PhoneNumber</label>
       					<input type="text" class="form-control" id="phone">
     				</div>
        				
        			<hr class="mb-4">
        			
        			<div class="custom-control custom-checkbox">
              			<input type="checkbox" class="custom-control-input" id="save-phone">
              			<label class="custom-control-label" for="save-phone">This is my phone number</label>
            		</div>
            		
            		<div class="custom-control custom-checkbox">
              			<input type="checkbox" class="custom-control-input" id="save-info">
             			<label class="custom-control-label" for="save-info">Save this information for next time</label>
            		</div>
            		
            		<hr class="mb-4">
   
        			<button class="btn btn-primary btn-lg btn-block" type="submit">Sign Up</button>
      			</form>
    		</div>
  		</div>
	</div>
	
	<script>
		$(function(){
			
			 var id_check = false;
			 var name = $('#name');
			 var id = $('#id');
			 var email = $('#email');
			 var password = $('#password');
			 var confirm = $('#confirm-Pass');
			 var phone = $('#phone');
			 
			 var registForm = $("#regist");
			
			$(".btn-block").on("click",function(e) {
				e.preventDefault();
				
				var regName = /^[가-힣]+$/;
				var regpId = /^[0-9a-z]+$/;
		        var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		        var regPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		        
		        if( name.val() == '' ){
		            alert('이름을 입력 해 주세요');
		            name.focus();
		            return false;
		        } else {
		            if(!regName.test(name.val())) {
		                alert('이름을 입력 해 주세요');
		                name.focus();
		                return false;
		            }
		        }
		        
		        if( id.val() == '') {
		        	alert("아이디를 입력 해 주세요.");
		        	id.focus();
		        	return false;
		        } else {
		            if(!regpId.test(id.val())) {
		                alert('영어로 입력 해 주세요');
		                id.focus();
		                return false;
		            }
		        }
		        
		        if (id_check == false) {
					alert("아이디 중복체크 해주세요");
					return false;
				}
		        
		        if( password.val() == '') {
		        	alert("비밀번호를 입력 해 주세요.");
		        	password.focus();
		        	return false;
		        }
		        
		        if( confirm.val() != password.val()) {
		        	alert("비밀번호가 일치하지 않습니다.");
		        	confirm.focus();
		        	return false;
		        }
		        
		        if( email.val() == '' ){
		            alert('이메일주소를 입력 해 주세요');
		            email.focus();
		            return false;
		        } else {
		            if(!regEmail.test(email.val())) {
		                alert('이메일 주소가 유효하지 않습니다');
		                email.focus();
		                return false;
		            }
		        }
		        
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
		        
		        if($("#save-phone").is(":checked") == false) {
					alert("이용약관에 동의하지 않았습니다.");
					return false;
				}
				
				if($("#save-info").is(":checked") == false) {
					alert("이용약관에 동의하지 않았습니다.");
					return false;
				}
				
				registForm.append("<input type='hidden' name='name' value='" + name.val() + "'/>")
				registForm.append("<input type='hidden' name='id' value='" + id.val() + "'/>")
				registForm.append("<input type='hidden' name='email' value='" + email.val() + "'/>")
				registForm.append("<input type='hidden' name='password' value='" + password.val() + "'/>")
				registForm.append("<input type='hidden' name='phone' value='" + phone.val() + "'/>")
				
				registForm.submit();
			});
			
			$("#check_id").click(function() {
				
				var checkId = $("#id").val();

				$.ajax({
					url : "/tour/check_id",
					data : checkId,
					type : "get",
					success : function(data) {
						
						if(data == 'no'){
							alert("아이디가 사용중입니다.");
							id.focus();
				        	return false;
						} else {
							alert("사용 가능합니다.");
							id_check = true;
						}
					}
				});
			});	
		});
	</script>

<%@include file="../includes/footer.jsp" %>