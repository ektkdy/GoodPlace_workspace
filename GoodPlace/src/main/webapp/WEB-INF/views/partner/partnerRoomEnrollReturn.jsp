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
                    <div class="reason">
                        <h3>숙소 신청이 반려되었습니다.</h3>
                        <table class="reason_tb">
                            <tr class="pdBtom">
                                <th width="120">거절사유</th>
                                <td>적절치 않은 숙소 이름</td>
                            </tr>
                            
                            <tr>
                                <th>상세내용</th>
                                <td><textarea cols="120" rows="5" readonly></textarea></td>
                            </tr>
                            <tfoot>
                                <tr>
                                    <td colspan="2">사유 확인 후 내용을 변경하여 다시 등록 요청을 해주세요. </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <table class="roomEnroll_tb" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
                                <th colspan="3" class="enrollInfo pdTopBtom">
                                    • 안내에 따라 여행 내용을 정확하게 설명하여 주세요.<br>
                                    • 상품 등록이 완료되면, 승인을 위한 심사가 진행됩니다.
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th rowspan="2">* 숙소명</th>
                                <td colspan="2"><input type="text" name=""></td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2" class="enrollInfo">• 정확하고 간결하게 표현해주세요.</td>
                            </tr>
                            <tr class="pdBtom">
                                <th>*숙소위치</th>
                                <td colspan="2"><input type="text" name=""></td>
                            </tr>
                            <tr>
                                <th rowspan="2" width=" ">* 대표사진</th>
                                <td rowspan="2"><div style="width: 100px; height: 100px;"></div></td>
                                <td><button>사진등록</button></td>
                            </tr>
                            <tr class="pdBtom">
                                <td class="enrollInfo">• 텍스트 및 로고가 있을 경우 관리자가 사진을 수정 혹은 삭제할 수 있습니다.</td>
                            </tr>
                            <tr>
                                <th rowspan="4">* 상세사진</th>
                                <td rowspan="4" class="photo_btn"><button>사진등록</button></td>
                                <td colspan="2">썸네일.png</td>
                            </tr>
                            <tr><td colspan="2">썸네일.png</td></tr>
                            <tr><td colspan="2">썸네일.png</td></tr>
                            <tr class="pdBtom"><td colspan="2">썸네일.png</td></tr>
                            <tr>
                                <th rowspan="2">* 예약 설정</th>
                                <td colspan="2"><input type="number" min="1" max="72">시간 전 부터 예약을 받지 않겠습니다.</td>
                            </tr>
                            <tr class="pdBtom"><td colspan="2" class="enrollInfo">• 최소 몇시간 전까지 예약을 받길 원하시나요? 기본은 36시간 입니다.</td></tr>
                            <tr>
                                <th rowspan="4">* 객실정보</th>
                                <td>침대수 : <input type="number" min="1"></td>
                                <td>샤워실수 : <input type="number" min="1"></td>
                            </tr>
                            <tr>
                                <td>화장실수 : <input type="number" min="1"></td>
                                <td>1박금액 : <input type="number" min="1"></td>
                            </tr>
                            <tr>
                                <td>최소인원 : <input type="number" min="1"></td>
                                <td>최대인원 : <input type="number" min="1"></td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2" class="enrollInfo">• 1박 금액은 승인심사 이후 변경될수 있습니다. 최소인원 이상일 경우 1인당 일정금액이 추가되며 <br>최대인원수 이상 받을수 없습니다.</td>
                            </tr>
                            <tr>
                                <th rowspan="10">* 숙소시설</th>
                                <td >
                                    <input type="checkbox" name="rooms" value="">침구
                                </td>
                                <td>
                                    <input type="checkbox" name="rooms" value="">아기침대
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <input type="checkbox" name="rooms" value="">여분의침구
                                </td>
                                <td>
                                    <input type="checkbox" name="rooms" value="">다리미
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <input type="checkbox" name="rooms" value="">주방
                                </td>
                                <td>
                                    <input type="checkbox" name="rooms" value="">식기류
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <input type="checkbox" name="rooms" value="">냉장고
                                </td>
                                <td>
                                    <input type="checkbox" name="rooms" value="">전자레인지
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <input type="checkbox" name="rooms" value="">인덕션
                                </td>
                                <td>
                                    <input type="checkbox" name="rooms" value="">조리도구(냄비 등)
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <input type="checkbox" name="rooms" value="">커피포트
                                </td>
                                <td>
                                    <input type="checkbox" name="rooms" value="">세탁기
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <input type="checkbox" name="rooms" value="">에어컨
                                </td>
                                <td>
                                    <input type="checkbox" name="rooms" value="">공용PC
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <input type="checkbox" name="rooms" value="">케이블TV
                                </td>
                                <td>
                                    <input type="checkbox" name="rooms" value="">드라이기
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <input type="checkbox" name="rooms" value="">아기욕조
                                </td>
                                <td>
                                    <input type="checkbox" name="rooms" value="">온수 및 난방
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <td>
                                    <input type="checkbox" name="rooms" value="">옷걸이
                                </td>
                                <td>
                                    <input type="checkbox" name="rooms" value="">주차가능
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="3">* 제공서비스</th>
                                <td>
                                    <input type="checkbox" name="service" value="">샴푸
                                </td>
                                <td>
                                    <input type="checkbox" name="service" value="">화장지
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" name="service" value="">바디워시
                                </td>
                                <td>
                                    <input type="checkbox" name="service" value="">비누
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <td>
                                    <input type="checkbox" name="service" value="">수건
                                </td>
                                <td>
                                    <input type="checkbox" name="service" value="">Free wifi
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="2">포함사항</th>
                                <td>
                                    <input type="checkbox" name="includeService" value="">조식
                                </td>
                                <td>
                                    <input type="checkbox" name="includeService" value="">중식
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2">
                                    <input type="checkbox" name="includeService" value="">석식
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="4">* 숙소검색태그</th>
                                <td>
                                    <input type="checkbox" name="tag" value="">신축건물
                                </td>
                                <td>
                                    <input type="checkbox" name="tag" value="">교통이 편리한
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" name="tag" value="">관광명소가 가까운
                                </td>
                                <td>
                                    <input type="checkbox" name="tag" value="">무인으로 운영되는
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" name="tag" value="">커플숙소
                                </td>
                                <td>
                                    <input type="checkbox" name="tag" value="">비주얼이 예쁜
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <td>
                                    <input type="checkbox" name="tag" value="">이색숙소
                                </td>
                                <td>
                                    <input type="checkbox" name="tag" value="">조식이 포함된
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 필수안내</th>
                                <td colspan="2">
                                    <textarea rows="10" cols="80" style="resize: none; overflow-y: scroll;"></textarea>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 이용안내</th>
                                <td>체크인 시간 : <input type="time"></td>
                                <td>체크아웃 시간 : <input type="time"></td>
                            </tr>
                            <tr class="pdBtom">
                                <th rowspan="6">*검토 후 제출</th>
                                <td colspan="2">
                                    <input type="checkbox" name="agree" value="">서비스 수수료에 동의합니다.
                                    <p>굿플레이스는 각 예약당 요금의 20%에 해당하는 수수료를 받습니다.<br>
                                    모든 결제는 굿플레이스를 통해 진행되며 고객센터를 통한 24시간 지원과 함께<br>
                                    대부분의 체험에 대해 책임 보험도 제공하고 있습니다.<br>
                                    서비스 수수료에 대해 자세히 알아보세요.</p>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2">
                                    <input type="checkbox" name="agree" value="">굿플레이스 회원만을 위한 체험을 진행합니다.
                                    <p>굿플레이스를 통해 체험예약을 받는 날에는 굿플레이스 게스트만 체험예약을 <br>
                                    진행해야만 합니다. 다른 플랫폼을 통해 예약하고 결제한 게스트는 <br>
                                    별도로 체험 진행해야 합니다.</p>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2">
                                    <input type="checkbox" name="agree" value="">
                                    굿플레이스의 안전관리 지침을 읽고 이해했으며 진행하는 체험이 지침을<br>&nbsp;&nbsp;&nbsp; 
                                    준수함을 확인합니다.
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2">
                                    <input type="checkbox" name="agree" value="">
                                    현지가이드라인 및 현지 안전 법규를 준수하며 이를 어길 시<br>&nbsp;&nbsp;&nbsp;  
                                    굿플레이스 플랫폼에서 삭제될 수 있음을 이해합니다.
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2">
                                    <input type="checkbox" name="agree" value="">굿플레이스 서비스와 게스트 환불 정책에 동의합니다.
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2">
                                    <input type="checkbox" name="agree" value="">전체 동의 후 체험 제출
                                </td>
                            </tr>
                    </table>
                    <div class="btnArea">
                        <button class="cancel">취소하기</button>
                        <button class="enroll">등록하기</button>
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