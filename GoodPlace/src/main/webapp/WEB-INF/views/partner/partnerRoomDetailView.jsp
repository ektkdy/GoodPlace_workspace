<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerRoomEnroll.css" />
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
                    <span>숙소관리</span>&gt;
                </a>
                <a href="#">
                    <span>숙소등록</span>
                </a>
            </div>
            <br clear="both">
            <div class="con" style="width:980px; color:#000">
                <span id="page_title">
                    <img src="../image/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">숙소등록</p>
                </span>
                <br clear="both">
                <div class="con2">
                    <table class="roomEnroll_tb" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr class="pdTop">
                                <th>숙소명</th>
                                <td colspan="2">제주 협재해수 산들바람마을</td>
                            </tr>
                            <tr class="pdBtom pdTop">
                                <th>숙소위치</th>
                                <td colspan="2">제주도 제주시 ~~</td>
                            </tr>
                            <tr>
                                <th width=" ">대표사진</th>
                                <td colspan="2"><div style="width: 100px; height: 100px; border:1px solid"></div></td>
                            </tr>
                            <tr class="pdTop">
                                <th rowspan="4">상세사진</th>
                                <td colspan="2">썸네일.png</td>
                            </tr>
                            <tr><td colspan="2">썸네일.png</td></tr>
                            <tr><td colspan="2">썸네일.png</td></tr>
                            <tr class="pdBtom"><td colspan="2">썸네일.png</td></tr>
                            <tr class="pdBtom">
                                <th >예약 시간</th>
                                <td colspan="2">24시간 전 부터 예약을 받지 않겠습니다.</td>
                            </tr>
                            <tr class="pdBtom">
                                <th>객실정보</th>
                                <td colspan="2">침대수 : 3<br>
                                샤워실수 : 2<br>
                                화장실수 : 2<br>
                                1박금액 : 35000원<br>
                                최소인원 : 2<br>
                                최대인원 : 3
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>숙소시설</th>
                                <td colspan="2">
                                    아아아
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>제공서비스</th>
                                <td colspan="2">
                                    아아아
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>포함사항</th>
                                <td colspan="2">
                                    없음
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>숙소검색태그</th>
                                <td>
                                    신축건물
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 필수안내</th>
                                <td colspan="2">
                                    <textarea rows="10" cols="80" readonly style="resize: none; overflow-y: scroll;"> 어쩌고오 저쩌고오</textarea>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>이용안내</th>
                                <td>체크인 시간 : 15:00</td>
                                <td>체크아웃 시간 : 11:00</td>
                            </tr>
                    </table>
                    <div class="btnArea">
                        <button class="cancel">목록으로</button>
                        <button class="enroll">수정하기</button>
                    </div>
                </div>
            </div>
        </div>
</div>
</body>
</html>