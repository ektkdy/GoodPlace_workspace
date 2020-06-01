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
    #wrap {width: 1200px; height: 950px; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }
    /* 회원 관리 */

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
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px;">정산관리</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">수익내역</p></span>
                <button class="blue_btn" style="margin-left: 13%;">내역화면</button>
                <button class="blue_btn">엑셀 다운로드</button>

                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
                                <div style="width: 920px; height: 500px; border: 1px solid black; text-align:center; margin-top: 30px;">
                                    	차트영역
                                </div>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <div style="width: 920px; height: 200px; background: #dbdbdb; text-align:center; margin-top: 30px;">
                                    
                                </div>
                            </tr>
                        </tbody>
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