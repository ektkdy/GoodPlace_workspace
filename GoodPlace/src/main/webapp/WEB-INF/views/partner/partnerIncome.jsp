<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    button{cursor: pointer;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}

    /*총금액div*/
    .sum{ width: 980px; height: 50px; background-color: #dbdbdb;}
    .sum p{text-align: right; padding-top: 10px; padding-right: 15px;}

    /*페이징바*/
    h5{color: cornflowerblue;}
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer; border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
</style>  
</head>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" >
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#"><span style="height: 30px;">HOME</span></a>
                <a href="#"><span style="margin-right: 30px;"> &gt; 수입내역</span></a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">수입내역</p>
                </span>
                <span class="up_btn_space">
                    <button class="blue_btn" style="margin-right: 20px;" onclick="location.href='incomeExcel.do'">엑셀 다운로드</button>
                </span>
                
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
                                <td width="100"><input type="checkbox" id="choice" style="display:block; margin-left:40px;"></td> 
                                <td width="200">예약번호</td>
                                <td width="200">수익일</td>
                                <td width="200">여행자</td>
                                <td width="200">수익금</td>
                                <td width="200">수익구분</td>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:choose>
	                    		<c:when test="${ !empty list }">
	                    			<c:forEach items="${ list }" var="ac">
		                    			<tr>
		                    				<td><input type="checkbox" name="choice" class="choice" style="display:block; margin-left:40px;"></td>
			                                <td>${ ac.no }</td>
			                                <td>${ ac.payDate }</td>
			                                <td>${ ac.userName }</td>
			                                <td class="amount">${ ac.amount }</td>
			                                <td>${ ac.section }</td>
				                        </tr>
			                        </c:forEach>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<tr><td colspan="6" style="text-align:center;"><br>수입 내역이 없습니다<br><br></td></tr>
	                    		</c:otherwise>
	                    	</c:choose>
                        </tbody>
                    </table>
                </div>
                <div class="sum">
                    <p>선택 내역의 총금액 합계 : <span id="sum">0</span>원</p>
                </div>
                <h5>*수입금은 굿플레이스의 수수료 20%가 공제된 내역입니다.</h5>
                
                <c:if test="${ !empty list }">
                   <div id="pagingArea" style="margin-top: 22px;">
                      <c:choose>
	                	<c:when test="${ pi.currentPage eq 1 }">
		                    <a href="#">&lt;</a>
		                </c:when>
		                <c:otherwise>
	                    	<a href="partnerIncome.ac?currentPage=${ pi.currentPage -1 }">&lt;</a>
	                    </c:otherwise>
                    </c:choose>
                    
			        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ p eq pi.currentPage }">
	                    		<a href="#">${p}</a>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a class="page-link" href="partnerIncome.ac?currentPage=${ p }">${p}</a>
	                    	</c:otherwise>
	                    </c:choose>
                    </c:forEach>
                    
			        <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <a>&gt;</a>
		                </c:when>
		                <c:otherwise>
		                    <a href="partnerIncome.ac?currentPage=${ pi.currentPage +1 }">&gt;</a>
		                </c:otherwise>
                    </c:choose>
                  </div>
              </c:if>
            </div>
        </div>
    </div>

	<!-- 체크박스 조건검사 및 선택 내역 총금액 출력 -->
    <script>
    var sum = 0;
	$(function(){
		$("#choice").click(function(){
			if($("#choice").is(":checked")){
				$(".choice").prop("checked", true);
				sum=0;
				for(var i=0; i<'${list.size()}'; i++){
	    			var a = parseInt($(".amount").eq(i).text());
					sum += a;
    			}
			}else{
				$(".choice").prop("checked", false);
				sum = 0;
			}
			$("#sum").text(sum);
		});
		
		$(".choice").click(function(){
			if($("input[name=choice]:checked").length=='${list.size()}'){
				$("#choice").prop("checked", true);
			} else{
				$("#choice").prop("checked", false);
			}
			var amount = $(this).parent().siblings().eq(3).text();	
		    var intAmount = parseInt(amount);						
    		
		    if($(this).is(":checked")){	
		    	sum += intAmount;
		    }else{
		    	sum -= intAmount;
		    }
		    $("#sum").text(sum);
		});
	});
    </script>
</body>
</html>