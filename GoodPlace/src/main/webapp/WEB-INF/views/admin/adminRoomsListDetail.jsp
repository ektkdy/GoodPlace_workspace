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
<!-- 부트스트랩에서 제공하고 있는 모달 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 모달 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
                                <td colspan="2"><strong>편안한방</strong></td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2" class="enrollInfo">• 정확하고 간결하게 표현해주세요.</td>
                            </tr>
                            <tr class="pdBtom">
                                <th>*숙소위치</th>
                                <td colspan="2"><strong>서울시 강남구</strong></td>
                            </tr>
                            <tr>
                                <th rowspan="2" width=" ">* 대표사진</th>
                                <td rowspan="2"><div style="width: 150px; height: 150px; border:1px solid black;">
                                    <img src="../image/집로고.jpg" style="vertical-align: middle; width:100%; height: 100%;">
                                </div></td>

                            </tr>
                            <tr class="pdBtom">
                                <td class="enrollInfo">• 텍스트 및 로고가 있을 경우 관리자가 승인 거절 할 수 있습니다.</td>
                            </tr>
                            <tr>
                                <th rowspan="5">* 상세사진</th>
                            </tr>
                            <tr><td colspan="2">썸네일.png</td></tr>
                            <tr><td colspan="2">썸네일.png</td></tr>
                            <tr><td colspan="2">썸네일.png</td></tr>
                            <tr><td colspan="2">썸네일.png</td></tr>

                            
                            <tr>
                                <th rowspan="2"  style="padding-top: 30px;">* 예약 설정</th>
                                <td colspan="2"  style="padding-top: 30px;"> <strong>33</strong> 시간 전 부터 예약을 받지 않겠습니다.</td>
                            </tr>
                            <tr class="pdBtom"><td colspan="2" class="enrollInfo">• 최소 몇시간 전까지 예약을 받길 원하시나요? 기본은 36시간 입니다.</td></tr>
                            <tr>
                                <th rowspan="4">* 객실정보</th>
                                <td>침대수 : <strong>2</strong></td>
                                <td>샤워실수 : <strong>2</strong></td>
                            </tr>
                            <tr>
                                <td>화장실수 : <strong>2</strong></td>
                                <td>1박금액 : <strong>85000</strong>원</td>
                            </tr>
                            <tr>
                                <td>최소인원 : <strong>1</strong></td>
                                <td>최대인원 : <strong>4</strong></td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2" class="enrollInfo">• 1박 금액은 승인심사 이후 변경될수 있습니다. 최소인원 이상일 경우 1인당 일정금액이 추가되며 <br>최대인원수 이상 받을수 없습니다.</td>
                            </tr>
                            <tr>
                                <tr class="pdBtom">
                                    <th>* 숙소시설</th>
                                    <td colspan="2">
                                        <textarea rows="10" cols="80" style="padding-top: 1%; padding-left: 1%; height:200px;" readonly>신축건물, 교통이 편리한, 관광명소가 가까운</textarea>
                                    </td>
                                </tr>
                            <tr class="pdBtom">
                                <th>* 제공서비스</th>
                                <td colspan="2">
                                    <textarea rows="10" cols="80" style="padding-top: 1%; padding-left: 1%; height:100px;" readonly>신축건물, 교통이 편리한, 관광명소가 가까운</textarea>
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
                            <tr class="pdBtom">
                                <th>* 숙소검색태그</th>
                                <td colspan="2">
                                    <textarea rows="10" cols="80" style="padding-top: 1%; padding-left: 1%; height:100px;" readonly>신축건물, 교통이 편리한, 관광명소가 가까운</textarea>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 필수안내</th>
                                <td colspan="2">
                                    <textarea rows="10" cols="80" style="padding-top: 1%; padding-left: 1%;" readonly>편안하고 안락한 침대가 최고에요</textarea>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 이용안내</th>
                                <td>체크인 시간 : <strong>15:00~22:00</strong></td>
                                <td>체크아웃 시간 : <strong>11:00</strong></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btnArea" style="padding-bottom: 10%;">
                        <button class="cancel" data-toggle="modal" data-target="#rejection">거절하기</button>
                        <button class="enroll">승인하기</button>
                        <div id="test" style="display:none;  padding-bottom: 20%;" >
                            <textarea style="width:300px; height: 200px; border:1px solid black; resize: none;"></textarea>
                        </div>
                    </div>
                    <div class="guideBox">

                    </div>
                </div>
            </div>
        </div>
    </div>



    <!-- 거절하기 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 button 클릭시 보임) -->
    <div class="modal fade" id="rejection">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="width:500px;">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">해당 숙소를 정말로 거절하겠습니까?</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="로그인요청받아주는서버" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <label for="userId" class="mr-sm-2">거절사유 :</label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="거절사유" id="userId"> <br>
                    <label for="userPwd" class="mr-sm-2">상세사유:</label><br>
                    <textarea class="form-control mb-2 mr-sm-2" style="height:200px;" placeholder="내용을 입력해주세요."></textarea>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" style="border:1px solid #bebebe; background: #f1f1f1; color:#333;" data-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-primary" style="border: 1px solid #184c88; background: #184c88; color:#fff">확인</button>
                </div>
            </form>
            </div>
        </div>
    </div>



    
</body>
</html>