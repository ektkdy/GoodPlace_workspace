<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소검색</title>
    <link rel="stylesheet" href="../main_css/jquery.bxslider.css">
    <!-- 슬라이더 버튼들 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <!-- 슬라이더를 생성하는 부분 -->
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/jquery.bxslider.js"></script>
    <style>
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

        /* content 시작*/
        #content{
            clear: both;
            width: 1200px;
            height: auto;
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
            text-align: left;
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
            width:88px;
            height:28px;
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
            background-color: ghostwhite;
            border:1px solid #dcdcdc;
        }
        /* 페이징바 끝 */
        /* content 끝*/

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
</head>
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
    <br>
    <div id="content">
        <div id="mainSearch">
            <div class="search chgBtn">
                <a style="color:#63b8ee; cursor: inherit;" onclick="searchView1();">숙소</a> | 
                <a onclick="searchView2();">체험</a>
            </div>

            <!-- 숙소검색 -->
            <form action="" post="get">
                <div class="search input" style="display: block;">
                    <li class="liBox">
                        <b>위치</b>
                        <input type="text" placeholder="어디로 여행가세요?" >
                    </li>
                    <li class="liBox">
                        <b>날짜</b>
                        <input type="date" placeholder="날짜를 입력하세요" >
                    </li>
                    <li class="liBox">
                        <b>인원수</b>
                        <input type="number" placeholder="인원수를 선택해주세요">
                    </li>
                    <li style="margin: auto; text-align: center;">
                        <input id="sub"type="submit" value="숙소검색">
                    </li>
                </div>
            </form>
            <!-- 체험검색 -->
            <form action="" post="get">
                <div class="experience input" style="display: none;">
                    <li class="liBox">
                        <b>태그</b>
                        <input type="text" placeholder="체험 목록을 선택하세요" >
                    </li>
                    <li class="liBox">
                        <b>날짜</b>
                        <input type="date" placeholder="날짜를 입력하세요" >
                    </li>
                    <li class="liBox">
                        <b>키워드</b>
                        <input type="number" placeholder="키워드를 입력하세요">
                    </li>
                    <li style="margin: auto; text-align: center;">
                        <input id="sub"type="submit" value="체험검색">
                    </li>
                </div>
            </form>
        </div>
        <div style="width:20%; height:auto; float:left;">
            <div id="filterArea">
                <div id="filterAreaInner" style="position:absolute; top:300px; width:220px; float:left;">   
                    <div style="width:220px; height:70%; float:left">
                        <div style="width:50%; height:54px; float:left;"><h3>필터</h3></div>
                        <div style="width:50%; height:54px; float:left; vertical-align:sub; text-align:right;"><h4 style="color:darkgray;" onclick="filterReset();">필터초기화</h4></div>
                        <hr style="height:0.2px; border-color:lightgray; background-color:lightgray;">
                        <div>
                            <table>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터1</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터2</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터3</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터4</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터5</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터6</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터7</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터8</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터9</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터10</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터11</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터12</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터13</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터14</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터15</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터16</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터17</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터18</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터19</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터20</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터21</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터22</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터23</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>필터24</label></td>
                                </tr>
                            </table>
                            <div style="width:100%" id="openFilter">   
                                <h4 style="color:darkslategray; margin-left:2%;" onclick="openFilter()" >필터펼치기</h4>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <script>
            $(window).scroll(function(){
                var position = $(document).scrollTop();
                $("#filterAreaInner").css({ width:'220px', 
                                            margin:'200px auto'
                                            });
                if($(document).scrollTop() != 0){
                    $("#filterAreaInner").stop().animate({top:position-100+"px"}, 1); //해당 오브젝트 위치값 재설정
                }else{
                    $("#filterAreaInner").stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
                }
            });
        </script>
        <script>
            function openFilter(){
                if($('#openFilter h4').text() == "필터펼치기"){
                    $('#filterArea tr').toggleClass("display");
                    $('#openFilter h4').text("필터접기")
                }else if($('#openFilter h4').text() == "필터접기"){
                    $('#filterArea tr').toggleClass("display");
                    $('#openFilter h4').text("필터펼치기")
                }
            }
            function filterReset(){
                $(".filterCheckBox[type=checkbox]").prop("checked", false);
            }
        </script>
        <!-- 인기등록 숙소-->
        <div id="roomList">
            <div style="padding-top:120px;"><h2>HOT 인기숙소</h2></div>
            <div class="rooms power">
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
            </div>
        </div>

        <!-- 검색된 숙소-->
        <div id="roomList" style="margin-left:20%;">
            <div style="margin:50px 0 20px 0; height:30px; width:100%;">
                <div class="halfWidth" style="height:30px;"><h3 style="margin:0px;">검색된 숙소 (n개)</h3></div>
                <div class="halfWidth" style="height:30px; width:40%; text-align: right;"><a href="#">리뷰 많은 순</a> | <a href="#">가격 낮은 순</a> | <a href="#">가격 높은 순</a></div>
            </div>
            <div class="rooms power bottomArea">
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
            </div>
            <div class="rooms power bottomArea">
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="../images/main/굿플레이스로고02.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
            </div>
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
    <!-- /content -->

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