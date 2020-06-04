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
    #wrap {width: 1200px; margin: 0 auto; height: 1200px; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }
    /* table */
    .common_tb{width: 980px; padding-top:15px;}
    .common_tb thead tr th{background-color:#dbdbdb; font-size: 18px; color:#333; padding: 10px 0;
                           border-top: 1px solid #bebebe; border-bottom:1px solid #bebebe; text-align: center;}
    .common_tb tbody tr td{padding: 10px 0; text-align: center; border-bottom:1px solid #dbdbdb; color:#505050; font-size: 15px;}       
    
    .bottum_tb{margin-top: 30px;}
    .bottum_tb thead tr td{font-size: 16px; color:#333; padding: 10px 0; padding-left: 20px;
                           border-top: 1px solid #dbdbdb}

    /*모든 버튼*/
    button{cursor: pointer; width: 140px; height: 35px; margin-right: 20px; border-radius: 6px; border: 1px solid #34538a; background-color: #34538a; color: #fff;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}

    /*상단 이미지 두개*/
    #backgroundImg{position: relative; z-index: 1; width:980px; height:150px; border-top: 1px solid skyblue; background: rgb(185, 222, 236);}
    #personalImg{position: relative; z-index: 2; margin-left: 420px; margin-top: -50px;}

    #pContent{

        width:980px; 
        height:300px; 
        text-align: center;
        margin-top: 20px;
        margin:0 auto;
    
    }
    table textarea{
        width: 90%; 
        height: 100px; 
        margin-top: 20px;;
        margin-right:75px;
        padding-left: 10px;
        font-size: 16px; 
        resize: none; 
        border-radius: 6px;
        border:1px solid gray;
    }
</style>    
</head>
<body>
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px;">파트너상세</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">파트너상세</p></span>
                <br><br><br><br><br>
                <div id="backgroundImg"></div>
                <div id="personalImg">
                    <img src="#" width="100px" height="100px" style="border-radius: 50px; background-color: darkblue;">
                    
                </div>
                <div id="pContent">
                    <table style="margin:0 auto; margin-top: 20px;">
                        <tr>
                            <th height="50px;" width="200px;">파트너이메일</th>
                            <td width="300px;" style="text-align: left; padding-left: 10px;">${ m.email }</td>
                            <th width="100px;">연락처</th>
                            <th width="200px;">${ m.phone }</th>
                        </tr>
                        <tr>
                            <th height="50px;" width="200px;">파트너 이름</th>
                            <td colspan="3" style="text-align: left; padding-left: 10px;">${ m.userName }</td>
                        </tr>
                        <tr>
                            <th style="padding-bottom: 50px;">소개</th>
                            <td colspan="3">
                                <textarea name="" id="">${ m.partnerIntro }</textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            
            
                <hr>
                <br>
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">숙소 리스트</p>
                </span>
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0" >
                        <thead>
                            <tr>
                                <th width="200px">상태</th>
                                <th width="200px">지역</th>
                                <th width="200px">숙소개시일</th>
                                <th width="200px">숙소명</th>
                                <th width="200px">총판매수</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<!-- 
                            <tr>
                                <td width="200px">심사진행중</td>
                                <td width="200px">파리</td>
                                <td width="200px">20.04.27</td>
                                <td width="200px">파리한인민박</td>
                                <td width="200px">52</td>
                            </tr> -->
                            <c:forEach items="${ listR }" var="r">
	                            <c:if test="${ r.status ne 5 }">
		                            <tr>
	                            		<c:choose>
				                            <c:when test="${ r.status eq 1}">
				                                <td width="200px">운영중</td>
				                            </c:when>
				                            <c:when test="${ r.status eq 2}">
				                                <td width="200px">승인대기</td>
				                            </c:when>
				                            <c:when test="${ r.status eq 3}">
				                                <td width="200px">승인거절</td>
				                            </c:when>
				                            <c:when test="${ r.status eq 4}">
				                                <td width="200px">휴면</td>
				                            </c:when>
			                            </c:choose>
		                                <td width="200px">${ r.addBasic }</td>
		                                <td width="200px">${ r.startDate }</td>
		                                <td width="200px">${ r.roomsTitle }</td>
		                                <td width="200px">52</td>
		                            </tr>
		                        </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <br><br>
                    <span id="page_title">
                        <img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;">
                        <p class="title_tt">체험 리스트</p>
                    </span>
                    <table class="common_tb" cellpadding="0" cellspacing="0" >
                        <thead>
                            <tr>
                                <th width="200px">상태</th>
                                <th width="200px">지역</th>
                                <th width="200px">체험개시일</th>
                                <th width="200px">체험명</th>
                                <th width="200px">총판매수</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<!-- 
                            <tr>
                                <td width="200px">운영중</td>
                                <td width="200px">서울</td>
                                <td width="200px">20.04.27</td>
                                <td width="200px">경복궁 역사체험</td>
                                <td width="200px">40</td>
                            </tr> -->
                            <c:forEach items="${ listE }" var="e">
	                            <c:if test="${ e.status ne 5 }">
		                            <tr>
			                            <c:choose>
				                            <c:when test="${ e.status eq 1}">
				                                <td width="200px">운영중</td>
				                            </c:when>
				                            <c:when test="${ e.status eq 2}">
				                                <td width="200px">승인대기</td>
				                            </c:when>
				                            <c:when test="${ e.status eq 3}">
				                                <td width="200px">승인거절</td>
				                            </c:when>
				                            <c:when test="${ e.status eq 4}">
				                                <td width="200px">휴면</td>
				                            </c:when>
			                            </c:choose>
		                                <td width="200px">${ e.addBasic }</td>
		                                <td width="200px">${ e.startDate }</td>
		                                <td width="200px">${ e.expTitle }</td>
		                                <td width="200px">40</td>
		                            </tr>
	                            </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br>
                    <div style="text-align: right;">
                        <button id="gotoList" onclick="javascript:history.go(-1);">목록으로 가기</button>
                    </div>
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