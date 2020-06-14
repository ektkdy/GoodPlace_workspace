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

    /* 신고 관리 */
    #searchInput{
        border:1px solid #dbdbdb;
        border-top-left-radius: 6px;
        border-bottom-left-radius: 6px;
    }
    .search_btn{
        background-color: #184c88; 
        color:#fff; 
        width: 100px; 
        height: 35px; 
        border-top-right-radius: 6px; 
        border-bottom-right-radius: 6px; 
        border:1px solid #184c88
    }
    #searchSelect{
        border-radius: 6px;
    }
    .common_tb>tbody>tr:hover td{
        color: white; 
        background-color: #34538a;
        cursor:pointer;
    }
    /*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
</style>   
</head>
<body>
    <div id="wrap">
        
        <jsp:include page="../common/adminMenubar.jsp"/>
        
        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px;">신고관리</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">신고목록</p></span>
                
                <div class="con2">
                    <table id="reportList" class="common_tb" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
                                <td width="100"><!-- <input type="checkbox">--></td>
                                <td width="150">신고번호</td>
                                <td width="350">제목</td>
                                <td width="200">신고자명</td>
                                <td width="150">등록일</td>
                                <td width="200">신고당한사람</td>
                                <td width="150">경고횟수</td>

                            </tr>
                        </thead>
                        <tbody>
                        <!-- 
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>방이 너무 더러워요</td>
                                <td>홍길동</td>
                                <td>20.05.18</td>
                                <td>임꺽정</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>방이 너무 더러워요</td>
                                <td>홍길동</td>
                                <td>20.05.18</td>
                                <td>임꺽정</td>
                                <td>0</td>
                            </tr>
                             -->
                             
	                        <c:forEach items="${ list }" var="b">
	                            <tr>
	                                <td onclick="event.cancelBubble=true"><input type="checkbox"></td>
	                                <td>${ b.inNo }</td>
	                                <td>${ b.inqTitle }</td>
	                                <td>${ b.email }</td>
	                                <td>${ b.inqDate }</td>
	                                <c:choose>
		                                <c:when test="${ b.emailR ne null }">
		                                	<td>${ b.emailR }</td>
		                                	<td>${ b.yellowCardRp }</td>
		                                </c:when>
		                                <c:when test="${ b.emailE ne null }">
		                                	<td>${ b.emailE }</td>
		                                	<td>${ b.yellowCardEp }</td>
		                                </c:when>
		                                <c:when test="${ b.emailV ne null }">
		                                	<td>${ b.emailV }</td>
		                                	<td>${ b.yellowCardV }</td>
		                                </c:when>
	                                </c:choose>
	                            </tr>
	                         </c:forEach>
                        </tbody>
                    </table>
                    
                   	<script>
		            	$(function(){
		            		
 	            		    $("#reportList tbody tr").click(function(){
		            			location.href="aReportDetail.bo?rno=" + $(this).children().eq(1).text();
		            		});  
 	            		    
		            	});
		            </script>
                    
                    
                    
                    
                    
                    <div id="pagingArea" style="margin-top: 22px;">
	                    <c:choose>
		                	<c:when test="${ pi.currentPage eq 1 }">
			                    <a href="#">&lt;</a>
			                </c:when>
			                <c:otherwise>
		                    	<a href="aReportList.bo??currentPage=${ pi.currentPage -1 }">&lt;</a>
		                    </c:otherwise>
	                    </c:choose>
	                    
				        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<c:choose>
	                    		<c:when test="${ p eq pi.currentPage }">
		                    		<a href="#">${p}</a>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<a class="page-link" href="aReportList.bo??currentPage=${ p }">${p}</a>
		                    	</c:otherwise>
		                    </c:choose>
	                    </c:forEach>
	                    
				        <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
			                    <a>&gt;</a>
			                </c:when>
			                <c:otherwise>
			                    <a href="aReportList.bo??currentPage=${ pi.currentPage +1 }">&gt;</a>
			                </c:otherwise>
	                    </c:choose>
                    </div>
                    <br>
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