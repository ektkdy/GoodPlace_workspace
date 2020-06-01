<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>취소 및 환불 정책</title>
</head>
<style>
    /* 여백 초기화 */
    body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form {margin: 0; padding: 0;}
    /* header(메뉴바) 시작 */
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
    /* header 끝*/

    /*해당 페이지만 특별히 추가하는 부분 */ html, body { height:100%;}
    
    /* content 스타일 시작 */
    /* 여백 초기화 */
    body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form {margin: 0; padding: 0;}
    #content{
            clear: both;
            width: 1200px;
            margin: 0 auto;
            height: auto;
    }
    #content div{
        box-sizing:border-box;
        float:left;
    }
    .contentInner{
        margin: 40px 30px;
        width:1140px;
    }
    .contentInner ul{
        list-style:none;
    }
    .contentInner li{
        margin: 0 0 20px 0;
    }
    .bold{
        font-weight: bolder;
    }
    /* font */
    *{
        font-family: 'Noto Sans KR', sans-serif;
    }

    /* content 스타일 끝 */
    
    /*footer 시작*/
    #footer{
            box-sizing: border-box;
            border-top: solid 1px lightgray;
            background-color: rgb(231, 231, 231);
            width:100%;
            height: 250px;
            left: 0;
            right: 0;
            float:left;     
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
            padding-top: 10px;
            height: 20px;
        }
        .footer_menu{
            width: 210px;
            display: table-cell;
            text-align: center;
	        vertical-align: middle;
        }
        .footer_menu a {
            text-decoration: none;
            color: rgb(75, 75, 75);
            font-size: 14px;
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
            font-size:14px;
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
            top:1px;
        }
        /*footer 끝*/

