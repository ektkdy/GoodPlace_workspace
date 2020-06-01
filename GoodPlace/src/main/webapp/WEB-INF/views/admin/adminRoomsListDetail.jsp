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
    #wrap {width: 1200px; height:100%; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }

    /*roomsEnroll 내부 css*/
    .roomEnroll_tb{width:100%;  border:1px solid #bebebe; }
    .roomEnroll_tb tr th{width: 260px; vertical-align: top; padding-left:40px}
    .roomEnroll_tb .enrollInfo{font-size: 13px; color: #0d80fb; font-weight: 400; }
    .pdTopBtom{padding-top:15px; padding-bottom: 15px;}
    .roomEnroll_tb tbody tr.pdBtom td{padding-bottom:30px}
    .roomEnroll_tb button{width:80px; height: 30px; border:1px solid #bebebe; background: #f1f1f1; color:#333; border-radius: 5px;}
    .roomEnroll_tb .photo_btn{vertical-align: top;}
    .roomEnroll_tb input{ border-radius:3px; border:1px solid #bebebe; }
    .btnArea{float: right; padding-top:15px; padding-bottom:30px}
    .btnArea button{width: 150px;height: 40px;}
    .btnArea .cancel{border-radius: 5px; border: 1px solid #bebebe; background: #f1f1f1;}
    .btnArea .enroll{border-radius: 5px; border: 1px solid #184c88; background: #184c88; color:#fff}

    .roomEnroll_tb>tbody>tr>td>input[type="checkbox"]{margin-right: 10px;}
    .roomEnroll_tb>tbody>tr>td>input[type="number"]{width: 100px; height: 28px; border-radius: 4px; margin-bottom: 10px;}
    .roomEnroll_tb>tbody>tr>td>input[type="text"]{width: 400px; height: 28px; border-radius: 4px; margin-bottom: 10px;}
    .roomEnroll_tb>tbody>tr>td>input[type="time"]{width: 100px; height: 28px; border-radius: 4px; margin-bottom: 10px;}
    .roomEnroll_tb>tbody>tr>td>textarea{resize: none; border-radius: 4px; border: 1px solid #bebebe;}

    .cancel:hover{background-color: #fff; border: 1px solid #bebebe; cursor: pointer;}
    .enroll:hover{background-color: #fff; border: 1px solid #184c88; cursor: pointer; color: #184c88;}
</style>
</head>
<body>
	<div id="wrap">
        <jsp:include page="../common/adminMenubar.jsp"/>
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
                    <img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">숙소등록</p>
                </span>
                <br clear="both">
                <div class="con2">
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
                                    <textarea rows="10" cols="80"></textarea>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 이용안내</th>
                                <td>체크인 시간 : <input type="time"></td>
                                <td>체크아웃 시간 : <input type="time"></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btnArea">
                        <button class="cancel">취소하기</button>
                        <button class="enroll">등록하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>