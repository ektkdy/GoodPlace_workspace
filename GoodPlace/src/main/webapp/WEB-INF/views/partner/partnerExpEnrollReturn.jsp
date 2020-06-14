<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
    #contents{height: 1700px;}

    /* 거절div */
    #comment{width:950px; padding:20px; margin-top: 50px; margin-bottom: 50px; background: #f8f8f8; border:1px solid #f1f1f1; margin-bottom:50px;}
    #comment #comment1{color:firebrick; font-size: 15px; text-align: right;}
    #comment table p{width: 100px; text-align: center; margin-right: 20px; font-weight: bold;}
    #comment table tr{vertical-align: top;}
    #comment table input[type=text]{height: 35px; width: 200px; border-radius: 4px; border: 1px solid #bebebe;}
    #comment textarea{width: 750px; height: 100px; resize: none; border: 1px solid #bebebe; border-radius: 4px; font-size: 15px;}

    /* 중앙 박스(div#stepOne) 내부공통 css */
    #stepOne{width:950px; border: 1px solid #dbdbdb;}
    table th{width: 200px; padding-top: 30px; padding-left: 70px; vertical-align: top;}
    table td{width:500px; padding-top: 30px; padding-left: 50px; font-size:13px;}
    .hh{color: cornflowerblue; padding-bottom: 5px;} /*중앙박스 외 상단에도 하나 있음*/
    table td textarea{width: 500px; height: 170px; border-radius: 4px; resize: none; border: 1px solid #dbdbdb;}
    table input[type=radio]{margin-right:5px;}
    table input[type=checkbox]{margin-right:5px;}
    table input[type=text]{height: 30px; border-radius: 4px; border: 1px solid #dbdbdb;}
    table td input[type=number]{width:100px; height:30px; border-radius: 4px; border: 1px solid #dbdbdb;}
    table select{width: 200px; height: 30px; border-radius: 4px;}
    .maxPeople {width: 200px; height: 30px; border-radius: 4px; border: 1px solid #dbdbdb; padding-left: 5px;}
    #oprateTimes select{width:150px; height:30px;border-radius:4px; border: 1px solid #dbdbdb; padding-left:5px;}
    #oprateTimes input{width:100px; height:30px;border-radius:4px; border: 1px solid #dbdbdb; padding-left:5px;}

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
</style>
</head>
<body>
<div id="wrap">
    <jsp:include page="../common/partnerMenubar.jsp"/>
    <div id="contents" >
        <div id="tab"></div>
        <div class="sitemap">
            <a href=""><span style="height: 30px;">HOME</span></a>
            <a href=""><span> &gt; 체험관리</span></a>
            <a href=""><span style="margin-right: 30px;"> &gt; 체험정보입력</span></a>
        </div>
        <br clear="both">
        <div class="con" style="color:#000">
            <span id="page_title">
                <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                <p class="title_tt">체험관리상세</p>
            </span><br>
            
            <form id="updateReExp" action="" method="post"  enctype="multipart/form-data">
	            <div id="comment">
	                <div style="text-align: center; margin-bottom: 20px;">
	                    <h2>체험 신청이 반려되었습니다.</h2>
	                </div>
	                <table>
	                    <tr>
	                        <td style="padding:0px; font-size:20px; padding-bottom:20px;"><p>거절사유</p></td>
	                        <td style="padding:0px;"><input type="text" name="deny" value="${ e.deny }" readonly></td>
	                    </tr>
	                    <tr>
	                        <td style="padding:0px; font-size:20px;"><p>거절상세</p></td>
	                        <td style="padding:0px"><textarea name="denyContent" readonly>${ e.denyContent }</textarea></td>
	                    </tr>
	                </table>
	                <p id="comment1">사유 확인 후 내용을 변경하여 다시 등록 요청을 해주세요. </p>
	            </div>
	            	<div style="text-align: center;">
	            </div>
	            
	            
	            <div id="stepOne">
	            <input type="hidden" name="usNo" value="${ loginUser.usNo }">
	            <input type="hidden" name="exNo" value="${ e.exNo }">
            	<input type="hidden" name="atList" value="${ list }">
            	<input type="hidden" id="count" name="count" value="">
            	
	                <div colspan="2" style="font-size: 22px; font-weight: bold; color: white; background-color: #34538a; height: 50px; padding-top: 15px; padding-left: 20px;"> 
	                    1. 기본 정보</div>
		                <table>
		                    <tr>
		                        <th>* 카테고리</th>
		                        <td>
		                            <p class="hh">• 아래의 카테고리중 1개만 선택이 가능합니다. <br>
					                                상품을 가장 잘 표현하는 카테고리를 선택해 주세요. <br>
					                                관리자 심사 후 수정될수 있습니다.</p>
		                            <label><input type="radio" id="life" name="expCategory" value=1>라이프 및 스타일(뷰티/패션/쇼핑)</label><br>
		                            <label><input type="radio" id="culture" name="expCategory" value=2>문화와 역사(과학/경제/역사/봉사활동)</label><br>
		                            <label><input type="radio" id="fitness" name="expCategory" value=3>스포츠 및 피트니스(자전거/요가/러닝/근력운동)</label><br>
		                            <label><input type="radio" id="art" name="expCategory" value=4>미술과 디자인(그림/전시/목공/사진/일러스트)</label><br>
		                            <label><input type="radio" id="outdoor" name="expCategory" value=5>야외활동(별관찰/농촌투어/캠핑/하이킹)</label>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>* 언어</th>
		                        <td>
		                        	<p class="hh">• 체험 진행 시 주로 사용되는 언어를 선택해주세요</p>
		                            <label><input type="checkbox" id="ko" name="language" value="한국어">한국어</label>
		                            <label><input type="checkbox" id="es" name="language" value="스페인어" style="margin-left:20px;">스페인어</label>
		                            <label><input type="checkbox" id="jp" name="language" value="일본어" style="margin-left:20px;">일본어</label>
		                            <br>
		                            <label><input type="checkbox" id="en" name="language" value="영어">영어</label>
		                            <label><input type="checkbox" id="ch" name="language" value="중국어" style="margin-left:30px;">중국어</label>
		                            <label><input type="checkbox" id="etc" name="language" value="그 외" style="margin-left:33px;">그 외</label>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>* 체험 태그</th>
		                        <td>
		                            <p class="hh">• 상품에 가장 잘 어울리는 태그를 선택해주세요. 최대 2개까지 가능합니다.</p>
		                            <label><input type="checkbox" id="musium" class="expTag" name="expTag" value="박물관/미술관">박물관/미술관</label>
		                            <label><input type="checkbox" id="shop" class="expTag" name="expTag" value="쇼핑" style="margin-left:20px;">쇼핑</label>
		                            <label><input type="checkbox" id="beauty" class="expTag" name="expTag" value="뷰티/패션" style="margin-left:50px;">뷰티/패션</label>
		                            <br>
		                            <label><input type="checkbox" id="park" class="expTag" name="expTag" value="테마파크">테마파크</label>
		                            <label><input type="checkbox" id="city" class="expTag" name="expTag" value="시티투어" style="margin-left:50px;">시티투어</label>
		                            <label><input type="checkbox" id="camp" class="expTag" name="expTag" value="캠핑" style="margin-left:25px;">캠핑</label>
		                            <br>
		                            <label><input type="checkbox" id="special" class="expTag" name="expTag" value="이색체험">이색체험</label>
		                            <label><input type="checkbox" id="food" class="expTag" name="expTag" value="맛집/카페" style="margin-left:50px;">맛집/카페</label>
		                            <label><input type="checkbox" id="sports" class="expTag" name="expTag" value="스포츠" style="margin-left:20px;">스포츠</label>
		                            <br>
		                            <label><input type="checkbox" id="landscape" class="expTag" name="expTag" value="야경">야경</label>
		                            <label><input type="checkbox" id="bicycle" class="expTag" name="expTag" value="자전거" style="margin-left:72px;">자전거</label>
		                            <label><input type="checkbox" id="class" class="expTag" name="expTag" value="클래스(강좌)" style="margin-left:39px;">클래스(강좌)</label>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>* 체험 제목</th>
		                        <td>
		                            <input type="text" id="expTitle" name="expTitle" value="${ e.expTitle }" style="padding-left:5px;width:500px" required>
		                            <p class="hh">• 정확하고 간결하게 표현해주세요. <br>
		                                • 지역명이 포함된 제목은 노출에 더 효과적입니다. <br>
		                                (도쿄, 산책하는 여행, 샌프란시스코 당일코드 등)</p>
		                        </td>
		                    </tr>
		                    <tr>
		                    	<th>* 체험 소개</th>
		                        <td>
		                        	<textarea id="summernote" style="height:100px; border:1px solid red" name="expContent">${ e.expContent }</textarea>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>* 체험 장소</th>
		                        <td>
		                        	<!-- 주소API -->
			                        <input type="text" id="del_postcode" name="zipCode" value="${ e.zipCode }" placeholder="우편번호" style="width:100px; height:25px; padding-left:5px; margin-bottom:5px;" readonly>
									<input type="button" id="searchAdressBtn" onclick="del_execDaumPostcode()" value="우편번호 찾기" style="width: 100px; height:25px; background-color: #34538a; color:#fff; border:1px solid #34538a; border-radius:4px;" readonly><br>
			                        <input type="text" id="del_address" name="addBasic" value="${ e.addBasic }" placeholder="주소" style="width:320px; height:25px; padding-left:5px; margin-bottom:5px;" readonly>											
									<input type="text" id="del_extraAddress" name="addRef" value="${ e.addRef }" placeholder="참고항목" style="width:150px; height:25px; padding-left:5px; margin-bottom:5px;" readonly>
									<!-- 사용자가 직접 입력하는 칸  -->
									<input type="text" id="del_detailAddress"  name="addDetail" value="${ e.addDetail }" placeholder="상세주소" style="width:480px; height:25px; padding-left:5px;" required> 
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
	                            <label><input type="radio" id="level1" class="activity" name="activity" value=1>가벼움</label><br>
	                            <label><input type="radio" id="level2" class="activity" name="activity" value=2>보통</label><br>
	                            <label><input type="radio" id="level3" class="activity" name="activity" value=3>격렬한</label><br>
	                            <label><input type="radio" id="level4" class="activity" name="activity" value=4>익스트림</label><br>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 최대 인원수</th>
	                        <td>
	                            <input type="number" class="maxPeople" name="maxPeople" value="${ e.maxPeople }" min="1" required style="width:100px;margin-right:5px;">명
	                            <p class="hh">• 최소 인원수는 1명입니다. 한 회차당 운영 가능한 최대인원수를 입력하세요.</p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 체험 시간</th>
	                        <td id="oprateTimes">
								운영 시작 시간은 <select name="startTime" id="startTime">
													<option value="00:00">00:00
													<option value="00:30">00:30
													<option value="01:00">01:00
													<option value="01:30">01:30
													<option value="02:00">02:00
													<option value="02:30">02:30
													<option value="03:00">03:00
													<option value="03:30">03:30
													<option value="04:00">04:00
													<option value="04:30">04:00
													<option value="05:00">05:00
													<option value="05:30">05:30
													<option value="06:00">06:00
													<option value="06:30">06:30
													<option value="07:00">07:00
													<option value="07:30">07:30
													<option value="08:00">08:00
													<option value="08:30">08:30
													<option value="09:00">09:00
													<option value="09:30">09:30
													<option value="10:00">10:00
													<option value="10:30">10:30
													<option value="11:00">11:00
													<option value="11:30">11:30
													<option value="12:00">12:00
													<option value="12:30">12:30
													<option value="13:00">13:00
													<option value="13:30">13:30
													<option value="14:00">14:00
													<option value="14:30">14:30
													<option value="15:00">15:00
													<option value="15:30">15:30
													<option value="16:00">16:00
													<option value="16:30">16:30
													<option value="17:00">17:00
													<option value="17:30">17:30
													<option value="18:00">18:00
													<option value="18:30">18:30
													<option value="19:00">19:00
													<option value="19:30">19:30
													<option value="20:00">20:00
													<option value="20:30">20:30
													<option value="21:00">21:00
													<option value="21:30">21:30
													<option value="22:00">22:00
													<option value="22:30">22:30
													<option value="23:00">23:00
													<option value="23:30">23:30
												</select> 입니다.<br><br>
								운영 마감 시간은<select name="endTime" id="endTime">
													<option value="00:00">00:00
													<option value="00:30">00:30
													<option value="01:00">01:00
													<option value="01:30">01:30
													<option value="02:00">02:00
													<option value="02:30">02:30
													<option value="03:00">03:00
													<option value="03:30">03:30
													<option value="04:00">04:00
													<option value="04:30">04:00
													<option value="05:00">05:00
													<option value="05:30">05:30
													<option value="06:00">06:00
													<option value="06:30">06:30
													<option value="07:00">07:00
													<option value="07:30">07:30
													<option value="08:00">08:00
													<option value="08:30">08:30
													<option value="09:00">09:00
													<option value="09:30">09:30
													<option value="10:00">10:00
													<option value="10:30">10:30
													<option value="11:00">11:00
													<option value="11:30">11:30
													<option value="12:00">12:00
													<option value="12:30">12:30
													<option value="13:00">13:00
													<option value="13:30">13:30
													<option value="14:00">14:00
													<option value="14:30">14:30
													<option value="15:00">15:00
													<option value="15:30">15:30
													<option value="16:00">16:00
													<option value="16:30">16:30
													<option value="17:00">17:00
													<option value="17:30">17:30
													<option value="18:00">18:00
													<option value="18:30">18:30
													<option value="19:00">19:00
													<option value="19:30">19:30
													<option value="20:00">20:00
													<option value="20:30">20:30
													<option value="21:00">21:00
													<option value="21:30">21:30
													<option value="22:00">22:00
													<option value="22:30">22:30
													<option value="23:00">23:00
													<option value="23:30">23:00
												</select> 입니다.<br><br>
								체험 소요 시간은  <input type="number" name="useTime" min=1 value="1">시간 입니다. 
								<h5>• 최소 소요시간은 1시간입니다.</h5><br>
								체험 운영 간격은	<select name="intervalTime" id="intervalTime">
													<option value="30" selected>30분간격
													<option value="60">60분(1시간)간격
													<option value="120">120분(2시간)간격
													<option value="180">180분(3시간)간격
												</select>분 입니다.
								<h5>• 최소 운영간격은 30분입니다.</h5>
								
							</td>
	                    </tr>
	                    <tr>
	                        <th>* 게스트 준비물</th>
	                        <td>
	                            <input type="text" id="supplies" name="supplies" value="${ e.supplies }" style="width:500px;padding-left:5px;">
	                            <input type="checkbox" id="noSupplies" name="supplies" value="별도의 준비물이 필요없는 체험입니다.">
	                            	<label for="noSupplies">게스트가 준비할 사항이 전혀 없습니다.</label>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 대표 사진</th>
	                        <td colspan="2">
	                          	<img id="titleImg" src="${pageContext.request.contextPath}/resources/uploadFiles/${ e.changeName }"
	                          		 style="border:0.5px solid #dbdbdb; width: 200px; height:150px" >
	                         	<div id="fileArea">
									<input type="file" name="thumb" id="thumb" onchange="loadImg(this,1);"required>
								</div>
	                          <p class="hh">• 텍스트 및 로고가 있을 경우 관리자가 사진을 수정 혹은 삭제할 수 있습니다.</p>
	                       </td>
	                    </tr>
	                    <tr>
	                        <th>* 상세 사진</th>
	                        <td class="photo_btn" colspan="2">
								<ul id="ul">
									<c:forEach items="${ list }" var="at">
										<li class="li">
											<input type="hidden" class="fiName" value="${ at.changeName }">
											<a href="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${ at.changeName }">${ at.originName }</a>
											<button class="del">x</button>
										</li>
									</c:forEach>
									<c:if test="${ list.size() ne 5 }">
										<button type="button" class="addBtn">+</button>
									</c:if>
								</ul>
								<div id="photoDiv"></div>
								
								
								<div id="delChangeName"></div>
								
								
								<p class="hh">• 1장 이상의 상세 사진을 등록해주세요. 최대 5장까지 가능합니다.</p>
							</td>
	                    </tr>
	                    
	                    <tr>
	                        <th>* 요금 책정</th>
	                        <td>
	                            <span>1인 예약시 요금</span>
	                            <span><input type="number" class="price" name="price" value="${ e.price }" style="text-align:right; padding-right:5px;">원</span>
	                            <br><br>
	
	                            <span>파트너 예상수익</span>
	                            <span><input type="number" class="priceCal" name="priceCal" style="text-align:right; padding-right:5px;" readonly disabled>원</span><br>
	                            <span></span>
	                        </td>
	                    </tr>
	                </table>
	            <br>
	            </div>
	            <div id="btns">
               <span>
                   <button type="button" id="gotoList" onclick="javascript:history.go(-1);">목록으로</button>
	                </span>
	                <div style="text-align:right; margin-top: -40px;">
	                    <button id="modify" onclick="expSubmit();">재심사요청</button>
	                </div>
	            </div>
	        </form>
       		<br><br><br>
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
	function expSubmit(){	
		$("#updateReExp").attr("action", "updateReExp.exp");
		$("#updateReExp").submit();
	}
</script>

<!-- 준비물 쪽 체크박스 -->
<script type="text/javascript">
	$(function(){
		$("#noSupplies").click(function(){
			if($("#noSupplies").is(":checked")){
				var a = $("#noSupplies").val("장비포함");
				$("#supplies").attr("disabled", true);
   				//console.log(a.val()); // "장비포함"
			} else{
				$("#supplies").attr("disabled", false);
			}
		});
	});
</script>

<!-- 체험시간 select option -->
<script>
	$(function(){
		 $("#startTime option").each(function(i, option){
			 if('${e.startTime}'==option.value){
				$(this).attr("selected", true);				 
			 }
		 });
		 
		 $("#endTime option").each(function(i, option){
			 if('${e.endTime}'==option.value){
				$(this).attr("selected", true);				 
			 }
		 });
		 
		 $("#intervalTime option").each(function(i, option){
			 if('${e.intervalTime}'==option.value){
				$(this).attr("selected", true);				 
			 }
		 });
	});
</script>

<script>
	$(function(){
		if('${e.supplies}'=="장비포함"){
			$("#supplies").text(" ");
			$("#supplies").attr("disabled", true);
			$("#noSupplies").prop("checked",true);
		}
	});

	$(function(){
		switch('${e.expCategory}'){
		case "1" : $("#life").prop("checked", true); break;
		case "2" : $("#culture").prop("checked", true); break;
		case "3" : $("#fitness").prop("checked", true); break;
		case "4" : $("#art").prop("checked", true); break;
		case "5" : $("#outdoor").prop("checked", true); break;
		}
	});
	
	$(function(){
		var language = ('${e.language}').split(",");
		
		for(var i=0; i<language.length; i++){
			switch(language[i]){
			case "한국어" : $("#ko").prop("checked", true); break;
			case "스페인어" : $("#es").prop("checked", true); break;
			case "일본어" : $("#jp").prop("checked", true); break;
			case "영어" : $("#en").prop("checked", true); break;
			case "중국어" : $("#ch").prop("checked", true); break;
			case "그 외" : $("#etc").prop("checked", true); break;
			}
		}
	});
	
</script>
	
<script>
	
	$(function(){
		var tag = ('${e.expTag}').split(",");

		for(var i=0; i<tag.length; i++){
			switch(tag[i]){
			case "박물관/미술관" : $("#musium").prop("checked", true); break;
			case "쇼핑" : $("#shop").prop("checked", true); break;
			case "뷰티/패션" : $("#beauty").prop("checked", true); break;
			case "테마파크" : $("#park").prop("checked", true); break;
			case "시티투어" : $("#city").prop("checked", true); break;
			case "캠핑" : $("#camp").prop("checked", true); break;
			case "이색체험" : $("#special").prop("checked", true); break;
			case "맛집/카페" : $("#food").prop("checked", true); break;
			case "스포츠" : $("#sports").prop("checked", true); break;
			case "야경" : $("#landscape").prop("checked", true); break;
			case "자전거" : $("#bicycle").prop("checked", true); break;
			case "클래스" : $("#class").prop("checked", true); break;
			}
		}
	});
	
	$(function(){
		switch('${e.activity}'){
		case "1" : $("#level1").prop("checked", true); break;
		case "2" : $("#level2").prop("checked", true); break;
		case "3" : $("#level3").prop("checked", true); break;
		case "4" : $("#level4").prop("checked", true); break;
		}
	});
</script>


<script type="text/javascript">
	$(function(){
		$(".expTag").click(function(){
			if($("input[name=expTag]:checked").length>2){
				alert("2개까지 선택가능합니다.");
				return false;
			}
			if($("input[name=expTag]:checked").length<1){
				alert("최소1개는 선택해야합니다");
				return false;
			}
		});
	});
</script>

<!-- 대표사진 fileArea -->
<script>
	$(function(){
		$("#fileArea").hide();
		
		$("#titleImg").click(function(){
			$("#thumb").click();
		});
	
	});
	
	function loadImg(inputFile, num) {
		if(inputFile.files.length==1){
      			// 파일을 읽어들일 FileReader 객체생성
      			var reader = new FileReader();

      			// 파일을 읽어주는 메소드 : 파일을 읽어들이는 순간 고유한 url부여
      			reader.readAsDataURL(inputFile.files[0]);
      			
      			//파일 읽기가 완료 되었을때 실행할 메소드
			// e : 현재 이벤트가 발생한 이벤트객체
      			reader.onload = function(e){
				$("#titleImg").attr("src", e.target.result); 
			};
		}
	}
</script>

<!-- 상세사진용  -->
<script>
	$(function(){

		var count = 0;	// 누른 x의 갯수
		$(".del").click(function(){  
			
			// 삭제하려고 x를 누른 파일의 changeName을 변수로 선언
			delChangeName = $(this).siblings().eq(0).val();		
			
			// name이 deList인 input요소에 x를 누른 파일의 changeName값을 넣어 폼안쪽에 넣어준다
			$("#delChangeName").append('<input type="hidden" name="deList" value="' + delChangeName + '">');
			
			// 누른 x의 갯수를 1증가시킨다
			count++;
			
			// 파일명+x버튼 한 줄을 삭제한다
			$(this).parent(".li").remove();
			
			// li길이가 5가 아닐 경우 파일추가할수 있는 버튼을 생성한다
			if($(".li").length != 5){
				if($("#ul").children().is(".addBtn")){
					
				}else{
					$("#ul").append('<button type="button" class="addBtn">+</button>');
				}
			}
		});
		
		// 상단에 input hidden으로 count를 받아놓고 form이 submit되면 컨트롤러로 전달한다
		$("#count").val(count);
		
		// 동적으로 만들어진 요소는 on메소드를 이용하여 이벤트 작성
		//$(".addBtn").click(function(){
		$("#ul").on("click", ".addBtn", function(){
			
			// name이 file인 input요소는 최대5개까지 생성
			if($("input[name=file]").length < (5-$(".li").length)){
				$("#photoDiv").append('<input type="file" name="file">');
			}
		});
	});
</script>
   
   <!-- 사용자가 가격을 입력할 때, 자동으로 수익계산(수수료20%제외) -->
<script>
	$(function(){
		// 이벤트 걸고자하는 input요소
		var price = $(".price");
		
		price.keyup(function(){
			// 금액이 4자리 이상 되었을 때 예상가격 출력 -- 소수점이하 버림
			if(price.val().length>=4){
				//console.log(price.val());
				var priceCal = Math.floor(price.val()*0.8);
				$(".priceCal").val(priceCal);
			}else{
				$('.priceCal').val('');
			}					
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
         	
         	tabsize: 2,
             height: 200,
              width: 600
              /*placeholder: '체험 설명을 잘 작성하면 게스트의 예약과 참여를 유도할 수 있습니다.  '
        			+'게스트를 위해 세심하게 고안한 체험 일정의 자세한 내용을 알려주세요.'
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
    
</body>
</html>