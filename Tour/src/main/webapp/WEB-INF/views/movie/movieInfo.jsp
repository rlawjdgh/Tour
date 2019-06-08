<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
	
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
      							상영시간 : ${ movieVO.showTm } min <br>
      							감독 : ${ movieVO.director }<br>
      							배우 : ${ movieVO.people } 
        		</p>
        		<form>
	        		<button type="button" class="btn btn-primary" id="booking">
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
	
	<div class="container">
  	
	  	<div class="embed-responsive embed-responsive-16by9" style="width: 1100px; height: 500px;">
	  		<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/PVP5ZJuI57c" allowfullscreen style="float: center;"></iframe>
		</div>
	  	
	  	
	  	<div style="padding-top: 70px;"></div>
	  	
	  	<blockquote class="blockquote text-center mb-3">
	  		<h1>한줄평</h1>
		</blockquote>
		
		<hr size="4px" width="170px">
		
		<!-- 한줄평 입력 -->
		<div class="input-group mb-3" style="padding-top: 40px;">
			<form action="" id="replyForm">
				<input id="reply" name="reply" type="text" class="form-control" placeholder="한줄평">
				<input id="movieTitle" name="movieNm" type="hidden" class="form-control" value="${ movieVO.movieNm }">		
				<input id="writer" name="writer" type="hidden" class="form-control" value="${ logon.id }"/>
			</form>
			<div class="input-group-append">
				<button class="btn btn-primary btn-reply">등록</button>
			</div>
		</div>
	
		<!-- 한줄평 리스트 -->
		<div class="list-group mt-3 reList"></div>
		
		<table width="690" class="mb-3 mt-3">
			<tr>
				<td class="f11" align="center">
					${pageMenu }
				</td>
			</tr>
		</table>
	</div>
	
	<input type="hidden" id="clickMovieNm" value="${ movieVO.movieNm }">
	
	<!-- 댓글등록 -->
	<script>
	$(function(){
		var logedIdx = "${logon.idx}";
		showReply();
		
		$(".btn-reply").on("click",function(){
			if(${logon == null}){
				alert("로그인 후 이용가능합니다.");
				return;
			}else{ 
				$.ajax({
					type : "post",
					url : '/tour/insertReply',
					data : {movieNm : $("#movieTitle").val(),
							writer : $("#writer").val(),
							reply : $("#reply").val()},
					success : function(data){
						console.log(data);
						 $("#reply").val("");
						 showReply();
					}
					
				});
			}
		});
		function showReply(){
			 $.getJSON({
				url : '/tour/getReplyLists',
				data : {movieNm : $("#movieTitle").val(),
						page : ${page}},  
				success:function(data){
					var str = "";
					console.log(data);
					$(data).each(function(i,obj){
						str += "<a href='#' class='list-group-item list-group-item-action disabled'>";
						str += "<div class='d-flex w-100 justify-content-between'>";
						str += "<h5 class='mb-1'>" + obj.writer + "</h5>";
						str += "</div><p class='mb-1'>" + obj.reply + "</p>";
						str += "<small>" + displayTime(obj.replyDate) + "</small></a>";
					});	
					$(".reList").html(str);
				}
			}); //getJSON
		 }//showReply
		  
		 //시간포맷
		function displayTime(timeValue){
			
			var today = new Date();
			
			var gap = today.getTime()-timeValue;
			
			var dateObj = new Date(timeValue);
			var str = "";
			/* if(gap<(1000*60*60*24)){//오늘 24시간 안에 작성됐을 경우
				var hh=dateObj.getHours();
				var mi = dateObj.getMinutes();
				var ss = dateObj.getSeconds();
				
						//시분초가 9가 넘어가면 두자리수가 되니까 그냥 쓰고, 두자리수가 안될경우 앞에 0붙이기
				return [(hh>9?'':'0')+hh,':',(mi>9?'':'0')+mi,':',(ss>9?'':'0')+ss].join('');
			}else{//댓글이 달린지 24시간이 지났으면 */
				var yy = dateObj.getFullYear();
				var mm = dateObj.getMonth()+1;
				var dd = dateObj.getDate();
				return [yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');
			//}
		}//displayTime
	})
	 
	$('#booking').click(function(){
		$(location).attr('href', '/tour/movieTicketing?movieNm='+$('#clickMovieNm').val());
	});	
	</script> 
<%@include file="../includes/footer.jsp" %>  