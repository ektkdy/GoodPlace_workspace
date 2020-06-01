<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ 상세 > 공지사항</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="../main_css/jquery.bxslider.css">
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/jquery.bxslider.js"></script>
    <style>
        /* 여백 초기화 */
            body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form {margin: 0; padding: 0;}
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
        /* body{
            width:100%;
        } */
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
        #listArea p{
        	padding:5px;
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
        #content .list li{
            list-style:none;
            margin: 10px 0;
        }
        #content #listArea .hide{
            display:none;
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
                <h1 style="font-weight:4000; font-size:2.5em;  padding-top:40px;">자주묻는 질문 FAQ</h1>
            </div>
           
            <div style="width:100%; margin-top:60px;">
                
                <div style="width:1000px; margin:0 100px; ">
                   <div style="width:100%; height: 60px; ">
                        <div style="width:50%; height:100%; "><h2 style="margin:2%;">공지사항</h2></div>
                        <div style="width:50%; height:100%; text-align: right; "> <button class="buttonStyle1" style="width:90px; height:30px; font-size: 80%; margin: 12px 5px;">목록으로</button></div>
                    </div>
                    <hr>
                    <div style="width:100%;" class="list">
                        <ul id="listArea">
                            <li><h4>계정 탈퇴는 어떻게 하나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>로그인 이메일 주소를 변경하고 싶어요.</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>비밀번호/계정을 잊어버렸는데 초기화 할수 있나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>회원가입은 어떻게 하나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>로그인 이메일 주소를 변경하고 싶어요.</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>계정 탈퇴는 어떻게 하나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>비밀번호/계정을 잊어버렸는데 초기화 할수 있나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>회원가입은 어떻게 하나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                        </ul>
                    </div>
                </div>
                <br style="clear:both;">
            </div>
            <div style="width:100%; height:120px; color:gray; margin:60px auto;" class="biotoreGroup">
                <div style="width:100%; height:40px; text-align: center;">
                    <h3>찾는 내용이 없으신가요?</h3>
                </div>
                <div style="width:100%; height:80px; text-align: center;">
                    <button class="buttonStyle1">1:1문의 하러 가기</button>
                </div>
            </div>
    </div>

    <script>
        // html dom 이 다 로딩된 후 실행된다.
        $(document).ready(function(){
            // "로그인 이메일 주소를 변경하고 싶어요." 같은 li를 클릭했을때
            $("#content #listArea li").click(function(){
                var submenu = $(this).next().next();
                var hideHr = $(this).next();
                // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
                if( submenu.is(":visible") ){
                    submenu.slideUp();
                    hideHr.toggleClass('hide');
                }else{
                    submenu.slideDown();
                    hideHr.toggleClass('hide');
                }
            });
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