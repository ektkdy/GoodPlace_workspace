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

    /*모든 버튼*/
    button{cursor: pointer; width: 140px; height: 35px; border-radius: 6px; border: 1px solid #34538a; background-color: #34538a; color: #fff;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    .modifiyBtn{width:70px;}

    .lt_tab{border-radius: 0px;}

    .gt_tab{border-radius: 0px;}

    #searchInput{
        padding-left: 5px;
        border:1px solid #dbdbdb;
        border-top-left-radius: 6px;
        border-bottom-left-radius: 6px;
    }
    .search_btn{
        border-radius: 0px;
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
            <div id="tab">
                <button class="off lt_tab" onclick="location.href='aPowerList.po'">파워등록 관리</button>
                <button class="on gt_tab" onclick="location.href='powerOkayList.po?currentPage=1'">파워등록 목록</button>
            </div>
            <div class="sitemap">
                <a href="#"><span style="width: 30px;height: 30px;">파워등록목록</span></a>
            </div>
            <br><br><br><br><br>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">파워등록목록</p></span>

                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
                                <td width="100">No.</td>
                                <td width="200">파워등록명</td>
                                <td width="300">숙소명</td>
                                <td width="200">파트너아이디</td>
                                <td width="150">사용일수</td>
                                <td width="200">사용기간</td>
                                <td width="150">진열상태</td>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- 
                            <tr>
                                <td>1</td>
                                <td>PLATINUM</td>
                                <td>강남 풀옵션 개인룸</td>
                                <td>seo8 </td>
                                <td>120</td>
                                <td>20.05.18~20.09.18</td>
                                <td>Y</td>
                                <td>0</td>
                            </tr>  -->
                            
                            <c:forEach items="${ list }" var="r">
	                            <tr>
	                                <td>${ r.poNo }</td>
	                                <td>${ r.powerKind }</td>
	                                <td>${ r.roomsTitle }</td>
	                                <td>${ r.email } </td>
	                                <td>${ r.period }</td>
	                                <td>${ r.powerStart }~${ r.powerEnd }</td>
		                             <c:choose> 
			                             <c:when test="${ r.poNo1 eq 0 }">
			                                <td>N</td>
			                             </c:when>
			                             <c:otherwise>
			                                <td>Y</td>
			                             </c:otherwise>
	                             	</c:choose>
	                            </tr>
							</c:forEach>
                        </tbody>
                    </table>
                    <table>
                        <th>
                            <div id="pagingArea" style="margin-top: 22px;">
      			                <c:choose>
				                	<c:when test="${ pi.currentPage eq 1 }">
					                    <a  href="">&lt;</a>
					                </c:when>
					                <c:otherwise>
				                    	<a href="powerOkayList.po?currentPage=${ pi.currentPage -1 }">&lt;</a>
				                    </c:otherwise>
			                    </c:choose>
			                    
						        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                    	<c:choose>
			                    		<c:when test="${ p eq pi.currentPage }">
				                    		<a href="" style="color:red;">${p}</a>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<a class="page-link" href="powerOkayList.po?currentPage=${ p }">${p}</a>
				                    	</c:otherwise>
				                    </c:choose>
			                    </c:forEach>
			                    
						        <c:choose>
			                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
					                    <a>&gt;</a>
					                </c:when>
					                <c:otherwise>
					                    <a href="powerOkayList.po?currentPage=${ pi.currentPage +1 }">&gt;</a>
					                </c:otherwise>
			                    </c:choose>
                            </div>
                        </th>

                    </table>

                </div>
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