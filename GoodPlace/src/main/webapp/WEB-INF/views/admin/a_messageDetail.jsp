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

    /* 메세지 상세 */
    .msgDetail{ width: 980px; padding-top:50px;}
    .msgDetail p{padding-top: 20px; padding-bottom: 20px;}
    .msgUser{border-top: 1px solid #bebebe; border-bottom: 1px solid #dbdbdb;}
    .msgContents{height: 200px;}
    .msgSend{border-top: 1px solid #dbdbdb; border-bottom: 1px solid #bebebe;}
    .msgSend input{height: 60px; width: 830px; border: 0px;}
    .msgSend button{float: right;margin-top: 12px; width: 140px; height: 35px; border-radius: 6px; border: 0; background-color: #34538a; color: #fff;}

    /*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
</style>     
</head>
<body>
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px; margin-right: 30px;">메세지상세</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">메세지상세</p></span>
                <div class="con2">
                    <div class="msgDetail">
                        <div class="msgUser">
                            <p> <img src="#"> 방기남 님과의 대화</p>
                        </div>
                        <div class="msgContents">
                            
                        </div>
                        <div class="msgSend">
                            <input type="text" placeholder="메세지를 입력하세요">
                            <button>SEND</button>
                        </div>
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