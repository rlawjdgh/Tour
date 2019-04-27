<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<style type="text/css">
		.carousel {
		  background:#444;
		}   
	</style>
	
</head>
<body>
	<div id="carousel-2" class="carousel slide carousel-fade" data-ride="carousel" data-interval="6000">
        
        <div class="carousel-inner" role="listbox">
          
            <div class="carousel-item active">

                 <img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid">

                    <div class="carousel-caption">
                        <div>
                            <h3>──────  FACTS & INFO  ──────</h3>
                            <h1>MOVIE DETAILS</h1>
                            
                        </div>
                    </div>
            </div>
   		</div>
   	</div>
   	
   	<div class="container marketing">		
		
  		<h1 style="text-align:center; padding-bottom: 50px; padding-top: 60px;">${ movieVO.movieNm }</h1>
		
		<div class="row featurette">
      		<div class="col-md-7 order-md-2">
        		<h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        		<p class="lead">Donec ullamcorper nulla non metus auctor fringilla. <br>Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
      		</div>
      		
	      	<div class="col-md-5 order-md-1">
	        	<svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500">
	        		<title>Placeholder</title>
	        		<rect width="100%" height="100%" fill="#eee"></rect>
	        		<text x="50%" y="50%" fill="#aaa" dy=".3em"></text>
	        	</svg>
	      	</div>
    	</div>
	</div>
</body>
</html>