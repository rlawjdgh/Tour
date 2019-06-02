<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/moviePay.css">
    
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
	
	<form>
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
	                    <a href="javascript:void(0);" class="btn_next" title="결제하기">결제하기</a>
	                </div>
            	</div>

           	</div>
		</div>
	</form>
	 
	  
	
	
	
	
<%@include file="../includes/footer.jsp"%>