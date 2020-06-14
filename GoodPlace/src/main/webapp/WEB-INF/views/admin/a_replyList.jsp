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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/adminCommon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/a_replyList.css" />
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
    #wrap {width: 1200px; margin: 0 auto; height: 900px; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }

</style>     
</head>
<body>
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px;">후기관리</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">등록된후기</p></span>
                <span class="up_btn_space">
                    <select style="width:250px; height:35px; border-radius: 5px;">
                        <option>등록일</option>
                        <option>별점</option>
                    </select>
                </span>
                <br clear="both">
                <table id="replyList" class="reply_tb" cellpadding="0" cellspacing="0">
                    <c:forEach items="${ list }" var="r">
	                    <tr>
	                    	<td style="display:none">${ r.reNo }</td>
	                        <td width="80px"><img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/userProfile/${r.changeName}"></td>
	                        <td width="80px">${ r.userName }</td>
	                        <td width="400px">${ r.reTitle }</td>
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
	                        <td wodth="100" class="text_center">작성일<p>${r.reviewDate }</p></td>
	                    </tr>
                    </c:forEach>
                </table>
                
              	<script>
	            	$(function(){
	            		
	            		    $("#replyList tbody tr").click(function(){
	            			location.href="aReplyDetail.bo?reNo=" +$(this).children().eq(0).html();
	            		});  
	            		    
	            	});
	            </script>
                
                
                
                <div id="pagingArea" style="margin-top: 22px;">
 	                    <c:if test="${ pi.currentPage ne 1 }">
		                    <c:choose>
			                	<c:when test="${ pi.currentPage eq 1 }">
				                    <a href="#">&lt;</a>
				                </c:when>
				                <c:otherwise>
			                    	<a href="aReplyList.bo?currentPage=${ pi.currentPage -1 }">&lt;</a>
			                    </c:otherwise>
		                    </c:choose>
		                 </c:if>  
				        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<c:choose>
	                    		<c:when test="${ p eq pi.currentPage }">
		                    		<a href="#" style="color:red;">${p}</a>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<a class="page-link" href="aReplyList.bo?currentPage=${ p }">${p}</a>
		                    	</c:otherwise>
		                    </c:choose>
	                    </c:forEach>
	                    <c:if test="${ pi.currentPage ne pi.maxPage }">
				        <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    <a>&gt;</a>
				                </c:when>
				                <c:otherwise>
				                    <a href="aReplyList.bo?currentPage=${ pi.currentPage +1 }">&gt;</a>
				                </c:otherwise>
		                    </c:choose>
	                    </c:if>
                </div>
            </div>
        </div>
        <div id="footer">footer</div>
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