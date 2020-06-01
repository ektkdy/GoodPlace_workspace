<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 처리방침</title>
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
                    <li class="bold">개인정보 처리방침</li>
                    <li>취소 및 환불 정책</li>
                </ul>
            </div>
            <div style="float:left; width: 85%;">
                <h2>개인정보 처리방침</h2>
                <br><hr>
                <h4>개인정보 취급에 대한 명칭 변경 및 구체화 수립</h4><br>
                <p>
                    주식회사 마이리얼트립 (이하 "당사")은 고객의 개인정보를 중요시하며, 개인정보의 보호와 관련하여 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」<br>및 「개인정보 보호법」 등 관련법 상의 개인정보 보호 규정을 준수하고 있으며, 당사는 고객(파트너 포함)이 당사의 개인정보 처리방침의 내용에 대하여 「동의」 버튼 또는 「취소」 버튼을 클릭할 수 있는 절차를 마련하여, 「동의」 버튼을 클릭하면 개인정보 수집 및 이용 등 아래 개인정보 처리방침에 대해 동의한 것으로 봅니다.<br>
                    고객은 「취소」 버튼을 클릭하여 당사의 개인정보 수집·이용을 거부할 수 있고, 이 경우 당사의 일부 서비스 사용이 제한됩니다.<br>
                    본 개인정보처리방침은 당사가 운영하는 웹사이트(https://www.myrealtrip.com/) 및 어플리케이션(Application, 이하 웹사이트와 어플리케이션을 통칭하여 "마이리얼트립 플랫폼")에서 제공하는 제반 서비스(이하 "서비스"라 합니다)에 적용되며, 다른 플랫폼에서 제공되는 서비스에 대해서는 별개의 개인정보처리방침이 적용될 수 있습니다. <br>
                    당사가 개인정보처리방침을 개정할 때에는 제15조에 따라 마이리얼트립 플랫폼의 공지사항(또는 개별공지)을 통하여 공지합니다.<br>
                    개인정보처리방침은 다음과 같은 의미를 가지고 있음을 고지하여 드립니다.<br>
                    ① 당사는 고객에게 당사가 수집하는 개인정보의 내역, 이용 방법, 제공 또는 위탁되는 정보, 파기 방법 등을 개인정보처리방침을 통해 알려드리고 있습니다.<br>
                    ② 고객은 개인정보자기결정권을 비롯한 자신의 개인정보에 대한 법률상 권리를 보유하고 있습니다. 그리고 본 개인정보처리방침은 고객의 개인정보에 대한 법률상 권리의 행사 방법을 안내합니다.<br>
                    ③ 본 개인정보처리방침은 개인정보 침해사고를 예방하고, 사고가 이미 발생하였을 때 피해를 복구하기 위한 방법을 안내합니다.<br>
                </p>
                <br>
                <h3>1. 개인정보의 수집 및 이용목적</h3><br>
                <p>
                    당사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
                    ① 여행 상품 판매 및 중개 서비스의 이행과 서비스 제공에 따른 요금정산 - 여행상품 예약, 컨텐츠 제공,<br> 구매 및 요금 결제, 물품배송 또는 청구지 등 발송,금융거래 본인 인증 및 금융서비스, 요금추심 등<br>
                    ② 고객관리 - 고객관리 및 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가,<br> 사용 방지, 가입/탈퇴 의사 확인, 연령확인, 만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 및 민원처리, 고지사항 전달 등<br>
                    ③ 파트너의 신원파악 - 파트너 본인확인, 개인식별, 불량 또는 부적법한 파트너에 대한 중개 서비스 제공 방지와 사용 방지 등<br>
                    ④ 기타 - 본인 의사 확인 등 원활한 의사소통 경로의 확보, 새로운 서비스/신상품이나 이벤트 정보 안내<br>
                </p>
                <br>
                <h3>2. 개인 정보 수집 항목</h3><br>
                <p>
                    당사가 서비스 제공을 위해 제공받는 수집한 최소한의 개인 정보 항목과 목적은 다음과 같습니다.<br>
                    ①	회원인식 및 예약 목적으로 수집하는 정보<br>
                    수집항목	수집목적	구분<br>
                    성명,이메일주소,패스워드	홈페이지 회원 가입 및 관리	필수<br>
                    만14세미만 법정대리인의 성명, 관계, 휴대폰번호, 가족관계 증빙서류<br>
                    연령대, 여행 목적, 신용카드사 정보, SNS연동 이메일 주소 , SNS연동 프로필 이미지	선택<br>
                    ②	예약 또는 서비스 제공<br>
                    수집항목	수집목적	구분<br>
                    성명, 주소, 휴대전화번호, 이메일주소	예약내역 확인 및 상담	필수<br>
                    입출국, 영문명, 여권정보	선택<br>
                    영문명, 생년월일, 여권정보(여권번호, 여권만료일)	항공권/호텔 예약	필수<br>
                    이메일정보, 휴대폰번호, 성별	선택<br>
                    사업자등록번호, 대표자명의 통장사본	파트너 신원 파악	필수<br>
                    라이센스번호, 보험서류	선택<br>
                    성명, 생년월일, 가상계좌, 카드정보(카드번호, 카드만료일), 환불시(은행명, 계좌정보, 예금주)	대금결제/환불/정산	필수<br>
                    수령자명, 수령자주소, 수령자연락처	예약 상품 상담/예약,물품배송	선택<br>
                    성명, 휴대전화번호, 이메일 주소	서비스홍보 및 마케팅 활용	선택<br>
                    ③	서비스 이용 또는 사업 처리 과정에서 생성/수집되는 정보<br>
                    구분	수집항목	수집목적<br>
                    서비스 이용 또는 사업 처리과정에서 생성/수집되는 정보	서비스 이용 기록(로그(Log), 쿠키(Cookie), IP주소, MAC주소, 서비스 이용 기록, 방문기록,<br>고유기기식별값, OS버전)	개인정보 침해 사고 대비 분쟁 조정을 위한 기록 보존, 혜택 및 서비스 개발을 위한 통계분석 및 연구조사<br>
                    ④ 스마트폰 앱 관리 : 스마트폰 앱을 통하여 마이리얼트립 서비스를 이용 시, 단말기 정보 등에 접근할 필요가 있는 경우에는 이를 고지하고 승인을 얻습니다.<br>다만, 승인을 해제하고자 하실 경우에는 스마트폰 상에서 '설정>애플리케이션관리자' 에서 변경이 가능합니다.<br>
                </p>
                <br>
                <h3>3. 개인정보의 이용 및 보유기간</h3><br>
                <p>
                    ① 고객님의 개인정보는 법령에 따른 개인정보 보유·이용기간 또는 당사가 고객으로부터 개인정보를 수집시에 동의받은<br>개인정보 보유·이용기간 내에서 처리 및 보유됩니다.<br> 단, 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정 기간 보유하여야 할 필요가 있을 경우 또는 관련법령의 규정에 의하여 일정기간 보유할 수 있습니다.<br>
                    - 회원 가입 및 관리 기록: 1년, 다만 채권/채무관계 잔존 시에는 해당 채권/채무관계 정산 시까지<br>
                    - 계약 또는 청약철회 등에 관한 기록: 5년, 다만 당사와 파트너와의 계약을 위해 파트너가 제공하는 신원정보는 파트너의 업무가 종료된 때로부터 5년까지<br>
                    - 대금결제 및 재화 등의 공급에 관한 기록: 5년<br>
                    - 소비자의 불만 또는 분쟁처리에 관한 기록: 3년<br>
                    - 표시/광고에 관한 기록: 6개월<br>
                    ② 당사는 회원가입시 지정한 유효기간 만료가 도래하기 30일 전까지, 당사의 보안지침에 따라 고객의 개인정보항목이<br> 파기되거나 보관이 필요 할 경우 관련 법령에 따라 안전하게 분리 저장, 관리되는 사실을 고지합니다.<br>
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