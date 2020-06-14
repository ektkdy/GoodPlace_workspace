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
    #contents{height: 1300px;}

    /* 중앙 박스(div#stepOne) 내부공통 css */
    #stepOne{width:950px; border: 1px solid #dbdbdb;}
    table th{width: 200px; padding-top: 30px; padding-left: 70px; vertical-align: top;}
    table td{width:500px; padding-top: 30px; padding-left: 50px; font-size:15px;}

    /*하단 버튼 css*/
    #btns{width:950px; text-align: right; margin-top: 20px; margin-bottom: 20px; margin-right: 20px;}
    #cancle{cursor: pointer;  width: 140px; height: 35px; border: 1px solid #dbdbdb; border-radius: 4px; font-size: 15px;}
    #cancle:hover{background-color: white; border: solid 1px #dbdbdb;}
    #next{cursor: pointer;  width: 140px; height: 35px; border: 1px solid #34538a; border-radius: 4px; font-size: 15px;}
    #next:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    #next{color: white; background-color: #34538a;}
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
            <a href="#"><span style="margin-right: 30px;"> &gt; 체험상세정보</span></a>
            
        </div>
        <br clear="both">
        <div class="con" style="color:#000">
            <div style="text-align: center;">
                <span><h2>체험 상세정보</h2></span>
                <br><br>
            </div>
            <form id="expEnrollForm2" action="expEnrollForm2.exp" method="post">
            <div id="stepOne">
                <table>
                    <tr>
                        <th>* 카테고리</th>
                        <c:choose>
                        	<c:when test="${ e.expCategory eq 1 }">
                        		<td>라이프 및 스타일(뷰티/패션/쇼핑)</td>
                        	</c:when>
                        	<c:when test="${ e.expCategory eq 2 }">
                        		<td>문화와 역사(과학/경제/역사/봉사활동)</td>
                        	</c:when>
                        	<c:when test="${ e.expCategory eq 3 }">
                        		<td>스포츠 및 피트니스(자전거/요가/러닝/근력운동)</td>
                        	</c:when>
                        	<c:when test="${ e.expCategory eq 4 }">
                        		<td>미술과 디자인(그림/전시/목공/사진/일러스트)</td>
                        	</c:when>
                        	<c:when test="${ e.expCategory eq 5 }">
                        		<td>야외활동(별관찰/농촌투어/캠핑/하이킹)</td>
                        	</c:when>
                        </c:choose>
                    </tr>
                    <tr>
                        <th>* 언어</th>
                        <td>${ e.language }</td>
                    </tr>
                    <tr>
                        <th>* 체험 태그</th>
                        <td>${ e.expTag }</td>
                    </tr>
                    <tr>
                        <th>* 체험 제목</th>
                        <td>${ e.expTitle }</td>
                    </tr>
                    <tr>
                        <th>* 체험 소개</th>
                        <td id="summer">
                        	
                        </td>
                    </tr>
                    <tr>
                        <th>* 체험 장소</th>
                        <td>우편번호 : ${ e.zipCode } <br>
                        	${ e.addBasic } ${ e.addRef } ${ e.addDetail }</td>
                    </tr>
                    <tr>
	                    <th>* 활동강도</th>
	                    <c:choose>
                        	<c:when test="${ e.activity eq 1 }">
                        		<td>1단계 : 가벼움</td>
                        	</c:when>
                        	<c:when test="${ e.activity eq 2 }">
                        		<td>2단계 : 보통</td>
                        	</c:when>
                        	<c:when test="${ e.activity eq 3 }">
                        		<td>3단계 : 격렬함</td>
                        	</c:when>
                        	<c:when test="${ e.activity eq 4 }">
                        		<td>4단계 : 익스트림</td>
                        	</c:when>
                        </c:choose>
	                    </tr>
	                    <tr>
	                        <th>* 최대 인원수</th>
	                        <td>${ e.maxPeople } 명 / 1회차 당</td>
	                    </tr>
	                    <tr>
	                        <th>* 체험 시간</th>
							<td id="oprateTimes">
								운영 시작 시간은 ${ e.startTime } 입니다.<br><br>
								운영 마감 시간은 ${ e.endTime } 입니다.<br><br>
								체험 소요 시간은 ${ e.useTime } 시간 입니다. <br><br>
								체험 운영 간격은 ${ e.intervalTime }분 입니다.
							</td>
						</tr>
	                    <tr>
	                        <th>* 게스트 준비물</th>
	                        <td>${ e.supplies }</td>
	                    </tr>
	                    <tr>
	                        <th>* 대표 사진</th>
	                        <td colspan="2">
	                          	<img src="${pageContext.request.contextPath}/resources/uploadFiles/${e.changeName}"
	                          		 style="border:0.5px solid #dbdbdb; width: 200px; height:150px" >
	                       </td>
	                    </tr>
	                    <tr>
	                        <th>* 상세 사진</th>
	                        <td class="photo_btn" colspan="2">
								<c:forEach items="${ list }" var="at">
									<img src="${pageContext.request.contextPath}/resources/uploadFiles/${ at.changeName }"
	                          		 style="border:0.5px solid #dbdbdb; width: 200px; height:150px">
								</c:forEach>
							</td>
	                    </tr>
	                   
	                    <tr>
	                        <th>* 요금 책정</th>
	                        <td>
	                            <span>1인 예약시 요금</span>
	                            <span>${ e.price }원</span>
	                            <br><br><br><br>
	                        </td>
	                    </tr>
                </table>
            <br>
            </div>
            <div id="btns">
                <button type="button" id="next" onclick="location.href='list.exp?currentPage=1'">목록으로</button>
            </div>
            <br><br><br><br>
            </form>
            
        </div>
    </div>
</div>


<script>
	$(function(){
         $("#summer").html('${ e.expContent }');
	});
</script>
</body>
</html>