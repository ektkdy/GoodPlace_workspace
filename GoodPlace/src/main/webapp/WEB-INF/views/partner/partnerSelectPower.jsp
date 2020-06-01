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
    .apply{width: 70px; height: 35px; background-color: #184c88; color:#fff; border: 0px; border-radius: 6px;}
    button{cursor: pointer;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}

    /* table */
    .common_tb tbody tr td input{border: 0px; width: 80px; text-align: right;}
    .common_tb tbody tr td select{border-radius: 4px; width: 140px; height: 35px;}
    
    /*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer;  border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}

    /* 모달 스타일*/
    .modal-body{margin:auto;}
</style>        
</head>
<body>
	<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" >
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#"><span style="height: 30px;">HOME</span></a>
                <a href="#"><span style="margin-right: 30px;"> &gt; 파워등록신청</span></a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">파워등록신청</p>
                </span>
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0" >
                        <thead>
                            <tr>
                                <td width="100px">상태</td>
                                <td width="100px">지역</td>
                                <td width="300px">숙소명</td>
                                <td width="100px">총판매수</td>
                                <td width="100px">파워종류</td>
                                <td width="100px">파워금액</td>
                                <td width="100px">파워기간</td>
                                <td width="100px">비고</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>운영중</td>
                                <td>파리</td>
                                <td>파리한인민박</td>
                                <td>52</td>
                                <td>
                                    <select name="powerKind" class="powerKind">
                                        <option value="300000" selected>STANDARD</option>
                                        <option value="500000">MEGA PACK</option>
                                        <option value="800000">ULTRA PACK</option>
                                        <option value="1200000">PLATINUM</option>
                                    </select>
                                </td>
                                <td><input type="text" class="result1 re" id="" name="" value="300000">원</td>
                                <td><input type="text" class="result2 re" id="" name="" value="30">일</td>
                                <td><button type="button" class="apply" data-toggle="modal" data-target="#myModal">신청</button></td>
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
            $(".powerKind").change(function(){
                value1=$("option:selected").val();
                $(".result1").val(value1);
                if(value1=="300000"){
                    $(".result2").val("30");
                } else if(value1=="500000"){
                    $(".result2").val("60");
                } else if(value1=="800000"){
                    $(".result2").val("90");
                } else{
                    $(".result2").val("120");
                }
            });
        });

    </script>
</body>
</html>