<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                    <span>숙소승인</span>
                </a>
            </div>
            <br clear="both">
            <div class="con" style="width:980px; color:#000">
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">숙소승인</p>
                </span>
                <br>
                <br clear="both">
                <div class="con2">
                    <table class="roomEnroll_tb" cellpadding="0" cellspacing="0">
                        <thead>
                        	
                             <tr>
                                <th colspan="3" class="enrollInfo pdTopBtom">
                                   <!-- • 안내에 따라 여행 내용을 정확하게 설명하여 주세요.<br>
                                    • 상품 등록이 완료되면, 승인을 위한 심사가 진행됩니다. -->
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th rowspan="2">* 숙소명</th>
                                <td colspan="2"><strong>${ r.roomsTitle }</strong></td>
                            </tr>
                            <tr class="pdBtom">
                                <!-- <td colspan="2" class="enrollInfo">• 정확하고 간결하게 표현해주세요.</td> -->
                            </tr>
                            <tr class="pdBtom">
	                        	<th><br>* 체험 장소</th>
		                        <td><br>우편번호 : ${ r.zipCode } <br>
		                        	${ r.addBasic } ${ r.addRef } ${ r.addDetail }</td>
		                    </tr>
                            <tr>
                                <th rowspan="2" width=" ">* 대표사진</th>
                                <td rowspan="2"><img id="titleImg" src="${pageContext.request.contextPath}/resources/uploadFiles/${ r.changeName }"
	                          		 style="border:0.5px solid #dbdbdb; width: 200px; height:150px" ></td>

                            </tr>
                            <tr class="pdBtom">
                                <!-- <td class="enrollInfo">• 텍스트 및 로고가 있을 경우 관리자가 승인 거절 할 수 있습니다.</td> -->
                            </tr>
                            <tr>
                           <tr class="pdBtom">
                                <th><br>* 상세사진</th>
	                            <td class="photo_btn" colspan="2">
	                            	<br>
									<ul id="ul">
										<c:forEach items="${ list }" var="at">
											<li class="li" style="list-style:none;">
												<a href="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${ at.changeName }">${ at.originName }</a>
											</li>
										</c:forEach>
									</ul>
									<div id="photoDiv"></div>
									<!--<p class="enrollInfo">• 1장 이상의 상세 사진을 등록해주세요. 최대 5장까지 가능합니다.</p>  -->
								</td>
							</tr>
                                
                            <tr>
                                <th rowspan="4">* 객실정보</th>
                                <td>침대수 : <strong>${ r.bedCount }</strong></td>
                                <td>샤워실수 : <strong>${ r.bathCount }</strong></td>
                            </tr>
                            <tr>
                                <td>화장실수 : <strong>${ r.restroomCount }</strong></td>
                                <td>1박금액 : <strong>${ r.price }</strong>원</td>
                            </tr>
                            <tr>
                                <td>최소인원 : <strong>${ r.minPeople }</strong></td>
                                <td>최대인원 : <strong>${ r.maxPeople }</strong></td>
                            </tr>
                            
                            <tr>
                                <tr class="pdBtom">
                                    <th><br>* 숙소시설</th>
                                    <td colspan="2">
                                        <br>${ r.facility }
                                    </td>
                                </tr>
                            <tr class="pdBtom">
                                <th>* 제공서비스</th>
                                <td colspan="2">
                                    ${ r.service }
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="2">포함사항</th>
                                <td>
                                    <input type="checkbox" id="includeService1" name="includeService" value="${r.meal}">조식 &nbsp; &nbsp;
                                    <input type="checkbox" id="includeService2" name="includeService" value="${r.meal}">중식 &nbsp; &nbsp;
                                    <input type="checkbox" id="includeService3" name="includeService" value="${r.meal}">석식 &nbsp; &nbsp;
                                    <input type="checkbox" id="includeService4" name="includeService" value="${r.meal}">없음 
                                </td>
                                
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2">
                                    
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 숙소검색태그</th>
                                <td colspan="2">
                                    ${ r.roomsTag }
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 필수안내</th>
                                <td colspan="2" id="summer">
                                    
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 이용안내</th>
                                <td> &nbsp;체크인 시간 : <strong>${ r.checkIn }</strong><br>
                                	체크아웃 시간 : <strong>${ r.checkOut }</strong>
                                </td>
                                
                            </tr>
                        </tbody>
                    </table>
                    <div class="btnArea" style="padding-bottom: 10%;">
                        <button class="cancel" data-toggle="modal" data-target="#rejection">거절하기</button>
                        <button class="enroll" onclick="location.href='aRoomOkay.ro?rno=${ r.roNo }'">승인하기</button>
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

	<script>
	 	$(function(){
	 		$("#summer").html('${ r.roomsNotice }');	
	 	});
	 	
		$(function(){
			
			
			switch('${r.meal}'){
			case "조식" : $("#includeService1").prop("checked", true); break;
			case "중식" : $("#includeService2").prop("checked", true); break;
			case "석식" : $("#includeService3").prop("checked", true); break;
			}
		});
	</script>

    <!-- 거절하기 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 button 클릭시 보임) -->
    <div class="modal fade" id="rejection">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="width:500px;">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">해당 숙소를 정말로 거절하겠습니까?</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="aRoomReject.ro" method="post">
            	<input type="hidden" name="roNo" value="${ r.roNo }">
                <!-- Modal Body -->
                <div class="modal-body">
                    <label for="userId" class="mr-sm-2">거절사유 :</label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="거절사유" id="deny" name="deny"> <br>
                    <label for="userPwd" class="mr-sm-2">상세사유:</label><br>
                    <textarea class="form-control mb-2 mr-sm-2" style="height:200px;" id="denyContent" name="denyContent" placeholder="내용을 입력해주세요."></textarea>
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