<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerReplyList.css" />
</head>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" style="width:980px" >
            <div id="tab">
                <button class="on lt_tab">답글 전 후기</button>
                <button class="off gt_tab">답글 후 후기</button>
            </div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px;">HOME</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">후기관리</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">답글 전 후기</span>
                </a>
            </div>
            <div class="con" style="color:#000; ">
                <span id="page_title"><img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;"><p class="title_tt">답글 전 후기</p></span>
                <span class="up_btn_space">
                    <select style="width:250px; height:35px; border-radius: 5px;">
                        <option>숙소 선택하기</option>
                    </select>
                </span>
                <table class="reply_tb" cellpadding="0" cellspacing="0">
                <c:forEach  items="${ list }" var="r"> 
	                <c:choose>
	                	<c:when test="${empty r.reply }">
		                    <tr>
		                    	<c:choose>
		                    		<c:when test="${empty r.changeName }">
		                        		<td width="80px">
		                        			<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/userProfile/default.jpg">
		                        		</td>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<td width="80px">
		                        			<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/userProfile/${changeName}">
		                        		</td>
		                        	</c:otherwise>
		                        </c:choose>
		                        <td width="80px">${r.userName }</td>
		                        <td width="500px">${r.reContent }</td>
		                        <c:choose>
		                        	<c:when test="${r.score eq 5}">
		                       			<td width="150">★★★★★</td>
		                       		</c:when>
		                       		<c:when test="${r.score eq 4 }">
		                       			<td width="150">★★★★</td>
		                       		</c:when>
		                       		<c:when test="${r.score eq 3 }">
		                       		 	<td width="150">★★★</td>
		                       		</c:when>
		                       		<c:when test="${r.score eq 2 }">
		                       			<td width="150">★★</td>
		                       		</c:when>
		                       		<c:when test="${r.score eq 1 }">
		                       			<td width="150">★</td>
		                       		</c:when>
		                        </c:choose>
		                        <td width="100" class="text_center">작성일<p>${r.reviewDate }</p></td>
		                    </tr>
	                    </c:when>
                	</c:choose>
               </c:forEach>
                </table>
                <c:if test="${ !empty list }">
	                    <div id="pagingArea" style="margin-top: 22px;">
	                       <c:choose>
			                	<c:when test="${ pi.currentPage eq 1 }">
				                    <a href="#">&lt;</a>
				                </c:when>
				                <c:otherwise>
			                    	<a href="pNoticeList.bo?currentPage=${ pi.currentPage -1 }">&lt;</a>
			                    </c:otherwise>
		                    </c:choose>
		                    
					        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<c:choose>
		                    		<c:when test="${ p eq pi.currentPage }">
			                    		<a href="#">${p}</a>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<a class="page-link" href="pNoticeList.bo?currentPage=${ p }">${p}</a>
			                    	</c:otherwise>
			                    </c:choose>
		                    </c:forEach>
		                    
					        <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    <a>&gt;</a>
				                </c:when>
				                <c:otherwise>
				                    <a href="pNoticeList.bo?currentPage=${ pi.currentPage +1 }">&gt;</a>
				                </c:otherwise>
		                    </c:choose>
	                    </div>
                    </c:if>
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
</body>
</html>