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
        /* header 끝*/

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

        #roomList{
            width:80%;
            float:left;
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
        /* 마이리스트 메뉴바 */
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

        /* 마이리스트 메뉴바 끝*/

        .common_tb{width: 980px; padding-top:15px; margin: 0 auto;}
        .common_tb thead tr td{background-color:#f1f1f1; font-size: 18px; color:#333; padding: 10px 0; text-align: center;
                           border-top: 1px solid #bebebe; border-bottom:1px solid #bebebe;}
        .common_tb tbody tr td{padding: 10px 0; text-align: center; border-bottom:1px solid rgb(241, 241, 241); color:#505050; font-size: 15px;}       
        
        #roomList>div>h1>.Btn{
            border: 0px;
            height: 30px;
            width: 120px;
            float: right;
            background-color: #1679c5;
            color: white;
            box-sizing: border-box;
            font-size: 18px;
            margin-top: 15px;
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
<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
</head>
    <!-- header -->
</head>
<body>
  <!-- header -->
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- content -->
	<div id="content" style="text-align: center;">
		<jsp:include page="../common/myPageMenubar.jsp"/>
		
		 <br>
    <div id="content" style="height:100%">
       
      
        <!-- 인기등록 숙소-->
        <div id="roomList" style="width:100%; margin:0 auto;" >
            <div>
                <h1 style="width:1000px; padding-left:80px;">1:1문의
                    <input type="button" class="Btn" value="1:1문의하기">
                </h1>
                
            </div>

            <div>
                <table class="common_tb" cellpadding="0" cellspacing="0" >
                    <thead>
                        <tr>
                            <td width="150px">상담구분</td>
                            <td width="500px">제목</td>
                            <td width="200px">문의신청일</td>
                            <td width="200px">상태</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>신고</td>
                            <td>문의신청 제목 입니다.</td>
                            <td>20.04.27</td>
                            <td>답변완료</td>
                        </tr>
                    </tbody>
                </table>
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
    <!-- /content -->
    <br clear="both">
		
			<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>