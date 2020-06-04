<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}

    /*비고 안 버튼 3종 css*/
    table .blue_btn{width: 80px;}
     
    /*페이징바*/
    h5{color: royalblue;}
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer; border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
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
            <span class="up_btn_space">
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
	                    				<input type="hidden" value=${ exp.exNo }>
		                            	<c:choose>
		                            		<c:when test="${ exp.status eq 1}">
		                            			<td>운영중</td>
		                            		</c:when>
		                            		<c:when test="${ exp.status eq 2}">
		                            			<td>승인대기</td>
		                            		</c:when>
		                            		<c:when test="${ exp.status eq 3}">
		                            			<td>승인거절</td>
		                            		</c:when>
		                            		<c:when test="${ exp.status eq 4}">
		                            			<td>휴면</td>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<td>삭제</td>
		                            		</c:otherwise>
		                            	</c:choose>
			                            <td>${ exp.local }</td>
			                            <td>${ exp.expTitle }</td>
			                            <td>${ exp.startDate }(${ exp.applyDate })</td>
			                            <td>${ exp.totalSal }</td>
			                            <td>
			                                <button class="blue_btn" class="expDetail">보기</button>
			                                <button class="blue_btn" class="expUpdate">수정</button>
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
                
                <script>
	                $(function(){
						$(".expDetail").click(function(){
							location.href="";
						});
					});
                	
	                $(function(){
						$(".expUpdate").click(function(){
							location.href="";
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