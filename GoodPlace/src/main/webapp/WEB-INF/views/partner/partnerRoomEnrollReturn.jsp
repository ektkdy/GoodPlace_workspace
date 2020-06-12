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
<style type="text/css">

	.addBtn {border:1px solid #bebebe; border-radius:4px; background-color:#fff; width:25px; height:25px; font-size:18px; margin-bottum:10px;}
    .del{border:0px; background-color:#fff; font-size:15px; color:#bebebe; margin-left:10px;}
    ul{   list-style:none;   }
    
	/*하단 버튼 css*/
    #btns{width:950px; margin-top: 20px; margin-bottom: 20px; margin-right: 20px;}
    #btns button{width:100px; height:35px; border-radius: 4px; font-size: 15px;}
    #gotoList{border: 1px solid #dbdbdb; }
    #gotoList:hover{background-color: white; border: solid 1px #dbdbdb; }
    #modify{border: 1px solid #34538a; border-radius: 4px; }
    #modify:hover{color: #34538a; background-color: white; border: 1px solid #34538a;font-weight:500;}
    #modify{color: white; background-color: #34538a;}
    #delete{background-color: darkred; border: 1px solid darkred; color: white; }
    #delete:hover{color: darkred; background-color: white; font-weight:500;}
    #rest{background-color: darkslategray; color: white; border: 1px solid darkslategray; }
    #rest:hover{background-color: white; color: darkslategray; font-weight:500;}
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
                
                <form action="" id="updateReRoom" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="usNo" value="${ loginUser.usNo }">
	            	<input type="hidden" name="roNo" value="${ r.roNo }">
                    <div class="reason">
                        <h3>숙소 신청이 반려되었습니다.</h3>
                        <table class="reason_tb">
                            <tr class="pdBtom">
                                <td width="200px" style="text-align:center; font-size:20px;">거절사유</td>
                                <td>${ r.deny }</td>
                            </tr>
                            <tr>
                                <td style="text-align:center; font-size:20px;">상세내용</td>
                                <td><textarea cols="85" rows="4" readonly>${ r.denyContent }</textarea></td>
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
                                <td colspan="2" class="instyle"><input type="text" name="roomsTitle" value="${ r.roomsTitle }" required></td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2" class="enrollInfo">• 정확하고 간결하게 표현해주세요.</td>
                            </tr>
                            <tr class="pdBtom">
                                <th>*숙소위치</th>
                                <td colspan="2" class="instyle">
			                        <input type="text" id="del_postcode" name="zipCode" value="${ r.zipCode }" placeholder="우편번호" style="width:100px; height:25px; padding-left:5px; margin-bottom:5px; font-size:15px" readonly required>
									<input type="button" id="searchAdressBtn" onclick="del_execDaumPostcode()" value="우편번호 찾기" style="width: 100px; font-size:15px;height:28px; background-color: #34538a; color:#fff; border:1px solid #34538a; border-radius:4px;" readonly required><br>
			                        <input type="text" id="del_address" name="addBasic" value="${ r.addBasic }" placeholder="주소" style="width:320px; height:25px; padding-left:5px; margin-bottom:5px; font-size:15px" readonly required>											
									<input type="text" id="del_extraAddress" name="addRef" value="${ r.addRef }" placeholder="참고항목" style="width:150px; height:25px; padding-left:5px; margin-bottom:5px; font-size:15px" readonly>
									<!-- 사용자가 직접 입력하는 칸  -->
									<input type="text" id="del_detailAddress"  name="addDetail" value="${ r.addDetail }" placeholder="상세주소" style="width:480px; height:25px; padding-left:5px; font-size:15px" required> 
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 대표사진</th>
                                <td colspan="2">
	                          	<img id="titleImg" src="${pageContext.request.contextPath}/resources/uploadFiles/${ e.changeName }"
	                          		 style="border:0.5px solid #dbdbdb; width: 200px; height:150px" >
	                         	<div id="fileArea">
									<input type="file" name="thumb" id="thumb" onchange="loadImg(this,1);"required>
								</div>
                                <p class="enrollInfo" style="text-align:left; margin-left:0;margin-top:0">• 텍스트 및 로고가 있을 경우 관리자가 사진을 수정 혹은 삭제할 수 있습니다.</p>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 상세사진</th>
	                            <td class="photo_btn" colspan="2">
									<ul id="ul">
										<c:forEach items="${ list }" var="at">
											<li class="li">
												<input class="fino" type="hidden" value="${ at.fiNo }">
												<a href="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${ at.changeName }">${ at.originName }</a>
												<button class="del">x</button>
											</li>
										</c:forEach>
									</ul>
									<div id="photoDiv"></div>
									<p class="enrollInfo">• 1장 이상의 상세 사진을 등록해주세요. 최대 5장까지 가능합니다.</p>
								</td>
							</tr>
                            <tr>
                                <th rowspan="2">* 객실정보</th>
                                <td colspan="2">
                                	침  &nbsp;대  &nbsp;수&nbsp;:&nbsp;<input type="number" min="1" name="bedCount" value="${ r.bedCount }"class="putNum mgRight" style="margin-bottom:10px" name="bedCount">
                                	샤워실 수 : <input type="number" min="1" value="1" class="putNum" name="bathCount" value="${ r.bathCount }" style="margin-bottom:10px" ><br>
                                	화장실 수 : <input type="number" min="1" value="1" class="putNum mgRight" name="restroomCount" value="${ r.restroomCount }" style="margin-bottom:10px" >
                                	최소 인원 : <input type="number" min="1" value="1" class="putNum mgRight" name="minPeople" value="${ r.minPeople }" style="margin-bottom:10px" ><br>
                                	최대 인원 : <input type="number" min="1" value="1" class="putNum" name="maxPeople" value="${ r.maxPeople }" style="margin-bottom:10px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                	방  &nbsp;개  &nbsp;수&nbsp;: <input type="number" min="1" value="1" class="putNum" name="roomCount" value="${ r.roomCount }"style="margin-bottom:10px" ><br>
                                	1박 금액   &nbsp;: <input type="number" min="10000" value="10000" step="1000" class="putNum" name="price" value="${ r.price }" style="width:100px"><br>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <td colspan="2" class="enrollInfo">• 1박 금액은 승인심사 이후 변경될수 있습니다. 최소인원 이상일 경우 1인당 일정금액이 추가되며 <br>최대인원수 이상 받을수 없습니다.</td>
                            </tr>
                            <tr class="pdBtom">
                                <th >* 숙소시설</th>
                                <td colspan="2">
                                	<label><input type="checkbox" name="facility" value="침구">침구</label>
	                                <label><input type="checkbox" name="facility" value="아기침대" style="margin-left:132px">아기침대</label><br>
	                                <label><input type="checkbox" name="facility" value="여분의침구">여분의침구</label>
                                    <label><input type="checkbox" name="facility" value="다리미" style="margin-left:91px">다리미</label><br>
                                    <label><input type="checkbox" name="facility" value="주방">주방</label>
                                    <label><input type="checkbox" name="facility" value="식기류" style="margin-left:132px">식기류</label><br>
                                    <label><input type="checkbox" name="facility" value="냉장고">냉장고</label>
                                    <label><input type="checkbox" name="facility" value="전자레인지" style="margin-left:118px">전자레인지</label><br>
                                    <label><input type="checkbox" name="facility" value="인덕션">인덕션</label>
                                    <label><input type="checkbox" name="facility" value="조리도구(냄비 등)" style="margin-left:118px">조리도구(냄비 등)</label><br>
                                    <label><input type="checkbox" name="facility" value="커피포트">커피포트</label>
                                    <label><input type="checkbox" name="facility" value="세탁기" style="margin-left:104px">세탁기</label><br>
                                    <label><input type="checkbox" name="facility" value="에어컨">에어컨</label>
                                    <label><input type="checkbox" name="facility" value="공용PC" style="margin-left:118px">공용PC</label><br>
                                    <label><input type="checkbox" name="facility" value="케이블TV">케이블TV</label>
                                    <label><input type="checkbox" name="facility" value="드라이기" style="margin-left:99px">드라이기</label><br>
                                    <label><input type="checkbox" name="facility" value="아기욕조">아기욕조</label>
                                    <label><input type="checkbox" name="facility" value="온수및난방" style="margin-left:104px">온수 및 난방</label><br>
                                    <label><input type="checkbox" name="facility" value="옷걸이">옷걸이</label>
                                    <label><input type="checkbox" name="facility" value="주차가능" style="margin-left:118px">주차가능</label>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 제공서비스</th>
                                <td colspan="2">
                                    <label><input type="checkbox" name="service" value="샴푸">샴푸</label>
                                    <label><input type="checkbox" name="service" value="화장지" style="margin-left:132px">화장지 </label><br>
                                    <label><input type="checkbox" name="service" value="바디워시">바디워시</label>
                                    <label><input type="checkbox" name="service" value="비누" style="margin-left:104px">비누</label> <br>
                                    <label><input type="checkbox" name="service" value="수건">수건</label>
                                    <label><input type="checkbox" name="service" value="FreeWifi" style="margin-left:132px">Free wifi</label>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>포함사항</th>
                                <td colspan="2">
                                    <label><input type="checkbox" name="meal" value="조식">조식</label>
                                    <label><input type="checkbox" name="meal" value="중식" style="margin-left:132px">중식 </label><br>
                                    <label><input type="checkbox" name="meal" value="석식">석식</label>
                                    <label><input type="checkbox" name="meal" value="없음" style="margin-left:132px">없음</label>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 숙소검색태그</th>
                                <td colspan="2">
                                    <label><input type="checkbox" name="roomsTag" value="신축건물">신축건물</label>
                                    <label><input type="checkbox" name="roomsTag" value="교통이 편리한" style="margin-left:104px">교통이 편리한</label> <br>
                                    <label><input type="checkbox" name="roomsTag" value="관광명소가 가까운">관광명소가 가까운</label>
                                    <label><input type="checkbox" name="roomsTag" value="무인으로 운영되는" style="margin-left:44.5px">무인으로 운영되는</label><br>
                                    <label><input type="checkbox" name="roomsTag" value="커플숙소">커플숙소</label>
                                    <label><input type="checkbox" name="roomsTag" value="비주얼이예쁜" style="margin-left:104px">비주얼이 예쁜</label><br>
                                    <label><input type="checkbox" name="roomsTag" value="이색숙소">이색숙소</label>
                                    <label><input type="checkbox" name="roomsTag" value="조식이포함된" style="margin-left:104px">조식이 포함된</label><br>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 필수안내</th>
                                <td colspan="2">
                                    <textarea id="summernote" name="roomsNotice" style="height:100px; border:1px solid red">${ r.roomsNotice }</textarea>
                                </td>
                            </tr>
                            <tr class="pdBtom">
                                <th>* 이용안내</th>
                                <td>체크인 시간 : <input type="time" values="${ r.checkIn }"></td>
                                <td>체크아웃 시간 : <input type="time"  values="${ r.checkOut }"></td>
                            </tr>
                    </table>
                    <div id="btns">
	                	<span>
	                    	<button type="button" id="gotoList" onclick="javascript:history.go(-1);">목록으로</button>
		                </span>
                        <button type="submit" class="enroll">재심사요청</button>
                    </div>
                </form>
                </div>
            </div>
        </div>
    </div>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- summernote -->

<script type="text/javascript">




</script>

<!-- 상세사진용  -->
<script>
	$(function(){
		
		$(".del").click(function(){
			$(this).parent(".li").remove();
			/* 
			var arr = [];
			arr.put */
			
			$(this).siblings(".fino");
			
			if($(".li").length != 5){
				if($("#ul").children().is(".addBtn")){
					
				}else{
					$("#ul").append('<button type="button" class="addBtn">+</button>');
				}
			}
		});
		
		//$(".addBtn").click(function(){
		$("#ul").on("click", ".addBtn", function(){
			if($("input[name=file]").length < (5-$(".li").length)){
				$("#photoDiv").append('<input type="file" name="file">');
			}
		});
	});
	
	
</script>


<script>
   $(function(){
       
       $(".arrow").click(function(){
           $("#slide_menu").slideToggle(500);
       });
   });
</script>
 <!-- 주소 api -->
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
<!-- summernote api -->
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
<!-- fileArea -->
<script>
$(function(){
	$("#fileArea").hide();
	
	$("#titleImg").click(function(){
		$("#thumb").click();
	});

	
});

function loadImg(inputFile, num) {
	// inputFile : 현재 변화가 생긴 input type="file" 요소
	// num : 몇번째 input 요소인지 확인 후 해당 영역에 미리보기 하려고 받는 숫자값

	// [참고] https://developer.mozilla.org/ko/docs/Web/API/FileReader

	//file이 존재할 경우 --> inputFile요소의 files속성인 배열의 0번 인덱스에  파일이 담김
	if (inputFile.files.length == 1) {
		// 파일을 읽어들일 FileReader 객체생성
		var reader = new FileReader();

		//파일을 읽어주는 메소드 --> 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
		reader.readAsDataURL(inputFile.files[0]);

		//파일 읽기가 완료 되었을때 실행할 메소드
		// e : 현재 이벤트가 발생한 이벤트객체
		reader.onload = function(e) {
			
			$("#titleImg").attr("src", e.target.result); 
			
		};
	}

}
</script>
</body>
</html>