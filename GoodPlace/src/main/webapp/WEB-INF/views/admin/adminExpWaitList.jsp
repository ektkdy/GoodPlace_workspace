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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/adminCommon.css" />
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

    button:hover{cursor: pointer;}

    /*검색+옵션*/
    #selectOption{width: 140px; height: 35px; border-radius: 6px;}
    #search{width: 140px; height: 35px; margin-right: -5px;border-top-left-radius: 6px; border-bottom-left-radius: 6px; border: 1px solid #a5a5a5;}
    #searchBtn{width: 50px; height: 37px; margin-right: 20px; border-top-right-radius: 6px; color:#fff;
                border-bottom-right-radius: 6px; border: 1px solid #34538a; background-color: #34538a;}


    /* table */
    .common_tb{width: 980px; padding-top:15px}
    .common_tb thead tr td{background-color:#f1f1f1; font-size: 18px; color:#333; padding: 10px 0; text-align: center;
                           border-top: 1px solid #bebebe; border-bottom:1px solid #bebebe;}
    .common_tb tbody tr td{padding: 10px 0; text-align: center; border-bottom:1px solid rgb(241, 241, 241); color:#505050; font-size: 15px;}       
    table button{cursor: pointer; width: 90px; height: 30px; border-radius: 20px; border: 1px solid #52b991; background-color: #52b991; color: white;}
    table button:hover{color: #52b991; background-color: white; font-weight: bold; border: 1px solid #52b991;}


    /*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer;  border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
</style> 
</head>
<body>
	<div id="wrap">
        <jsp:include page="../common/adminMenubar.jsp"/>
        <div id="contents" >
            <div id="tab">
                <button class="on lt_tab" onclick="location.href='aExpWaitList.ex?currentPage=1'">승인대기목록</button>
                <button class="off gt_tab" onclick="location.href='aExpOkayList.ex?currentPage=1'">체험승인목록</button>
            </div>
            <div class="sitemap">
                <a href="#"><span>HOME</span></a>
                <a href="#"><span> &gt;체험관리</span></a>
                <a href="#"><span style="margin-right: 20px;">&gt;승인대기목록</span></a>
            </div>
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">체험 승인대기 목록</p>
                </span>

                <div class="con2">
                    <table id="ExpList" class="common_tb" cellpadding="0" cellspacing="0" >
                        <thead>
                            <tr>
                                <td width="100px">번호</td>
                                <td width="200px">지역</td>
                                <td width="200px">체험신청일</td>
                                <td width="500px">체험명</td>
                                <td width="200px">체험가격(1인)</td>
                                <td width="200px">상태</td>
                            </tr>
                        </thead>
                        <tbody>
                        	<!-- 
                            <tr>
                                <td>상태</td>
                                <td>파리</td>
                                <td>20.04.27</td>
                                <td>체험이름</td>
                                <td>150,000원</td>
                                <td>
                                    <button class="blue_btn">승인대기</button>
                                </td>
                            </tr> -->
							<c:forEach items="${ list }" var="e">
	                            <tr>
	                                <td>${ e.exNo }</td>
	                                <td>${fn:substring(e.addBasic,0,2)}</td>
	                                <td>${ e.applyDate }</td>
	                                <td>${ e.expTitle }</td>
	                                <td>${ e.price }원</td>
	                                <td>
	                                    <button class="blue_btn">승인대기</button>
	                                </td>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
					<script>
		            	$(function(){
		            		
 	            		    $("#ExpList tbody tr").click(function(){
		            			location.href="aExpDetail.ex?eno=" + $(this).children().eq(0).text();
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
			                    	<a href="aExpWaitList.ex?currentPage=${ pi.currentPage -1 }">&lt;</a>
			                    </c:otherwise>
		                    </c:choose>
		                 </c:if>  
				        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<c:choose>
	                    		<c:when test="${ p eq pi.currentPage }">
		                    		<a href="#" style="color:red;">${p}</a>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<a class="page-link" href="aExpWaitList.ex?currentPage=${ p }">${p}</a>
		                    	</c:otherwise>
		                    </c:choose>
	                    </c:forEach>
	                    <c:if test="${ pi.currentPage ne pi.maxPage }">
				        <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    <a>&gt;</a>
				                </c:when>
				                <c:otherwise>
				                    <a href="aExpWaitList.ex?currentPage=${ pi.currentPage +1 }">&gt;</a>
				                </c:otherwise>
		                    </c:choose>
	                    </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>