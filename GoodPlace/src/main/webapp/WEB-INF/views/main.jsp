<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 슬라이더를 생성하는 부분 -->
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/jquery.bxslider.js"></script>
<!-- 슬라이더 버튼들 -->
<link rel="stylesheet" href="resources/css/user/mainPage/jquery.bxslider.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<style>
    /*content*/


    /*메인 검색바(숙소, 체험)*/
    #mainSearch{
        clear: both;
        height: 100px;
        width: 1200px;
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
    /*메인 검색바 끝(숙소, 체험)*/

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

    }
    #roomList h2{
        margin-left: 150px;
    }
    #roomList .menu{
        height: 30px;
        margin-left: 130px;
    }
    #roomList .menu>a{
        cursor: pointer;
    }
    #roomList .rooms{
        list-style-type: none;
    }
    #roomList .power{
        margin: 0 auto;
        text-align: center;
    }
    #roomList .power>li{
        display: inline-block;
        text-align: left;
    }
    
    
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="common/menubar.jsp"/>
	
	<!-- content -->
    <br>
    <div id="content" style="margin-bottom: 100px;">
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

        <!-- 이벤트 슬라이더 부분 -->
        <!-- 슬라이더 영역 크기 지정 -->
        <div id="eventSlider">
            <br><br>
            <!-- 슬라이더가 될 컨텐츠 부분 -->
            <!-- .bxslider : 캡션 정렬 가능 -->
            <!-- 슬라이더 안에 글 넣는법 img 태그에 title을 이용한 방법, div에 style="position:absolute;" 사용하는 방법 -->
            <ul class="bxslider"> 
                <li>
                    <!-- <div style="position:absolute;"><h1>첫 번째 이미지</h1></div> -->
                    <img src="resources/images/user/eventSlider1.PNG" title="캡션을 지정 할 수 있다."/>
                </li>
                <li>
                    <!-- <div style="position:absolute;"><h1>두 번째 이미지</h1></div> -->
                    <img src="resources/images/user/eventSlider2.PNG"/>
                </li>
                <li>
                    <!-- <div style="position:absolute;"><h1>세 번째 이미지</h1></div> -->
                    <img src="resources/images/user/eventSlider3.PNG" />
                </li> 
            </ul>
        </div>
        <!-- 슬라이더 끝 -->

        <!-- 파워등록숙소, 인기숙소 -->
        <div id="roomList">
            <div><h2>파워숙소</h2></div>
            <div class="rooms menu">
                <!-- ajax사용해서 실시간 불러오기 -->
                <a style="color:#63b8ee; cursor: inherit;" onclick="searchView1();">서울</a> | 
                <a>부산</a> |
                <a>제주</a> |
                <a>강릉</a> |
                <a>여수</a>
                <a href="" style="float: right; margin-right: 150px;">파워숙소 더보기 ></a>
            </div>
            <hr width="950px" style="margin-top: 0px;">
            <!-- 파워등록 숙소 -->
            <div class="rooms power">
                <li>
                    <a href="">
                        <img src="resources/images/user/goodplaceLogo.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="resources/images/user/goodplaceLogo.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="resources/images/user/goodplaceLogo.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="resources/images/user/goodplaceLogo.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명
                    </a>
                </li>
            </div>
            <br>
            <br>
            <!-- 인기등록 숙소-->
            <div><h2>인기숙소</h2></div>
                <!-- ajax사용해서 실시간 불러오기 -->
                <div class="rooms menu">
                    <!-- ajax사용해서 실시간 불러오기 -->
                    <a style="color:#63b8ee; cursor: inherit;" onclick="searchView1();">서울</a> | 
                    <a>부산</a> |
                    <a>제주</a> |
                    <a>강릉</a> |
                    <a>여수</a>
                    <a href="" style="float: right; margin-right: 150px;">인기숙소 더보기 ></a>
                </div>
                <hr width="950px" style="margin-top: 0px;">
            <div class="rooms power">
                <li>
                    <a href="">
                        <img src="resources/images/user/goodplaceLogo.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="resources/images/user/goodplaceLogo.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="resources/images/user/goodplaceLogo.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="resources/images/user/goodplaceLogo.jpg" width="200px" height="150px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명
                    </a>
                </li>
            </div>
        </div>
    </div><!-- /content -->
	
	<!-- footer -->
	<jsp:include page="common/footer.jsp"/>
	
	<script>
    /* 슬라이더 js */
    $(document).ready(function(){
        $('.bxslider').bxSlider({
            auto: true,
            captions: true, // true시 캡션기능으로 slider 글 등록 가능 
            speed: 500,
            pause: 4000,
            mode:'fade',
            autoControls:true,
            pager:true
        });
    });
    
    
    function searchView1(){
        $('#mainSearch form .search').css("display","block");
        $('#mainSearch .chgBtn').children().eq(0).css("color","#63b8ee");
        $('#mainSearch .chgBtn').children().eq(0).css("cursor","inherit");
        $('#mainSearch form .experience').css("display","none");
        $('#mainSearch .chgBtn').children().eq(1).css("color","gray");
        $('#mainSearch .chgBtn').children().eq(1).css("cursor","pointer");
    }
    function searchView2(){
        $('#mainSearch form .experience').css("display","block");
        $('#mainSearch .chgBtn').children().eq(0).css("color","gray");
        $('#mainSearch .chgBtn').children().eq(0).css("cursor","pointer");
        $('#mainSearch form .search').css("display","none");
        $('#mainSearch .chgBtn').children().eq(1).css("color","#63b8ee");
        $('#mainSearch .chgBtn').children().eq(1).css("cursor","inherit");
    }
	</script>
</body>
</html>