<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerCommon.css" />
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerDashBoard.css" />

<style>
button:hover{cursor:pointer}

/*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer; border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
    
    #noticeList tr:hover{cursor:pointer;}
</style>
</head>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px;">HOME</span>&gt;
                </a>
                <a href="#">
                    <span> 대쉬보드</span>
                </a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;">
                    <p class="title_tt">대쉬보드</p>
                </span>
                
                <div class="con2">
                    <div class="reservationArea" style="float:left; margin-top: 20px;">
	                    <div class="divTitle" style="float: left;">
	                        <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/step_icon1.png"  style="float:left; padding-left:10px; vertical-align:bottom">
	                        <p>예약현황</p><span style="font-size: 15px;">&nbsp;|&nbsp;새로운 정보가 실시간으로 바뀌여 보여집니다.</span>
	                    </div>
	                </div>
	                <div class="calendar" style="margin-top:20px">
	
	                </div>
	                <br clear="both">
	                <div class="reservDiv">
	                    <div class="divTitle">
	                        <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/step_icon2.png" style="float:left; padding-left:10px; vertical-align:bottom">
	                        <p>숙소예약목록</p><span style="float:right; margin-right:10px;"><a href="rvRoomList.rv?currentPage=1"  style="font-size: 18px;">더보기+</a></span></div>
	                    <div style="float:left; margin-top:30px">
	                        <table id="roomReservationTb"class="reservTb" cellpadding="0" cellspacing="0">
	                            <thead>
	                                <tr>
	                                    <th>예약번호</th>
	                                    <th>여행자</th>
	                                    <th>날짜</th>
	                                    <th>숙소이름</th>
	                                    <th>예약상태</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	                <br clear="both">
	                <div class="reservDiv">
	                    <div class="divTitle">
	                        <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/exp.jpg" style="float:left; padding-left:10px; vertical-align:bottom">
	                        <p>체험예약목록</p>
	                        <span style="float:right; margin-right:10px;">
	                            <a href="rvExpList.rv?currentPage=1" style="font-size: 18px;">더보기+</a>
	                        </span>
	                    </div>
	                    <div style="float:left; margin-top:30px">
	                        <table id="expReservationTb"class="reservTb" cellpadding="0" cellspacing="0">
	                            <thead>
	                                <tr>
	                                    <th>예약번호</th>
	                                    <th>여행자</th>
	                                    <th>날짜</th>
	                                    <th>체험이름</th>
	                                    <th>예약상태</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	                <br clear="both">
	                <div class="reviewDiv">
	                    <div class="divTitle">
	                        <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/review_icon.jpg" style="float:left; padding-left:10px; vertical-align:bottom">
	                        <p>최근등록후기</p>
	                        <span style="float:right; margin-right:10px;">
	                            <a href="reviewList.re?currentPage=1" style="font-size: 18px;">더보기+</a>
	                        </span>
	                    </div>
	                    <div style="float: left;">
	                        <table class="reviewTb">
	                            <tr class="reviewTr">
	                            
	                            </tr>
	                        </table>
	                    </div>
	                </div>
	                <div class="noticeDiv">
	                    <div class="divTitle">
	                        <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/notice_icon.jpg"  style="float:left; padding-left:10px; vertical-align:bottom">
	                        <p>공지사항</p>
	                        <span style="float:right; margin-right:10px;">
	                            <a href="pNoticeList.bo?currentPage=1" style="font-size: 18px;">더보기+</a>
	                        </span>
	                    </div>
	                    <div>
	                        <table class="noticeTb">
	                        <tbody>
	                        	
	                        </tbody>
	                        </table>
	                    </div>
	                </div>
                </div>
            </div>
        </div>
    </div>
 <script>
 	$(function(){
 		//후기
 		$.ajax({
 			url:"reviewListDashboard.bo",
 			data:{currentPage:1 },
 			type:"post",
 			success:function(result){
 				var list = result.list;
 				
 				console.log(result);
 				
 				var content = "";
 				if(list.length == 0){
 						
 					 content += '<tr>' +
 							   		"<td colspan='2' style='text-align:center'>공지사항이 없습니다.</td>" +
 							   	"</tr>";
 					
 				}else{
 					
 					for(var i in list){
 						var start = list[i].reviewDate;
 								content +=  "<tr>" +
 										 	"<td>" + list[i].reContent + "</td>" +
 										 	"<td>" + start.substring( 0, 10 )+"</td>" +
 										"</tr>";
 									  }
 				}			 		
 				
 				$(".reviewTb tbody").html(content);
 			

 		},error:function(){
 			console.log("통신실패!!");
 		}
 	 });
 		
 		
 		//공지사항
 		$.ajax({
 			url:"noticeListDashboard.bo",
 			data:{currentPage:1 },
 			type:"post",
 			success:function(result){
 				var list = result.list;
 				
 				console.log(result);
 				
 				var content = "";
 				if(list.length == 0){
 						
 					 content += '<tr>' +
 							   		"<td colspan='2' style='text-align:center'>공지사항이 없습니다.</td>" +
 							   	"</tr>";
 					
 				}else{
 					for(var i in list){
 						var start = list[i].noticeDate;
 								content +=  "<tr>" +
 										 	"<td width='80%'>" + list[i].noticeTitle + "</td>" +
 										 	"<td width='20%'>" + start.substring( 0, 5)+"일</td>" +
 										"</tr>";
 									  }
 				}			 		
 				
 				$(".noticeTb tbody").html(content);
 			

 		},error:function(){
 			console.log("통신실패!!");
 		}
 	 });
 		
 	//체험예약
 		$.ajax({
 			url:"dashboardExpList.rv",
 			data:{currentPage:1 },
 			type:"post",
 			success:function(result){
 				var pi = result.pi;
 				var list = result.list;
 				
 				console.log(list);
 				
 				var content = "";
 				if(list.length == 0){
 						
 					 content += '<tr>' +
 							   		"<td colspan='5' style='text-align:center'>예약목록이 없습니다.</td>" +
 							   	"</tr>";
 					
 				}else{
 					var arr = list;
 					
 					var temp = arr.slice(0, 6);
 					
 					for(var i in temp){
 						var start = list[i].expDateUser;
 						content +=  "<tr>" +
					 	"<td>" + list[i].epNo + "</td>" +
					 	"<td>" + list[i].userName +"</td>" + 
					 	"<td>" + start.substr(0,10) +"</td>" +
					 	"<td>" +  list[i].expTitle + "</td>" +
					 	"<td>예약확정</td>" +
					 	"</tr>";
 					}
 				}	 		
 				
 				$("#expReservationTb tbody").html(content);
 			

 		},error:function(){
 			console.log("통신실패!!");
 		}
 	 });

 		//숙소예약
 		$.ajax({
 			url:"dashboardRoomList.rv",
 			data:{currentPage:1 },
 			type:"post",
 			success:function(result){
 				var pi = result.pi;
 				var list = result.list;
 				
 				console.log(list);
 				
 				var content = "";
 				if(list.length == 0){
 						
 					 content += '<tr>' +
 							   		"<td colspan='5' style='text-align:center'>예약목록이 없습니다.</td>" +
 							   	"</tr>";
 					
 				}else{
 					var temp2 = list.slice(0, 6);
 					
 					for(var i in temp2){
 						var start = list[i].startDays;
 						var end = list[i].endDays;
 							content +=  "<tr>" +
 										 	"<td>" + list[i].rpNo + "</td>" +
 										 	"<td>" + list[i].userName +"</td>" + 
 										 	"<td>" + start.substr(0,10) + " ~ " + end.substr(0,10) + "</td>" +
 										 	"<td>" +  list[i].roomsTitle + "</td>" +
 										 	"<td>예약확정</td>" +
 										"</tr>";
 									  }
 					}	 		
 				
 				$("#roomReservationTb tbody").html(content);
 			

 		},error:function(){
 			console.log("통신실패!!");
 		}
 	 });

 	});
 </script>
<script>
	$(function(){
 		 	});
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