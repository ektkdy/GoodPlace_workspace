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
	
	
    <div id="wrap">
        
		<jsp:include page="../common/adminMenubar.jsp"/>
        
        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#"><span style="width: 30px;height: 30px;">대시보드</span></a>
            </div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">대시보드</p></span>
                <br><br><br><br><br><br>
                <div style="height:200px;">
                    <span ><b style="font-weight:bold; font-size: 1.3em;">오늘매출현황</b> <small>(05월17일 13:10 기준)</small></span>
                    <br>
                    
                    <table id="dbTable01">
                        <th rowspan="2" height="150px" width="100px">
                            <img src="${pageContext.request.contextPath}/resources/images/admin/calendar2.png" style="vertical-align: middle; width: 70px; height: 70px; padding-left: 60%;">
                        </th>
                        <th rowspan="2" width="200px" style="padding-left: 3%;">예약<small>(9건)</small><br><b>11,809,827</b> 원</th>
                        <th rowspan="2" height="150px" width="100px">
                            <img src="${pageContext.request.contextPath}/resources/images/admin/cash2.png" style="vertical-align: middle; width: 70px; height: 70px; padding-left: 60%;">
                        </th>
                        <th rowspan="2" width="200px">결제<small>(0건)</small><br><b>0</b> 원</th>
                        <th rowspan="2" height="150px" width="100px">
                            <img src="${pageContext.request.contextPath}/resources/images/admin/nocash2.png" style="vertical-align: middle; width: 70px; height: 70px; padding-left: 60%;">
                        </th>
                        <th rowspan="2" width="200px">환불<small>(0건)</small><br><b>0</b> 원</th>
                    </table>
                    <br>
                    <hr class="bline">

                    <span><b style="font-weight:bold; font-size: 1.3em;">예약 현황</b> <small>(최근 1개월 기준)</small></span>
                    <br>
                    
                    <table id="dbTable01">
                        <tr height="100px">
                            <th width="300px"><b style="font-size: 2.0em;">0</b></th>
                            <th width="300px"><b style="font-size: 2.0em;">0</b></th>
                            <th width="300px"><b style="font-size: 2.0em;">0</b></th>
                        </tr>
                        <tr>
                            <th width="300px" style="color:#34538a"><b>예약</b></th>
                            <th width="300px" style="color:#34538a"><b>입금완료</b></th>
                            <th width="300px" style="color:#34538a"><b>취소</b></th>
                        </tr>
                    </table>
                    <br>
                    <hr class="bline">

                    <span><b style="font-weight:bold; font-size: 1.3em;">회원 & 파트너 현황</b></span>
                    <br>
                    
                    <table id="dbTable01">
                        <tr height="100px">
                            <th width="300px"><b style="font-size: 2.0em;">0</b></th>
                            <th width="300px"><b style="font-size: 2.0em;">0</b></th>
                            <th width="300px"><b style="font-size: 2.0em;">0</b></th>
                        </tr>
                        <tr>
                            <th width="300px" style="color:#34538a"><b>일반회원</b></th>
                            <th width="300px" style="color:#34538a"><b>파트너</b></th>
                            <th width="300px" style="color:#34538a"><b>정지회원</b></th>
                        </tr>
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