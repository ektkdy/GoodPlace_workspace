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

    /* FAQ 관리 */
    #searchInput{
        border:1px solid #dbdbdb;
        border-radius: 0px;
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
    .searchSelect{
        border-radius: 6px;
    }
    .common_tb>tbody>tr:hover td{
        /*
        color: white; 
        background-color: #34538a;
        */
        cursor:pointer;
    }
    /*페이징바*/
    #pagingArea{width: 870px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer;}
    #pagingArea a:hover{color: white; background-color: #34538a;}


    /*모든 버튼*/
    button{cursor: pointer; width: 140px; height: 35px; border-radius: 6px; border: 1px solid #34538a; background-color: #34538a; color: #fff;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    .modifiyBtn{width:100px;}
    /* 삭제 버튼*/
    #delete_btn{
        color:black;
        background: #dbdbdb;
        border: 1px solid #dbdbdb;
        width:100px;
    }
    #delete_btn:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    #page_title{width:280px;}
    
    .offBtn{
    	pointer-events: none;
    }
</style>    
</head>
<body>
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px;">1:1문의관리</span></a></div>
            <div id="searchArea" class="con" style="color:#000">
                <span id="page_title" style="width:25%"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">1:1문의관리</p></span>
                <form name="" method="" action="inquirySearch.bo">
	                <span class="up_btn_space" style="width: 700px;">
	                    <select class="searchSelect" name="searchSelect" id="searchSelect1" style="width:100px; height:35px;">
	                        <option value="searchOp1">전체</option>
	                        <option value="searchOp2">답변완료</option>
	                        <option value="searchOp3">답변전</option>
	                    </select>
	                    <select class="searchSelect2" name="searchSelect2" id="searchSelect2" style="width:100px; height:35px;">
	                        <option value="searchOp4">제목</option>
	                        <option value="searchOp5">내용</option>
	                        <option value="searchOp6">제목+내용</option>
	                    </select>
	                    <input id="searchInput" type="search" style="width:200px; height:35px;" name="keyword" value="${ keyword }"><button type="submit" class="search_btn">검색</button>
	                    <input type="hidden" name="currentPage" value="1">
	                </span>
                </form>
                
                <script>
					$(function(){
						switch('${b.searchSelect}'){
						case "searchOp1" : $("#searchArea option").eq(0).attr("selected", true); break;
						case "searchOp2" : $("#searchArea option").eq(1).attr("selected", true); break;
						case "searchOp3" : $("#searchArea option").eq(2).attr("selected", true); break;
						}
					});
				</script>
				
				<script>
					$(function(){
						switch('${b.searchSelect2}'){
						case "searchOp4" : $("#searchArea option").eq(3).attr("selected", true); break;
						case "searchOp5" : $("#searchArea option").eq(4).attr("selected", true); break;
						case "searchOp6" : $("#searchArea option").eq(5).attr("selected", true); break;
						case "searchOp7" : $("#searchArea option").eq(6).attr("selected", true); break;
						}
					});
				</script>
                
                
                <div class="con2">
                    <table id="inquiryList" class="common_tb" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
                                <td width="100">선택</td>
                                <td width="100">문의번호</td>
                                <td width="300">제목</td>
                                <td width="200">문의분류</td>
                                <td width="100">작성일</td>
                                <td width="200">답변</td>
                            </tr>
                        </thead>
                        <tbody>
                        	<!-- 
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>10261</td>
                                <td>예약을 하려고 하는데...</td>
                                <td>상품문의</td>
                                <td>20-05-13</td>
                                <td><button class="modifiyBtn">답변하기</button></td>
                            </tr> -->
                            <c:forEach items="${ list }" var="b">
	                            <tr>
	                                <td onclick="event.cancelBubble=true"><input type="checkbox"></td>
	                                <td>${ b.inNo }</td>
	                                <td>${ b.inqTitle }</td>
	                                <c:choose>
	                                	<c:when test="${ b.inqCategory eq 1}">
	                                		<td>일반</td>
	                                	</c:when>
	                                	<c:when test="${ b.inqCategory eq 2}">
	                                		<td>숙소/체험</td>
	                                	</c:when>
	                                	<c:when test="${ b.inqCategory eq 3}">
	                                		<td>취소환불</td>
	                                	</c:when>
	                                	<c:when test="${ b.inqCategory eq 4}">
	                                		<td>포인트</td>
	                                	</c:when>
	                                </c:choose>
	                                <td>${ b.inqDate }</td>
									<c:choose>	
										<c:when test="${ b.inqReStatus eq 1 }">                                
		                                	<td onclick="event.cancelBubble=true"><button class="modifiyBtn" onclick="location.href='inquiryAnswerForm.bo?ino=${ b.inNo }'">답변하기</button></td>
										</c:when>
										<c:otherwise>
		                                	<td onclick="event.cancelBubble=true"><button class="modifiyBtn offBtn" disabled>답변완료</button></td>
		                                </c:otherwise>
	                                </c:choose>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <script>
		            	$(function(){
		            		
 	            		    $("#inquiryList tbody tr").click(function(){
		            			location.href="aInquiryDetail.bo?ino=" + $(this).children().eq(1).text();
		            		});  
 	            		    
		            	});
		            </script>
                    
                       
                    <table>
                        <th>
                            <br>
                            <button class="blue_btn" id="delete_btn">삭제</button>
                        </th>
                        <th>
                            <div id="pagingArea" style="margin-top: 22px;">
	                            <!-- [이전] -->
	                            <c:if test="${ pi.currentPage ne 1 }">
				                    <c:choose>
					                	<c:when test="${ empty b.searchSelect }">
						                    <a href="aInquiryList.bo?currentPage=${ pi.currentPage -1 }">&lt;</a>
						                </c:when>
						                <c:otherwise>
					                    	<a href="aInquiryList.bo?searchSelect=${ b.searchSelect }&keyword=${b.keyword}&currentPage=${ pi.currentPage -1 }">&lt;</a>
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
												<c:when test = "${ empty b.searchSelect }">
													<a class="page-link" href="aInquiryList.bo?currentPage=${ p }">${p}</a>
												</c:when>
												<c:otherwise>
													<c:url value="inquirySearch.bo" var="searchUrl">
														<c:param name="searchSelect" value="${ b.searchSelect }"/>
														<c:param name="searchSelect2" value="${ b.searchSelect2 }"/>
														<c:param name="keyword" value="${ b.keyword }"/>
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
										<c:when test = "${ empty b.searchSelect }">
											 <a href="aInquiryList.bo?currentPage=${ pi.currentPage +1 }">&gt;</a>
										</c:when>
										<c:otherwise>
											<c:url value="inquirySearch.bo" var="searchUrl">
												<c:param name="searchSelect" value="${ b.searchSelect }"/>
												<c:param name="searchSelect2" value="${ b.searchSelect2 }"/>
												<c:param name="keyword" value="${ b.keyword }"/>
												<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
											</c:url>										
											<a href="${ searchUrl }">&gt;</a>
										</c:otherwise>
									</c:choose>
				                </c:if>
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