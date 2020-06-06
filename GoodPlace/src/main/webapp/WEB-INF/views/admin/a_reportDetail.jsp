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
    
    /* table */
    
    .common_tb{width: 980px; padding-top:15px;}
    .common_tb thead tr td{background-color:#dbdbdb; font-size: 18px; color:#333; padding: 10px 0;
                           border-top: 1px solid #bebebe; border-bottom:1px solid #bebebe;}
    .common_tb tbody tr td{padding: 10px 0; text-align: center; border-bottom:1px solid #dbdbdb; color:#505050; font-size: 15px;}       
    table>thead>tr:hover{cursor: pointer;}
    table textarea{width: 720px; height: 300px; margin-right:75px; font-size: 16px; resize: none; border:0px}
    .bottum_tb{margin-top: 30px;}
    .bottum_tb thead tr td{font-size: 16px; color:#333; padding: 10px 0; padding-left: 20px;
                           border-top: 1px solid #dbdbdb}
    .contentBtn{width: 100px; margin-right: 0px;}
    #gotoList{background-color: white; color: black;}
    #gotoList:hover{color: white; background-color: #34538a; font-weight: bold; border: 1px solid #34538a;}
    /*모든 버튼*/
    button{cursor: pointer; width: 140px; height: 35px; border-radius: 6px; border: 1px solid #34538a; background-color: #34538a; color: #fff;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
</style>   
</head>
<body>
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px;">신고상세</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">신고상세</p></span>
                <div class="con2">
					<form id="postForm" method="post" action="">
						<input type="hidden" name="ino" value="${ b.inNo }">
						<input type="hidden" name="yellowCardR" value="${ b.yellowCardR }">
						<input type="hidden" name="yellowCardV" value="${ b.yellowCardV }">
						<input type="hidden" name="yellowCardE" value="${ b.yellowCardE }">
						<input type="hidden" name="yellowCardRp" value="${ b.yellowCardRp }">
						<input type="hidden" name="yellowCardEp" value="${ b.yellowCardEp }">
	                    <table class="common_tb" cellpadding="0" cellspacing="0" >
	                        <thead>
	                            <tr>
	                                <td width="250px">제목</td>
	                                <td colspan="4" width="100px" style="background: white;">${ b.inqTitle }</td>
	                                <td width="100px">문의분류</td>
	                                <td width="100px" style="background: white;">신고</td>
	                            </tr>
	                            <tr>
	                                <td width="200px" style="border-top: 0px;">숙소/체험명</td>
	                                <c:choose>
		                                <c:when test="${ b.roomsTitle ne null }">
		                                	<td colspan="2" width="300px" style="background: white; border-top: 0px;">${ b.roomsTitle }</td>
		                                </c:when>
		                                <c:when test="${ b.expTitle ne null }">
		                                	<td colspan="2" width="300px" style="background: white; border-top: 0px;">${ b.expTitle }</td>
		                                </c:when>
		                                <c:when test="${ b.reTitle ne null }">
		                                	<td colspan="2" width="300px" style="background: white; border-top: 0px;">${ b.reTitle }</td>
		                                </c:when>
	                                </c:choose>
	                                <td width="200px" style="border-top: 0px;">신고자</td>
	                                <td width="200px" style="background: white; border-top: 0px;">${ b.email }</td>
	                                <td width="200px" style="border-top: 0px;">신고당한사람</td>
	                                <c:choose>
		                                <c:when test="${ b.emailR ne null }">
		                                	<td width="200px" style="background: white; border-top: 0px;">${ b.emailR }</td>
		                                </c:when>
		                                <c:when test="${ b.emailE ne null }">
		                                	<td width="200px" style="background: white; border-top: 0px;">${ b.emailE }</td>
		                                </c:when>
		                                <c:when test="${ b.emailV ne null }">
		                                	<td width="200px" style="background: white; border-top: 0px;">${ b.emailV }</td>
		                                </c:when>
	                                </c:choose>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td rowspan="2" width="200px" style="background: #c1d9f0; font-size: 18px;">내용</td>
	                                <td colspan="6" style="border-bottom: 0px;">
	                                    <textarea name="" id="">${ b.inqContent }</textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                            
	                                <td colspan="5" style="text-align:right;"><button id="contentBtn" name="ino" value="${ b.inNo }" onclick="postFormSubmit(1)">삭제하기</button></td>
	                                <c:choose>
		                                <c:when test="${ b.emailR ne null }">
	                                		<td colspan="3" style="text-align:right;"><button id="contentBtn" name="partnerNoR" value="${ b.partnerNoR }" onclick="postFormSubmit(2)">제제하기</button></td>
		                                </c:when>
		                                <c:when test="${ b.emailE ne null }">
	                                		<td colspan="3" style="text-align:right;"><button id="contentBtn" name="partnerNoE" value="${ b.partnerNoE }" onclick="postFormSubmit(2)">제제하기</button></td>
		                                </c:when>
		                                <c:when test="${ b.emailV ne null }">
	                                		<td colspan="3" style="text-align:right;"><button id="contentBtn" name="userNoV" value="${ b.userNoV }" onclick="postFormSubmit(2)">제제하기</button></td>
		                                </c:when>
	                                </c:choose>
	                            </tr>
	                        </tbody>
	                    </table>
					</form>
                    <br>
                    <div style="text-align: right;">
                        <button type="button" id="gotoList" onclick="javascript:history.go(-1);">목록으로</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
    
	<script>
	    function postFormSubmit(num)
	    {
	       if(num == 1)
	       {
	      	confirm("삭제하시겠습니까?");
	          $("#postForm").attr("action", "reportDelete.bo");
	       }
	       else
	       {
	      	confirm("제제하시겠습니까?");
	          $("#postForm").attr("action", "yellowCardPlus.bo");
	       }
	       
	       $("#postForm").submit();
	    }
	 </script>
    
    
    
    

    <script>
        $(function(){
            
            $(".arrow").click(function(){
                $("#slide_menu").slideToggle(500);
            });
        });
    </script>

</body>
</html>