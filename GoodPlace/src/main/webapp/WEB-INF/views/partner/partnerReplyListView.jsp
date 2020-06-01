<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerReplyList.css" />
</head>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" style="width:980px" >
            <div id="tab">
                <button class="on lt_tab">답글 전 후기</button>
                <button class="off gt_tab">답글 후 후기</button>
            </div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px;">HOME</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">후기관리</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">답글 전 후기</span>
                </a>
            </div>
            <div class="con" style="color:#000; ">
                <span id="page_title"><img src="../image/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">답글 전 후기</p></span>
                <span class="up_btn_space">
                    <select style="width:250px; height:35px; border-radius: 5px;">
                        <option>숙소 선택하기</option>
                    </select>
                </span>
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