<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<style>
	body{
		margin:0px;
	}
	/* font */
	*{font-family: 'Noto Sans KR', sans-serif;}
	
	    /* header(메뉴바) */
	#header {
	    clear: both;
	    width: 100%;
	    background: linear-gradient(to left, #734ce7, #41a3ec );
	    top: 0;
	    z-index: 1000000;
	    height: 60px;
	    box-shadow: 0px 10px 10px 0px rgba(144, 144, 144, 0.1);
	    /*
	    position: fixed;
	    position: absolute;
	    */
	}
	#content{
	    clear: both;
	    width: 1200px;
	    height: auto;
	    margin: 0 auto;
	}
	#footer{
        clear: both;
        border-top: solid 1px lightgray;
        background-color: rgb(231, 231, 231);
        height: 250px;
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
	    margin: 0 10px;
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
	
	/*채팅박스*/
    #sidebox {
        background-color: white;
        position:absolute;
        width:280px;
        height: 520px;
        bottom:30px;
        right:30px;
        border-radius: 20px;
    }

    
    .chat_content{
        height: 310px;
        background-color:
        white; padding: 10px;
        overflow-y: auto;
    }

    /*채팅 관리자 회원 공통*/
    .chat_content .chat_common{
        height: 30px;
        clear: both;
    }
    .chat_content .chat_common>img{
        border-radius: 50px;
        background-color: darkblue;
    }
    .chat_content .chat_common>span{
        font-size: 20px;
        vertical-align:top;
        font-weight: 400;
        color: black;
    }
    .chat_content .chat{
        float: left;
        position: relative;
        min-width: calc(50%);
        max-width: calc(100% - 44px);
        word-break:break-all; padding:
        5px; border-radius: 10px;
        font-size: 15px;
        color: black;
    }
    .chat_content .chat_date{
        clear: both;
        margin: 0px 10px;
        color:grey;
        font-size: 12px;
    }

    /*채팅 관리자 css*/
    .chat_content .chat_admin{
        background-color: lightgrey;
    }

    /*채팅 회원(사용자)*/
    .chat_content .chat_userId>img, .chat_content .chat_userId>span, .chat_content .chat_user, .chat_content .chat_userDate{
        float: right;
    }
    .chat_content .chat_user{
        background-color: rgb(10, 0, 150);
        color: white;
    }

</style>
</head>
<body>
  <!-- header -->
    <div id="header">
        <div id="header_wrap">
            <div id="header_1">
                <a href="${pageContext.servletContext.contextPath}"><img id="home-logo" src="resources/images/user/menubarLogo.png" width="250px" height="40px" style="padding:10px"></a>
            </div>
            <div id="header_2">
                <ul id="navi" style="padding-left: 30px; margin-top: 10px">
                    <li>
                        <input class="list search" type="text" placeholder="여행이나 체험을 검색해보세요" style="width: 300px; height: 19px; ">
                        <div class="list searchBtn">
                            <a href=""><img id="searchbtn" src="resources/images/user/searchBtn.JPG" width="37px" height="37px"></a>
                        </div>
                    </li>
                </ul>
            </div>    
            <div id="header_3">
                <ul id="navi" style="padding-left: 0px; margin-top: 5px;">
                    <!-- 로그인 전 -->

                    <li style="margin-top: 10px;">
                        <a class="list qBtn" href="" style="font-size: 15px; margin-left: 50px;">1:1채팅상담</a>
                    </li>
                    <li style="margin-top: 10px;">
                        <a href="loginForm.me" class="list loginBtn" style="margin-left: 30px;">로그인</a>
                    </li>

                    <!-- 로그인 후 -->
<!--
                    <li style=" margin-top: 10px;">
                        <a class="list qBtn" href="" style="font-size: 15px;">파트너등록하기</a>
                        <a class="list qBtn" href="" style="font-size: 15px;">1:1채팅상담</a>
                    </li>
                    <li>
                        <div id="personalImg" style="margin-left: 10px;">
                            <img src="#" width="50px" height="50px" style="border-radius: 50px; background-color: darkblue;">
                        </div>
                    </li>
