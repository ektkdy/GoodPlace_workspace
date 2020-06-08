<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/partner/partnerCommon.css" />
<style>
    /*공통*/
    /* font */
    *{font-family: 'Noto Sans KR', sans-serif;}
    /* 여백 초기화 */
     body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form {margin: 0; padding: 0;}
    /* a 링크 초기화 */
    a {color: #333333; text-decoration: none;}
    /* body css */
    body {background: #fff;}
    #wrap {width: 1200px; height: 900px; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }
    
    /*모든 버튼*/
    button{cursor: pointer;}

    /*페이징바*/
    h5{color: royalblue;}
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer; border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
    
    /*상태모양*/
	.common_tb tbody tr td .ing{width:100px; height:30px;  border:1px solid #0d80fb; background: #0d80fb; 
	                            border-radius: 15px; color:#fff; line-height: 28px;}
	.common_tb tbody tr td .confirm_ing{width:100px; height: 30px; border:1px solid #91919b; background: #91919b; 
	                                    border-radius: 15px; color:#fff; line-height: 28px;}
	.common_tb tbody tr td .cancel{width:100px; height: 30px; border:1px solid #d22d32; background: #d22d32; 
	                                    border-radius: 15px; color:#fff; line-height: 28px;}
	.common_tb tbody tr td .rest{width:100px; height: 30px; border:1px solid #272b36; background: #fff; 
	                                        border-radius: 15px; color:#333; line-height: 28px;}
	.expUpdate{width: 70px;height: 30px;background: #2777f6; border-radius: 15px; color:#fff; line-height: 28px; border:1px solid #2777f6;}
	.expUpdate:hover{background-color:white; color:#2777f6; font-weight:400;}
	.expDetail{width: 70px;height: 30px;background: #f1f1f1; border-radius: 15px; color:#333; line-height: 28px; border:1px solid #f1f1f1;}
	.expDetail:hover{background-color:white;}
</style>   
</head>
<body>
<div id="wrap">
    <jsp:include page="../common/partnerMenubar.jsp"/>   
    <div id="contents" >
        <div id="tab"></div>
        <div class="sitemap">
            <a href="#"><span style="height: 30px;">HOME</span></a>
            <a href="#"><span style="margin-right: 30px;"> &gt; 체험관리</span></a>
        </div>
        <br clear="both">
        <div class="con" style="color:#000">
            <span id="page_title">
                <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                <p class="title_tt">체험관리</p>
            </span>
            <span class="up_btn_space" style="margin-top:8px">
                <button class="blue_btn" style="margin-right: 20px;" id="expForm">체험등록</button>
            </span>
            
            <script>
				$(function(){
					$("#expForm").click(function(){
						location.href="expEnrollForm1.exp";
					});
				});
			</script>
            
            <div class="con2">
                <table class="common_tb" cellpadding="0" cellspacing="0" >
                    <thead>
                        <tr>
                            <td width="100px">상태</td>
                            <td width="100px">지역</td>
                            <td width="300px">체험명</td>
                            <td width="200px">개시일(신청일)</td>
                            <td width="200px">누적판매수</td>
                            <td width="200px">비고</td>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
                    		<c:when test="${ !empty list }">
                    			<c:forEach items="${ list }" var="exp">
	                    			<tr>
	                    				<input type="hidden" name="exNo" value=${ exp.exNo }>
		                            	<c:choose>
		                            		<c:when test="${ exp.status eq 1}">
		                            			<td><div class="ing">운영중</div></td>
		                            		</c:when>
		                            		<c:when test="${ exp.status eq 2}">
		                            			<td><div class="confirm_ing">승인대기</div></td>
		                            		</c:when>
		                            		<c:when test="${ exp.status eq 3}">
		                            			<td><div class="cancel">승인거절</div></td>
		                            		</c:when>
		                            		<c:when test="${ exp.status eq 4}">
		                            			<td><div class="rest">휴면</div></td>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<td>삭제</td>
		                            		</c:otherwise>
		                            	</c:choose>
			                            <td>${fn:substring(exp.addBasic,0,2)}</td>
			                            <td>${ exp.expTitle }</td>
			                            <c:if test="${ empty exp.startDate }">
			                            	<td> 심사진행중 (${ exp.applyDate })</td>
			                            </c:if>
			                            <c:if test="${ !empty exp.startDate }">
			                            	<td>${ exp.startDate }(${ exp.applyDate })</td>
			                            </c:if>
			                            <td>${ exp.totalSal }</td>
			                            <td>
			                                <button class="expDetail">보기</button>
			                                <button class="expUpdate">수정</button>
			                            </td>
			                        </tr>
		                        </c:forEach>
                    		</c:when>
                    		<c:otherwise>
                    			<tr><td colspan="6" style="text-align:center;"><br>등록된 체험이 없습니다 <br> 신규체험을 등록하고 나만의 재능을 공유해 보세요<br><br></td></tr>
                    		</c:otherwise>
                    	</c:choose>
                    </tbody>
                </table>
                
                
                <!-- 상세보기 / 수정폼 / 거절사유있는 수정폼으로의 이동 -->
                <script>
	                $(function(){
						$(".expDetail").click(function(){
							location.href="expDetail.exp?exNo="+$(this).parent().siblings().eq(0).val();
							//console.log($(this).parent().siblings().eq(0).val());
						});
					});
	                
	                $(function(){
						$(".expUpdate").click(function(){
		                	if($(this).parent().siblings().eq(1).text()=="승인거절"){	// 체험번호의 상태가 승인거절(3)일 경우 거절사유가 적힌 폼으로 이동
		                		location.href="updateReExpForm.exp?exNo="+$(this).parent().siblings().eq(0).val();
		                	}else{	// 그 외에는 수정폼으로 이동
		                		location.href="updateExpForm.exp?exNo="+$(this).parent().siblings().eq(0).val();
		                	}
						});
	                });
                </script>
                
                <c:if test="${ !empty list }">
                   <div id="pagingArea" style="margin-top: 22px;">
                      <c:choose>
	                	<c:when test="${ pi.currentPage eq 1 }">
		                    <a href="#">&lt;</a>
		                </c:when>
		                <c:otherwise>
	                    	<a href="list.exp?currentPage=${ pi.currentPage -1 }">&lt;</a>
	                    </c:otherwise>
                    </c:choose>
                    
			        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ p eq pi.currentPage }">
	                    		<a href="#">${p}</a>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a class="page-link" href="list.exp?currentPage=${ p }">${p}</a>
	                    	</c:otherwise>
	                    </c:choose>
                    </c:forEach>
                    
			        <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <a>&gt;</a>
		                </c:when>
		                <c:otherwise>
		                    <a href="list.exp?currentPage=${ pi.currentPage +1 }">&gt;</a>
		                </c:otherwise>
                    </c:choose>
                  </div>
              </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>