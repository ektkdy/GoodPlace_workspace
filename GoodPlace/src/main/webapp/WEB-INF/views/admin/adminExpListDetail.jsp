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
                <br clear="both">
                <div id="expEnroll_stepOne">
                    <div colspan="2" style="font-size: 22px; font-weight: bold; color: white; background-color: #34538a; height: 50px; padding-top: 15px; padding-left: 20px;"> 
                        1. 기본 정보</div>
                    <table class="expEnroll_tb">
                        <tr>
                            <th>* 카테고리</th>
                            <td>
                                <h5 class="h5Cl enrollInfo">• 아래의 카테고리중 1개만 선택이 가능합니다. <br>
                                    상품을 가장 잘 표현하는 카테고리를 선택해 주세요. <br>
                                    관리자 심사 후 수정될수 있습니다.</h5>
                                <input type="radio" name="expCategory" value="lifeStyle"><label for="lifeStyle">라이프 및 스타일(뷰티/패션/쇼핑)</label><br>
                                <input type="radio" name="expCategory" value="culture"><label for="culture">문화와 역사(과학/경제/역사/봉사활동)</label><br>
                                <input type="radio" name="expCategory" value="fitness"><label for="fitness">스포츠 및 피트니스(자전거/요가/러닝/근력운동)</label><br>
                                <input type="radio" name="expCategory" value="art"><label for="art">미술과 디자인(그림/전시/목공/사진/일러스트)</label><br>
                                <input type="radio" name="expCategory" value="outdoor"><label for="outdoor">야외활동(별관찰/농촌투어/캠핑/하이킹)</label>
                            </td>
                        </tr>
                        <tr>
                            <th>* 언어</th>
                            <td>
                                <h5 class="h5Cl enrollInfo">• 체험 진행 시 주로 사용되는 언어를 선택해주세요</h5>
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
                                <strong>테마파크, 맛집/카페</strong>
                            </td>
                        </tr>
                        <tr>
                            <th>* 체험 제목</th>
                            <td>
                                <strong>인생사진</strong>
                                <h5 class="expEnroll_tb enrollInfo">• 정확하고 간결하게 표현해주세요. <br>
                                    • 지역명이 포함된 제목은 노출에 더 효과적입니다. <br>
                                    (도쿄, 산책하는 여행, 샌프란시스코 당일코드 등)</h5>
                            </td>
                        </tr>
                        <tr>
                            <th>* 체험 소개</th>
                            <td>
                                <textarea class="enrollInfo" style="color:black;" placeholder="체험 설명을 잘 작성하면 게스트의 예약과 참여를 유도할 수 있습니다.  &#13;&#10; 게스트를 위해 세심하게 고안한 체험 일정의 자세한 내용을 알려주세요. &#13;&#10; &#13;&#10;* 체험을 처음부터 끝까지 실제 진행 순서대로 설명해 주세요.&#13;&#10;- 게스트가 참여하게 될 체험활동을 구체적으로 설명하기&#13;&#10;- 게스트가 일정을 충분히 이해할 수 있도록 일정을 상세하게 설명하기"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>* 체험 장소</th>
                            <td>
                                    다음주소 api사용
                            </td>
                        </tr>
                    </table>
                    <br>
                    <div colspan="2" style="font-size: 22px; font-weight: bold; color: white; background-color: #34538a; height: 50px; padding-top: 15px; padding-left: 20px;"> 
                        2. 체험 정보</div>
                    <table class="expEnroll_tb">
                        <tr>
                            <th>* 활동강도</th>
                            <td>
                                <strong>가벼움</strong>
                            </td>
                        </tr>
                        <tr>
                            <th>* 최대 인원수</th>
                            <td>
                                <strong>5명</strong>
                                <h5 class="h5Cl enrollInfo">• 최소 인원수는 1명입니다.</h5>
                            </td>
                        </tr>
                        <tr>
                            <th>* 체험 시간</th>
                            <td>
                                <strong>체험 시작시간 오전 10시</strong>
                                (소요시간<strong>3시간</strong>)
                            </td>
                        </tr>
                        <tr>
                            <th>* 게스트 준비물</th>
                            <td>
                                <input type="text" placeholder="게스트가 준비할 사항이 전혀 없습니다." name="" value="">
                            </td>
                        </tr>
                        <tr>
                            <th>* 대표 사진</th>
                            <td>
                                <input type="file">
                                <h5 class="h5Cl enrollInfo">• 텍스트 및 로고가 있을 경우 관리자가 사진을 수정 혹은 삭제할 수 있습니다.</h5>
                            </td>
                        </tr>
                        <tr>
                            <th>* 상세 사진</th>
                            <td>
                                <input type="file" value="사진등록">
                                <h5 class="h5Cl enrollInfo">• 1장 이상의 상세 사진을 등록해주세요. 최대 10장까지 가능합니다.</h5>
                            </td>
                        </tr>
                        <tr>
                            <th>* 예약 설정</th>
                            <td>
                                <strong>1시간 전</strong>
                                <h5 class="h5Cl enrollInfo">• 예약 마감 시간을 체험시작 1시간 전으로 설정하실 것을 권해드립니다.<br>
                                    나중에 언제든지 변경하실수 있습니다.</h5>
                            </td>
                        </tr>
                    </table>
                    <br>
                </div>
                <div class="btnArea" style="padding-bottom: 10%;">
                    <button class="cancel" data-toggle="modal" data-target="#rejection">거절하기</button>
                    <button class="enroll">승인하기</button>
                    <div id="test" style="display:none;  padding-bottom: 20%;" >
                        <textarea style="width:300px; height: 200px; border:1px solid black; resize: none;"></textarea>
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



    <!-- 거절하기 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 button 클릭시 보임) -->
    <div class="modal fade" id="rejection">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" style="width:500px;">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">해당 체험을 정말로 거절하겠습니까?</h4>
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