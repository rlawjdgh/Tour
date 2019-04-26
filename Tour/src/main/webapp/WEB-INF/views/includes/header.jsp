<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    </style>
</head>
<body>
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
          				<a class="nav-link" href="#">HOME <span class="sr-only">(current)</span></a>
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
</body>
</html>