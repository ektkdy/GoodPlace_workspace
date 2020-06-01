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

    /* 신고 관리 */
    #searchInput{
        border:1px solid #dbdbdb;
        border-top-left-radius: 6px;
        border-bottom-left-radius: 6px;
    }
    .search_btn{
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
        color: white; 
        background-color: #34538a;
        cursor:pointer;
    }
    /*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
</style>   
</head>
<body>
    <div id="wrap">
        
        <jsp:include page="../common/adminMenubar.jsp"/>
        
        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px;">신고관리</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">신고목록</p></span>
                <span class="up_btn_space">
                    <select name="" id="searchSelect" style="width:100px; height:35px;">
                        <option value="">선택</option>
                        <option value="">이름</option>
                        <option value="">회원번호</option>
                        <option value="">회원타입</option>
                    </select>
                    <input id="searchInput" type="search" style="width:200px; height:35px;"><button class="search_btn">검색</button>
                </span>
                
                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
                                <td width="100"><input type="checkbox"></td>
                                <td width="150">신고번호</td>
                                <td width="200">신고자명</td>
                                <td width="200">신고당한사람</td>
                                <td width="300">제목</td>
                                <td width="200">등록일</td>
                                <td width="150">경고횟수</td>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>홍길동</td>
                                <td>임꺽정</td>
                                <td>방이 너무 더러워요</td>
                                <td>20.05.18</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>홍길동</td>
                                <td>임꺽정</td>
                                <td>방이 너무 더러워요</td>
                                <td>20.05.18</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>홍길동</td>
                                <td>임꺽정</td>
                                <td>방이 너무 더러워요</td>
                                <td>20.05.18</td>
                                <td>0</td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="pagingArea" style="margin-top: 22px;">
                        <a>&lt;</a>
                        <a>1</a>
                        <a>2</a>
                        <a>3</a>
                        <a>4</a>
                        <a>5</a>
                        <a>&gt;</a>
                    </div>
                    <br>
                </div>
            </div>
        </div>
        <div id="footer">footer</div>
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