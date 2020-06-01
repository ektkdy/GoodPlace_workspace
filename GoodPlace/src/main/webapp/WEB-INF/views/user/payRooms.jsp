<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소결제</title>
    <script src="../js/jquery-3.4.1.min.js"></script>
    <style>
        /* 여백 초기화 */
            body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form, hr {margin: 0; padding: 0;}
        /* header(메뉴바) 스타일 시작*/
                body{
            margin:0px;   
        }
        #header {
            clear: both;
            width: 100%;
            background: linear-gradient(to left, #4f4ce7, #41a3ec );
            top: 0;
            z-index: 1000000;
            height: 60px;
            box-shadow: 0px 10px 10px 0px rgba(144, 144, 144, 0.1);
            /*
            position: fixed;
            position: absolute;
            */
        }

        #header_wrap {
            height: inherit;
            position: relative;
            width: 1200px;
            margin: 0 auto;
            left: 0;
            right: 0;
            text-align: center;
        }

        #header>#header_wrap>div {
            display: inline-block;
            height: 100%;
        }
        /*로고*/
        #header_1 {
            width: 30%;

            position: relative;
        }
        /*검색*/
        #header_2 {
            width: 35%;
            position: relative;
        }
        /*문의,로그인*/
        #header_3 {
            width: 30%;
        }
        #navi {
            list-style-type: none;
            width: 100%;
        }
        #navi>li {
            position: relative;
            float: left;
            font-weight: 600;
            font-size: 19px;
            height: 40px;
            text-align: center;
        }
        /*검색*/
        #navi .search {
            font-size: 16px;
            padding: 10px;
            border: 0px;
            outline: none;
            float: left;
        }
        /*검색버튼*/
        #navi .searchBtn{
            width: 45px;
            height: 39px;
            border: 0px;
            background: #ffffff;
            outline: none;
            float: left;
            color:#ffffff;
        }

        /*1:1채팅상담*/
        #navi .qBtn{
            margin: 0 40px;
            color: white;
        }
        /*로그인 버튼 */
        .loginBtn {
            box-shadow:inset 0px 1px 0px 0px #bee2f9;
            background:linear-gradient(to bottom, #63b8ee 5%, #468ccf 100%);
            background-color:#63b8ee;
            border-radius:6px;
            border:1px solid #3866a3;
            display:inline-block;
            cursor:pointer;
            color:#14396a;
            font-family:Arial;
            font-size:15px;
            font-weight:bold;
            padding:6px 37px;
            text-decoration:none;
            text-shadow:0px 1px 0px #7cacde;
        }
        .loginBtn:hover {
            background:linear-gradient(to bottom, #468ccf 5%, #63b8ee 100%);
            background-color:#468ccf;
        }
        .loginBtn:active {
            position:relative;
            top:1px;
        }
        /* header(메뉴바) 스타일 끝*/

        /* content 스타일 시작*/
        #content{
            clear: both;
            width: 1200px;
            margin: 0 auto;
            height: auto;
        }
        #content>div div{
            float:left; 
            box-sizing: border-box;
        }
        .alignCenter{
            vertical-align: middle;
            text-align: center;
        }
        .biotoreGroup>div *{
            margin:0px;
        }
        .biotoreGroup h3{
            font-weight: 2000;
        }
        .backgroundGray{
            background-color:rgba(24, 76, 136, 0.33);
        }
        .buttonStyle1{
            border-radius: 5px;
            background-color:rgb(24, 76, 136);
            color:white;
            font-size: 1.5em;
            height:60px;
            width: 350px;
            border:none;
        }
        .pointButton{
            height:44px; width:126px; margin-top:57px; font-size:14px; border:1px solid gray; background-color:white; font-weight:900; color: gray;
        }
        .buttonStyle3{
            background-color:gray;
            color:white;
        }

        /* content 스타일 끝*/

         /*footer 스타일 시작*/
         #footer{
            box-sizing: border-box;
            border-top: solid 1px lightgray;
            background-color: rgb(231, 231, 231);

            height: 250px;
            left: 0;
            right: 0;
        }
        .footer_address{
            margin: 0 auto;
            width: 1200px;
            font-size: 11px;
            color: grey;
            padding-top: 20px;
            margin-left: 25%;
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
            font-size: 20px;
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
            margin-top:-12px;
        }
        .serBtn:hover {
            background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
            background-color:#f6f6f6;
        }
        .serBtn:active {
            position:relative;
            top:1px;
        }
        .footerMargin{
            margin-top:14px;
            font-size:large;
            line-height: 152%;
        }
        /*footer 스타일 끝*/

    </style>
