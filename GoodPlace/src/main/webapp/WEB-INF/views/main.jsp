<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 슬라이더 버튼들 -->
<link rel="stylesheet" href="resources/css/user/mainPage/jquery.bxslider.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<style>
    /*content*/

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
		
		<jsp:include page="common/searchbar.jsp"/>
		
		<!-- 
		<form action="mTest.me" method="post">
			<input type="text" name="userEmail" value="${ loginUser.email }">
			<input type="submit" value="메세지 테스트">
		</form>
		 -->
		
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
        <div style="padding-left:150px;"><a href="eventForm.bo">이벤트 리스트</a></div>

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
	
	<!-- 슬라이더를 생성 스크립트 -->
	<script src="resources/js/jquery.bxslider.js"></script>
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
    
   
	</script>
</body>
</html>