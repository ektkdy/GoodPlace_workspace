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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/partner/partnerCommon.css" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    #wrap {width: 1200px; height: 900px; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }
    #contents{height: 2100px;}

    /* 중앙 박스(div#stepOne) 내부공통 css */
    #stepOne{width:950px; border: 1px solid #dbdbdb;}
    table th{width: 200px; padding-top: 30px; padding-left: 70px; vertical-align: top;}
    table td{width:500px; padding-top: 30px; padding-left: 50px; font-size:13px;}
    h5{color: cornflowerblue; padding-bottom: 5px;} /*중앙박스 외 상단에도 하나 있음*/
    table td textarea{width: 500px; height: 170px; border-radius: 4px; resize: none; border: 1px solid #dbdbdb;}
    table input[type=radio]{margin-right:5px;}
    table input[type=checkbox]{margin-right:5px;}
    table input[type=text]{width: 500px; height: 30px; border-radius: 4px; border: 1px solid #dbdbdb;}
    table td span input[type=number]{width:200px; height: 30px;border-radius: 4px; margin-left: 20px;border: 1px solid #dbdbdb;}
    table select{width: 200px; height: 30px; border-radius: 4px;}
    .maxPeople {width: 200px; height: 30px; border-radius: 4px; border: 1px solid #dbdbdb; padding-left: 5px;}

    /*하단 버튼 css*/
    #btns{width:950px; margin-top: 20px; margin-bottom: 20px; margin-right: 20px;}
    button{cursor: pointer;  width: 140px; height: 35px; }
    #gotoList{border: 1px solid #dbdbdb; border-radius: 4px; font-size: 15px;}
    #gotoList:hover{background-color: white; border: solid 1px #dbdbdb;}
    #modify{border: 1px solid #34538a; border-radius: 4px; font-size: 15px;}
    #modify:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    #modify{color: white; background-color: #34538a;}
    #delete{background-color: darkred; border: 1px solid darkred; color: white; border-radius: 4px;}
    #delete:hover{color: darkred; background-color: white;}
    #rest{background-color: darkslategray; color: white; border: 1px solid darkslategray; border-radius: 4px;}
    #rest:hover{background-color: white; color: darkslategray;}
</style>  
</head>
<body>
<div id="wrap">
    <jsp:include page="../common/partnerMenubar.jsp"/>
    <div id="contents" >
        <div id="tab"></div>
        <div class="sitemap">
            <a href="#"><span style="height: 30px;">HOME</span></a>
            <a href="#"><span> &gt; 체험관리</span></a>
            <a href="#"><span style="margin-right: 30px;"> &gt; 체험정보입력</span></a>
        </div>
        <div class="con" style="color:#000">
            <span id="page_title">
                <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                <p class="title_tt">체험관리상세</p>
            </span><br>
            <div style="text-align: center; margin-bottom: 150px;"></div>
            <br clear="both">
            
            <form action="updateExp.exp" id="updateExp" method="post">    
	            <div id="stepOne">
	                <div colspan="2" style="font-size: 22px; font-weight: bold; color: white; background-color: #34538a; height: 50px; padding-top: 15px; padding-left: 20px;"> 
	                    1. 기본 정보</div>
	                    
	                    ${ exp }
	                    ${ exp.category }
	                    
		                <table>
		                    <tr>
		                        <th>* 카테고리</th>
		                        <td>
		                            <h5>• 아래의 카테고리중 1개만 선택이 가능합니다. <br>
		                                상품을 가장 잘 표현하는 카테고리를 선택해 주세요.</h5>
		                            <input type="radio" name="expCategory" id="lifeStyle"><label for="lifeStyle">라이프 및 스타일(뷰티/패션/쇼핑)</label><br>
		                            <input type="radio" name="expCategory" id="culture"><label for="culture">문화와 역사(과학/경제/역사/봉사활동)</label><br>
		                            <input type="radio" name="expCategory" id="fitness"><label for="fitness">스포츠 및 피트니스(자전거/요가/러닝/근력운동)</label><br>
		                            <input type="radio" name="expCategory" id="art"><label for="art">미술과 디자인(그림/전시/목공/사진/일러스트)</label><br>
		                            <input type="radio" name="expCategory" id="outdoor"><label for="outdoor">야외활동(별관찰/농촌투어/캠핑/하이킹)</label>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>* 언어</th>
		                        <td>
		                            <h5>• 체험 진행 시 주로 사용되는 언어를 선택해주세요</h5>
		                            <input type="checkbox" name="ko" value="ko"><label class="language" for="ko" style="padding-right: 20px;">한국어</label>
		                            <input type="checkbox" name="es" value="es"><label class="language" for="es" style="padding-right: 20px;">스페인어</label>
		                            <input type="checkbox" name="jp" value="jp"><label class="language" for="jp">일본어</label><br>
		                            <input type="checkbox" name="en" value="en"><label class="language" for="en" style="padding-right: 35px;">영어</label>
		                            <input type="checkbox" name="ch" value="ch"><label class="language" for="ch" style="padding-right: 34px;">중국어</label>
		                            <input type="checkbox" name="etc" value="etc"><label class="language" for="etc">그 외</label>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>* 체험 태그</th>
		                        <td>
		                            <h5>• 상품에 가장 잘 어울리는 태그를 선택해주세요. 최대 2개까지 가능합니다.</h5>
		                            <input type="checkbox" name="museum" value="museum"><label class="expTag" for="museum" style="padding-right: 20px;">박물관/미술관</label>
		                            <input type="checkbox" name="shopping" value="shopping"><label class="expTag" for="shopping" style="padding-right: 55px;">쇼핑</label>
		                            <input type="checkbox" name="beauty" value="beauty"><label class="expTag" for="beauty">뷰티/패션</label><br>
		                            <input type="checkbox" name="themapark" value="themapark"><label class="expTag" for="themapark" style="padding-right: 56px;">테마파크</label>
		                            <input type="checkbox" name="citytour" value="citytour"><label class="expTag" for="citytour" style="padding-right: 25px;">시티투어</label>
		                            <input type="checkbox" name="camping" value="camping"><label class="expTag" for="camping">캠핑</label><br>
		                            <input type="checkbox" name="special" value="special"><label class="expTag" for="special" style="padding-right: 56px;">이색체험</label>
		                            <input type="checkbox" name="food" value="food"><label class="expTag" for="food" style="padding-right: 20px;">맛집/카페</label>
		                            <input type="checkbox" name="sports" value="sports"><label class="expTag" for="sports">스포츠</label><br>
		                            <input type="checkbox" name="nightscape" value="nightscape"><label class="expTag" for="nightscape" style="padding-right: 86px;">야경</label>
		                            <input type="checkbox" name="bicycle" value="bicycle"><label class="expTag" for="bicycle" style="padding-right: 40px;">자전거</label>
		                            <input type="checkbox" name="class" value="class"><label class="expTag" for="class">클래스</label>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>* 체험 제목</th>
		                        <td>
		                            <input type="text" name="expTitle" value="${ exp.expTitle }">
		                            <h5>• 정확하고 간결하게 표현해주세요. <br>
		                                • 지역명이 포함된 제목은 노출에 더 효과적입니다. <br>
		                                (도쿄, 산책하는 여행, 샌프란시스코 당일코드 등)</h5>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>* 체험 소개</th>
		                        <td>
		                        	<div id="summernote" style="height:100px; border:1px solid red" name="expContent">${ exp.expContent }</div>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>* 체험 장소</th>
		                        <td>
		                        	<!-- 주소API -->
			                        <input type="text" id="del_postcode" name="zipCode" placeholder="우편번호" style="width:100px; height:25px; padding-left:5px; margin-bottom:5px;" value="${ exp.zipCode }" readonly>
									<input type="button" id="searchAdressBtn" onclick="del_execDaumPostcode()" value="우편번호 찾기" style="width: 100px; height:25px; background-color: #34538a; color:#fff; border:1px solid #34538a; border-radius:4px;" readonly><br>
			                        <input type="text" id="del_address" name="addBasic" placeholder="주소" style="width:320px; height:25px; padding-left:5px; margin-bottom:5px;" value="${ exp.addBasic }">											
									<input type="text" id="del_extraAddress" name="addRef" placeholder="참고항목" style="width:150px; height:25px; padding-left:5px; margin-bottom:5px;" value="${ exp.addRef }" readonly>
									<!-- 사용자가 직접 입력하는 칸  -->
									<input type="text" id="del_detailAddress"  name="addDetail" placeholder="상세주소" style="width:480px; height:25px; padding-left:5px;" value="${ exp.addDetail }"required> 
		                        </td>
		                    </tr>
		                </table>
		                <br>
		                <div colspan="2" style="font-size: 22px; font-weight: bold; color: white; background-color: #34538a; height: 50px; padding-top: 15px; padding-left: 20px;"> 
		                    2. 체험 정보</div>
		                <table>
	                    <tr>
	                        <th>* 활동강도</th>
	                        <td>
	                            <label><input type="radio" class="activity" name="activity" value=1>가벼움</label><br>
	                            <label><input type="radio" class="activity" name="activity" value=2>보통</label><br>
	                            <label><input type="radio" class="activity" name="activity" value=3>격렬한</label><br>
	                            <label><input type="radio" class="activity" name="activity" value=4>익스트림</label><br>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 최대 인원수</th>
	                        <td>
	                            <input type="number" class="maxPeople" name="maxPeople" min="1" required style="width:100px;margin-right:5px;" value="${ exp.maxPeople }">명
	                            <h5>• 최소 인원수는 1명입니다. 한 회차당 운영 가능한 최대인원수를 입력하세요.</h5>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 체험 시간</th>
	                        <td id="oprateTimes">
								운영 시작 시간은 <input type="time" name="startTime" id="startTime" value="${ exp.startTime }"> 입니다.<br><br>
								운영 마감 시간은 <input type="time" name="endTime" id="endTime" value="${ exp.endTime }"> 입니다.<br><br>
								체험 소요 시간은  <input type="number" name="useTime" min=1 value="${ exp.useTime }">시간 입니다. 
								<h5>• 최소 소요시간은 1시간입니다.</h5><br>
								체험 운영 간격은	<input type="number" name="intervalTime" id="intervalTime" min=30 value="${ exp.intervalTime }">분 입니다.
								<h5>• 최소 운영간격은 30분입니다.</h5>
							</td>
	                    </tr>
	                    <tr>
	                        <th>* 게스트 준비물</th>
	                        <td>
	                            <input type="text" id="supplies" name="supplies" style="width:500px;padding-left:5px;" value="${ exp.supplies }">
	                            <input type="checkbox" id="noSupplies" name="supplies" value="별도의 준비물이 필요없는 체험입니다.">
	                            	<label for="noSupplies">게스트가 준비할 사항이 전혀 없습니다.</label>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 대표 사진</th>
	                        <td colspan="2">
	                          	<img id="titleImg" style="border:0.5px solid #bebebe; width: 200px; height:150px">
	                         	<div id="fileArea">
									<input type="file" name="thumb" id="thumb" onchange="loadImg(this,1);" required>
								</div>
	                          <h5>• 텍스트 및 로고가 있을 경우 관리자가 사진을 수정 혹은 삭제할 수 있습니다.</h5>
	                       </td>
	                    </tr>
	                    <tr>
	                        <th>* 상세 사진</th>
	                        <td class="photo_btn" colspan="2">
								<div id="parah"></div>
	                        	<input type="button" value="추가" onclick="addInput();" style="width:50px; height:35px; background:#184c88; color:#fff; border:none; border-radius:4px;" />
								<input type="button" value="삭제" onclick="deleteInput();" style="width:50px; height:35px; border:none; border-radius:4px;"/>
								<h5>• 1장 이상의 상세 사진을 등록해주세요. 최대 5장까지 가능합니다.</h5>
							</td>
	                    </tr>
	                    <tr>
	                        <th>* 예약 설정</th>
	                        <td>
	                        	<input type="number" name="deadline" id="deadline" min=1 placeholder="1" style="padding-rignt:5px; text-align:right;" value="${ exp.deadline }">시간 전 부터 예약을 받지 않겠습니다.
	                            <h5>• 예약 마감 시간을 체험시작 1시간 전으로 설정하실 것을 권해드립니다.<br>
	                                	나중에 언제든지 변경하실수 있습니다.</h5>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 요금 책정</th>
	                        <td>
	                            <span>1인 예약시 요금</span>
	                            <span><input type="number" class="price" name="price" style="text-align:right; padding-right:5px;" value="${ exp.price }" readonly disabled>원</span>
	                            <h5>• 요금변경은 관리자 승인이 필요합니다. 1:1문의로 문의부탁드립니다.</h5>
	                        </td>
	                    </tr>
	                </table>
	            <br>
	            </div>
	            <div id="btns">
                <span>
                    <button id="gotoList" onclick="javascript:history.go(-1);">목록으로</button>
		                </span>
		                <div style="text-align:right; margin-top: -40px;">
		                    <button id="delete" >삭제하기</button>
		                    <button id="rest">휴면하기</button>
		                    <button type="submit" id="modify">수정하기</button>
		                </div>
		            </div>
            </form>
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


<script>
	$(function(){
		$("#rest").click(function(){
			
		});
		
		$("#delete").click(function(){
			
		});
	});
</script>


<script>
	$(function(){
		var 
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
         	
         	tabsize: 2,
             height: 200,
              width: 600,
        placeholder: '체험 설명을 잘 작성하면 게스트의 예약과 참여를 유도할 수 있습니다.  '
        			+'게스트를 위해 세심하게 고안한 체험 일정의 자세한 내용을 알려주세요.'
             /*toolbar: [
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

</body>
</html>