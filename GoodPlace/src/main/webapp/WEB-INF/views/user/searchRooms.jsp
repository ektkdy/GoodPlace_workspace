<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소검색</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/mainPage/jquery.bxslider.css">
    <!-- 슬라이더 버튼들 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <!-- 슬라이더를 생성하는 부분 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.js"></script>
    <style>
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
            width:100%;
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
            float:left;
        }
        .halfWidth{
            width:50%;
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
            background-color: ghostwhite;
            border:1px solid #dcdcdc;
        }
        /* 페이징바 끝 */
        /* content 끝*/

    </style>
</head>
<body>
    <!-- header -->
	<jsp:include page="../common/menubar.jsp"/>
    
    <!-- filter -->
	<jsp:include page="../common/filter.jsp"/>
    
    <!-- content -->
    <br>
    <div id="content">
        
		<!-- searchbar -->
	    <div id="searchbar">
	        <div id="mainSearch">
	            <div class="search chgBtn">
	                <a style="color:#63b8ee; cursor: inherit;" onclick="searchView1();">숙소</a> | 
	                <a onclick="searchView2();">체험</a>
	            </div>
	
	            <!-- 숙소검색 -->
	            <form action="searchRoWithFilter.ro" id="roomSearchArea" method="get" >
	                <div class="search input" style="display: block;">
	                    <li class="liBox">
	                        <b>위치</b>
	                        <input type="text" name="tripArea" id="tripArea" placeholder="${ tripArea }" value="${ tripArea }">
	                    </li>
	                    <li class="liBox">
	                        <b>가는날짜</b>
	                        <input type="date" name="tripStartDate" id="tripStartDate" placeholder="${ tripStartDate }" value="${ tripStartDate }">
	                    </li>
	                    <li class="liBox">
	                        <b>오는날짜</b>
	                        <input type="date" name="tripEndDate" id="tripEndDate" placeholder="${ tripEndDate }" value="${ tripEndDate }">
	                    </li>
	                    <li class="liBox">
	                        <b>인원수</b>
	                        <input type="number" name="tripPeople" id="tripPeople" placeholder="${ tripPeople }" value="${ tripPeople }">
	                    </li>
	                    <li style="margin: auto; text-align: center;">
	                        <input id="subRoomInfo"type="submit" value="숙소검색">
	                    </li>
	                </div>
	                <input type="hidden" id="filterValue" name="filterValue"/>
	            </form>
	         	<script>
	            	$(function(){
	            		$("#roomSearchArea #subRoomInfo").click(function(){
	
	            			$("#roomSearchArea").submit();
	            			
	            		});
	            	});
	            </script>
            <!-- 체험검색 -->
	            <form action="" post="get">
	                <div class="experience input" style="display: none;">
	                    <li class="liBox1">
	                        <b>태그</b>
	                        <input type="text" placeholder="체험 목록을 선택하세요" >
	                    </li>
	                    <li class="liBox1">
	                        <b>날짜</b>
	                        <input type="date" placeholder="날짜를 입력하세요" >
	                    </li>
	                    <li class="liBox1">
	                        <b>키워드</b>
	                        <input type="number" placeholder="키워드를 입력하세요">
	                    </li>
	                    <li style="margin: auto; text-align: center;">
	                        <input id="sub"type="submit" value="체험검색">
	                    </li>
	                </div>
	            </form>
        	</div>
    	</div><!-- /searchbar -->
		
		<script>
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
        
        <!-- 인기등록 숙소-->
        <div id="roomList">
            <div style="padding-top:60px;"><h2>HOT 인기숙소</h2></div>
            <div class="rooms power">
                <li>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/resources/images/user/굿플레이스로고02.jpg" width="260px" height="170px" style="margin:0 53px 0 0;"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/resources/images/user/굿플레이스로고02.jpg" width="260px" height="170px" style="margin:0 53px 0 0;"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
               <li>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/resources/images/user/굿플레이스로고02.jpg" width="260px" height="170px" style="margin:0 53px 0 0;"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="${pageContext.request.contextPath}/resources/images/user/굿플레이스로고02.jpg" width="260px" height="170px"><br>
                        숙소 타이틀<br>
                        숙소 간단한 설명<br>
                        <p style="text-align:center; margin:unset;">n개의 이용후기</p>
                    </a>
                </li>
            </div>
        </div>

	        <!-- 검색된 숙소 -->
	        <div id="roomList">
	            <div style="margin:50px 0 20px 0; height:30px; width:100%;">
	                <div class="halfWidth" style="height:30px;"><h3 style="margin:0px;">검색된 숙소 (n개)</h3></div>
	                <div class="halfWidth" style="height:30px; width:50%; text-align: right;"><a href="#">리뷰 많은 순</a> | <a href="#">가격 낮은 순</a> | <a href="#">가격 높은 순</a></div>
	            </div>
	            

	           	<div class="rooms power bottomArea">
		           		<c:forEach items="${ roomList }" var="roomList" varStatus="status">
			               	<li class="roomDetail">
			                    <a href="roomDe.ro?roNo=${ roomList.roNo }">
			                        <img src="${pageContext.request.contextPath}/resources/images/user/굿플레이스로고02.jpg" width="260px" height="170px" style="margin:0 53px 0 0;"><br>
			                        	${ roomList.roomsTitle }<br>
				                       	#<c:out value="${fn:replace(roomList.roomsTag, ',', ' #')}"/><br>
			                        <p style="text-align:center; margin:unset;">${ roomList.reviewCount }개의 이용후기</p>
			                    </a>
			                    <input type="hidden" class="roNo" value="${ roomList.roNo }" />
	                		</li>
	               	 	</c:forEach>
	           	</div>

				<script>
	            	//$(function(){
	            		//$(".roomDetail").click(function(){
	            			//var roNo = $(this).children(".roNo").val();
	            			//console.log(roNo);
	            			//location.href="roomDe.ro?roNo=" + roNo;
	            			//console.log("roomDetail li 클릭됨");
	            		//});
	            	//});
				</script>
	        <!-- 페이징 바 -->
	        <div class="pagingBar">
	            <button>&lt;</button>&nbsp;
	            <button style="background-color:rgb(24, 76, 136); color:white;">n</button>&nbsp;
	            <button>n</button>&nbsp;
	            <button>n</button>&nbsp;
	            <button>n</button>&nbsp;
	            <button>n</button>&nbsp;
	            <button>&gt;</button>
	        </div>
	    </div>	
	    	
   	</div>
    <!-- /content -->
    
   	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>