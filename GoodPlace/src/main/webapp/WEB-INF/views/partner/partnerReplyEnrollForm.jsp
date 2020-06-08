<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerReplyDetailView.css" />

</head>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" style="width:980px" >
            <div id="tab">
                <button class="on lt_tab">답글 전 후기</button>
                <button class="off gt_tab">답글 후 후기</button>
            </div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px;">HOME</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">후기관리</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">답글 전 후기</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">답글작성</span>
                </a>
            </div>
            <div class="con" style="float:left; color:#000; ">
                <span id="page_title" style="margin-top:20px"><img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;"><p class="title_tt">답글 전 후기</p></span>
                <br clear="both">
                <form action="insert.re"  id="insertReply" method="post" >
                <input type="hidden" name="reNo" value="${r.reNo }">
                	<div>
	                    <table class="replyDetail" cellpadding="0" cellspacing="0">
	                        <thead>
	                            <tr class="pdTop">
	                                <td rowspan="2" width="70px" >
	                                    <div align="center">
		                                    <c:choose>
					                    		<c:when test="${empty r.changeName }">
					                        			<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/userProfile/default.jpg"width="60px" style="border-radius:25px" >
					                        	</c:when>
					                        	<c:otherwise>
					                        			<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/userProfile/${changeName}">
					                        	</c:otherwise>
					                        </c:choose>
	                                    </div>
	                                </td>
	                                <td width="250">여행자 : ${r.userName}</td>
	                                <td width="300">예약자 평점 : ${r.score }</td>
	                                <td width="250">연령대 : ${r.age }대</td>
	                            </tr>
	                            <tr class="pdBot">
	                                <td>여행일 : ${r.endDays}</td>
	                                <td>후기작성일 : ${r.reviewDate}</td>
	                                <td>여행목적 : ${r.concept}</td>
	                            </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td colspan="4">
	                                <div class="reply_con">${r.reContent}</div>
	                            </td>
	                        </tr>
	                    </tbody>
	                    <tfoot>
	                        <tr>
	                            <td colspan="4" style="padding-top:15px; padding-bottom:10px; font-weight: 500;">답글등록</td>
	                        </tr>
	                        <c:choose>
		                        <c:when test="${empty r.reply }">
			                        <tr>
			                            <td colspan="4">
			                                <textarea id="summernote" name="reply" class="replyAnswer" rows="10"></textarea>
			                            </td>
			                        </tr>
		                        </c:when>
		                        <c:otherwise>
		                        	<tr>
			                            <td colspan="4">
			                                <textarea id="summernote" name="reply" class="replyAnswer" rows="10">${r.reply }</textarea>
			                            </td>
			                        </tr>
		                        </c:otherwise>
	                        </c:choose>
	                    </tfoot>
	                    </table>
	                    <div class="replyBtnArea" style="width:100%">
	                        <button class="blue_btn" type="submit" >댓글등록</button>
	                    </div>
                	</div>
                </form>
            </div>
        </div>
    </div>
<!-- 토글 -->
    <script>
        $(function(){
            
            $(".arrow").click(function(){
                $("#slide_menu").slideToggle(500);
            });
        });
    </script>
   <!-- summernote api -->
	<script>
		$(function(){
	
                // 1. 단순히 에디터 폼만 보이게 하는거
                //$("#summernote").summernote();

                // 2. 추가적인 속성들 부여 가능
                // 간단하게 사이즈 조정(width, height) / 미리보기 값(placeholder)
                $('#summernote').summernote({
                //placeholder:" ",
                tabsize: 2,
                    height: 200,
                    width:980/*
                    toolbar: [
                        [groupName, [list of button]]
                        ['Font Style', ['fontname']],
                        ['style', ['bold', 'italic', 'underline']],
                        ['font', ['strikethrough']],
                        ['fontsize', ['fontsize']],
                        ['color', ['color']],
                        ['para', ['paragraph']],
                        ['height', ['height']],
                        ['Insert', ['picture']]
                    ] 
                    */
            	});

			});
		
	</script>
	
	<script>
	$(function(){

		$("insertReply").submit(function(){
			if ($('#summernote').summernote('isEmpty')) {//using id
			    alert('contents is empty1');
				return false;
			}
		});
		
	});
	</script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- summernote -->
</body>
</html>