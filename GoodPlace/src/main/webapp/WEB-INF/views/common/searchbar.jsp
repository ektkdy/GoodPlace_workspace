<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        width: 200px; 
    }
    
    #mainSearch .input .liBox1{
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


</style>
</head>
<body>

	<!-- searchbar -->
    <div id="searchbar">
        <div id="mainSearch">
            <div class="search chgBtn">
                <a style="color:#63b8ee; cursor: inherit;" onclick="searchView1();">숙소</a> | 
                <a onclick="searchView2();">체험</a>
            </div>

            <!-- 숙소검색 -->
            <form action="" id="roomSearchArea" method="get" >
                <div class="search input" style="display: block;">
                    <li class="liBox">
                        <b>위치</b>
                        <input type="text" id="tripArea" placeholder="어디로 여행가세요?" >
                    </li>
                    <li class="liBox">
                        <b>가는날짜</b>
                        <input type="date" id="tripStartDate" placeholder="날짜를 입력하세요" >
                    </li>
                    <li class="liBox">
                        <b>오는날짜</b>
                        <input type="date" id="tripEndDate" placeholder="날짜를 입력하세요" >
                    </li>
                    <li class="liBox">
                        <b>인원수</b>
                        <input type="number" id="tripPeople" placeholder="인원수를 선택해주세요">
                    </li>
                    <li style="margin: auto; text-align: center;">
                        <input id="subRoomInfo"type="submit" value="숙소검색">
                    </li>
                </div>
            </form>
         	<script>
            	$(function(){
            		$("#roomSearchArea #subRoomInfo").click(function(){
            			
            			var tripArea = $("#tripArea").val();
            			var tripPeriod = $("#tripPeriod").val();
            			var tripPeople = $("#tripPeople").val();

            			console.log(tripArea, tripPeriod, tripPeople);
            			
            			location.href = "searchRo.ro";
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
</body>
</html>