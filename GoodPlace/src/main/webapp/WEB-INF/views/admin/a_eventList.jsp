<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/adminCommon.css" />
<style>
    /*공통*/
    /* font */
    *{font-family: 'Noto Sans KR', sans-serif;}
    /* 여백 초기화 */
     body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form {margin: 0; padding: 0;}
    /* a 링크 초기화 */
    a {color: #333333; text-decoration: none;}
    /* body css */
    body {background: #fff;}
    #wrap {width: 1200px; margin: 0 auto; height: 900px; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }

    .lt_tab{border-radius: 0px;}
    .mid_tab{border-radius: 0px;}
    .gt_tab{border-radius: 0px;}

    /* 공지사항 관리 */
    #searchInput{
        border:1px solid #dbdbdb;
        border-radius: 0px;
        border-top-left-radius: 6px;
        border-bottom-left-radius: 6px;
    }
    .search_btn{
        border-radius: 0px;
        background-color: #184c88; 
        color:#fff; 
        width: 100px; 
        height: 35px; 
        border-top-right-radius: 6px; 
        border-bottom-right-radius: 6px; 
        border:1px solid #184c88
    }
    #searchSelect{
        border-radius: 6px;
    }
    .common_tb>tbody>tr:hover td{
        /*
        color: white; 
        background-color: #34538a;
        */
        cursor:pointer;
    }
    /*페이징바*/
    #pagingArea{width: 680px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer;}
    #pagingArea a:hover{color: white; background-color: #34538a;}


    /*모든 버튼*/
    button{cursor: pointer; width: 140px; height: 35px; border-radius: 6px; border: 1px solid #34538a; background-color: #34538a; color: #fff;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    .modifiyBtn{width:70px;}
    /* 삭제 버튼*/
    #delete_btn{
        color:black;
        background: #dbdbdb;
        border: 1px solid #dbdbdb;
    }
    #delete_btn:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}

    .event-img {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 90%;
	height: 70%;
	margin: auto;
    margin-top: 5%;
    }

    input[class="cb1"] {
        margin-bottom: 180px;
        display: inline-block;
	    width: 20px;
	    height: 20px;
    }
    

</style>     
</head>
<body>
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" >
            <div id="tab">
                <button class="off lt_tab">FAQ관리</button>
                <button class="on mid_tab">이벤트관리</button>
                <button class="off gt_tab">공지사항관리</button>
            </div>
            <div class="sitemap">
                <a href="#"><span style="width: 30px;height: 30px;">이벤트관리</span></a>
            </div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">이벤트관리</p></span>
                <span class="up_btn_space">
                    <select name="" id="searchSelect" style="width:100px; height:35px;">
                        <option value="">제목</option>
                        <option value="">내용</option>
                        <option value="">제목+내용</option>
                    </select>
                    <input id="searchInput" type="search" style="width:200px; height:35px;"><button class="search_btn">검색</button>
                </span>
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0">

                            <tr>
                                <td><input class="cb1" type="checkbox" name="" value=""></td>
                                <td>
                                    <div class="eventDiv" style="width: 250px; height:200px; border:1px solid black;">
                                        <div id="event-img" class="event-img" >
                                            <input type="hidden" value="">
                                            <img src= "${pageContext.request.contextPath}/resources/images/admin/1234.png" alt="">
                                        </div>
                                        <span>추천을 하면 포인트를 드려요!</span><br>
                                        <span>2020.05.01-2020.06.20</span>
                                    </div>
                                </td>
                                <td><input class="cb1" type="checkbox" name="" value=""></td>
                                <td>
                                    <div class="eventDiv" style="width: 250px; height:200px; border:1px solid black;">
                                        <div id="event-img" class="event-img" >
                                            <input type="hidden" value="">
                                            <img src= "${pageContext.request.contextPath}/resources/images/admin/1234.png" alt="">
                                        </div>
                                        <span>추천을 하면 포인트를 드려요!</span><br>
                                        <span>2020.05.01-2020.06.20</span>
                                    </div>
                                </td>
                                <td><input class="cb1" type="checkbox" name="" value=""></td>
                                <td>
                                    <div class="eventDiv" style="width: 250px; height:200px; border:1px solid black;">
                                        <div id="event-img" class="event-img" >
                                            <input type="hidden" value="">
                                            <img src= "${pageContext.request.contextPath}/resources/images/admin/1234.png" alt="">
                                        </div>
                                        <span>추천을 하면 포인트를 드려요!</span><br>
                                        <span>2020.05.01-2020.06.20</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><input class="cb1" type="checkbox" name="" value=""></td>
                                <td>
                                    <div class="eventDiv" style="width: 250px; height:200px; border:1px solid black;">
                                        <div id="event-img" class="event-img" >
                                            <input type="hidden" value="">
                                            <img src= "${pageContext.request.contextPath}/resources/images/admin/1234.png" alt="">
                                        </div>
                                        <span>추천을 하면 포인트를 드려요!</span><br>
                                        <span>2020.05.01-2020.06.20</span>
                                    </div>
                                </td>
                                <td><input class="cb1" type="checkbox" name="" value=""></td>
                                <td>
                                    <div class="eventDiv" style="width: 250px; height:200px; border:1px solid black;">
                                        <div id="event-img" class="event-img" >
                                            <input type="hidden" value="">
                                            <img src= "${pageContext.request.contextPath}/resources/images/admin/1234.png" alt="">
                                        </div>
                                        <span>추천을 하면 포인트를 드려요!</span><br>
                                        <span>2020.05.01-2020.06.20</span>
                                    </div>
                                </td>
                                <td><input class="cb1" type="checkbox" name="" value=""></td>
                                <td>
                                    <div class="eventDiv" style="width: 250px; height:200px; border:1px solid black;">
                                        <div id="event-img" class="event-img" >
                                            <input type="hidden" value="">
                                            <img src= "${pageContext.request.contextPath}/resources/images/admin/1234.png" alt="">
                                        </div>
                                        <span>추천을 하면 포인트를 드려요!</span><br>
                                        <span>2020.05.01-2020.06.20</span>
                                    </div>
                                </td>
                            </tr>

                    </table>
                    <table>
                        <th>
                            <br>
                            <button class="blue_btn" >등록하기</button>
                            <button class="blue_btn" id="delete_btn">삭제</button>
                        </th>
                        <th>
                            <div id="pagingArea" style="margin-top: 22px;">
                                <a>&lt;</a>
                                <a>1</a>
                                <a>2</a>
                                <a>3</a>
                                <a>4</a>
                                <a>5</a>
                                <a>&gt;</a>
                            </div>
                        </th>
    
                    </table>
    
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            
            $(".arrow").click(function(){
                $("#slide_menu").slideToggle(500);
            });
        });
    </script>

</body>
</html>