<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerReplyDetailView.css" />
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
                    <span style="height: 30px;">답글 전 후기</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">답글작성</span>
                </a>
            </div>
            <div class="con" style="color:#000; ">
                <span id="page_title"><img src="../image/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">답글 전 후기</p></span>
                <br clear="both">
                <div>
                    <table class="replyDetail" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr class="pdTop">
                                <td rowspan="2" style="width:100px; ">
                                    <div align="center"><img src="#" width="50px" height="50px"></div>
                                </td>
                                <td width="250">예약자명 : 홍길동</td>
                                <td width="300">예약자 평점 : 4.5</td>
                                <td width="250">연령대 : 20대</td>
                            </tr>
                            <tr class="pdBot">
                                <td>여행일 : 20.04.27</td>
                                <td>후기작성일 : 20.04.29</td>
                                <td>여행목적 : 혼자가는여행</td>
                            </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4">
                                <div class="reply_con"></div>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4" style="padding-top:15px; padding-bottom:10px; font-weight: 500; ">답글쓰기</td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <textarea type="text" class="replyAnswer" rows="10"></textarea>
                            </td>
                        </tr>
                    </tfoot>
                    </table>
                    <div class="replyBtnArea" style="width:100%">
                        <button class="blue_btn" >댓글등록</button>
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