</head>
<body>
    <!-- header -->
    <div id="header">
        <div id="header_wrap">
            <div id="header_1">
                <a href=""><img id="home-logo" src="img/mainbar/투명배경.png" width="250px" height="40px" style="padding:10px"></a>
            </div>
            <div id="header_2">
                <ul id="navi" style="padding-left: 30px; margin-top: 10px">
                    <li>
                        <input class="list search" type="text" placeholder="여행이나 체험을 검색해보세요" style="width: 300px; height: 19px; ">
                        <div class="list searchBtn">
                            <a href=""><img id="searchbtn" src="img/mainbar/검색버튼.JPG" width="37px" height="37px"></a>
                        </div>
                    </li>
                </ul>
            </div>    
            <div id="header_3">
                <ul id="navi" style="padding-left: 0px; margin-top: 12px;">
                    <li style=" margin-top: 3px;">
                        <a class="list qBtn" href="" style="font-size: 15px;">1:1채팅상담</a>
                    </li>
                    <li>
                        <a href="#" class="list loginBtn">로그인</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- content -->
    <div id="content">
        <div style="width:100%; height:140px;" class="alignCenter backgroundGray">
            <h1 style="font-weight:4000; font-size:2.5em;  padding-top:40px;">예약결제</h1>
        </div>
        
        <div style="width:100%;">
            <div style="width:70%;">
                <div style="width:100%; margin-bottom:80px; margin-top:60px;">
                    <h2>예약상품 확인</h2><br><br> 

                    <h2 style="font-weight:500;">숙소 정보</h2><hr style="border:2px solid lightgray; margin:15px 0 18px 0;"> 
                    <div style="width:34%; height:180px;">
                        <img src="../img/street.jpg" width="100%;" height="100%;"/>
                    </div>
                    <div style="width:20%; height:180px; padding:10px 0 0 16px;">
                        <h3 style="margin-bottom:10px;">숙소명</h3>
                        <h3 style="margin-bottom:10px;">예약일자</h3>
                        <h3 style="margin-bottom:10px;">예약인원</h3>
                        <h3 style="margin-bottom:10px;">가격</h3>
                        <h3 style="margin-bottom:10px;">총 금액</h3>
                    </div>
                    <div style="width:46%; height:180px; padding:10px 0 0 16px; ">
                        <p3 style="margin-bottom:12px; font-size:17px; display:block; color:dimgray; font-weight:900;">유럽갬성 강남역세권 게스트하우스</p3>
                        <p3 style="margin-bottom:12px; font-size:17px; display:block; color: dimgray; font-weight:550;">2020.03.06 ~ 2020.03.07</p3>
                        <p3 style="margin-bottom:12px; font-size:17px; display:block; color: dimgray; font-weight:550;">2명</p3>
                        <p3 style="margin-bottom:12px; font-size:17px; display:block; color: dimgray; font-weight:550;">30,000원</p3>
                        <p3 style="margin-bottom:12px; font-size:17px; display:block; color: dimgray; font-weight:550;">60,000원</p3>
                    </div>

                </div>
                <div style="width:100%; margin-bottom:80px;">

                    <h2 style="font-weight:500;">포인트 사용</h2><hr style="border:2px solid lightgray; margin:15px 0 18px 0;"> 
                    <div style="width:34%; height:126px; padding-left:10px;">
                        <h3 style="margin-bottom:34px;">보유포인트</h3>
                        <h3 style="margin-bottom:34px; padding-top:6px;">사용할 포인트</h3>
                    </div>
                    <div style="width:42%; height:126px;">
                        <h3 style="margin-bottom:34px; color: dimgray; font-weight:550;">1,000원</h3>
                        <input type="text" id="myPoint" size="36px;" style="height:42px; border-radius:5px; border:1px solid gray; padding-left:8px; font-size:14px; font-weight:bold;" placeholder="보유 포인트 : 500점"/>
                        <input type="hidden" id="myPointHidden" val="500" />
                    </div>
                    <div style="width:24%; height:126px;">
                        <button type="button" id="pointButton" class="pointButton" style="border-radius:4px;">포인트 사용</button>
                    </div>
                    
                </div>

                <div style="width:100%; margin-bottom:80px;">

                    <h2 style="font-weight:500;">예약자 정보</h2><hr style="border:2px solid lightgray; margin:15px 0 18px 0;"> 
                    <div style="width:34%; padding-left:10px;">
                        <h3 style="margin-bottom:34px; padding-top:28px;">이름</h3>
                        <h3 style="margin-bottom:34px; padding-top:14px;">연락처</h3>
                        <h3 style="margin-bottom:34px; padding-top:14px;">이메일</h3>
                    </div>
                    <div style="width:66%; height:235px;">
                        <input type="text" size="36px;" style="height:42px; border-radius:5px; border:1px solid gray; margin:20px 0 14px 0; padding-left:8px; font-size:16px;" placeholder="홍길동"/>
                        <input type="text" size="36px;" style="height:42px; border-radius:5px; border:1px solid gray; margin:14px 0; padding-left:8px; font-size:16px;" placeholder="010-0000-8282"/>
                        <input type="text" size="36px;" style="height:42px; border-radius:5px; border:1px solid gray; margin:14px 0; padding-left:8px; font-size:16px;" placeholder="happy@gmail.com""/>
                    </div>
                    
                </div>
            </div>

            <div id="receipt" style="width:310px; margin: 110px 0 0 30px; position:absolute; left:1200px; top:200px;">
                <hr>
                <div style="width:100%; height:70px; padding:22px 14px;">
                    <h3 style="margin-bottom:10px;">최종 결제 금액</h3>
                </div>
                <hr>
                <div style="width:50%;padding:22px 14px;">
                    <h3 style="margin-bottom:10px;">가격</h3>
                    <h3 style="margin-bottom:10px;">총 금액</h3>
                    <h3>포인트 할인</h3>
                </div>
                <div style="width:50%;padding:22px 14px; text-align:right;">
                    <h3 style="margin-bottom:10px; font-weight:550; color:dimgray;">30,000원</h3>
                    <h3 style="margin-bottom:10px; font-weight:550; color:dimgray;">60,000원</h3>
                    <h3 style="color:dimgray; font-weight:550;">-1,000원</h3>
                </div>
                <hr>
                <div style="width:50%; height:70px; padding:22px 14px;">
                    <h3 style="margin-bottom:10px;">총 결제 금액</h3>
                </div>
                <div style="width:50%; height:70px; padding:22px 14px; text-align:right;">
                    <h3 style="color:dimgray; font-weight:550;">59,000원</h3>
                </div>
                <hr>
                <div style="width:100%; padding:22px 14px 0px 14px;">
                    <p style="color:dimgray; font-weight:550;">
                        위 상품의 판매조건을 명확히 확인<br>
                        하였으며, 구매 진행에 동의 합니다.<br>
                        (전자상거래법 제8조 2항)<br>
                    </p>
                    <input type="checkbox" name="clause" style="float:left; zoom:2.0; margin:10px 5px 10px 5px;"/><p style="float:left; margin:22px 5px;">동의합니다.</p>
                </div>
                <hr>
                <div style="width:100%; height:120px; padding:22px 14px; text-align:center;">
                    <input type="button" style="height:58px; width:180px; font-size:18px; font-weight:900; border:1px solid gray; background-color:white; color:gray; margin:10px auto;"  value="결제하기"/>
                </div>
                <hr>
            </div>

            <br style="clear:both;">
        </div>
    </div>

    <!-- '포인트 사용' 클릭 시 -->
    <script>
        $("#pointButton").click(function(){

            var myPoint = $('#myPointHidden').val();

            if(myPoint <= 500){
                alert('포인트는 3000점 이상부터 사용가능합니다.'); return;
            }

            if($('#pointButton').text() == '포인트 사용'){
                $('#pointButton').toggleClass('buttonStyle3');
                $('#pointButton').text('사용 취소');
                $('#myPoint').attr('placeholder', '500원');

            }else if($('#pointButton').text('사용 취소')){
                $('#pointButton').toggleClass('buttonStyle3');
                $('#pointButton').text('포인트 사용');
            }

        });

        $(window).scroll(function(){
        var position = $(document).scrollTop();

        console.log(position);
        $("#receipt").css({ width:'310px',
                            margin:'314px 0 0 20px;'
                                    });

        if($(document).scrollTop() != 0){
            $("#receipt").stop().animate({top:position+30+"px"}, 1); //해당 오브젝트 위치값 재설정

        }else{
            $("#receipt").stop().animate({top:position+204+"px"}, 1); //해당 오브젝트 위치값 재설정
            $("#receipt").css({ width:'310px',
                            margin:'0 0 0 20px;'
                                    });
        }
    });

    </script>


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