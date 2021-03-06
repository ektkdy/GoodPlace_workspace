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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/a_replyDetailView.css" />
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

</style>  
</head>
<body>
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>
aReplyDetail.bo
        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px;">후기상세</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">후기상세</p></span>
                <br clear="both">
                <div>
                    <table class="replyDetail" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr class="pdTop">
                                <td rowspan="2" style="width:100px; ">
                                    <div align="center">
	                                  	<c:choose>
				                    		<c:when test="${empty r.changeName }">
				                        			<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/userProfile/default.jpg"width="60px" style="border-radius:25px" >
				                        	</c:when>
				                        	<c:otherwise>
				                        			<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/userProfile/${r.changeName}">
				                        	</c:otherwise>
				                        </c:choose>
                                    </div>
                                </td>
                                <td width="250">예약자명 : ${ r.userName }</td>
                                <td width="300">예약자 평점 : ${ r.score }</td>
                                <td width="250">연령대 : ${ r.age }대</td>
                            </tr>
                            <tr class="pdBot">
                                <td>여행일 : ${ r.endDays }</td>
                                <td>후기작성일 : ${ r.reviewDate }</td>
                                <td>여행목적 : ${ r.concept }</td>
                            </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4">
                                <div class="reply_con">${ r.reContent }</div>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4" style="padding-top:15px; padding-bottom:10px; font-weight: 500; ">답글</td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <textarea type="text" class="replyAnswer" rows="10" readonly>${ r.reply }</textarea>
                            </td>
                        </tr>
                    </tfoot>
                    </table>
                    <div class="replyBtnArea" style="width:100%">
                        <button class="blue_btn" onclick="javascript:history.go(-1);">목록으로</button>
                    </div>
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