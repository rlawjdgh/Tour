<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/carousel.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css">
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
    			MAGAVGC
    		</a>
    		
    		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>
    		
    		<div class="collapse navbar-collapse" id="navbarCollapse">	
	      		<ul class="navbar-nav mr-auto">
        			<li class="nav-item active">
          				<a class="nav-link" href="/tour/movielogin">로그인</a>
        			</li>
        		
        			<li class="nav-item">
          				<a class="nav-link" href="#">영화</a>
       		 		</li>
       		 	
        			<li class="nav-item">
          				<a class="nav-link" href="#">상영관</a>
        			</li>
      			</ul>
      	
			      <form class="form-inline mt-2 mt-md-0">
			        	<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
			        	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			      </form>
    		</div>
    		
  		</nav>
  	</header>
