<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/moviePay.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
    
    <div class="carousel slide carousel-fade">
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid">
				<div class="carousel-caption">
					<div>
						<h3>────── FACTS & INFO ──────</h3>
						<h1>MOVIE TICKETING</h1>
					</div>
				</div>
			</div>
		</div> 
	</div>
	
	<div id="container" class="sub">
		<div id="content">
			<div class="orderPayment">
				<div class="orderCont">
					<h2 class="order_tit Lang-LBL0037">주문/결제</h2>
					<fieldset>
						<table border="1" class="tableRet table_typeC">
							<tbody>
								<tr>
									<td>
										<div class="order_Lbox2">
											<strong class="order_title">${movieDecideVO.movieNm}</strong>
											
											<ul class="order_tList">
												<li class="bg_none"><em class="Lang-LBL0055">상영일</em> ${movieDecideVO.day}</li>
												<li><em class="Lang-LBL1029">상영시간</em> ${movieDecideVO.time}</li>
												<li><em class="Lang-LBL1030">상영관</em> ${movieDecideVO.locName} ${movieDecideVO.boxNum}관</li>
												<li><em class="Lang-LBL0038">관람인원</em> ${movieDecideVO.people}명</li>
												<li><em class="Lang-LBL0033">  좌석</em> ${movieDecideVO.seatNum}</li>  
											</ul> 
										</div>   
									</td>
								</tr>
							</tbody>
							  
							<tfoot>
								<tr> 
                                    <td colspan="2">
                                        <dl class="mount"> 
                                            <dt class="Lang-LBL0039">총 주문금액</dt>
                                            <dd class="sum"> 
                                            	<em><strong>${movieDecideVO.price}</strong> <span class="Lang-LBL3037">원</span></em>
                                            </dd>                             
                                        </dl>
                                    </td> 
                               	</tr>  
							</tfoot>  
						</table>      
					</fieldset>  
				</div>
			</div>  
			   
			<div class="btn_wrap">
                <div class="btn_inner"> 
                    <a href="javascript:void(0);" class="btn_prev Lang-LBL0029">이전단계</a>
                    <div style="padding-top: 7px;">	                     
                    	<button type="button" class="btn btn-outline-danger btn_pay" style="float: right;">카카오페이 결제하기</button>
                    	<button type="button" class="btn btn-outline-danger btn_coupon" style="float: right;">쿠폰으로 결제하기</button>
                    </div>
                </div>  
           	</div>
    	</div>
	</div> 
	
	
   	<input type="hidden" id="boxIdx" value="${movieDecideVO.boxIdx}">	                    
   	<input type="hidden" id="day" value="${movieDecideVO.day}">	                    
   	<input type="hidden" id="price" value="${movieDecideVO.price}">	                    
   	<input type="hidden" id="movieNm" value="${movieDecideVO.movieNm}">	                    
   	<input type="hidden" id="seatNum" value="${movieDecideVO.seatNum}">	                    
   	<input type="hidden" id="logon_idx" value="${logon.idx}">	                    
   	<input type="hidden" id="logon_name" value="${logon.name}">	                    
   	<input type="hidden" id="logon_phone" value="${logon.phone}">
   	
   	
   	<input type="hidden" id="people" value="${movieDecideVO.people}"> 
   	<input type="hidden" id="logon_coupon" value="">  

	
	<script>
	
	
		var code = "cou_"; 
		 
		for(var i = 0; i < 12; i++) {
			code +=  Math.floor(Math.random() * 10);;
		}
		
		$.getJSON({ 
			url : "/tour/findMember",  
			data : {idx: Number($('#logon_idx').val())},   
			type : "get", 
			success : function(data) {
				$(data).each(function(i,obj) {   
					
					coupon = obj.coupon; 
				});	 
				document.getElementById('logon_coupon').value = coupon;					 		    
			}     
		});
		
		$(".btn_coupon").on("click", function() {
			
			if($('#people').val() > $('#logon_coupon').val()) {
				alert("쿠폰이 부족합니다");
				return false;
			} 
			
			
			$.ajax({
				url : '/tour/removeCoupon',
				type : 'get',
				data : {
					idx : $("#logon_idx").val(),
					people : $('#people').val()},  
				success : function(done) { 
					console.log(done);
				} 
			});
	 	 
			$.ajax({
				url : '/tour/couponPay',  
				type : 'get',
				data : { 
					idx : code,
                    memberIdx : $('#logon_idx').val(),
                    boxIdx : $('#boxIdx').val(),
                    day : $('#day').val(),
                    movieNm : $('#movieNm').val(),
                    seatNum : $('#seatNum').val(),
                    price : 0
				}, 
				success : function(result) {
					
					if(result == "clear") {
						
						$.getJSON({ 
							url : "/tour/getPay",
							data : {idx: code},   
							type : "get", 
							success : function(data) {
								
								$(data).each(function(i,obj) {  
							
									msg = '결제가 완료되었습니다.';
					            	msg += '\n이름 : ' + $('#logon_name').val();
				                    msg += '\n결제번호 : ' + obj.idx;
				                    msg += '\n결제 금액 : ' + obj.price;
				                     
				                    alert(msg);       
				                    $(location).attr('href', '/tour/'); 
								});	
											 		    
							}   
						}); 		
					}
				}
			});		
		});
	

		$(".btn_pay").on("click", function() {
			
			 $(function(){
				
		        IMP.init('imp57782593');
		        var msg;
		        
		        IMP.request_pay({
		        	
		            pg : 'kakaopay',
		            pay_method : 'card',
		            merchant_uid : 'merchant_' + new Date().getTime(),
		            name : 'MAGACGV 결제',
		            amount : $('#price').val(),
		            buyer_name : $('#logon_name').val(),
		            buyer_tel : $('#logon_phone').val(),    
		        }, function(rsp) {
		        	
		            if ( rsp.success ) {
		            	
		            	$.getJSON({
		                    url: "/tour/kakaoPay",
		                    type: 'POST',
		                    data: {
		                    	idx : rsp.imp_uid,
		                        memberIdx : $('#logon_idx').val(),
		                        boxIdx : $('#boxIdx').val(),
		                        day : $('#day').val(),
		                        movieNm : $('#movieNm').val(),
		                        seatNum : $('#seatNum').val(),
		                        price : $('#price').val()
		                    }
		                });
		            	
		            	msg = '결제가 완료되었습니다.';
		            	msg += '\n이름 : ' + rsp.buyer_name;
	                    msg += '\n결제번호 : ' + rsp.imp_uid;
	                    msg += '\n결제 금액 : ' + rsp.paid_amount;
	                    
	                    alert(msg);       
	                    $(location).attr('href', '/tour/');
	                    
		            } else {
		                msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		                
		                alert(msg);
		                return false;
		            }
		        });
		        
		    });
		});
		
		$(".btn_prev").click(function(){
			
			window.history.back();
		}); 
	</script>
	
<%@include file="../includes/footer.jsp"%>