<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta charset="UTF-8">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
    <!-- <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5"> -->
<title>Home</title>

	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/carousel.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css">
	
	<script src="${ pageContext.request.contextPath }/resources/css/jquery.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/css/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function() {
	         $('.carousel').carousel({
	             interval: 2000
	         })
	    });    
	</script>
	
	
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
		
		.carousel-item .img-fluid {
		  width:100%;
		  height:auto;
		}
      	
    </style>
    
</head>
<body>
	
	<!-- navbar include로 뺄 예정 -->
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    		<a class="navbar-brand" href="#">
    			<img src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
    			MAGAVGC
    		</a>
    		
    		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>
    		
    		<div class="collapse navbar-collapse" id="navbarCollapse">	
	      		<ul class="navbar-nav mr-auto">
        			<li class="nav-item active">
          				<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        			</li>
        		
        			<li class="nav-item">
          				<a class="nav-link" href="#">Link</a>
       		 		</li>
       		 	
        			<li class="nav-item">
          				<a class="nav-link" href="#">Disabled</a>
        			</li>
      			</ul>
      	
			      <form class="form-inline mt-2 mt-md-0">
			        	<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
			        	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			      </form>
    		</div>
    		
  		</nav>
  	</header>
	
	<!-- 사진 슬라이드(슬라이드는 안됌)...???? -->
	<div id="carousel-2" class="carousel slide carousel-fade" data-ride="carousel" data-interval="6000">
        <ol class="carousel-indicators">
            <li data-target="#carousel-2" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-2" data-slide-to="1"></li>
            <li data-target="#carousel-2" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          
            <div class="carousel-item active">
                <a href="https://bootstrapcreative.com/">

                 <img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid">

                    <div class="carousel-caption">
                        <div>
                            <h2>Digital Craftsmanship</h2>
                            <p>We meticously build each site to get results</p>
                            <span class="btn btn-sm btn-outline-secondary">Learn More</span>
                        </div>
                    </div>
                </a>
            </div>
          
          
            <div class="carousel-item">
                <a href="https://bootstrapcreative.com/">
                 <img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid">

                    <div class="carousel-caption justify-content-center align-items-center">
                        <div>
                            <h2>Every project begins with a sketch</h2>
                            <p>We work as an extension of your business to explore solutions</p>
                            <span class="btn btn-sm btn-outline-secondary">Our Process</span>
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="carousel-item">
                <a href="https://bootstrapcreative.com/">
  
                 <img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid">


                    <div class="carousel-caption justify-content-center align-items-center">
                        <div>
                            <h2>Performance Optimization</h2>
                            <p>We monitor and optimize your site's long-term performance</p>
                            <span class="btn btn-sm btn-secondary">Learn How</span>
                        </div>
                    </div>
                </a>
            </div>
            
        </div>
       
        <a class="carousel-control-prev" href="#carousel-2" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carousel-2" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    
	
	<blockquote class="blockquote text-center">
  		<h1>Moive</h1>
	</blockquote>
	
	<hr size="4px" width="170px">
	
	<div class="col text-center" style="padding-bottom: 50px;"> 
		<button type="button" class="btn btn-secondary btn-lg">Box Office</button>
		<button type="button" class="btn btn-secondary btn-lg">Latest Film</button>
		<button type="button" class="btn btn-secondary btn-lg">Coming Soon</button>
	</div>
	
	<div style="padding-left: 1500px;">
		<button type="button" class="btn btn-link">MORE</button>
	</div>
	
	<!-- 영화 정보 4개 만들 예정 -->
	<div class="row justify-content-center">
		<div class="col-sm-2">
			<div class="card" style="width: 18rem;">
		  	<img class="card-img-top" src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" alt="Card image cap">
				<div class="card-body">
		   			<h5 class="card-title">Special title treatment</h5>
		       		<a href="#" class="card-link">Card link</a>
		   			<a href="#" class="card-link">Another link</a>
				</div>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="card" style="width: 18rem;">
		  	<img class="card-img-top" src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" alt="Card image cap">
				<div class="card-body">
		   			<h5 class="card-title">Special title treatment</h5>
		       		<a href="#" class="card-link">Card link</a>
		   			<a href="#" class="card-link">Another link</a>
				</div>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="card" style="width: 18rem;">
		  	<img class="card-img-top" src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" alt="Card image cap">
				<div class="card-body">
		   			<h5 class="card-title">Special title treatment</h5>
		       		<a href="#" class="card-link">Card link</a>
		   			<a href="#" class="card-link">Another link</a>
				</div>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="card" style="width: 18rem;">
		  	<img class="card-img-top" src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" alt="Card image cap">
				<div class="card-body">
		   			<h5 class="card-title">Special title treatment</h5>
		       		<a href="#" class="card-link">Card link</a>
		   			<a href="#" class="card-link">Another link</a>
				</div>
			</div>
		</div>
	</div>
	


	<div class="container marketing">		
		<hr class="featurette-divider">
		
  		<h1 style="text-align:center; padding-bottom: 20px;">Coming Soon</h1>
		
		<div class="row featurette">
      		<div class="col-md-7 order-md-2">
        		<h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        		<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
      		</div>
      		
	      	<div class="col-md-5 order-md-1">
	        	<svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500">
	        		<title>Placeholder</title>
	        		<rect width="100%" height="100%" fill="#eee"></rect>
	        		<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
	        	</svg>
	      	</div>
    	</div>
	</div>
	
</body>
</html>
