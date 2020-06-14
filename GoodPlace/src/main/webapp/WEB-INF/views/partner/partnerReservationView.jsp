<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerReservationList.css" />
<style>

	.con button {
		width:150px;
		height:40px;
		border: 1px solid #bebebe;
		background:#fff;
	}
	#go_rooms{
		position:relative;
		float:left;
		width:480px;
		height:350px;
		border:1px solid #bebebe;
	}
	#go_rooms:hover{
		border:1px solid #184c88;
	}
	#go_rooms button{
		position:absolute;
		top: 270px;
		left: 165px;
		
	}
	#go_rooms img{
	position:absolute;
	top:125px;
	left:180px
	}
	#go_rooms p{
	 font-size: 30px;
	 font-weight:600;
	 text-align:center;
	 padding-top:40px
	 
	}	
	#go_exps{
		position:relative;
		float:left;
		width:480px;
		height:350px;
		border:1px solid #bebebe;
		margin-left:15px
	}
	#go_exps:hover{
		border:1px solid #184c88;
	}
	#go_exps button{
		position:absolute;
		top: 270px;
		left: 165px;
		
	}
	#go_exps button:hover{
		background: #184c88;
		color:#fff;
		border:1px solid #fff
		
	}
	#go_exps img{
	position:absolute;
	top:125px;
	left:180px
	}
	#go_exps p{
	 font-size: 30px;
	 font-weight:600;
	 text-align:center;
	 padding-top:40px
	 
	}	
	
</style>
</head>
<body>
 <div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" style="width:980px">
            <div id="tab">
            </div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px; margin:0">대시보드</span>
                </a>
                <a href="#">
                    <span>&gt;&nbsp;예약관리</span>
                </a>
            </div>
             <br clear="both"><br>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;">
                	<p class="title_tt">예약관리</p></span>
                <br clear="both">
                <div id="go_rooms">
                	<p id="img_tt">숙&nbsp;&nbsp;소</p>
                	<img id="goImg" src="${ pageContext.servletContext.contextPath }/resources/images/partner/building.png" width="120px" height="120px">
                	<button id="gobtn">숙소예약관리 바로가기</button>
                </div>
                <div id="go_exps">
                	<p id="exp_tt">체&nbsp;&nbsp;험</p>
                	<img id="expImg" src="${ pageContext.servletContext.contextPath }/resources/images/partner/exp.png" width="120px" height="120px">
                	<button id="expbtn">체험예약관리 바로가기</button>
                </div>
            </div>
        </div>
    </div>
<!-- 페이지 이동 -->
	<script>
		$(function(){
			$("#go_rooms").click(function(){
				location.href='rvRoomList.rv?currentPage='+ 1;
			})
			
			$("#go_exps").click(function(){
				location.href='rvExpList.rv?currentPage='+ 1;
			})
		});
	</script>
<!-- hover -->
	<script>
		$("#go_rooms").on('mouseenter',function(){
				$("#goImg").attr('src', "${ pageContext.servletContext.contextPath }/resources/images/partner/building2.png");
				$("#img_tt").css("color","#184c88");
				$("#gobtn").css({'background':'#184c88',
								 'color':'#ffffff',
								 'border':'1px solid #fff'});
		});
		
		$("#go_rooms").on('mouseleave',function(){
			$("#goImg").attr('src', "${ pageContext.servletContext.contextPath }/resources/images/partner/building.png");
			$("#img_tt").css('color',"#000");
			$("#gobtn").css({'background':'#ffffff',
				 'color':'#333333',
				 'border':'1px solid #bebebe'});
		});
		
		$("#go_exps").on('mouseenter',function(){
			$("#expImg").attr('src', "${ pageContext.servletContext.contextPath }/resources/images/partner/exp2.png");
			$("#exp_tt").css("color","#184c88");
			$("#expbtn").css({'background':'#184c88',
							 'color':'#ffffff',
							 'border':'1px solid #fff'});
	});
	
		$("#go_exps").on('mouseleave',function(){
			$("#expImg").attr('src', "${ pageContext.servletContext.contextPath }/resources/images/partner/exp.png");
			$("#exp_tt").css('color',"#000");
			$("#expbtn").css({'background':'#ffffff',
				 'color':'#333333',
				 'border':'1px solid #bebebe'});
		});
	</script>

<!-- 토글 -->
    <script>
        $(function(){
            
            $(".arrow").click(function(){
                $("#slide_menu").slideToggle(500);
            });
        });
    </script>

</body>
</html>