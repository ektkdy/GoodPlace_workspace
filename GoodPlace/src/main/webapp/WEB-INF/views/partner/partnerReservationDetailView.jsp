<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerReservationStep.css" />
<style>
#gotoList{border: 1px solid #dbdbdb;  width:100px; height:35px; border-radius:5px}
#gotoList:hover{background-color: white; border: solid 1px #dbdbdb; }
</style>
</head>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
         <div id="contents" >
            <div id="tab">
                <button class="on lt_tab">진행중인 예약</button>
                <button class="off mid_tab">확정된 예약</button>
                <button class="off gt_tab">취소된 예약</button>
            </div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px; margin:0">대시보드</span>&gt;
                </a>
                <a href="#">
                    <span>&nbsp;예약관리</span>&gt;
                </a>
                <a href="#">
                    <span>&nbsp;진행중인예약</span>&gt;
                </a>
                <a href="#">
                    <span>&nbsp;예약상세</span>
                </a>
            </div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${ pageContext.servletContext.contextPath }/resources/images/homelogo.jpg" style="vertical-align: middle;"><p class="title_tt">진행중인예약</p></span>
                <br clear="both">
                <table class="step_tb" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <td colspan="5"><img src="../image/step_icon1.png" width="30px" height="30px">방기남 님과 함께하는 여행</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="stepArea">
                            <td>
                                <span class="step_img1_on"></span>
                                <br clear="both">확정대기
                            </td>
                            <td rowspan="2">
                                <img src="../image/arrow_2.png">
                            </td>
                            <td>
                                <span class="step_img2_off"></span>
                                <br clear="both">예약확정
                            </td>
                            <td rowspan="2">
                                <img src="../image/arrow_2.png">
                            </td>
                            <td>
                                <span class="step_img3_off"></span>
                                <br clear="both">여행완료
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5" class="step_notice">
                                <p>*예약이 접수되었습니다. 24시간 내에 확정여부를 알려주세요.
                                    <br><br>
                                    숙박 가능 여부를 확인해주세요. 예약 진행이 가능하면 "예약확정"을, 불가능하면 "예약취소"를 해주세요.<br>
                                    예약 취소시 다른 날짜에 대해 안내하거나, 불가능한 이유에 대해 정중하게 알려주시기 바랍니다.
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" class="step_btn">
                                <button class="confirm">확정하기</button>
                                <button class="cancel">예약취소</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <br>
                <table class="info_tb" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <td colspan="2"><img src="../image/step_icon2.png" width="30px" height="30px" >제주 협재(산들바람피는마을)</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td width="250">예약번호</td>
                            <td>gt0424</td>
                        </tr>
                        <tr>
                            <td>예약일자</td>
                            <td>2020-06-09~2020-06-15</td>
                        </tr>
                        <tr>
                            <td>예약자</td>
                            <td>방기남</td>
                        </tr>
                        <tr>
                            <td rowspan="5">예약자 정보</td>
                            <td class="no_border">예약인원:1</td>
                        </tr>
                        <tr><td class="no_border">이름 : 방기남</td></tr>
                        <tr><td class="no_border">성별 : 남자</td></tr>
                        <tr><td class="no_border">생년월일 : 950315</td></tr>
                        <tr><td>연락처는 예약이 확정후 보여집니다.</td></tr>
                        <tr>
                            <td>예약일수</td>
                            <td>6일</td>
                        </tr>
                        <tr>
                            <td>여행컨셈</td>
                            <td>20대/혼자떠나는 여행</td>
                        </tr>
                        <tr>
                            <td>요청사항</td>
                            <td>없음</td>
                        </tr>
                        <tr>
                            <td>결제금액</td>
                            <td>300,000원</td>
                        </tr>
                    </tbody>
                </table>
               <!-- <table class="message_tb">
                    <thead>
                        <tr>
                            <td colspan="2"><img src="../image/step_icon3.png" width="30px" height="30px" >방기남 님과의 대화</td>
                        </tr>
                    </thead>
                    <tbody id="chat_area">
                        <tr>
                            <td>
                                <div style="height: 400px;">
                                    <table class="chat_tb">
                                        <tr class="other"> 
                                            <td width="80"><img src=""></td>
                                            <td class="chat">
                                                방기남 
                                                <p>숙소앞에 도착했는데 들어가도될까요?</p>
                                            </td>
                                        </tr>
                                        <tr class="me">
                                            <td width="80" style="float: right; margin-left:20px"><img src=""></td>
                                            <td class="chat">
                                                나
                                                <p>네 들어오셔도되요~^^</p>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr></tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2">
                                <input type="text" class="text_input"><button type="submit" >send</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>-->
                <div style="height:10px"></div>
                <button type="button" id="gotoList" onclick="javascript:history.go(-1);">목록으로</button>
                <div style="height:50px"></div>
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