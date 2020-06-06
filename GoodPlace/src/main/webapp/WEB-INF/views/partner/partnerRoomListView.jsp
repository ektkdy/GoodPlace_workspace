<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerRoomList.css" />
<style>
button:hover{cursor:pointer}

/*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer; border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
    
    #noticeList tr:hover{cursor:pointer;}
</style>
</head>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px;">HOME</span>&gt;
                </a>
                <a href="#">
                    <span> 숙소관리</span>
                </a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;">
                    <p class="title_tt">숙소관리</p>
                </span>
                <span class="up_btn_space" style="margin-top:8px">
                    <button class="blue_btn" onclick="location.href=''">파워등록신청</button>
                    <button class="blue_btn" onclick="location.href='insertRoomForm.ro'">숙소등록</button>
                </span>
                
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
                                <td width="120">상태</td>
                                <td>숙소번호</td>
                                <td width="100">지역</td>
                                <td width="100">숙소개시일</td>
                                <td width="400">숙소명</td>
                                <td width="100">총판매수</td>
                                <td width="300">비고</td>
                            </tr>
                        </thead>
                        <tbody>
                           <c:choose>
                           	<c:when  test="${!empty list }">
	                           <c:forEach items="${ list }" var="r">
				                    <tr>
				                    <c:choose>
				                    	<c:when test="${r.status eq 1}">
				                        	<td><div class="ing" style="margin:0 auto">운영중</div></td>
				                        </c:when>
				                        <c:when test="${r.status eq 2 }">
				                        	<td><div class="confirm_ing" style="margin:0 auto">심사진행중</div></td>
				                        </c:when>
				                       	<c:when test="${r.status eq 3}">
				                       		<td><div class="cancel" style="margin:0 auto">승인거절</div></td>
				                       	</c:when>
				                       	<c:otherwise>
				                       		<td><div class="rest" style="margin:0 auto">휴면중</div></td>
				                       	</c:otherwise>
				                    </c:choose>
				                    	<td>${r.roNo }</td>
				                        <td width="10%">${r.addBasic}</td>
				                        <c:choose>
				                        	<c:when test="${!empty r.startDate }">
				                        		<td width="15%">${r.startDate }</td>
				                        	</c:when>
				                        	<c:when test="${empty r.startDate }">
				                        		<td width="15%">심사중</td>
				                        	</c:when>
				                       	</c:choose>
				                        <td width="35%">${r.roomsTitle}</td>
				                        <td width="10%">50</td>
				                        <td width="18%">
			                        	    <button class="detail_btn" onclick="location.href='roomDetailView.ro?rno='+${r.roNo}">보기</button>
	                                    	<button class="schedule_btn">수정</button>
	                                    	<!-- <button class="schedule_btn">일정관리</button> -->
				                        </td>
				                    </tr>
				                </c:forEach>
				                </c:when>
				                <c:otherwise>
				                	<tr>
				                		<td colspan="6"> 등록된 숙소가 없습니다.</td>
				                	</tr>
				                </c:otherwise>
				            </c:choose>
                        </tbody>
                    </table>
                    <!-- 공지사항 상세조회용 서비스 -->
                    <script type="text/javascript">
			             $(function(){
			            	 $("#noticeList tbody tr").click(function(){
								 location.href="pNoticeListDetail.bo?noNo="+$(this).children().eq(0).text();           		 
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
    </div>
    
<!-- 토글  -->
    <script>
        $(function(){
            
            $(".arrow").click(function(){
                $("#slide_menu").slideToggle(500);
            });
        });
    </script>
</body>
</html>