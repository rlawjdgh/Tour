<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAGACGV</title>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/carousel.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<style>
      	.bd-placeholder-img {
        	font-size: 1.125rem;
        	text-anchor: middle;
        	-webkit-user-select: none;
        	-moz-user-select: none;
        	-ms-user-select: none;
        	user-select: none;
      	}
      	
      	.carousel {
		  background:#444;
		}
		
		.show {
			position: absolute; 
			width: 100%;
		 	height: 100%; top: 0; 
		 	bottom: 0; 
		 	left: 0; 
		 	right: 0;
		}
		
		.show-video {
			position: absolute; 
			top: 50%; 
			left: 50%; 
			transform: translate(-50%,-50%);
		}	
    </style>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    		<a class="navbar-brand" href="/tour/">
    			<img src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
    			MAGACGV
    		</a>
    		
    		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>
    		
    		<div class="collapse navbar-collapse" id="navbarCollapse">	
	      		<ul class="navbar-nav mr-auto">
        			<li class="nav-item active">
        				<c:choose>
        					<c:when test="${logon == null}">
        						<a class="nav-link" href="/tour/memberlogin">Login</a>
        					</c:when>
        					 
        					<c:otherwise>
        						<a class="nav-link" href="#" style="pointer-events: none;">${ logon.name } 님 안녕하세요</a>
        						
        						<li class="nav-item"> 
          							<a class="nav-link" href="#" onclick="return false">MyPage</a>
       		 					</li> 
        					</c:otherwise>
        				</c:choose>  
        			</li>
      			</ul>
      				<div class="form-inline mt-2 mt-md-0">
						<input class="form-control mr-sm-2 keyword" type="text" placeholder="Search" aria-label="Search">
				      	<button class="btn btn-outline-success my-2 my-sm-0 goSearch" type="button">Search</button>
				    </div>
    		</div>
    		
  		</nav>
  	</header>

	<script>
  		$(function(){
  			
  			$(".goSearch").on("click",function(){
  				if($(".keyword").val()=="" || $(".keyword").val==null){
  					alert("검색어를 입력하세요");
  				}else{
  					location.href="/tour/searchList?keyword="+$(".keyword").val();
  				}  				
  			});
  			
  		});
  	</script> 
