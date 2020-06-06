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
                    <span>숙소상세</span>
                </a>
            </div>
            <br clear="both">
            <div class="con" style="width:980px; color:#000">
                <span id="page_title">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;">
                    <p class="title_tt">숙소상세</p>
                </span>
                <br clear="both">
                <div class="con2">
                    <table class="roomEnroll_tb" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr class="pdTop">
                                <th>숙소명</th>
                                <td colspan="2">${r.roomsTitle }</td>
                            </tr>
                            <tr class="pdBtom pdTop">
                                <th>숙소위치</th>
                                <td colspan="2">${r.addBasic} </td>
                            </tr>
                            <tr>
                                <th width=" ">대표사진</th>
                                <td colspan="2"><img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${r.changeName }" style="width:200px; height:150px"></td>
                            </tr>
                            <tr class="pdTop">
                                <th >상세사진</th>
                                <td colspan="2">썸네일.png</td>
                            </tr>
                            <tr class="pdBtom">
                                <th >예약 시간</th>
                                <td colspan="2">${r.deadline }시간 전 부터 예약을 받지 않겠습니다.</td>
                            </tr>
                            <tr class="pdBtom">
                                <th>객실정보</th>
                                <td colspan="2">침대수 : ${r.bedCount }<br>
								                                   샤워실수 : ${r.bathCount }<br>
								                                   화장실수 : ${r.restroomCount }<br>
			                                   1박금액 : ${r.price }원<br>
								                                  최소인원 : ${r.minPeople }<br>
								                                  최대인원 : ${r.maxPeople }
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>숙소시설</th>
                                <td colspan="2">
                                    ${r.facility }
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>제공서비스</th>
                                <td colspan="2">
                                    ${r.service }
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>포함사항</th>
                                <td colspan="2">
                               		${r.meal}
                            </tr>
                            <tr class="pdBtom">
                                <th>숙소검색태그</th>
                                <td>
                               		${r.roomsTag }
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 필수안내</th>
                                <td colspan="2">
                                    <textarea rows="10" cols="80" readonly style="resize: none; overflow-y: scroll;"> ${r.roomsNotice }</textarea>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>이용안내</th>
                                <td>체크인 시간 : ${r.checkIn }</td>
                                <td>체크아웃 시간 : ${r.checkOut }</td>
                            </tr>
                    </table>
                    <div class="btnArea">
                        <button class="cancel" onclick="location.href='list.ro?currentPage=1'">목록으로</button>
                        <button class="enroll">수정하기</button>
                    </div>
                </div>
            </div>
        </div>
</div>
</body>
</html>