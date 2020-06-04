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
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerCommon.css" />
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
</style>
</head>
<body>


	<!-- 반응 메세지 출력 -->
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
	
	<div id="header">
            <span id="gotomain">
                <a href=""><img src="${ pageContext.servletContext.contextPath }/resources/images/partner/nobackgroundlogo.png" id="logo" alt="logo"><p class="title_name">파트너</p></a>
            </span>
            <span id="p_info">
                <a href="" style="float:left; ">
                	<img src="${pageContext.request.contextPath}/resources/uploadFiles/userProfile/${loginUser.changeName}" class="userphoto" style="border-radius: 50px; margin-right:5px;">
                	<p>${ loginUser.userName }</p>
                </a>
                <img src="${pageContext.request.contextPath}/resources/images/partner/arrow.png" class="arrow" style="margin-left:10px;">
            </span>
            <div id="slide_menu">
                <ul>
                    <li><a href="">사용자페이지 가기</a></li>
                    <li><a href="">로그아웃</a></li>
                </ul>
            </div>
        </div>
        <div id="sidenav">
            <ul>
                <li><a href=""><span class="icon1"></span><p>대시보드 </p></a></li>
                <li><a href=""><span class="icon2"></span><p>예약관리</p></a></li>
                <li><a href=""><span class="icon3"></span><p>일정관리</p></a></li>
                <li><a href="list.ro?currentPage=1"><span class="icon4"></span><p>숙소관리</p></a></li>
                <li><a href=""><span class="icon5"></span><p>후기관리</p></a></li>
                <li><a href="list.exp?currentPage=1"><span class="icon6"></span><p>체험관리</p></a></li>
                <li><a href=""><span class="icon7"></span><p>정산관리</p></a></li>
                <li><a href=""><span class="icon8"></span><p>메세지</p></a></li>
                <li><a href="pAccount.me"><span class="icon9"></span><p>계정관리</p></a></li>
                <li><a href="pNoticeList.bo?currentPage=1"><span class="icon10"></span><p>공지사항</p></a></li>
            </ul>
        </div>
</body>
</html>