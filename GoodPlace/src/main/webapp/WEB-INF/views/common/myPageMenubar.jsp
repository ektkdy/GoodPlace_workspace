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

    <style>
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
            margin: auto;
            text-align: center;
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
    </style>

</head>
<body>

	
    <!-- content -->
    <br>
    <div id="content" style="height:100%">
        <div class="tab_st" >
        	<!-- class="button_on" style="margin-left: 10px;" -->
            <button><a href="wishList.bo">위시리스트</a></button>
            <button><a href="ReserveForm.ro">예약내역</a></button>
            <button><a href="mpExp.exp">나의체험</a></button>
            <button>포인트</button>
            <button><a href="inQuiry.bo">1:1문의</a></button>
            <button>메세지</button>
        </div>
     	<br>
     	

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