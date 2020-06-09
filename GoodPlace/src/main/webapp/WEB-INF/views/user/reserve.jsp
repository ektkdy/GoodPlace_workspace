<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../main_css/jquery.bxslider.css">
    <!-- 슬라이더 버튼들 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <!-- 슬라이더를 생성하는 부분 -->
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/jquery.bxslider.js"></script>
    <style>
        /* header(메뉴바) 시작 */
        html{ height:100%}
        body{
            margin:0px;  height:100%
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

         /* content 시작*/
         #content{
            clear: both;
            width: 1200px;
            height: 100%;
            margin: 0 auto;
        }
        #content div{
            box-sizing:border-box;
        }
        #content a{
            text-decoration: none;
        }
        /*메인 검색바(숙소, 체험)*/
        #mainSearch{
            clear: both;
            height: 100px;
            width: 1200px;
            float: left;
            left: 0;
            right: 0;
        }
        /*숙소,체험 버튼*/
        #mainSearch .chgBtn{
            height: 30px;
            margin-left: 150px;
        }
        #mainSearch .chgBtn>a{
            cursor:pointer;
        }


        /*검색텍스트박스 (위치, 날짜, 인원수)*/
        #mainSearch .input{
            text-align: center;
            height: 60px;
        }

        #mainSearch .input .liBox{
            border: solid 1px lightgray;
            height: 58px;
            width: 268px; 
        }

        #mainSearch .input>li{
            display: inline-block;
            position: relative;
            list-style-type: none;
            margin:auto;
            text-align: left;
        }
        /*인풋 태그*/
        #mainSearch .input>li>input{
            width: 100%;
            height: 35px;
            box-sizing: border-box;
            border:0px;
            padding: 7px 15px;
        }
        #mainSearch .input>li>b{
            margin-left: 15px;
            font-size: 12px;
        }
        /*submit버튼 검색*/
        #mainSearch .input>li>#sub{
            width: 120px;
            height: 50px;
            background-color: #63b8ee;
            color: #fff;
            font-family:Arial;
            font-size:15px;
            font-weight:bold;
        }
        #mainSearch .input>li>#sub:hover{
            background-color: #2aa3f3;
        }

        /*이벤트 슬라이더*/
        .bxslider img{
            height: auto;
            max-height: 475px;
            margin: auto;
        }
        /*슬라이더 크기*/
        #eventSlider{
            min-width:840px; 
            width: auto; 
            max-width: 840px; 
            margin: 0 auto;
            clear: both;
        }
        .bx-wrapper{
            margin-bottom: 50px;
        }

        /*파워등록숙소,인기숙소*/
        #roomList{
            width:80%;
            float:left;
        }
        #roomList .menu>a{
            cursor: pointer;
        }
        #roomList .rooms{
            list-style-type: none;
        }
        #roomList .power{
            margin: 0 0 5% 0;
            text-align: center;
        }
        #roomList .power>li{
            display: inline-block;
            text-align: center;
        }
        #roomList img{
            width:240px; 
            height:200px;
            margin-right:15px
        }
        .halfWidth{
            width:50%;
            float:left;
        }
        #filterArea{
            width:90%;
            height:100%;
            margin:200px auto;
            float:left;
        }
        .filterCheckBox{
            width:20px;
            height:20px;
            float:left;
        }
        #filterArea label{
            display: block;
            float: left;
            margin-left:5px;
            margin-top: 2px;
        }
        .hide{
            display:none;
        }
        .display{
            display: block;
        }
        /* 페이징바 시작 */ 
        .pagingBar{
            width:100%;
            margin:30px auto; 
            height: 60px; 

            text-align:center;
            float:left;
        }
        .pagingBar button{
            width:40px;
            height:40px;
            color:gray;
            border-radius: 5px;
            background-color: fff;
            border:1px solid #dcdcdc;
        }
        /* 페이징바 끝 */
        a {
            margin: 0 0 20px;
            line-height:1.5;;
        }
        #content{
            clear: both;
            width: 1200px;
            margin: 0 auto;
            height: auto;
        }

        section {
            display:none;
            padding: 20px 0 0;
            border-top: 1px solid #ddd;
        }
        .tab_st{
            float:left;
            margin-left: 75px;
            width:1030px; 
            height:65px;
            background: #fff;
            box-shadow: -1px 0px 10px #e8e8e8;
            border-radius: 30px;
            }
        
        .tab_st input {
            display:none;
        }

        .tab_st button {
            height:45px;
            margin:10px 5px;
            float: left;
            width:160px;
            border-radius:25px;
            font-weight: 600;
            text-align:center;
            color:#333;
            background:#fff ;
            font-size: 15px;
            font-weight: 500;
            border: none;
        }
        .tab_st button:hover {
            cursor: pointer;
            background: #4f4ce7;
            color:#fff;
            font-weight:600;
        }

        .tab_st .button_on{
            background: #4f4ce7;
            color:#fff;
            font-weight:600;
        }
        /* content 끝*/

        /*footer 시작*/
        #footer{
            box-sizing: border-box;
            border-top: solid 1px lightgray;
            background-color: rgb(231, 231, 231);
            width:100%;
            height: 250px;
            float:left;     
        }
        .footer_address{
            margin: 0 auto;
            width: 100%;
            font-size: 11px;
            color: grey;
            padding-top: 20px;
            padding-left:300px
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
</head>
<body>
	 <!-- header -->
    <div id="header">
        <div id="header_wrap">
            <div id="header_1">
                <a href=""><img id="home-logo" src="images//common/투명배경.png" width="250px" height="40px" style="padding:10px"></a>
            </div>
            <div id="header_2">
                <ul id="navi" style="padding-left: 30px; margin-top: 10px">
                    <li>
                        <input class="list search" type="text" placeholder="여행이나 체험을 검색해보세요" style="width: 300px; height: 19px; ">
                        <div class="list searchBtn">
                            <a href=""><img id="searchbtn" src="images//common/검색버튼.JPG" width="37px" height="37px"></a>
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
    <div id="content" class="main" style="text-align: center;">
       
        <div style=" width:1000px; margin-left: 100px;">
            <div class="tab_st" >
                <button >위시리스트</button>
                <button class="button_on" style="margin-left: 10px;">예약내역</button>
                <button>나의체험</button>
                <button>포인트</button>
                <button>1:1문의</button>
                <button>메세지</button>
            </div>
            <select name="status" style="float: right; width:200px;">
                <option>진행중인 예약</option>
                <option>승인대기 예약</option>
            </select>
        </div>
        <hr width="1000px">
        <div style="margin: 20px auto; text-align: center; width: 1000px; height: 1000px;">
            <div style="margin: 0 30px; height: 200px;">            
                <dvi style="float: left; width: 30%; height: 200px; background-color: gray;">
                    <img src="img/mainbar/굿플레이스로고02.jpg" width="100%" height="100%" style="padding: 10px; box-sizing: border-box;">
                </dvi>
                
                <div style="border: 1px solid lightgray; width: 70%; height: 200px; text-align: left; float: left; padding: 30px 30px; box-sizing: border-box;">
                    <div style="box-sizing: border-box; height: 20%; font-size: 20px; font-weight: 700;">
                        제목
                    </div>
                    <div style="box-sizing: border-box; height: 60%; font-size: 16px;">
                        소제목소제목소제목소제목소제목소제목소제목소제목소제목소제목 
                    </div>
                    <div style="box-sizing: border-box; height: 20%; font-size: 15px;">
                        2020.04.15~2020.04.15
                    </div>
                </div>
            </div>
            <hr style="clear: both; margin: 20px 0;">
            
            <div style="margin: 0 30px; height: 200px;">            
                <dvi style="float: left; width: 30%; height: 200px; background-color: gray;">
                    <img src="img/mainbar/굿플레이스로고02.jpg" width="100%" height="100%" style="padding: 10px; box-sizing: border-box;">
                </dvi>
                
                <div style="border: 1px solid lightgray; width: 70%; height: 200px; text-align: left; float: left; padding: 30px 30px; box-sizing: border-box;">
                    <div style="box-sizing: border-box; height: 20%; font-size: 20px; font-weight: 700;">
                        제목
                    </div>
                    <div style="box-sizing: border-box; height: 60%; font-size: 16px;">
                        소제목소제목소제목소제목소제목소제목소제목소제목소제목소제목 
                    </div>
                    <div style="box-sizing: border-box; height: 20%; font-size: 15px;">
                        2020.04.15~2020.04.15
                    </div>
                </div>
            </div>
            <hr style="clear: both; margin: 20px 0;">
            
            <div style="margin: 0 30px; height: 200px;">            
                <dvi style="float: left; width: 30%; height: 200px; background-color: gray;">
                    <img src="img/mainbar/굿플레이스로고02.jpg" width="100%" height="100%" style="padding: 10px; box-sizing: border-box;">
                </dvi>
                
                <div style="border: 1px solid lightgray; width: 70%; height: 200px; text-align: left; float: left; padding: 30px 30px; box-sizing: border-box;">
                    <div style="box-sizing: border-box; height: 20%; font-size: 20px; font-weight: 700;">
                        제목
                    </div>
                    <div style="box-sizing: border-box; height: 60%; font-size: 16px;">
                        소제목소제목소제목소제목소제목소제목소제목소제목소제목소제목 
                    </div>
                    <div style="box-sizing: border-box; height: 20%; font-size: 15px;">
                        2020.04.15~2020.04.15
                    </div>
                </div>
            </div>
            <hr style="clear: both; margin: 20px 0;">
            
            <div style="margin: 0 30px; height: 200px;">            
                <dvi style="float: left; width: 30%; height: 200px; background-color: gray;">
                    <img src="img/mainbar/굿플레이스로고02.jpg" width="100%" height="100%" style="padding: 10px; box-sizing: border-box;">
                </dvi>
                
                <div style="border: 1px solid lightgray; width: 70%; height: 200px; text-align: left; float: left; padding: 30px 30px; box-sizing: border-box;">
                    <div style="box-sizing: border-box; height: 20%; font-size: 20px; font-weight: 700;">
                        제목
                    </div>
                    <div style="box-sizing: border-box; height: 60%; font-size: 16px;">
                       소제목소제목소제목소제목소제목소제목소제목소제목소제목소제목 
                    </div>
                    <div style="box-sizing: border-box; height: 20%; font-size: 15px;">
                        2020.04.15~2020.04.15
                    </div>
                </div>
            </div>
            <hr style="clear: both; margin: 20px 0;">
            
            <div style="margin: 0 30px; height: 200px;">            
                <dvi style="float: left; width: 30%; height: 200px; background-color: gray;">
                    <img src="img/mainbar/굿플레이스로고02.jpg" width="100%" height="100%" style="padding: 10px; box-sizing: border-box;">
                </dvi>
                
                <div style="border: 1px solid lightgray; width: 70%; height: 200px; text-align: left; float: left; padding: 30px 30px; box-sizing: border-box;">
                    <div style="box-sizing: border-box; height: 20%; font-size: 20px; font-weight: 700;">
                        제목
                    </div>
                    <div style="box-sizing: border-box; height: 60%; font-size: 16px;">
                        소제목소제목소제목소제목소제목소제목소제목소제목소제목소제목 
                    </div>
                    <div style="box-sizing: border-box; height: 20%; font-size: 15px;">
                        2020.04.15~2020.04.15
                    </div>
                </div>
            </div>
            <hr style="clear: both; margin: 20px 0;">
            
        </div>
        
        
        <hr width="1000px;">
    </div>
      <!-- 페이징 바 -->
      <div class="pagingBar">
        <button>&lt;</button>
        <button style="background-color:rgb(24, 76, 136); color:white;">n</button>&nbsp;
        <button>n</button>&nbsp;
        <button>n</button>&nbsp;
        <button>n</button>&nbsp;
        <button>n</button>&nbsp;
        <button>&gt;</button>
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