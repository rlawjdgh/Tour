<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<style>
		#slider-animation{max-height:550px;}
		.heading-box h2{ width:100%; color: red; }
		h2, p{color:#fff;}
		.carousel-item img{width:100%;}
		.text-box {
			position: absolute;
			top: 50%;
			left: 15%;
			right: 15%;
			color: #000;
			transform: translateY(-50%);
		}
	</style>
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.css">

	<section>
		<div id="slider-animation" class="carousel slide" data-ride="carousel">

		  	<div class="carousel-inner">
		    	<div class="carousel-item active">
		      		<img src="${ pageContext.request.contextPath }/resources/img/gv.jpg" alt="Los Angeles">	
		    	</div>
		    	
		    	<div class="carousel-item">
		        	<img src="${ pageContext.request.contextPath }/resources/img/abcd.jpg" alt="Los Angeles">
		 			<div class="text-box">
		            	<div class="row align-items-center"> 
		            		<div class="col-md-6"> 
		                		<h1 class="wow fadeInUp" data-wow-duration="4s" style="color: white;">존 윅 3: 파라벨룸</h1>
		            			<h5 class="wow fadeInUp" data-wow-duration="2s" style="color: white;">평화를 원한다면 전쟁을 준비하라!</h5> 
		            		</div>
		        		</div> 
		    		</div> 
		    	</div>
		    	
		      <div class="carousel-item">
		      	<img src="${ pageContext.request.contextPath }/resources/img/bist.jpg" alt="Chicago">
					<div class="text-box">
		            	<div class="row align-items-center">     
		            		<div class="col-md-6  wow slideInRight" data-wow-duration="4s">
		                		<h1 style="color: white;">비스트</h1> 
		            			<h5 style="color: white;">살인마를 잡기 위해 살인을 감추다</h5>
		            		</div>   
		        		</div>   
		    		</div> 
		  		</div> 
			</div>
		 
			<a class="carousel-control-prev" href="#slider-animation" data-slide="prev">
		    	<span class="carousel-control-prev-icon"></span>
		  	</a>
		  	<a class="carousel-control-next" href="#slider-animation" data-slide="next">
		    	<span class="carousel-control-next-icon"></span>
		  	</a>
		</div>
	</section>

	<script>
		wow = new WOW({
			animateClass: 'animated',
  			offset: 100,
  			callback: function(box) {
    			console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
  				}
			}
 		);
		wow.init();
		
		document.getElementById('moar').onclick = function() {
			var section = document.createElement('section');
   			section.className = 'section--purple wow fadeInDown';
   			this.parentNode.insertBefore(section, this);
		 };
	</script>