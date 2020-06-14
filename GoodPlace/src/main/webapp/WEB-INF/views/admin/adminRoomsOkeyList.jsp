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
    table button{cursor: pointer; width: 85px; height: 35px; border-radius: 20px; border: 1px solid #52b991; background-color: #52b991; color: white;}
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
                <button class="off lt_tab" onclick="location.href='aRoomsWaitList.ro?currentPage=1'">승인대기목록</button>
                <button class="on gt_tab" onclick="location.href='aRoomsOkeyList.ro?currentPage=1'">숙소승인목록</button>
            </div>
            <div class="sitemap">
                <a href="#"><span>HOME</span></a>
                <a href="#"><span>&gt;숙소관리</span></a>
                <a href="#"><span style="margin-right: 20px;">&gt;숙소승인목록</span></a>
            </div>
            <div id="searchArea" class="con" style="color:#000">
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">숙소 승인완료 목록</p>
                </span>
                <form name="" method="" action="roomOkSearch.ro">
	                <span class="up_btn_space">
	                    <select name="searchSelect" id="selectOption">
	                        <option value="searchOp1">숙소명</option>
	                        <option value="searchOp2">지역</option>
	                    </select>
	                    <input id="search" type="text" name="keyword" value="${ keyword }">
	                    <input type="submit" id="searchBtn" value="검색">
	                    <input type="hidden" name="currentPage" value="1">
	                </span>
                </form>
                
                <script>
					$(function(){
						switch('${r.searchSelect}'){
						case "searchOp1" : $("#searchArea option").eq(0).attr("selected", true); break;
						case "searchOp2" : $("#searchArea option").eq(1).attr("selected", true); break;
						}
					});
				</script>
                
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0" >
                        <thead>
                            <tr>
                                <td width="100px">번호</td>
                                <td width="200px">지역</td>
                                <td width="200px">숙소승인일</td>
                                <td width="500px">숙소명</td>
                                <td width="200px">숙박가격(1인1박)</td>
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
                                <td>운영중</td>
                            </tr> -->
                            <c:forEach items="${ list }" var="r">
	                            <tr>
	                                <td>${ r.roNo }</td>
	                                <td>${fn:substring(r.addBasic,0,2)}</td>
	                                <td>${ r.startDate }</td>
	                                <td>${ r.roomsTitle }</td>
	                                <td>${ r.price }원</td>
	                                <td onclick="event.cancelBubble=true">
	                                    <button class="blue_btn">승인완료</button>
	                                </td>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div id="pagingArea" style="margin-top: 22px;">
	                            <!-- [이전] -->
	                            <c:if test="${ pi.currentPage ne 1 }">
				                    <c:choose>
					                	<c:when test="${ empty r.searchSelect }">
						                    <a href="aRoomsOkeyList.ro?currentPage=${ pi.currentPage -1 }">&lt;</a>
						                </c:when>
						                <c:otherwise>
					                    	<a href="aRoomsOkeyList.ro?searchSelect=${ r.searchSelect }&keyword=${r.keyword}&currentPage=${ pi.currentPage -1 }">&lt;</a>
					                    </c:otherwise>
				                    </c:choose>
				                </c:if>
				                
				                <!-- [번호들] -->
								<c:forEach var="p" begin="${ pi.startPage }" end ="${ pi.endPage }">
									<c:choose>
										<c:when test="${ p eq pi.currentPage }">
											<a href="" style="color:red;">${ p }</a>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test = "${ empty r.searchSelect }">
													<a class="page-link" href="aRoomsOkeyList.ro?currentPage=${ p }">${p}</a>
												</c:when>
												<c:otherwise>
													<c:url value="roomOkSearch.ro" var="searchUrl">
														<c:param name="searchSelect" value="${ r.searchSelect }"/>
														<c:param name="keyword" value="${ r.keyword }"/>
														<c:param name="currentPage" value="${ p }"/>
													</c:url>
														
													<a href="${ searchUrl }">${p}</a>
												</c:otherwise>
											</c:choose>
										</c:otherwise>

				               		</c:choose>    
				                </c:forEach>   
				                
								<!-- [다음] -->
								<c:if test="${ pi.currentPage ne pi.maxPage }">
									<c:choose>
										<c:when test = "${ empty r.searchSelect }">
											 <a href="aRoomsOkeyList.ro?currentPage=${ pi.currentPage +1 }">&gt;</a>
										</c:when>
										<c:otherwise>
											<c:url value="roomOkSearch.ro" var="searchUrl">
												<c:param name="searchSelect" value="${ r.searchSelect }"/>
												<c:param name="keyword" value="${ r.keyword }"/>
												<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
											</c:url>										
											<a href="${ searchUrl }">&gt;</a>
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