-->
                </ul>
            </div>
        </div>
    </div>
    <div id="sidebox" style="box-shadow: 5px 5px 10px black; z-index: 99999;"> 
        <!-- 채팅헤더 -->
        <div class="chat_header" style="width:240px; padding: 10px 20px; height: 80px; border-top-left-radius: 20px; border-top-right-radius: 20px; background-color:#184c88;">
            <div style="color: white;">
                <b style=" font-weight: 800; font-size: 24px;">GoodPlace</b>
                <span style="float: right; margin-top:10px">
                    <a href="#">
                        <img src="resources/images/user/clear-button.png" width="18px">
                    </a>
                </span>
                <div style="font-size: 14px; font-weight: 600; padding-top: 10px; padding-left: 10px;">
                    실시간 채팅 상담 시간<br>
                    평일 08:00 ~ 18:00
                </div>
            </div>
        </div>
        <!-- 채팅박스 -->
        <div class="chat_content" style="box-shadow: lightgray;">

            <!-- 유저1 -->
            <div>
                <!--아이디-->
                <div class="chat_common"> 
                    <img src="#" width="28px" height="28px"> <!-- 프로필사진 -->
                    <span>GoodPlace</span>
                </div>
                <!-- 채팅 내용 -->
                <div class="chat chat_admin">
                    안녕하세요! 여행 플랫폼 서비스! GoodPlace입니다!
                </div>
                <div class="chat_date chat_adminDate" style="clear: both; margin: 0px 10px; color:grey; font-size: 12px;">20:20</div> <!-- 시간 -->
            </div>
            <!-- 유저1 끝 -->
            <!-- 유저2 -->
            <div>
                <!--아이디-->
                <div class="chat_common chat_userId">
                    <img src="#" width="28px" height="28px"> <!-- 프로필사진 -->
                    <span>GoodPlace</span>
                </div>
                <!-- 채팅 내용 -->
                <div class="chat chat_user">
                    숙소 환불하려고 하는데요
                </div>
                <div class="chat_date chat_userDate">20:21</div> <!-- 시간 -->
            </div>

            <!-- 유저1 -->
            <div>
                <!--아이디-->
                <div class="chat_common"> 
                    <img src="#" width="28px" height="28px">
                    <span>GoodPlace</span>
                </div>
                <!-- 채팅 내용 -->
                <div class="chat chat_admin">
                    안녕하세요! 여행 플랫폼 서비스! GoodPlace입니다!
                </div>
                <div class="chat_date chat_adminDate" style="clear: both; margin: 0px 10px; color:grey; font-size: 12px;">20:20</div> <!-- 시간 -->
            </div>
            <!-- 유저1 끝 -->
            <!-- 유저2 -->
            <div>
                <!--아이디-->
                <div class="chat_common chat_userId">
                    <img src="#" width="28px" height="28px">
                    <span>GoodPlace</span>
                </div>
                <!-- 채팅 내용 -->
                <div class="chat chat_user">
                    숙소 환불하려고 하는데요
                </div>
                <div class="chat_date chat_userDate">20:21</div> <!-- 시간 -->
            </div>

            
        </div>
        
        <div class="chat_bottom" style="height: 90px; width: 280px; border-bottom-left-radius: 20px; border-radius: 20px; border: 1px solid lightgray; box-sizing: border-box;">
            <div style="float: left; height: 100%; width: 214px; padding: 5px;">
                <!-- 채팅 문자열 입력(chat_str) -->
                <textarea name="chat_str" id="" style="overflow-y: auto; width: 100%; height: 87%; box-sizing: border-box; border:none; resize:none"></textarea>
            </div>
            
            <div style="float: left; height: 100%; width:54px; background-color: #184c88; border-bottom-right-radius: 20px; border-top-right-radius: 20px; box-sizing: border-box; text-align: center; padding: 34px 0px;">
                <a herf="" style="text-align: center;">전송</a>
            </div>
        </div>
    </div>
    
    <script>
    /*채팅창*/
    var currentPosition = parseInt($("#sidebox").css("top"));
    $(window).scroll(function() {
        var position = $(window).scrollTop();
        $("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
    });
    </script>
</body>
</html>