<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage2.css">

	 <div class="carousel slide carousel-fade">
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid">
				<div class="carousel-caption">
					<div>
						<h3>────── Member INFO ──────</h3>
						<h1>My Page</h1>
					</div>
				</div> 
			</div>
		</div> 
	</div> 
	
	<div id="wrap">
		<div id="container">
			<div id="content">
				<div class="myCinema">
					<div class="myInfo">  
						<h2 class="order_tit02 Lang-LBL0000">마이MAGACGV</h2>
						<div class="myInfoTit">
							<em><span class="userName" id="spnUserName">${ logon.name }</span>님 환영합니다!</em>
							<dl>
	                            <dt>회원 등급</dt>
	                            <dd class="rating Lang-LBL0000"><span id="spnMemberGrade">${ logon.grade }</span></dd> 
                        	</dl>
						</div>
						
						<div class="pointCont">
							<dl class="apoint">
								<dt>POINT</dt>
								<dd class="available">
                                	<strong id="strAccountLPoint">${ logon.point }<span class="icon_p">P</span></strong>
                            	</dd>
                            	<dd class="note">
	                                <ul>
	                                    <li>POINT로 영화예매 할 수 있습니다.</li>   
	                                </ul>
                            	</dd>   
							</dl>
						</div>
						
					</div> 
				</div>
				
				<div class="myCinemaCont">
					<ul class="tab_st03" id="ulTab" style="border-bottom: 1px solid #231f20;">
						<li class="myticket active">
                        	<a href="javascript:void(0)" class="Lang-LBL3001" id="ticket" onclick="return false;">예매/구매내역</a>
                        </li>
                        
                        <li class="myContact" style="">
                        	<a href="javascript:void(0)">나의 문의 내역</a>
						</li>
						 
						<li class="myInfoMng" style="">
                        	<a href="javascript:void(0)">나의 정보관리</a> 
                    	</li>	 
					</ul>
					
					<div class="tabCont" id="divTabContent">
						<div class="srchResult_none" style="display: none;" id="searchResultNone">
							<span class="txt Lang-LBL3056">예매/구매한 내역이 없습니다.</span>
						</div>		
						<ol class="myCinema_list" id="myCinemaList"></ol> 
					</div> 
				</div>
			</div>
		</div> 
	</div>
	
	<input type="hidden" id="idx" value="${logon.idx }"> 
	
	<script>
			
		$(document).ready(function() {
			
			str = "";
			
			$.getJSON({
				url : "/tour/getTicket",
				type: "get", 
				data : {memberIdx: Number($('#idx').val())}, 
				success : function(data) {
					
					if(data.length == 0) {
						$("#searchResultNone").css("display","block");
						$("#myCinemaList").css("display","none"); 
					}  
					
					$(data).each(function(i,obj) {
						str += "<li>";
						str += "<div class='myCinema_box'>";
						str += "<dl class='myCimema_cont'>";
						str += "<dt class='Lang-LBL3015'>예매번호(예매일)</dt>";
						str += "<dd>"+obj.idx+" ("+obj.regdate+")</dd>";
						str += "<dt class='Lang-LBL3016'>예매내역</dt>";
						str += "<dd>"+obj.movieNm+"</dd>";
						str += "<dt class='Lang-LBL0045'>총 결제 금액</dt>";
						str += "<dd>"+obj.price+" <span class='Lang-LBL3037'>원</span></dd>";
						str += "</dl>";
						str += "</div>";
						str += "</li>";
					});  
				
					$("#myCinemaList").html(str);  
				} 
			});  
		}); 
		
	</script>
	 
<%@include file="../includes/footer.jsp" %>  



