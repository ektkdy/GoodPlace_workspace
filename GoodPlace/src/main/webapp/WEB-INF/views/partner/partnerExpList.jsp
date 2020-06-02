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
    
    
    /*모든 버튼*/
    button{cursor: pointer;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}

    /*비고 안 버튼 3종 css*/
    table .blue_btn{width: 80px;}
     
    /*페이징바*/
    h5{color: royalblue;}
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
            <a href="#"><span style="margin-right: 30px;"> &gt; 체험관리</span></a>
        </div>
        <br clear="both">
        <div class="con" style="color:#000">
            <span id="page_title">
                <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                <p class="title_tt">체험관리</p>
            </span>
            <span class="up_btn_space">
                <button class="blue_btn" style="margin-right: 20px;" id="expForm">체험등록</button>
            </span>
            
            <div class="con2">
                <table class="common_tb" cellpadding="0" cellspacing="0" >
                    <thead>
                        <tr>
                            <td width="100px">상태</td>
                            <td width="100px">지역</td>
                            <td width="100px">체험개시일</td>
                            <td width="300px">체험명</td>
                            <td width="200px">누적판매수</td>
                            <td width="300px">비고</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>상태</td>
                            <td>파리</td>
                            <td>20.04.27</td>
                            <td>체험이름</td>
                            <td>52</td>
                            <td>
                                <button class="blue_btn">보기</button>
                                <button class="blue_btn">수정</button>
                            </td>
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
<script type="text/javascript">
	$(function(){
		$("#expForm").click(function(){
			location.href="expEnrollForm1.exp";
		});
	});

</script>
</body>
</html>