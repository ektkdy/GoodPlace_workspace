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
    #contents{height: 2100px;}


    /* 중앙 박스(div#stepOne) 내부공통 css */
    #expEnroll_stepOne{width:950px; border: 1px solid #dbdbdb;}
    .expEnroll_tb th{width: 200px; padding-top: 30px; padding-left: 70px; vertical-align: top;}
    .expEnroll_tb td{width:500px; padding-top: 30px; padding-left: 50px;}
    .expEnroll_tb td label{font-size: 15px; padding-left: 10px;}
    .expEnroll_tb .enrollInfo{font-size: 13px; color: #0d80fb; font-weight: 400; }
    .h5Cl{color: cornflowerblue; padding-bottom: 5px;} /*중앙박스 외 상단에도 하나 있음*/
    .expEnroll_tb td textarea{width: 500px; height: 170px; border-radius: 4px; resize: none; border: 1px solid #dbdbdb;}
    .expEnroll_tb input[type=text]{width: 500px; border-radius: 4px; height: 30px; border: 1px solid #dbdbdb;}
    .expEnroll_tb select{width: 200px; height: 30px;border-radius: 4px;}

    /*하단 버튼 css*/
    .btnArea{float: right; padding-top:15px; padding-bottom:30px}
    .btnArea button{width: 150px;height: 40px;}
    .btnArea .cancel{border-radius: 5px; border: 1px solid #bebebe; background: #f1f1f1;}
    .btnArea .enroll{border-radius: 5px; border: 1px solid #184c88; background: #184c88; color:#fff}
    .Cbutton{cursor: pointer;  width: 140px; height: 35px; }
    #gotoList{border: 1px solid #dbdbdb; border-radius: 4px; font-size: 15px;}
    #gotoList:hover{background-color: white; border: solid 1px #dbdbdb;}
    #okey{border: 1px solid #34538a; border-radius: 4px; font-size: 15px; background-color: #34538a; color: white;}
    #okey:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    #reject{background-color: darkred; border: 1px solid darkred; color: white; border-radius: 4px;}
    #reject:hover{color: darkred; background-color: white;}
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
                    <span>체험관리</span>&gt;
                </a>
                <a href="#">
                    <span>체험승인</span>
                </a>
                
            </div>
            <br clear="both">
            <div class="con" style="width:980px; color:#000">
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">체험승인</p>
                </span>
                <br>
                <br clear="both">
                <div id="expEnroll_stepOne">
                    <div colspan="2" style="font-size: 22px; font-weight: bold; color: white; background-color: #34538a; height: 50px; padding-top: 15px; padding-left: 20px;"> 
                        1. 기본 정보</div>
                    <table class="expEnroll_tb">
                        <tr>
                            <th>* 카테고리</th>
                            <td>
                                <!-- <h5 class="h5Cl enrollInfo">• 아래의 카테고리중 1개만 선택이 가능합니다. <br>
                                    상품을 가장 잘 표현하는 카테고리를 선택해 주세요. <br>
                                    관리자 심사 후 수정될수 있습니다.</h5> -->
                                <input type="radio" id="expCategory1" name="expCategory" value="lifeStyle"><label for="lifeStyle">라이프 및 스타일(뷰티/패션/쇼핑)</label><br>
                                <input type="radio" id="expCategory2" name="expCategory" value="culture"><label for="culture">문화와 역사(과학/경제/역사/봉사활동)</label><br>
                                <input type="radio" id="expCategory3" name="expCategory" value="fitness"><label for="fitness">스포츠 및 피트니스(자전거/요가/러닝/근력운동)</label><br>
                                <input type="radio" id="expCategory4" name="expCategory" value="art"><label for="art">미술과 디자인(그림/전시/목공/사진/일러스트)</label><br>
                                <input type="radio" id="expCategory5" name="expCategory" value="outdoor"><label for="outdoor">야외활동(별관찰/농촌투어/캠핑/하이킹)</label>
                            </td>
                        </tr>
                        <tr>
		                        <th>* 언어</th>
		                        <td>
		                        	<!-- <p class="hh">• 체험 진행 시 주로 사용되는 언어를 선택해주세요</p> -->
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
                                <strong>${ e.expTag }</strong>
                            </td>
                        </tr>
                        <tr>
                            <th>* 체험 제목</th>
                            <td>
                                <strong>${ e.expTitle }</strong>
                                <!-- <h5 class="expEnroll_tb enrollInfo">• 정확하고 간결하게 표현해주세요. <br>
                                    • 지역명이 포함된 제목은 노출에 더 효과적입니다. <br>
                                    (도쿄, 산책하는 여행, 샌프란시스코 당일코드 등)</h5> -->
                            </td>
                        </tr>
                        <tr>
                            <th>* 체험 소개</th>
                            <td id="summer">
                            </td>
                        </tr>
                        <tr>
	                        <th>* 체험 장소</th>
	                        <td>우편번호 : ${ list[0].zipCode } <br>
	                        	${ list[0].addBasic } ${ list[0].addRef } ${ list[0].addDetail }</td>
	                    </tr>
                    </table>
                    <br>
                    <div colspan="2" style="font-size: 22px; font-weight: bold; color: white; background-color: #34538a; height: 50px; padding-top: 15px; padding-left: 20px;"> 
                        2. 체험 정보</div>
                    <table class="expEnroll_tb">
                        <tr>
                            <th>* 활동강도</th>
                            <c:if test="${ e.activity eq 1 }">
                            	<td><strong>가벼움</strong></td>
                            </c:if>
                            <c:if test="${ e.activity eq 2 }">
                            	<td><strong>보통</strong></td>
                            </c:if>
                            <c:if test="${ e.activity eq 3 }">
                            	<td><strong>격렬한</strong></td>
                            </c:if>
                            <c:if test="${ e.activity eq 4 }">
                            	<td><strong>익스트림</strong></td>
                            </c:if>
                        </tr>
                        <tr>
                            <th>* 최대 인원수</th>
                            <td>
                                <strong>${ e.maxPeople }명</strong>
                               <!-- <h5 class="h5Cl enrollInfo">• 최소 인원수는 1명입니다.</h5> -->
                            </td>
                        </tr>
                        <tr>
                            <th>* 체험 시간</th>
                            <td>
                                <strong>체험 시작시간 ${ e.startTime }</strong>
                                (소요시간<strong>${ e.useTime }시간</strong>)
                            </td>
                        </tr>
                        <tr>
                            <th>* 게스트 준비물</th>
                            <td><strong>${ e.supplies }</strong></td>
                        </tr>
                        <tr>
                            <th>* 대표 사진</th>
                            <td>
                                <img id="titleImg" src="${pageContext.request.contextPath}/resources/uploadFiles/${ e.changeName }"
	                          		 style="border:0.5px solid #dbdbdb; width: 200px; height:150px" >
                                <!-- <h5 class="h5Cl enrollInfo">• 텍스트 및 로고가 있을 경우 관리자가 사진을 수정 혹은 삭제할 수 있습니다.</h5> -->
                            </td>
                        </tr>
                        <tr>
                            <th>* 상세 사진</th>
                            <td>
                            	<ul id="ulExp" style="list-style:none;">
									<c:forEach items="${ list }" var="at">
										<li class="liExp">
											<input type="hidden" class="fiName" value="${ at.changeName }">
											<a href="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${ at.changeName }">${ at.originName }</a>
										</li>
									</c:forEach>
								</ul>
                            </td>
                        </tr>
                        
                    </table>
                    <br>
                </div>
                <div class="btnArea" style="padding-bottom: 10%;">
                    <button class="cancel" data-toggle="modal" data-target="#rejection">거절하기</button>
                    <button class="enroll" onclick="location.href='aExpOkay.ex?eno=${ e.exNo }'">승인하기</button>
                    <div id="test" style="display:none;  padding-bottom: 20%;" >
                        <textarea style="width:300px; height: 200px; border:1px solid black; resize: none;"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <script>
	    $(function(){
	 		$("#summer").html('${ e.expContent }');	
	 	});
    
		$(function(){
			switch('${e.expCategory}'){
			case "1" : $("#expCategory1").prop("checked", true); break;
			case "2" : $("#expCategory2").prop("checked", true); break;
			case "3" : $("#expCategory3").prop("checked", true); break;
			case "4" : $("#expCategory4").prop("checked", true); break;
			case "5" : $("#expCategory5").prop("checked", true); break;
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



    <!-- 거절하기 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 button 클릭시 보임) -->
    <div class="modal fade" id="rejection">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="width:500px;">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">해당 체험을 정말로 거절하겠습니까?</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="aExpReject.ex" method="post">
                <input type="hidden" name="exNo" value="${ e.exNo }">
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
    
	<script>
        $(function(){
            
            $(".arrow").click(function(){
                $("#slide_menu").slideToggle(500);
            });
        });
    </script>
    
    
</body>
</html>