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
    #contents{height: 1400px;}

    /*상단 이미지 두개*/
    #backgroundImg{position: relative; z-index: 1;}
    #personalImg{position: relative; z-index: 2; margin-left: 420px; margin-top: -50px;}

    /* 중앙 박스(div#stepOne) 내부공통 css */
    #stepOne{width:950px; border: 1px solid #dbdbdb;}
    table th{width: 200px; padding-top: 30px; padding-left: 70px; vertical-align: top;}
    table td{width: 500px; padding-top: 30px; padding-left: 50px;}
    table td label{font-size: 15px; padding-left: 10px; padding-right: 30px;}
    h5{color: cornflowerblue; padding-bottom: 5px;} /*중앙박스 외 상단에도 하나 있음*/
    table td textarea{width: 500px; height: 170px; border-radius: 4px; resize: none; border: 1px solid #dbdbdb;}
    table input[type=text]{width: 500px; height:30px; border-radius: 4px; border: 1px solid #dbdbdb;}
    select{width: 140px; height: 35px; border-radius: 4px; margin-bottom: 10px;}

    /*하단 버튼 css*/
    #btns{width:950px; margin-top: 20px; margin-bottom: 20px; margin-right: 20px; text-align: right;}
    button{cursor: pointer;  width: 140px; height: 35px; }
    #cancle{border: 1px solid #dbdbdb; border-radius: 4px; font-size: 15px;}
    #cancle:hover{background-color: white; border: solid 1px #dbdbdb;}
    #next{border: 1px solid #34538a; border-radius: 4px; font-size: 15px;}
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
            <a href="#"><span style="margin-right: 30px;"> &gt; 계정관리</span></a>
        </div>
        <br clear="both">
        <div class="con" style="color:#000">
            <span id="page_title">
                <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                <p class="title_tt">계정관리</p>
            </span><br>
            <div style="margin-bottom: 50px;"></div>
            <div id="stepOne">
                <div id="backgroundImg">
                    <img src="#" width="100%" height="160px">
                </div>
                <div id="personalImg">
                    <img src="#" width="100px" height="100px" style="border-radius: 50px; background-color: darkblue;">
                    <input type="file">
                </div>
                
                <form action="" method="post" id="">
	                <table>
	                    <tr>
	                        <th>* 파트너 이름 </th>
	                        <td><input type="text" id="" name="" value=""></td>
	                    </tr>
	                    <tr>
	                        <th>* 소개</th>
	                        <td>
	                            <textarea id="" name="" value=""></textarea>
	                            <h5>• 예약 확정 후 서로의 연락처가 공개됩니다.<br>
	                                • 안전 거래를 위해 파트너님의 개인 연락처 및 SNS 페이지를 기재할 경우 수정되거나 삭제될 수 있습니다.</h5>   
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 연락처</th>
	                        <td>
	                            <input type="text" id="" name="" value="">
	                            <h5>• 상시 연락할 수 있는 전화번호를 알려주시면 여행자에게 큰 도움이 됩니다.</h5>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 계좌 정보</th>
	                        <td>
	                            <select name="" id="" style="margin-bottom:10px;">
	                                <option value="">은행명</option>
	                                <option value="">기업은행</option>
	                                <option value="">국민은행</option>
	                                <option value="">우리은행</option>
	                                <option value="">신한은행</option>
	                                <option value="">카카오뱅크</option>
	                                <option value="">우체국</option>
	                            </select>
	                            <input type="text" placeholder="1234-56-78900" id="" name="" value="">
	                            <h5>• 예금주가 본인 이름인 계좌만 설정이 가능합니다.</h5>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 문의 기본응답 메세지</th>
	                        <td>
	                            <textarea id="" name=""></textarea>
	                            <h5>• 기본메시지는 여행자가 최초 문의를 했을 때 기본으로 제공되는 메시지 입니다.<br>
	                                • 친절하고 구체적인 인사말로 예약을 유도하세요.</h5>
	                        </td>
	                    </tr>
	                </table>
                </form>
                <br>
            </div>
            <div id="btns">
                <button type="submit" id="cancle">취소하기</button>
                <button type="button" id="next">등록하기</button>
            </div>
        </div>
    </div>
 </div>
</body>
</html>