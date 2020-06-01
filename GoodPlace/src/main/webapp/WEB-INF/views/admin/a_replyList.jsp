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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/a_replyList.css" />
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
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px;">후기관리</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">등록된후기(1665개)</p></span>
                <span class="up_btn_space">
                    <select style="width:250px; height:35px; border-radius: 5px;">
                        <option>등록일</option>
                        <option>별점</option>
                    </select>
                </span>
                <br clear="both">
                <table class="reply_tb" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="80px"><img src="#"></td>
                        <td width="80px">방송국님</td>
                        <td width="500px">이번에 이용했는데 너무 좋아서 또가고싶어요!!</td>
                        <td width="150">★★★★★</td>
                        <td wodth="100" class="text_center">여행일<p>20-05-10</p></td>
                    </tr>
                    <tr>
                        <td width="80px"><img src="#"></td>
                        <td width="80px">방송국님</td>
                        <td width="500px">이번에 이용했는데 너무 좋아서 또가고싶어요!!</td>
                        <td width="150">★★★★★</td>
                        <td wodth="100" class="text_center">여행일<p>20-05-10</p></td>
                    </tr>
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
        <div id="footer">footer</div>
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