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
    #contents{height: 800px;}

    /* table */
    table textarea{width: 920px; height: 300px; font-size: 16px; resize: none; border:0px}
    .bottum_tb{margin-top: 30px;}
    .bottum_tb thead tr td{font-size: 16px; color:#333; padding: 10px 0; padding-left: 20px;
                           border-top: 1px solid #dbdbdb}
    table>thead>tr:hover{cursor: pointer;}

    /*모든 버튼*/
    button{cursor: pointer; width: 140px; height: 35px; margin-right: 20px; border-radius: 6px; border: 1px solid #34538a; background-color: #34538a; color: #fff;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}

</style>        
</head>
<body>
 <div id="wrap">
	<jsp:include page="../common/partnerMenubar.jsp"/>
	<div id="contents" >
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#"><span style="height: 30px;">HOME</span></a>
                <a href="#"><span> &gt; 공지사항</span></a>
                <a href="#"><span style="margin-right: 30px;"> &gt; 공지사항상세</span></a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">공지사항</p>
                </span>
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0" >
                        <thead>
                            <tr>
                                <td width="900px">공지사항 제목입니다</td>
                                <td width="200px">20.03.01</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2">
                                    <textarea name="" id="">공지사항 내용입니다.</textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                    <div style="text-align: right; margin-right:20px;">
                        <button id="gotoList">목록으로 가기</button>
                    </div>
                    <div>
                        <table class="bottum_tb" cellpadding="0" cellspacing="0">
                            <thead>
                                <tr>
                                    <td width="150px">이전글</td>
                                    <td width="800px">이전글 제목입니다</td>
                                </tr>
                                <tr>
                                    <td style="border-bottom:1px solid #dbdbdb">다음글</td>
                                    <td style="border-bottom:1px solid #dbdbdb">다음글 제목입니다</td>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function(){
            $(".bottum_tb>tbody>tr").click(function(){
                var bno  = $(this).children().eq(0).text();
                location.href="${pageContext.request.contextPath}/detail.no?nno="+nno;
            });
        });
    </script>

</body>
</html>