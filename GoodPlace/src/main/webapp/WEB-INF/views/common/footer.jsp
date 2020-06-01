<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

   .footer_address{
       margin: 0 auto;
       width: 1200px;
       font-size: 11px;
       color: grey;
       padding-top: 20px;
       margin-left: 200px;
   }
   .footer_nav{
       padding-top: 18px;
       height: 20px;
   }
   .footer_menu{
       width: 210px;
       display: table-cell;
       text-align: center;
    vertical-align: middle;
       font-weight: bold;
   }
   .footer_menu a {
       text-decoration: none;
       color: rgb(75, 75, 75);
       font-size: 15px;
   }

   /*고객센터 버튼*/
   .serBtn {
       box-shadow:inset 0px 1px 0px 0px #ffffff;
       background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
       background-color:#ffffff;
       border-radius:6px;
       border:1px solid #dcdcdc;
       display:inline-block;
       cursor:pointer;
       color:#666666;
       font-family:Arial;
       font-size:16px;
       font-weight:bold;
       padding:6px 24px;
       text-decoration:none;
       text-shadow:0px 1px 0px #ffffff;
   }
   .serBtn:hover {
       background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
       background-color:#f6f6f6;
   }
   .serBtn:active {
       position:relative;
   }
   .footerMargin{
       margin-top:14px;
       font-size: 12px;
       line-height: 152%;
   }
   /*footer 스타일 끝*/
</style>
</head>
<body>
    <!-- footer -->
    <div id="footer">
        <div class="footer_nav" align="center">
            <div class="footer_menu">
                <a href="">이용약관</a>
            </div>
            <div class="footer_menu">
                <a href="">개인정보 처리방침</a>
            </div>
            <div class="footer_menu">
                <a href="">취소 및 환불 정책</a>
            </div>
        </div>
        <div class="footer_address">
            <div>
                <a href="#" class="serBtn">고객센터</a>
            </div>
            <p class="footerMargin">
                상호명 (주)굿플레이스 | 대표 강보람 | 개인정보보호책임자 채희영 |사업자등록번호 209-81-55339 사업자정보확인 
                <br>통신판매업신고번호 2019-서울서초-0260 | 서울특별시 서초구 강남대로 327, 대륭서초타워 18층(서초동)
                <br>대표번호 : 1670-8208 | 일반 문의 09:00-22:00 | 연중무휴 / 점심 12:00-13:00
                <br>굿플레이스는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품·거래정보 및 거래에 대하여 책임을 지지않습니다.
                <br>자사는 서울특별시관광협회 공제영업보증보험에 가입되어 있습니다.
            </p>
        </div>
    </div>
</body>
</html>