<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/partner/partnerCommon.css" />
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

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

    /* 숙소정보 css */
    #roomInfo{height: 300px;}
    #roomInfo td:first-child{font-weight: bold;}
    table td{padding-left: 50px;}

    /*하단 버튼 css*/
    #btns{text-align: center;}
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
                <a href="#"><span style="margin-right: 30px;"> &gt; 파워등록</span></a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                    <p class="title_tt">파워 결제 확인</p>
                </span><br>
                <div style="margin-bottom: 50px;"></div>
                <div>
                    <div>
                        <p style="font-size: 25px; margin-left: 20px;">숙소정보</p>
                        <hr style="width: 950px;" align="left">
                        <div style="display: inline;">
                            <img src="${pageContext.request.contextPath}/resources/uploadFiles/${r.changeName}" style="width: 400px; height: 300px;">
                        </div>
                        <div style="display: inline-block;">
                            <table id="roomInfo">
                            	<input type="hidden" name="roNo" value="${ r.roNo }">
                            	
                                <tr>
                                    <td>숙소명</td>
                                    <td>${ r.roomsTitle } / ${ p.poNo }</td>
                                </tr>
                                <tr>
                                    <td>파워종류</td>
                                    <td>${ p.powerKind }</td>
                                </tr>
                                <tr>
                                    <td>파워기간</td>
                                    <td>
                                    	<span id="powerStart" name="powerStart"></span>  -  
                                    	<span id="powerEnd" name="powerEnd"></span>
										(${ p.period }일)
									</td>
                                </tr>
                                <tr>
                                    <td>총 금액</td>
                                    <td><fmt:formatNumber value="${ p.powerPrice }"/>원</td>
                                </tr>
                            </table>
                        </div>
                        <hr style="width: 950px;" align="left">
                        <div style="text-align:center; margin:50px 0px;">
                            <p>파워등록을 신청하시겠습니까? <br>
                                                     신청 후 취소가 불가합니다.<br>
                                                     신청하기를 누르면 결제 페이지로 이동합니다.
                            </p>
                        </div>
                    </div>
                    
                </div>
                <div id="btns">
                    <button type="button" id="cancle" onclick="location.href='list.ro?currentPage=1'">취소하기</button>
                    <button type="button" id="next">신청하기</button>
                </div>
            </div>
        </div>
    </div>
    
    <form id="updateRoomPower" action="updateRoomPower.ro" method="post">
    	<input type="hidden" name="roNo" value="${r.roNo}">
    	<input type="hidden" name="poNo" value="${p.poNo}">
    	<input type="hidden" id="powerStart2" name="powerStart" value="">
    	<input type="hidden" id="powerEnd2" name="powerEnd" value="">
    </form>
    
    <script>
	    $(function(){
	    	$("#next").click(function(){
	    		var IMP = window.IMP; // 생략가능
	    		IMP.init('imp13454636'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    		
	    		// IMP.request_pay(param, callback) 호출
	    		IMP.request_pay({	// param
	    		    pg : ' html5_inicis', // version 1.1.0부터 지원.
	    		    pay_method : 'card',
	    		    merchant_uid : 'merchant_' + new Date().getTime(),
	    		    name : '주문명:결제테스트',
	    		    amount : 100,
	    		    buyer_email : 'iamport@siot.do',
	    		    buyer_name : '구매자이름',
	    		    buyer_tel : '010-1234-5678',
	    		    buyer_addr : '서울특별시 강남구 삼성동',
	    		    buyer_postcode : '123-456',
	    		    m_redirect_url : 'http://localhost:8888/goodplace'
	    		}, function(rsp) {	// callback
	    		    if ( rsp.success ) {
	    		        var msg = '결제가 완료되었습니다.';
	    		        //msg += '고유ID : ' + rsp.imp_uid;
	    		        //msg += '상점 거래ID : ' + rsp.merchant_uid;
	    		        //msg += '결제 금액 : ' + rsp.paid_amount;
	    		        //msg += '카드 승인번호 : ' + rsp.apply_num;
	    		        location.href="list.ro?currentPage=1";
	    		        
	    		        $("#updateRoomPower").submit();
	    		        
	    		    } else {
	    		    	var msg = '결제실패.';
	    		        msg += '에러내용 : ' + rsp.error_msg;
	    		        location.href="list.ro?currentPage=1";
	    		    }
	    		    alert(msg);
	    		});
	    	});
	    });
	    
	    
	    $(function(){
	    	var date = new Date();	// 오늘날짜(년월일시분초 담김)

	    	var start = date.toISOString().substring(0,10);	// 포맷을 yyyy-MM-dd로 변환 후 년월일만 추출
	    	$("#powerStart").text(start);
	    	$("#powerStart2").val(start);
	    	
	    	date.setDate(date.getDate()+ ${p.period});	// period기간만큼 일정 늦어줌
	    	var after = date.toISOString().substring(0,10);	
	    	$("#powerEnd").text(after);
	    	$("#powerEnd2").val(after);
	    	
	    	//console.log(start);
	    	//console.log(after);
	    	
	    });
	</script>
    
</body>
</html>