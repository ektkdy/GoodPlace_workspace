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
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/admin/adminCommon.css" />
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

    /*대시보드*/
    #dbTable01{
        margin:auto;
        margin-right: 50px;
        text-align: center;
    }
    #dbTable01 b{font-size: 25px;}
    .bline {
        background-color: #34538a;
        height: 2px;
        border:0px;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
    <div id="header">
        <span id="gotomain">
            <a href="adminForm.me"><img src="${ pageContext.servletContext.contextPath }/resources/images/admin/배경없는_굿플로고.png" id="logo" alt="logo" ><p class="title_name">관리자</p></a>
        </span>
        <span id="p_info">
            <a href="" style="float:left; "><img src="${pageContext.request.contextPath}/resources/images/admin/admin.jpg" class="userphoto"><p>나관리</p></a><img src="${ pageContext.servletContext.contextPath }/resources/images/admin/arrow.png" class="arrow">
        </span>
        <div id="slide_menu">
            <ul>
                <li><a href="#">사용자페이지 가기</a></li>
                <li><a href="#">로그아웃</a></li>
            </ul>
        </div>
    </div>
    <div id="sidenav">
        <ul>
            <li><a href="adminForm.me"><span class="icon1"></span><p>대시보드</p></a></li>
            <li><a href="aMemberList.me?currentPage=1"><span class="icon2"></span><p>회원관리</p></a></li>
            <li><a href="aReportList.bo?currentPage=1"><span class="icon3"></span><p>신고관리</p></a></li>
            <li><a href="aReplyList.bo?currentPage=1"><span class="icon4"></span><p>후기관리</p></a></li>
            <li><a href="aPartnerList.me?currentPage=1"><span class="icon5"></span><p>파트너관리</p></a></li>
            <li><a href="aPowerList.po"><span class="icon6"></span><p>파워등록</p></a></li>
            <li><a href="aFaqList.bo?currentPage=1"><span class="icon7"></span><p>게시글관리</p></a></li>
            <li><a href="aAccountsList.ac?currentPage=1"><span class="icon8"></span><p>정산관리</p></a></li>
            <li><a href="aMessagesList.me"><span class="icon9"></span><p>메세지</p></a></li>
            <li><a href="aInquiryList.bo?currentPage=1"><span class="icon10"></span><p>1:1문의관리</p></a></li>
            <li><a href="aRoomsWaitList.ro?currentPage=1"><span class="icon11"></span><p>숙소관리</p></a></li>
            <li><a href="aExpWaitList.ex?currentPage=1"><span class="icon12"></span><p>체험관리</p></a></li>
        </ul>
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