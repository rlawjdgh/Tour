<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage2.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage3.css"> 
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myPage4.css"> 

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
	                                    <li>POINT로 영화예매를 할 수 있습니다.</li>   
	                                </ul>
                            	</dd>    
							</dl>
						</div>
						
					</div> 
				</div>
				
				<div class="myCinemaCont">
					<ul class="tab_st03" id="ulTab" style="border-bottom: 1px solid #231f20;">
						<li class="myticket" id="ticket"> 
                        	<a href="javascript:void(0)" class="Lang-LBL3001" onclick="return false;">예매/구매내역</a>
                        </li> 
                        
                        <li class="myContact" style="">
                        	<a href="javascript:void(0)">나의 문의 내역</a>
						</li>
						 
						<li class="myInfoMng" style="">
                        	<a href="javascript:void(0)">나의 정보관리</a> 
                    	</li>	 
					</ul>
					
					<div class="tabCont" id="divTabContent">
							
						<ol class="myCinema_list" id="myCinemaList"></ol>
						
						<div id="myNotice">
							<fieldset>
								<table border="1" class="tbl_st03">
									<colgroup>
										<col style="width:15%">
										<col style="width:52%">
										<col style="width:20%">
										<col style="width:14%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>	
											<th scope="col">제목</th>
											<th scope="col">등록일</th>
											<th scope="col">처리상태</th>	
										</tr>
									</thead>
									<tbody id="tbodyListInquiry"></tbody>
								</table>
							</fieldset>	
							<div class="btn_box btn_rbox">
								<a href="javascript:void(0);" class="btnc_reserve goNotice">문의등록</a>
							</div>
						</div>
						
						<div id="myInfo">
						<ol class="manage_step">
							<li class="second"><a href="javascript:void(0);" onclick="return false;" id="aPasswordChange">회원정보 변경</a></li>
							<li class="last"><a href="javascript:void(0);" onclick="return false;" id="aMemberDelete">회원탈퇴</a></li>
						</ol> 
					</div>	
							 		
					</div>
						
					<div id="pageMenu"></div>
				</div>
			</div>
		</div> 
	</div>
	
	<input type="hidden" id="idx" value="${logon.idx }">
	<input type="hidden" id="payPageMenu" value="${pageMenu}">
	
	<script>
			
		$(document).ready(function() {
			
			$("#ticket").on("click", function() {
				
				str = "";
				msg = ""; 
				
				$(".myContact").attr('class','myContact');
				$("#ticket").attr('class','myticket active');
				$(".myInfoMng").attr('class','myInfoMng'); 	
				
				$("#myNotice").css("display","none");	
				$("#myInfo").css("display","none");	
				$("#myCinemaList").css("display","block");		
				$("#pageMenu").css("display","block");  
				
				$.getJSON({ 
					url : "/tour/getTicket",
					type: "get", 
					data : {memberIdx: Number($('#idx').val()), 
							page : ${page}}, 
					success : function(data) { 
						
						if(data.length == 0) {
					 
							$("#pageMenu").css("display","none"); 
							
							str += "<div class='srchResult_none' id='searchResultNone'>";
							str += "<span class='txt Lang-LBL3056'>구매한 내역이 없습니다.</span>";
							str += "</div>"; 
							
							$("#myCinemaList").html(str); 
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
						
						msg = "<table width='690' class='mb-3 mt-3'>";
						msg += "<tr>";
						msg += "<td class='f11' align='center'>";
						msg += 	$('#payPageMenu').val()
						msg += "</td>";
						msg += "</tr>";
						msg += "</table>";
					
						$("#myCinemaList").html(str);  
						$("#pageMenu").html(msg);  		 
					}  
				}); 
			});  
			 
			 $('#ticket').trigger('click');  
		}); 
		
		$(".myContact").on("click", function() {
			
			var str = "";
			 
			$(".myContact").attr('class','myContact active'); 
			$("#ticket").attr('class','ticket'); 	
			$(".myInfoMng").attr('class','myInfoMng');
			
			$("#myCinemaList").css("display","none");
			$("#pageMenu").css("display","none");
			$("#myInfo").css("display","none");
			
			$("#myNotice").css("display","block"); 	
			 
			$.getJSON({ 
				url : "/tour/getNotice",
				type: "get", 
				data : {memberIdx: Number($('#idx').val()),
						page : ${page}},  
				success : function(data) {    
					
					if(data.length == 0) {
						
						str += "<tr>";
						str += "<td colspan='6'>";
						str += "<div class='srchResult_none'>";
						str += "<span class='txt'>등록된 문의 내역이 없습니다.</span>";
						str += "</div>";
						str += "</td>";
						str += "</tr>";
						
						$("#tbodyListInquiry").html(str); 
					}   
					 	 
					$(data).each(function(i,obj) {
						 
						str += "<tr>";
						str += "<td>"+(++i)+"</td>"; 
						str += "<td>"+obj.title+"</td>";
						str += "<td>"+obj.regdate+"</td>";
						if(obj.done == 0) {
							str += "<td>미처리</td>";
						} else {   
							str += "<td>답변완료</td>";	  
						} 
						str += "</tr>";
					}); 
					
					alert("최근 문의내역 5건만 출력됩니다."); 
					$("#tbodyListInquiry").html(str);   		 
				}  
			}); 
			  
		}); 
		
		$(".goNotice").on("click", function() { 
			
			var popUrl = "/tour/memberNotice"; 
			var popOption = "width=500, height=360, resizable=no, scrollbars=no, status=no;";

			window.open(popUrl,"",popOption);  
			 
		});
		
		$(".myInfoMng").on("click", function() { 
			
			$(".myContact").attr('class','myContact');
			$("#ticket").attr('class','myticket');
			$(".myInfoMng").attr('class','myInfoMng active');
			
			$("#myInfo").css("display","block");
			$("#myNotice").css("display","none");
			$("#myCinemaList").css("display","none");
			$("#pageMenu").css("display","none"); 
		}); 
		
		$("#aPasswordChange").on("click", function() {
			
			var result = confirm("회원정보를 변경하시겠습니까?"); 
			
			if(result) {
				$(location).attr('href', "/tour/memberInfoChange");
			} 
		});    
		
		
		$("#aMemberDelete").on("click", function() {
			
			
			var userInput = prompt("'회원탈퇴' 라고 입력하시면 회원탈퇴 처리가 됩니다"+"");
			
			if(userInput == "회원탈퇴") {
				$.ajax({
					url : "/tour/memberDelete", 
					data : {idx: $("#idx").val()}, 
					type : "get",
					success : function(data) { 
						if(data == 'clear'){
							alert("탈퇴되었습니다.");
							$(location).attr('href', "/tour/"); 
						}
					}
				});
			} else {
				alert("취소되었습니다."); 
			}
		});
	</script>
	 
<%@include file="../includes/footer.jsp" %>   
 


