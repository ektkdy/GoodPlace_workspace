<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    #contents{height: 1400px;}

    /* 숙소정보 css */
    #roomInfo{height: 300px;}
    #roomInfo td:first-child{font-weight: bold;}
    table td{padding-left: 50px;}

    /*하단 버튼 css*/
    #btns{text-align: center;}
    button{cursor: pointer;  width: 140px; height: 35px; }
    #cancle{border: 1px solid #dbdbdb; border-radius: 4px; font-size: 15px;}
    #cancle:hover{background-color: white; border: solid 1px #dbdbdb;}
    #next{border: 1px solid #34538a; border-radius: 4px; font-size: 15px;}
    #next:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    #next{color: white; background-color: #34538a;}
</style>        
</head>
<body>
	<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" >
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#"><span style="height: 30px;">HOME</span></a>
                <a href="#"><span style="margin-right: 30px;"> &gt; 파워등록</span></a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">파워 결제 확인</p>
                </span><br>
                <div style="margin-bottom: 50px;"></div>
                <div>
                    <div>
                        <p style="font-size: 25px; margin-left: 20px;">숙소정보</p>
                        <hr style="width: 950px;" align="left">
                        <div style="display: inline;">
                            <img src="${pageContext.request.contextPath}/resources/uploadFiles/${r.changeName}" style="width: 400px; height: 300px;">
                        </div>
                        <div style="display: inline-block;">
                            <table id="roomInfo">
                            	<input type="hidden" name="roNo" value="${ r.roNo }">
                                <tr>
                                    <td>숙소명</td>
                                    <td>${ r.roomsTitle }</td>
                                </tr>
                                <tr>
                                    <td>파워종류</td>
                                    <td>${ p.powerKind }</td>
                                </tr>
                                <tr>
                                    <td>파워기간</td>
                                    <td>
                                    	<jsp:useBean id="toDay" class="java.util.Date" />
										<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd"/>부터
										
										${ p.period }일 간 
									</td>
                                </tr>
                                <tr>
                                    <td>총 금액</td>
                                    <td><fmt:formatNumber value="${ p.powerPrice }"/>원</td>
                                </tr>
                            </table>
                        </div>
                        <hr style="width: 950px;" align="left">
                        <div style="text-align:center; margin:50px 0px;">
                            <p>파워등록을 신청하시겠습니까? <br>
                                                     신청 후 취소가 불가합니다.<br>
                                                     신청하기를 누르면 결제 페이지로 이동합니다.
                            </p>
                        </div>
                    </div>
                    
                </div>
                <div id="btns">
                    <button type="button" id="cancle" onclick="location.href='list.ro?currentPage=1'">취소하기</button>
                    <button type="button" id="next" onclick="payNext();">신청하기</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
	    function payNext(){
	        var roNo = $("#roomInfo").children().eq(0).val();
	        location.href='paymentPower.ro?roNo='+roNo;
	     }
    </script>
    
</body>
</html>