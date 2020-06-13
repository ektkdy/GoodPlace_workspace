<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerReservationStep.css" />
<style>
#confirm_btn:hover{
	background:#fff;
	border: 1.5px solid #184c88;
	color:#184c88;
	font-weight:500;
}
#cancel_btn:hover{
	background:#d22d32;
	border: 1.5px solid #d22d32;
	color:#fff;
	font-weight:500;
}
</style>

</head>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
         <div id="contents" style="width:980px">
            <div id="tab">
            <c:choose>
            	<c:when test="${r.reserveStatus == 1}">
	                <button class="on lt_tab">진행중인 예약</button>
	                <button class="off mid_tab">확정된 예약</button>
	                <button class="off gt_tab">취소된 예약</button>
            	</c:when>
            	<c:when test="${r.reserveStatus == 2 || r.reserveStatus == 3}">
            		<button class="off lt_tab">진행중인 예약</button>
	                <button class="on mid_tab">확정된 예약</button>
	                <button class="off gt_tab">취소된 예약</button>
            	</c:when>
            	<c:otherwise>
            		<button class="off lt_tab">진행중인 예약</button>
	                <button class="off mid_tab">확정된 예약</button>
	                <button class="on gt_tab">취소된 예약</button>
            	</c:otherwise>
            </c:choose>
            </div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px; margin:0">대시보드</span>&gt;
                </a>
                <a href="#">
                    <span>&nbsp;예약관리</span>&gt;
                </a>
                <a href="#">
                    <span>&nbsp;예약상세</span>
                </a>
            </div>
            <br clear="both"><br>
            <div class="con" style="color:#000">
                <span id="page_title">
                	<img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;">
                	<c:choose>
                		<c:when test="${r.reserveStatus == 1}">
                			<p class="title_tt">진행중인예약</p>
                		</c:when>
                		<c:when test="${r.reserveStatus == 2 || r.reserveStatus == 3}">
                			<p class="title_tt">확정된 예약</p>
                		</c:when>
                		<c:otherwise>
                			<p class="title_tt">취소된 예약</p>
                		</c:otherwise>
                	</c:choose>
                </span>
                <br clear="both">
                <form id="confirmForm" action="roomConfirm.rv" method="post">
                  <input type="hidden" name="rpNo" value='${r.rpNo}'>
                 </form>
                <form id="cancelForm" action="roomCancel.rv" method="post">
                  <input type="hidden" name="rpNo" value='${r.rpNo}'>
                 </form>
                <table class="step_tb" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <td colspan="5">
                            	<img src="${ pageContext.servletContext.contextPath }/resources/images/partner/step_icon1.png" style="vertical-align:bottom">
                            	<span>${r.userName} 님과 함께하는 여행</span>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="stepArea">
                        
                       	<c:choose>
                       		<c:when test="${r.reserveStatus == 1}">
	                            <td>
	                                <span class="step_img1_on"></span>
	                                <br clear="both">확정대기
	                            </td>
	                            <td rowspan="2">
	                                <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/arrow_2.png">
	                            </td>
	                            <td>
	                                <span class="step_img2_off"></span>
	                                <br clear="both">예약확정
	                            </td>
	                            <td rowspan="2">
	                                <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/arrow_2.png">
	                            </td>
	                            <td>
	                                <span class="step_img3_off"></span>
	                                <br clear="both">여행완료
	                            </td>
                            </c:when>
                            <c:when test="${r.reserveStatus == 2 }">
	                            <td>
	                                <span class="step_img1_off"></span>
	                                <br clear="both">확정대기
	                            </td>
	                            <td rowspan="2">
	                                <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/arrow_2.png">
	                            </td>
	                            <td>
	                                <span class="step_img2_on"></span>
	                                <br clear="both">예약확정
	                            </td>
	                            <td rowspan="2">
	                                <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/arrow_2.png">
	                            </td>
	                            <td>
	                                <span class="step_img3_off"></span>
	                                <br clear="both">여행완료
	                            </td>
                            </c:when>
                            <c:otherwise>
	                            <td>
	                                <span class="step_img1_off"></span>
	                                <br clear="both">확정대기
	                            </td>
	                            <td rowspan="2">
	                                <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/arrow_2.png">
	                            </td>
	                            <td>
	                                <span class="step_img2_off"></span>
	                                <br clear="both">예약확정
	                            </td>
	                            <td rowspan="2">
	                                <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/arrow_2.png">
	                            </td>
	                            <td>
	                                <span class="step_img3_on"></span>
	                                <br clear="both">여행완료
	                            </td>
                            </c:otherwise>
                         </c:choose>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5" class="step_notice">
                            <c:choose>
                            	<c:when test="${r.reserveStatus == 1}">
	                                <p>*예약이 접수되었습니다. 24시간 내에 확정여부를 알려주세요.
	                                    <br><br>
	                                    숙박 가능 여부를 확인해주세요. 예약 진행이 가능하면 "예약확정"을, 불가능하면 "예약취소"를 해주세요.<br>
	                                    예약 취소시 다른 날짜에 대해 안내하거나, 불가능한 이유에 대해 정중하게 알려주시기 바랍니다.
	                                </p>
                                </c:when>
                                <c:when test="${r.reserveStatus == 2 || r.reserveStatus == 3 }">
                                	<p>*예약이 확정되었습니다. 
                                    <br><br>
                                    공지사항 및 예약자님에게 전달할 사항이 있으시다면. 1:1 채팅을 통해서 미리 공지해주세요. <br>
                                    예약자님이 채팅문의를 한다면 친절하고 성의있는 답변을 해주세요.
                                </p>
                                </c:when>
                                <c:otherwise>
                                	 <p>* 예약이 취소되었습니다.
                                    <br><br>
                                    예약 취소시 다른 날짜에 대해 안내하거나, 불가능한 이유에 대해 정중하게 알려주시기 바랍니다.
                                </p>
                                </c:otherwise>
                            </c:choose>
                            </td>
                        </tr>
                        <tr>
                           <td colspan="5" class="step_btn">
                           	<c:choose>
                           		<c:when test="${r.reserveStatus == 1 }">
                               		<button class="confirm" id="confirm_btn">확정하기</button>
		                            <button class="cancel" id="cancel_btn">예약취소</button>
		                        </c:when>
		                        <c:otherwise>
		                        	<button class="confirm" id="confirm_btn" disabled>확정하기</button>
		                            <button class="cancel" id="cancel_btn"  disabled>예약취소</button>
		                        </c:otherwise>
                            </c:choose>
                           </td>
                        </tr>
                    </tfoot>
                </table>
                
                <br>
                <table class="info_tb" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <td colspan="2">
                            	<img src="${ pageContext.servletContext.contextPath }/resources/images/partner/step_icon2.png"style="vertical-align:bottom">
                            	<span>${r.roomsTitle }</span>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td width="250">예약번호</td>
                            <td>${r.rpNo}</td>
                        </tr>
                        <tr>
                            <td>예약일자</td>
                            <td>
                            <c:set var="TextValue1" value="${r.startDays }"/>
			                                	${fn:substring(TextValue1,0,10) }
			                                	~
                           	<c:set var="TextValue2" value="${r.endDays }"/>
			                                	${fn:substring(TextValue2,0,10) }
			                </td>
                        </tr>
                        <tr>
                            <td>예약자</td>
                            <td>${r.userName}</td>
                        </tr>
                        <tr>
                            <td rowspan="4">예약자 정보</td>
                            <td class="no_border">예약인원:${r.people }</td>
                        </tr>
                        <tr><td class="no_border">이름 : ${r.userName }</td></tr>
                        <tr><td class="no_border">생년월일 : 
                        <c:set var="birthday" value="${r.birthday }"/>
			                                	${fn:substring(birthday,2,8) }
                        </td></tr>
                        <tr>
                        	<c:choose>
                        		<c:when test="${r.reserveStatus == 1 || r.reserveStatus == 4}">
                        			<td>연락처는 예약이 확정후 보여집니다.</td>
  								</c:when>
  								<c:otherwise>
  									<td>${r.phone }</td>
  								</c:otherwise>
							</c:choose>	
                        </tr>
                        <tr>
                            <td>예약일수</td>
                            <td>${r.days }</td>
                        </tr>
                        <tr>
                            <td>여행컨셉</td>
                            <td>${r.concept }</td>
                        </tr>
                        <tr>
                            <td>요청사항</td>
                            <c:choose>
	                            <c:when test="${r.request eq '' }">
	                            	<td>없음</td>
	                            </c:when>
	                            <c:otherwise>
	                            	<td>${r.request }</td>
	                            </c:otherwise>
	                        </c:choose>
                        </tr>
                        <tr>
                            <td>결제금액</td>
                            <td>${r.amount }원</td>
                        </tr>
                    </tbody>
                </table>
                <table class="message_tb">
                    <thead>
                        <tr>
                            <td colspan="2">
                            	<span><img src="${ pageContext.servletContext.contextPath }/resources/images/partner/step_icon3.png" style="vertical-align:bottom" >
                            	${r.userName } 님과의 대화</span>
                            </td>
                        </tr>
                    </thead>
                    <tbody id="chat_area">
                        <tr>
                            <td>
                                <div style="height: 400px;">
                                    <table class="chat_tb">
                                        <tr class="other"> 
                                            <td width="80"><img src=""></td>
                                            <td class="chat">
                                                방기남 
                                                <p>숙소앞에 도착했는데 들어가도될까요?</p>
                                            </td>
                                        </tr>
                                        <tr class="me">
                                            <td width="80" style="float: right; margin-left:20px"><img src=""></td>
                                            <td class="chat">
                                                나
                                                <p>네 들어오셔도되요~^^</p>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr></tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2">
                                <input type="text" class="text_input"><button type="submit" >send</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
	
    <script>
        $(function(){
            
            $(".arrow").click(function(){
                $("#slide_menu").slideToggle(500);
            });
        });
    </script>
    <script>
    	$(function(){
    		$("#confirm_btn").click(function(){
    			var result = confirm('정말로 예약을 확정하시겠습니까?'); 
    			
    			if(result) { 
    				
    				$("#confirmForm").submit();
    				
    			} else { 
    				
    			}

    		});
    	});
    	
    	$(function(){
    		$("#cancel_btn").click(function(){
    			var result = confirm('정말로 예약을 취소하시겠습니까?'); 
    			
    			if(result) { 
    				
    				$("#cancelForm").submit();
    				
    			} else { 
    				
    			}

    		});
    	});
    </script>
</body>
</html>