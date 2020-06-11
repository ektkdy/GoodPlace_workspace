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
    
    /*모든 버튼*/
    .apply{width: 70px; height: 35px; background-color: #184c88; color:#fff; border: 0px; border-radius: 6px;}
    button{cursor: pointer;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}

    /* table */
    .common_tb tbody tr td input{border: 0px; width: 80px; text-align: right;}
    .common_tb tbody tr td select{border-radius: 4px; width: 140px; height: 35px;}
    
    /*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer;  border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}

    /* 모달 스타일*/
    .modal-body{margin:auto;}
    
    /*상태모양*/
	.common_tb tbody tr td .ing{width:100px; height:30px;  border:1px solid #0d80fb; background: #0d80fb; 
	                            border-radius: 15px; color:#fff; line-height: 28px;}
	.common_tb tbody tr td .confirm_ing{width:100px; height: 30px; border:1px solid #91919b; background: #91919b; 
	                                    border-radius: 15px; color:#fff; line-height: 28px;}
	.common_tb tbody tr td .cancel{width:100px; height: 30px; border:1px solid #d22d32; background: #d22d32; 
	                                    border-radius: 15px; color:#fff; line-height: 28px;}
	.common_tb tbody tr td .rest{width:100px; height: 30px; border:1px solid #272b36; background: #fff; 
	                                        border-radius: 15px; color:#333; line-height: 28px;}
	.apply{width: 70px;height: 30px;background: #2777f6; border-radius: 15px; color:#fff; line-height: 28px; border:1px solid #2777f6;}
	.apply:hover{background-color:white; color:#2777f6; font-weight:400;}
	
</style>        
</head>
<body>
	<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" >
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#"><span style="height: 30px;">HOME</span></a>
                <a href="#"><span style="margin-right: 30px;"> &gt; 파워등록신청</span></a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">파워등록신청</p>
                </span>
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0" >
                        <thead>
                            <tr>
                                <td width="100px">상태</td>
                                <td width="100px">지역</td>
                                <td width="300px">숙소명</td>
                                <td width="100px">총판매수</td>
                                <td width="100px">파워종류</td>
                                <td width="100px">파워금액</td>
                                <td width="100px">파워기간</td>
                                <td width="100px">비고</td>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:choose>
                    			<c:when test="${ !empty list }">
                    				<c:forEach items="${ list }" var="r">
		                            	<form action="payPower.ro" method="get">
	                    					<input type="hidden" class="roNo" name="roNo" value=${ r.roNo }>
				                            <tr>
		                            			<td><div class="ing">운영중</div></td>
				                                <td>${ fn:substring(r.addBasic,0,2) }</td>
				                                <td>${ r.roomsTitle }</td>
				                                <td>${ r.totalSal }</td>
				                                <td>
				                                    <select name="powerKind" class="powerKind">
				                                        <c:forEach items="${ plist }" var="p">
				                                        	<option value="${p.poNo} ${p.powerKind} ${p.powerPrice} ${p.period}" >${ p.powerKind }</option>
				                                        </c:forEach>
				                                    </select>
				                                </td>
				                                <td><input type="text" class="result1 re price" name="price" value="${ plist[0].powerPrice }">원</td>
				                                <td><input type="text" class="result2 re period" name="period" value="${ plist[0].period }">일</td>
				                                <input type="hidden" class="poNo" name="poNo" value=${ plist[0].poNo }>
				                                <td><button type="submit" class="apply">신청</button></td>
				                            </tr>
		                                </form>
			                        </c:forEach>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<tr><td colspan="8">운영중인 숙소가 없습니다.</td></tr>
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
		                    	<a href="selectPower.ro?currentPage=${ pi.currentPage -1 }">&lt;</a>
		                    </c:otherwise>
	                    </c:choose>
	                    
				        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<c:choose>
	                    		<c:when test="${ p eq pi.currentPage }">
		                    		<a href="#">${p}</a>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<a class="page-link" href="selectPower.ro?currentPage=${ p }">${p}</a>
		                    	</c:otherwise>
		                    </c:choose>
	                    </c:forEach>
	                    
				        <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
			                    <a>&gt;</a>
			                </c:when>
			                <c:otherwise>
			                    <a href="selectPower.ro?currentPage=${ pi.currentPage +1 }">&gt;</a>
			                </c:otherwise>
	                    </c:choose>
	                  </div>
              		</c:if>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            $(".powerKind").change(function(){
                var option = $(this).val().split(" ");
                $(this).parent().siblings().eq(6).val(option[0]);
                $(this).parent().siblings().eq(3).children().val(option[1]);
                $(this).parent().siblings().eq(4).children().val(option[2]);
                $(this).parent().siblings().eq(5).children().val(option[3]);
                
            });
        }); 
    </script>
</body>
</html>