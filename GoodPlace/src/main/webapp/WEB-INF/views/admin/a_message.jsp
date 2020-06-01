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

    /*검색+옵션*/
    #selectMsg{width: 140px; height: 35px; border-radius: 6px;}
    #search{width: 140px; height: 35px; margin-right: -5px;border-top-left-radius: 6px; border-bottom-left-radius: 6px; border: 1px solid #a5a5a5;}
    #searchBtn{width: 50px; height: 37px; margin-right: 20px; border-top-right-radius: 6px; color:#fff;
                border-bottom-right-radius: 6px; border: 1px solid #34538a; background-color: #34538a;}

    /*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer; border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
</style>     
</head>
<body>
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px;">메세지</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">메세지</p></span>
                <span class="up_btn_space">
                    <select name="selectMsg" id="selectMsg">
                        <option value="all">모든메세지</option>
                        <option value="openyet">읽지않은 메세지</option>
                    </select>
                    <input id="search" type="text" placeholder="여행자 이름 검색">
                    <input type="button" id="searchBtn" value="검색">
                </span>
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0" >
                        <thead>
                            <tr>
                                <td width="200px">메세지보낸사람</td>
                                <td width="200px">시간</td>
                                <td width="500pc">메세지내용</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td width="200px">메세지보낸사람</td>
                                <td width="200px">시간</td>
                                <td width="500pc">메세지내용</td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="pagingArea" style="margin-top: 22px;">
                        <a>&lt;</a>
                        <a>1</a>
                        <a>2</a>
                        <a>3</a>
                        <a>4</a>
                        <a>5</a>
                        <a>&gt;</a>
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