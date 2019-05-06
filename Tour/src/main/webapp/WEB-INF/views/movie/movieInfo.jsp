<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
		
  		<h1 style="text-align:center; padding-bottom: 50px; padding-top: 40px;">${ movieVO.movieNm }</h1>
		
		<div class="row featurette">
      		<div class="col-md-7 order-md-2">
        		<h2 class="featurette-heading"><span class="text-muted"></span></h2>
        		<p class="lead">장르 : ${ movieVO.genreNm }<br>
      							개봉연도 : ${ movieVO.openDt }<br>
      							상영시간 : ${ movieVO.showTm } mim <br>
      							감독 : ${ movieVO.director }<br>
      							배우 : ${ movieVO.people } <br>
      							영화번호 : ${ movieVO.movieNm } 
        		</p>
        		<form>
	        		<button type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" autocomplete="off">
	  					예매하기
					</button>
				</form>
      		</div>
      		
	      	<div class="col-md-5 order-md-1">
	        	<img src="${ pageContext.request.contextPath }/resources/img/nnn.jpg" style="width: 100%; height: 100%;">
	      	</div>
    	</div>
	</div>
	
	<div style=" padding-top: 60px;"></div>
	
	<div class="text-center" style="position: relative;">
  		<img src="#" class="rounded" style="width: 1000px; height: 500px;">
  		
  		<div class="show">
  			<div class="show-video">
  				 <a href="#">
  				 	<img src="#"/>
  				 </a>
  			</div>
  		</div>
  	</div>
  	
  	
  	<div style="padding-top: 70px;"></div>
  	
  	<blockquote class="blockquote text-center">
  		<h1>한줄평</h1>
	</blockquote>
	
	<hr size="4px" width="170px">
	
	<!-- 여기부터 테이블 -->
	<div class="list-group">
		<c:forEach var="r" items="${reply }">
			<a href="#" class="list-group-item list-group-item-action">
				<div class="d-flex w-100 justify-content-between">
					<h5 class="mb-1">${r.writer }</h5>
					<small>3 days ago</small>
				</div>
				<p class="mb-1">${r.reply }</p>
				<small>${r.replyDate }</small>
			</a>
		</c:forEach>
	</div>
	<table width="690">
			<tr>
				<td class="f11" align="center">
					${pageMenu }
				</td>
			</tr>
		</table>	





<%@include file="../includes/footer.jsp" %>  