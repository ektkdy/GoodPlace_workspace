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
    
    /*페이징바*/
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
                <a href="#"><span style="margin-right: 30px;"> &gt; 공지사항</span></a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">공지사항</p>
                </span>
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0" >
                        <thead>
                            <tr>
                                <td width="100px">번호</td>
                                <td width="500px">제목</td>
                                <td width="100px">일자</td>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:choose>
	                        	<c:when test="${ !empty list }">
	                        		<c:forEach items="${ list }" var="b">
		                        		<tr>
			                                <td>${ b.noNo }</td>
			                                <td>${ b.noticeTitle }</td>
			                                <td>${ b.noticeDate }</td>
		                            	</tr>
	                        		</c:forEach>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<tr>
	                        			<td colspan="3"> 공지사항이 없습니다 </td>
	                        		</tr>
	                        	</c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                    
                    <c:if test="${ !empty list }">
	                    <div id="pagingArea" style="margin-top: 22px;">
	                       <c:choose>
			                	<c:when test="${ pi.currentPage eq 1 }">
				                    <a href="#">&lt;</a>
				                </c:when>
				                <c:otherwise>
			                    	<a href="aNoticeList.bo?currentPage=${ pi.currentPage -1 }">&lt;</a>
			                    </c:otherwise>
		                    </c:choose>
		                    
					        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<c:choose>
		                    		<c:when test="${ p eq pi.currentPage }">
			                    		<a href="#">${p}</a>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<a class="page-link" href="aNoticeList.bo?currentPage=${ p }">${p}</a>
			                    	</c:otherwise>
			                    </c:choose>
		                    </c:forEach>
		                    
					        <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    <a>&gt;</a>
				                </c:when>
				                <c:otherwise>
				                    <a href="aNoticeList.bo?currentPage=${ pi.currentPage +1 }">&gt;</a>
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