</style>
<body>
    <!-- header -->
    <div id="header">
        <div id="header_wrap">
            <div id="header_1">
                <a href=""><img id="home-logo" src="../images/common/투명배경.png" width="250px" height="40px" style="padding:10px"></a>
            </div>
            <div id="header_2">
                <ul id="navi" style="padding-left: 30px; margin-top: 10px">
                    <li>
                        <input class="list search" type="text" placeholder="여행이나 체험을 검색해보세요" style="width: 300px; height: 19px; ">
                        <div class="list searchBtn">
                            <a href=""><img id="searchbtn" src="../images/common/검색버튼.JPG" width="37px" height="37px"></a>
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
        <div class="contentInner">
            <div style="width:15%;height:100%; float:left; text-align: left;">
                <ul style="margin-left:unset;">
                    <li>이용약관</li>
                    <li>개인정보 처리방침</li>
                    <li class="bold">취소 및 환불 정책</li>
                </ul>
            </div>
            <div style="float:left; width: 85%;">
                <h2>취소 및 환불 정책</h2>
                <br><hr>
                <br><br>
                <p>
                    - 취소요청 접수기준은 당사의 운영시간 내 ‘환불요청서’가 접수된 시간 또는 마이리얼트립 플랫폼 내의 ‘1:1 문의하기’에 기록된 시간<br>혹은 ‘취소요청’이 접수된 시간을 기준으로 합니다.<br>
                    - 예약 확정 후 파트너가 일정을 변경하여 드릴 수 없어서 발생하는 예약 취소에 관하여는 본 취소환불 정책에 따른 수수료가 부과됩니다.<br>
                    - 여행 일정 변경과 관련한 사항은 파트너에게 직접 문의하여야 합니다. 변경요청하시는 내용에 따라서 요금이 추가되거나 일정 변경이 불가할 수 있습니다.<br>
                    - 여행자가 여행 확정 후 24시간 이내에 예약 취소를 요청하더라도, 여행일이 24시간 이내인 경우 전액환불 대상에서 제외됩니다.<br>
                    - 각 상품의 설명 내용에서 취소환불 정책이 별도 규정 있을 경우, 각 상품의 별도 기재 내용이 본 취소환불 정책보다 우선 적용됩니다.<br>
                </p>
                <br>
                <h3>가이드투어 취소/환불 안내</h3><br>
                <p>
                    파트너약관 제16조 제2항과 같이 여행요금 지급이 이루어진 후 투어 개시일 이전에 여행계약을 임의로<br> 해제되는 경우, 해제 통보 시점에 관한 다음 각 호의 기준에 따라 여행요금이 환불됩니다.
                </p>
                <br>
                <h5>[국외여행의 경우]</h5><br>
                <p>
                    - 여행시작 30일전까지 (~30) 통보시: 여행 요금 전액 환불<br>
                    - 여행시작 20일 전까지 (29~20) 통보시: 여행요금에서 가이드 요금의 10%와 마이리얼트립 수수료 공제 후 환불<br>
                    - 여행시작 6일 전까지 (19~6) 통보시: 여행요금에서 가이드 요금의 15%와 마이리얼트립 수수료 공제 후 환불<br>
                    - 여행시작 1 일 전까지 (1~5) 통보시: 여행요금에서 가이드 요금의 20%와 마이리얼트립 수수료 공제 후 환불<br>
                    - 여행시작 시간 기준 24시간 이내 통보시: 여행요금에서 가이드 요금의 50%와 마이리얼트립 수수료 공제 후 환불<br>
                </p>
                <br>
                <h5>[국내여행의 경우]</h5><br>
                <p>
                    - 여행자가 여행 개시일로부터 3일 이전 통보 시: 여행 요금 전액 환불<br>
                    - 여행 개시일로부터 2일 이전 통보 시: 여행요금에서 가이드 요금의 10%와 마이리얼트립 수수료 공제 후 환불<br>
                    - 여행 개시일로부터 여행 시작 시간 기준 24시간 이전 통보 시: 여행요금에서 가이드 요금의 20%와 마이리얼트립 수수료 공제 후 환불<br>
                    - 여행 시작 시간으로부터 24시간 이내 통보 시: 여행요금에서 가이드 요금의 30%와 마이리얼트립 수수료 공제 후 환불<br>
                    <br><br>
                    다만, 위의 규정에도 불구하고 다음의 경우에는 예외로 합니다.<br>
                    1) 여행자가 여행요금을 결제(지급)한 때로부터 24시간 이내에 여행계약을 철회(취소)하는 경우와 여행자가 투어 예약 후 가이드가 확정되기 전에 취소하는 경우는 여행요금을 전액 환불합니다.  <br>단, 여행자가 여행요금을 결제하였다고 하더라도 해당 시점으로부터 24시간 이내 여행이 시작될 경우 (Instant Booking 예약에 해당하는 경우)는 전액 환불 대상에서 제외합니다.<br>
                    2) 상품의 특성에 따라 현지 예약금으로 지불되어야 하는 금액이 있는 경우 해당 예약금의 환불에 대하여는 각 상품의 상세설명보기에서 별도로 고지한 취소환불 약관을 적용합니다.
                </p>
                <br>
                <h3>티켓 취소/환불 안내</h3><br>
                <p>
                    아래 내용이 적용되는 대상은 마이리얼트립의 플랫폼(웹사이트와 어플리케이션 포함)을 통하여 당사가 판매대행 또는 구매 대행하여 여행자에게 배송하는 실물티켓과 여행자로 하여금 출력할 수 있도록 제공한 E-바우처에 한합니다.
                <br>
                <h5>[실물티켓]</h5><br>
                <p>
                    1. 환불신청가능기간
                    결제일 이후 7일 이내 환불 신청한 경우에 한하여 환불이 가능합니다.<br>
                    (티켓 유효기간의 1개월 이전에 환불을 신청한 경우에 한하여 환불이 가능합니다.)<br>
                    2. 환불진행시 유의사항<br>
                    여행자가 반품한 실물티켓을 당사가 수령하여 확인한 후 환불 처리됩니다.<br>
                    실물티켓 구매 시 동봉되었던 티켓 사용 가이드북, 현지 사용 쿠폰 및 사은품도 함께 반품되어야 정상 환불 처리됩니다.<br>
                    환불요청 접수 후 5일 이내에 당사에 실물티켓이 수령 확인되는 경우에 한해 정상 환불 처리됩니다.<br>
                    개인 과실로 인하여 실물티켓이 멸실되거나 훼손된 경우에는 환불이 불가하오니, 각별히 유의하여 주시기 바랍니다.<br>
                    3. 환불수수료<br>
                    취소수수료(결제금액의 10%) 및 배송비가 환불수수료로 차감됩니다.<br>
                    티켓제공업체에서 자체 규정하는 별도의 환불규정이 있는 경우 제공업체의 환불규정이 당사의 환불규정에 우선하여 적용됩니다. (상품상세페이지 기재)<br>
                </p>
                <br>
                <h5>[E-바우쳐]</h5><br>
                <p>
                    티켓제공업체에서 자체 규정하는 별도의 환불규정에 따라 취소/환불이 진행됩니다. (상품상세페이지 기재)<br>
                    티켓제공업체의 정책에 따라 환불이 원칙적으로 불가할 수 있으니, 신중히 구매하여 주시기를 당부 드립니다.<br>
                </p>
                <br>
            </div>


        </div>
    </div>

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
            <p>
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