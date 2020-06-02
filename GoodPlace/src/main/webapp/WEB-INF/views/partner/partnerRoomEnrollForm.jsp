<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerRoomEnroll.css" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;">
                    <p class="title_tt">숙소등록</p>
                </span>
                <br clear="both">
                <div class="con2">
                <form action="" id="enrollRoom" method="" enctype="">
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
                                <td colspan="2" class="instyle"><input type="text" name="" style=""></td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2" class="enrollInfo">• 정확하고 간결하게 표현해주세요.</td>
                            </tr>
                            <tr class="pdBtom">
                                <th>*숙소위치</th>
                                <td colspan="2" class="instyle">
			                        <input type="text" id="del_postcode" name="address1" placeholder="우편번호" style="width:100px; height:25px; padding-left:5px; margin-bottom:5px; font-size:15px" readonly>
									<input type="button" id="searchAdressBtn" onclick="del_execDaumPostcode()" value="우편번호 찾기" style="width: 100px; font-size:15px;height:28px; background-color: #34538a; color:#fff; border:1px solid #34538a; border-radius:4px;" readonly><br>
			                        <input type="text" id="del_address" name="address2" placeholder="주소" style="width:320px; height:25px; padding-left:5px; margin-bottom:5px; font-size:15px" readonly>											
									<input type="text" id="del_extraAddress" name="address3" placeholder="참고항목" style="width:150px; height:25px; padding-left:5px; margin-bottom:5px; font-size:15px" readonly>
									<!-- 사용자가 직접 입력하는 칸  -->
									<input type="text" id="del_detailAddress"  name="address4" placeholder="상세주소" style="width:480px; height:25px; padding-left:5px; font-size:15px"> 
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th rowspan="2" width=" ">* 대표사진</th>
                                <td rowspan="2"><div style="width: 200px; height: 150px; border:1px solid #bebebe"></div></td>
                                <td width="550"><button>사진등록</button></td>
                            </tr>
                            <tr class="pdBtom">
                                <td class="enrollInfo">• 텍스트 및 로고가 있을 경우 관리자가 사진을 수정 혹은 삭제할 수 있습니다.</td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 상세사진</th>
                                <td class="photo_btn"><button>사진등록</button></td>
                            <tr>
                                <th rowspan="2">* 예약 설정</th>
                                <td colspan="2" ><input type="number" min="36" max="72" value="36" style="padding-left:5px">시간 전 부터 예약을 받지 않겠습니다.</td>
                            </tr>
                            <tr class="pdBtom"><td colspan="2" class="enrollInfo">• 최소 몇시간 전까지 예약을 받길 원하시나요? 기본은 36시간 입니다.</td></tr>
                            <tr>
                                <th rowspan="2">* 객실정보</th>
                                <td colspan="2">
                                	침  &nbsp;대  &nbsp;수&nbsp;:&nbsp;<input type="number" min="1" value="1" class="putNum mgRight">
                                	샤워실 수 : <input type="number" min="1" value="1" class="putNum"><br>
                                	화장실 수 : <input type="number" min="1" value="1" class="putNum mgRight">
                                	1박 금액   &nbsp;: <input type="number" min="1" value="1" class="putNum"><br>
                                	최소 인원 : <input type="number" min="1" value="1" class="putNum mgRight">
                                	최대 인원 : <input type="number" min="1" value="1" class="putNum">
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2" class="enrollInfo">• 1박 금액은 승인심사 이후 변경될수 있습니다. 최소인원 이상일 경우 1인당 일정금액이 추가되며 <br>최대인원수 이상 받을수 없습니다.</td>
                            </tr>
                            <tr class="pdBtom">
                                <th >* 숙소시설</th>
                                <td colspan="2">
                                    <input type="checkbox" name="rooms" value="" >침구
                                    <input type="checkbox" name="rooms" value="" style="margin-left:132px">아기침대<br>
                                    <input type="checkbox" name="rooms" value="">여분의침구
                                    <input type="checkbox" name="rooms" value="" style="margin-left:82.5px">다리미<br>
                                    <input type="checkbox" name="rooms" value="">주방
                                    <input type="checkbox" name="rooms" value="" style="margin-left:132px">식기류<br>
                                    <input type="checkbox" name="rooms" value="">냉장고
                                    <input type="checkbox" name="rooms" value="" style="margin-left:115.5px">전자레인지<br>
                                    <input type="checkbox" name="rooms" value="">인덕션
                                    <input type="checkbox" name="rooms" value="" style="margin-left:115.5px">조리도구(냄비 등)<br>
                                    <input type="checkbox" name="rooms" value="">커피포트
                                    <input type="checkbox" name="rooms" value="" style="margin-left:99px">세탁기<br>
                                    <input type="checkbox" name="rooms" value="">에어컨
                                    <input type="checkbox" name="rooms" value="" style="margin-left:115.5px">공용PC<br>
                                    <input type="checkbox" name="rooms" value="">케이블TV
                                    <input type="checkbox" name="rooms" value="" style="margin-left:94.5px">드라이기<br>
                                    <input type="checkbox" name="rooms" value="">아기욕조
                                    <input type="checkbox" name="rooms" value="" style="margin-left:99px">온수 및 난방<br>
                                    <input type="checkbox" name="rooms" value="">옷걸이
                                    <input type="checkbox" name="rooms" value="" class="mLeft835">주차가능
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 제공서비스</th>
                                <td colspan="2">
                                    <input type="checkbox" name="service" value="">샴푸
                                    <input type="checkbox" name="service" value="" style="margin-left:132px">화장지 <br>
                                    <input type="checkbox" name="service" value="">바디워시
                                    <input type="checkbox" name="service" value="" style="margin-left:99px">비누 <br>
                                    <input type="checkbox" name="service" value="">수건
                                    <input type="checkbox" name="service" value="" style="margin-left:132px">Free wifi
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>포함사항</th>
                                <td colspan="2">
                                    <input type="checkbox" name="includeService" value="">조식
                                    <input type="checkbox" name="includeService" value="" style="margin-left:132px">중식 <br>
                                    <input type="checkbox" name="includeService" value="">석식
                                    <input type="checkbox" name="includeService" value="" style="margin-left:132px">없음
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 숙소검색태그</th>
                                <td colspan="2">
                                    <input type="checkbox" name="tag" value="">신축건물
                                    <input type="checkbox" name="tag" value="" style="margin-left:100px">교통이 편리한 <br>
                                    <input type="checkbox" name="tag" value="">관광명소가 가까운
                                    <input type="checkbox" name="tag" value="" style="margin-left:28.5px">무인으로 운영되는<br>
                                    <input type="checkbox" name="tag" value="">커플숙소
                                    <input type="checkbox" name="tag" value="" style="margin-left:100px">비주얼이 예쁜<br>
                                    <input type="checkbox" name="tag" value="">이색숙소
                                    <input type="checkbox" name="tag" value="" style="margin-left:100px">조식이 포함된<br>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 필수안내</th>
                                <td colspan="2">
                                    <div id="summernote" style="height:100px; border:1px solid red"></div>
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
                    </form>
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
    <script>
	   function del_execDaumPostcode() {
	       new daum.Postcode({
	           oncomplete: function(data) {
	               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var addr = ''; // 주소 변수
	               var extraAddr = ''; // 참고항목 변수
	
	               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                   addr = data.roadAddress;
	               } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                   addr = data.jibunAddress;
	               }
	
	               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	               if(data.userSelectedType === 'R'){
	                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                       extraAddr += data.bname;
	                   }
	                   // 건물명이 있고, 공동주택일 경우 추가한다.
	                   if(data.buildingName !== '' && data.apartment === 'Y'){
	                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                   }
	                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                   if(extraAddr !== ''){
	                       extraAddr = ' (' + extraAddr + ')';
	                   }
	                   // 조합된 참고항목을 해당 필드에 넣는다.
	                   document.getElementById("del_extraAddress").value = extraAddr;
	               
	               } else {
	                   document.getElementById("del_extraAddress").value = '';
	               }
	
	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               document.getElementById('del_postcode').value = data.zonecode;
	               document.getElementById("del_address").value = addr;
	               // 커서를 상세주소 필드로 이동한다.
	               document.getElementById("del_detailAddress").focus();
	           }
	       }).open();
	   }
	</script>
	<script>
$(function(){
	
                // 1. 단순히 에디터 폼만 보이게 하는거
                //$("#summernote").summernote();

                // 2. 추가적인 속성들 부여 가능
                // 간단하게 사이즈 조정(width, height) / 미리보기 값(placeholder)
                $('#summernote').summernote({
                //placeholder:" ",
                tabsize: 2,
                    height: 200,
                    width:600/*
                    toolbar: [
                        [groupName, [list of button]]
                        ['Font Style', ['fontname']],
                        ['style', ['bold', 'italic', 'underline']],
                        ['font', ['strikethrough']],
                        ['fontsize', ['fontsize']],
                        ['color', ['color']],
                        ['para', ['paragraph']],
                        ['height', ['height']],
                        ['Insert', ['picture']]
                    ] 
                    */
            	});

});
     </script>
     
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- summernote -->
</head>
</body>
</html>