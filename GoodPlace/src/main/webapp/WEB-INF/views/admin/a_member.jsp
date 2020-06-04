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
    #wrap {width: 1200px; height: 900px; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }
    
    /*모든 버튼*/
    button{cursor: pointer; width: 140px; height: 35px; border-radius: 6px; border: 1px solid #34538a; background-color: #34538a; color: #fff;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    .modifiyBtn{width:70px;}

    /* 회원 관리 */
    #searchInput{
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
    .common_tb>tbody>tr:hover td{
        color: white; 
        background-color: #34538a;
        cursor:pointer;
    }
    /*페이징바*/
    #pagingArea{width: 680px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
</style>  
</head>
<body>
    <div id="wrap">
		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px;">회원관리</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">회원관리<small style="font-size: 0.5em;">(총 회원수 0명)검색결과 0건</small></p></span>
                <span class="up_btn_space">
                    <select name="" id="searchSelect" style="width:100px; height:35px;">
                        <option value="">선택</option>
                        <option value="">이름</option>
                        <option value="">회원번호</option>
                        <option value="">회원타입</option>
                  </select>
                    <input id="searchInput" type="search" style="width:200px; height:35px;"><button class="search_btn">검색</button>
                </span>
                <div class="con2">
	                <form id="postForm" method="post" action="">
	                    <table class="common_tb" cellpadding="0" cellspacing="0">
	                        <thead>
	                            <tr>
	                                <td width="100"><input type="checkbox"></td>
	                                <td width="150">회원번호</td>
	                                <td width="200">이름</td>
	                                <td width="200">아이디</td>
	                                <td width="200">등록일</td>
	                                <td width="300">휴대전화</td>
	                                <td width="150">회원타입</td>
	                                <td width="150">경고횟수</td>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        <!-- 
	                            <tr>
	                                <td><input type="checkbox"></td>
	                                <td>1</td>
	                                <td>홍길동</td>
	                                <td>test0000</td>
	                                <td>20.05.18</td>
	                                <td>010-9999-9999</td>
	                                <td>Y</td>
	                                <td>0</td>
	                            </tr>
	                            <tr>
	                                <td><input type="checkbox"></td>
	                                <td>2</td>
	                                <td>홍길동</td>
	                                <td>test0000</td>
	                                <td>20.05.18</td>
	                                <td>010-9999-9999</td>
	                                <td>Y</td>
	                                <td>0</td>
	                            </tr> -->
	                            <c:forEach items="${ list }" var="m">
		                            <tr>
		                                <td><input type="checkbox" name="mno" value="${ m.usNo }"></td>
		                                <td>${ m.usNo }</td>
		                                <td>${ m.userName }</td>
		                                <td>${ m.email }</td>
		                                <td>${ m.enrollDate }</td>
		                                <td>${ m.phone }</td>
		                                <td>${ m.status }</td>
		                                <c:choose>
			                                <c:when test="${ m.yellowCard >= 3}">
			                                	<input type="hidden" id="blockOnsubmit" name="mno" value="${ m.usNo }">
				                                <td>${ m.yellowCard }</td>
			                                </c:when>
			                                <c:otherwise>
				                                <td>${ m.yellowCard }</td>
			                                </c:otherwise>
		                                </c:choose>
		                            </tr>
	                            </c:forEach>
	                            
	                        </tbody>
	                    </table>
	               
	                    <table>
	                        <th>
	                            <br>
	                            <button class="blue_btn" onclick="postFormSubmit(1)">정지</button>
	                            <button class="blue_btn" onclick="postFormSubmit(2)">정지해지</button>
	                        </th>
	                        <th>
	                            <div id="pagingArea" style="margin-top: 22px;">
				                    <c:choose>
					                	<c:when test="${ pi.currentPage eq 1 }">
						                    <a href="#">&lt;</a>
						                </c:when>
						                <c:otherwise>
					                    	<a href="aMemberList.me?currentPage=${ pi.currentPage -1 }">&lt;</a>
					                    </c:otherwise>
				                    </c:choose>
				                    
							        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				                    	<c:choose>
				                    		<c:when test="${ p eq pi.currentPage }">
					                    		<a href="#">${p}</a>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<a class="page-link" href="aMemberList.me?currentPage=${ p }">${p}</a>
					                    	</c:otherwise>
					                    </c:choose>
				                    </c:forEach>
				                    
							        <c:choose>
				                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
						                    <a>&gt;</a>
						                </c:when>
						                <c:otherwise>
						                    <a href="aMemberList.me?currentPage=${ pi.currentPage +1 }">&gt;</a>
						                </c:otherwise>
				                    </c:choose>
	                            </div>
	                        </th>
	    
	                    </table>
	    			</form>
	    			
		    		<script>
	                  function postFormSubmit(num)
	                  {
	                     if(num == 1)
	                     {
	                    	confirm("정지하시겠습니까?");
	                        $("#postForm").attr("action", "blockOn.me");
	                     }
	                     else
	                     {
	                    	confirm("정지해제하시겠습니까?");
	                        $("#postForm").attr("action", "blockOff.me");
	                     }
	                     
	                     $("#postForm").submit();
	                  }
	               </script>
	               
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