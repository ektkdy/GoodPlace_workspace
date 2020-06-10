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
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp44699415'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
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
	    m_redirect_url : 'http://192.168.30.232:8888/goodplace'
	}, function(rsp) {	// callback
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        location.href="partnerMain.me";
	    } else {
	    	var msg = '결제가 완료되었습니다.';
	        //msg += '에러내용 : ' + rsp.error_msg;
	        location.href="partnerMain.me";
	    }
	    alert(msg);
	});
</script>
</head>
<body>
	<p>아임 서포트 결제 모듈 테스트 해보기</p>
</body>
</html>