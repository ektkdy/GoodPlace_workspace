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
    
    /*모든 버튼*/
    button{cursor: pointer; width: 140px; height: 35px; border-radius: 6px; border: 1px solid #34538a; background-color: #34538a; color: #fff;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    .modifiyBtn{width:70px;}

    .lt_tab{border-radius: 0px;}

    .gt_tab{border-radius: 0px;}

    #blue_btn1{
        font-size: 1.0em;
        height: 50px;
        border-radius: 0px;
        border-top-left-radius: 6px;
        border-bottom-left-radius: 6px;
    }
    #blue_btn2:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    #blue_btn2 {
        font-size: 1.0em;
        color:black;
        background: #dbdbdb;
        border: 1px solid #dbdbdb;
        margin-right: 500px;
        height: 50px;
        border-radius: 0px;
        border-top-right-radius: 6px;
        border-bottom-right-radius: 6px;
    }
    #delete_btn{
        color:black;
        background: #dbdbdb;
        border: 1px solid #dbdbdb;
    }
    #delete_btn:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
</style>     
</head>
<body>
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" >
            <div id="tab">
                <button class="on lt_tab" onclick="location.href='aPowerList.po'">파워등록 관리</button>
                <button class="off gt_tab" onclick="location.href='powerOkayList.po?currentPage=1'">파워등록 목록</button>
            </div>
            <div class="sitemap">
                <a href="#"><span style="width: 30px;height: 30px;">파워등록관리</span></a>
            </div>
            <br><br><br><br><br>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">파워등록관리</p></span>
                <div class="con2">
                    <table id="powerList" class="common_tb" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
                                <td width="150">번호</td>
                                <td width="300">파워명</td>
                                <td width="200">가격</td>
                                <td width="200">일수</td>
                                <td width="200">수정</td>
                                <td width="150">선택</td>
                            </tr>
                        </thead>
                        <tbody>
<!--                             <tr>
                                <td>1</td>
                                <td>STANDARD</td>
                                <td>300,000원</td>
                                <td>30일</td>
                                <td><button class="modifiyBtn">수정</button></td>
                                <td><input type="checkbox"></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>MEGA PACK</td>
                                <td>500,000원</td>
                                <td>60일</td>
                                <td><button class="modifiyBtn">수정</button></td>
                                <td><input type="checkbox"></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>ULTRA PACK</td>
                                <td>800,000원</td>
                                <td>90일</td>
                                <td><button class="modifiyBtn">수정</button></td>
                                <td><input type="checkbox"></td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>PLATINUM</td>
                                <td>1,200,000원</td>
                                <td>120일</td>
                                <td><button class="modifiyBtn">수정</button></td>
                                <td><input type="checkbox"></td>
                            </tr> -->
	                        <c:forEach items="${ list }" var="r">
	                            <tr>
	                                <td>${ r.poNo }</td>
	                                <td>${ r.powerKind }</td>
	                                <td>${ r.powerPrice }원</td>
	                                <td>${ r.period }일</td>
	                                <td><button class="modifiyBtn">수정</button></td>
	                                <td onclick="event.cancelBubble=true"><input type="checkbox"></td>
	                            </tr>
	                        </c:forEach>   
                        </tbody>
                    </table>
                    
                    <table>
                        <th>
                            <br>
                            <button id="delete_btn"  style="margin-left:700px;">삭제</button>
                            <button class="insert_btn" onclick="location.href='powerEnrollForm.po'">등록</button>
                        </th>
                    </table>
                    
                 	<script>
		            	$(function(){
		            		
 	            		    $("#powerList tbody tr").click(function(){
		            			location.href="powerUpdateForm.po?pno=" + $(this).children().eq(0).text();
		            		});  
 	            		    
		            	});
		            </script>

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