<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerRoomList.css" />
<style>
button:hover{cursor:pointer}
</style>
</head>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px;">HOME</span>&gt;
                </a>
                <a href="#">
                    <span> 숙소관리</span>
                </a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;">
                    <p class="title_tt">숙소관리</p>
                </span>
                <span class="up_btn_space" style="margin-top:8px">
                    <button class="blue_btn">파워등록신청</button>
                    <button class="blue_btn">숙소등록</button>
                </span>
                
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
                                <td width="120">상태</td>
                                <td width="100">지역</td>
                                <td width="100">숙소개시일</td>
                                <td width="400">숙소명</td>
                                <td width="100">총판매수</td>
                                <td width="300">비고</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><div class="ing" style="margin:0 auto">운영중</div></td>
                                <td>파리</td>
                                <td>20.04.27</td>
                                <td>파리한인민박</td>
                                <td>52</td>
                                <td>
                                    <button class="detail_btn">보기</button>
                                    <button class="modify_btn">수정</button>
                                    <button class="schedule_btn">일정관리</button>
                                </td>
                            </tr>
                            <tr>
                                <td><div class="confirm_ing" style="margin:0 auto">심사진행중</div></td>
                                <td>파리</td>
                                <td>20.04.27</td>
                                <td>파리한인민박</td>
                                <td>52</td>
                                <td>
                                    <button class="detail_btn">보기</button>
                                    <button class="modify_btn">수정</button>
                                    <button class="schedule_btn">일정관리</button>
                                </td>
                            </tr>
                            <tr>
                                <td><div class="cancel" style="margin:0 auto">승인거절</div></td>
                                <td>파리</td>
                                <td>20.04.27</td>
                                <td>파리한인민박</td>
                                <td>52</td>
                                <td>
                                    <button class="detail_btn">보기</button>
                                    <button class="modify_btn">수정</button>
                                    <button class="schedule_btn">일정관리</button>
                                </td>
                            </tr>
                            <tr>
                                <td><div class="rest" style="margin:0 auto">휴면중</div></td>
                                <td>파리</td>
                                <td>20.04.27</td>
                                <td>파리한인민박</td>
                                <td>52</td>
                                <td>
                                    <button class="detail_btn">보기</button>
                                    <button class="modify_btn">수정</button>
                                    <button class="schedule_btn">일정관리</button>
                                </td>
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