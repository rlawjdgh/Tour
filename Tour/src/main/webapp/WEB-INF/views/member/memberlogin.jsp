<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/util.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/login.css">	
    
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
  		<h1>Login</h1>
	</blockquote>
	
	<hr size="4px" width="170px">

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w">
				
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
						<input class="input100" type="text" name="userId" placeholder="userId">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-t-3 p-b-24">

						<div>
							<a href="/tour/memberInsert" class="txt1">
								회원가입
							</a>
							 / 				
							<a href="#" class="txt1">
								비밀번호 찾기
							</a>
						</div>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	
<%@include file="../includes/footer.jsp" %>  