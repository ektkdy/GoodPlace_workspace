<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerReservationList.css" />
<style>
button{
	cursor:pointer;
}
.reserv_tb tbody tr:hover{
	background:#c1d9f0;
	color:#34538a;
	cursor:pointer;
}
.search_btn img {
    width: 25px;
    height: 26px;
    vertical-align:bottom;    
}
.search_btn{
	vertical-align: middle;
	width:32px; height:35px; 
	background:#fff; 
	border:1px solid #bebebe;
	border-left:none;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	corsor:pointer;
}

/*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer; border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}

</style>

</head>
<body>
 <div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" style="width:980px" >
            <div id="tab">
                <button id="ing" class="on lt_tab">진행중인 예약</button>
                <button id="confirm" class="off mid_tab">확정된 예약</button>
                <button id="cancel" class="off gt_tab">취소된 예약</button>
            </div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px;">대시보드</span>&gt;
                </a>
                <a href="#">
                    <span>예약관리</span>
                </a>
            </div>
             <br clear="both"><br>
            <div class="con" style="color:#000;">
                <span id="page_title"><img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;">
                	<p class="title_tt">진행중인예약(${pi.listCount})</p></span>
                <br clear="both">
                <div class="choose_area"style="clear: both;">
                    <select id="roomTitle" class="select_st">
                    <c:choose>
                    	<c:when test="${!empty list }">
		                    <c:forEach var="r" items="${ list}">
		                        <option>${r.roomsTitle }</option>
		                    </c:forEach>
	                    </c:when>
	                    <c:otherwise>
	                    	<option>목록이 없습니다.</option>
	                    </c:otherwise>
                    </c:choose>
                    </select>
                    <input class="ch_date" type="date">
                    <select class="select_st">
                        <option>예약일순</option>
                        <option>여행임박일순</option>
                    </select>
                    <input type="text" name="keyword" class="keyword_search" placeholder="검색할 키워드를 입력해주세요.">
                    <button class="search_btn"type="submit">
                    	<img  src="${ pageContext.servletContext.contextPath }/resources/images/partner/search.png" >
                    </button>
                </div>
                <div>
                    <table class="reserv_tb"cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
                                <td width="150">예약번호</td>
                                <td width="150">예약상태</td>
                                <td width="100">여행자</td>
                                <td width="290">날짜</td>
                                <td width="290">숙소이름</td>
                                <td width="200">확정여부</td>
                            </tr>
                        </thead>
                        <tbody>
                        	
                        	<c:choose>
                        		<c:when test="${!empty list }">
		                        	<c:forEach var="r" items="${ list}">
			                            <tr>
			                                <td>${r.rpNo } </td>
			                                <c:choose>
			                                	<c:when test="${r.reserveStatus eq 1 }">
			                                		<td>확정대기</td>
			                                	</c:when>
			                                	<c:when test="${r.reserveStatus eq 2 }">
			                                		<td>확정완료</td>
			                                	</c:when>
			                                	<c:when test="${r.reserveStatus eq 3 }">
			                                		<td>여행완료</td>
			                                	</c:when>
			                                </c:choose>
			                                <td>${r.userName}</td>
			                                <td>
			                                <c:set var="TextValue1" value="${r.startDays }"/>
			                                	${fn:substring(TextValue1,0,10) }
		
			                                	~
			                                	<c:set var="TextValue2" value="${r.endDays }"/>
			                                	${fn:substring(TextValue2,0,10) }
			                                </td>
			                                <td>${r.roomsTitle }</td>
			                                <td><button class="confirm_btn">확정하기</button></td>
			                            </tr>
		                           </c:forEach>
	                           </c:when>
		                       <c:otherwise>
		                       	<tr>
		                       		<td colspan="6">예약목록이 없습니다.</td>
		                       	</tr>
		                       </c:otherwise>    
	                        </c:choose>
                        </tbody>
                    </table>
                    <c:if test="${ !empty list }">
	                    <div id="pagingArea" style="margin-top: 22px;">
	                       <c:choose>
			                	<c:when test="${ pi.currentPage eq 1 }">
				                    <a href="#">&lt;</a>
				                </c:when>
				                <c:otherwise>
			                    	<a href="rvRoomList.rv?currentPage=${ pi.currentPage -1 }">&lt;</a>
			                    </c:otherwise>
		                    </c:choose>
		                    
					        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<c:choose>
		                    		<c:when test="${ p eq pi.currentPage }">
			                    		<a href="#">${p}</a>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<a class="page-link" href="rvRoomList.rv?currentPage=${ p }">${p}</a>
			                    	</c:otherwise>
			                    </c:choose>
		                    </c:forEach>
		                    
					        <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    <a>&gt;</a>
				                </c:when>
				                <c:otherwise>
				                    <a href="rvRoomList.rv?currentPage=${ pi.currentPage +1 }">&gt;</a>
				                </c:otherwise>
		                    </c:choose>
	                    </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
<!-- 디테일뷰 -->

<!-- tab메뉴 ajax -->

<script>
//진행중인예약 
$('#ing').click(function(){
  $.ajax({
	url:"rvRoomListIng.rv",
	data:{currentPage:1 },
	type:"post",
	success:function(result){
		
			var list = result.list;
			var pi = result.pi;
			
			//tbody에 값 넣을 변수 선언
			var content = "";
			
			//select에 값 넣을 변수 선언
			var selectCon = "";
			
			//tbody 부분 비우기
			$(".reserv_tb tbody").empty();
			
			//select 부분 비우기
			$('#roomTitle').empty();
			
			//페이지 제목 변경
			var title = "진행중인예약(" + list.length + ")" ;
			$('.title_tt').empty();
			$('.title_tt').text(title);
			
			//button class 바꿔주기
			$("#ing").attr('class', "on lt_tab");
			$("#confirm").attr('class', "off mid_tab");
			$("#cancel").attr('class', "off gt_tab");
			
			if(list.length == 0){
					
				content += "<tr>" +
						   "<td colspan='6'>예약 목록이 없습니다.</td>" +
						   "</tr>";
						   
				selectCon += "<option>목록이 없습니다.</option>";
			}else{
				
				for(var i in list){
					var start = list[i].startDays;
					var end = list[i].endDays;
						content +=  "<tr>" +
								 	"<td>" + list[i].rpNo + "</td>" +
								 	"<td>예약확정</td>" +
								 	"<td>" + list[i].userName +"</td>" + 
								 	"<td>" + start.substr(0,10) + " ~ " + end.substr(0,10) + "</td>" +
								 	"<td>" +  list[i].roomsTitle + "</td>" +
								 	"<td><button class='confirm_btn' disabled>확정하기</button></td>" +
									"</tr>";
									
						selectCon += 
								"<option>" + list[i].roomsTitle + "</option>";
						
								  }
			}		
			
			$(".reserv_tb tbody").html(content);
			$("#roomTitle").html(selectCon);
			



	},error:function(){
		console.log("통신실패!!");
	}
 });
});


</script>
<script>
	
	
	// 확정된예약
	$('#confirm').click(function(){
	  $.ajax({
		url:"rvRoomListConfirm.rv",
		data:{currentPage:1 },
		type:"post",
		success:function(result){
			
				var list = result.list;
				var pi = result.pi;
				//tbody에 값 넣을 변수 선언
				var content = "";
				
				//select에 값 넣을 변수 선언
				var selectCon = "";
				
				//tbody 부분 비우기
				$(".reserv_tb tbody").empty();
				
				//select 부분 비우기
				$('#roomTitle').empty();
				
				//페이지 제목 변경
				var title = "확정된 예약(" + list.length + ")";
				$('.title_tt').empty();
				$('.title_tt').text(title);
				
				//button class 바꿔주기
				$("#ing").attr('class', "off lt_tab");
				$("#confirm").attr('class', "on mid_tab");
				$("#cancel").attr('class', "off gt_tab");
				
				if(list.length == 0){
						
					content += "<tr>" +
							   "<td colspan='6'>예약 목록이 없습니다.</td>" +
							   "</tr>";
					selectCon += "<option>목록이 없습니다.</option>";
				}else{


					for(var i in list){
						var start = list[i].startDays;
						var end = list[i].endDays;
							content +=  "<tr>" +
										 	"<td>" + list[i].rpNo + "</td>" +
										 	"<td>예약확정</td>" +
										 	"<td>" + list[i].userName +"</td>" + 
										 	"<td>" + start.substr(0,10) + " ~ " + end.substr(0,10) + "</td>" +
										 	"<td>" +  list[i].roomsTitle + "</td>" +
										 	"<td>" + 
									 		"<button class='confirm_btn' style='background:#f1f1f1; border:1px solid #bebebe; color:#333 'disabled>예약완료</button>" + 
										 	"</td>" +
										"</tr>";
							selectCon += "<option>" + list[i].roomsTitle + "</option>";
									  }
				}			 		
				
				$(".reserv_tb tbody").html(content);
				$("#roomTitle").html(selectCon);
			

		},error:function(){
			console.log("통신실패!!");
		}
	 });
	});
  
	//취소된예약
	$('#cancel').click(function(){
	  $.ajax({
		url:"rvRoomListCancel.rv",
		data:{currentPage:1 },
		type:"post",
		success:function(result){
			
			var list = result.list;
			var pi = result.pi;
			//tbody에 값 넣을 변수 선언
			var content = "";
			
			//select에 값 넣을 변수 선언
			var selectCon = "";
			
			//tbody 부분 비우기
			$(".reserv_tb tbody").empty();
			
			//select 부분 비우기
			$('#roomTitle').empty();
			
			//페이지 제목 변경
			var title = "취소된 예약(" + list.length + ")" ;
			$('.title_tt').empty();
			$('.title_tt').text(title);
			
			//button class 바꿔주기
			$("#ing").attr('class', "off lt_tab");
			$("#confirm").attr('class', "off mid_tab");
			$("#cancel").attr('class', "on gt_tab");
			
			if(list.length == 0){
					
				content += "<tr>" +
						   "<td colspan='6'>예약 목록이 없습니다.</td>" +
						   "</tr>";
				selectCon += "<option>목록이 없습니다.</option>";
			}else{
				
				for(var i in list){
					var start = list[i].startDays;
					var end = list[i].endDays;
						content +=  "<tr>" +
									 	"<td>" + list[i].rpNo + "</td>" +
									 	"<td>예약취소</td>" +
									 	"<td>" + list[i].userName +"</td>" + 
									 	"<td>" + start.substr(0,10) + " ~ " + end.substr(0,10) + "</td>" +
									 	"<td>" +  list[i].roomsTitle + "</td>" +
									 	"<td>" + 
									 		"<button class='confirm_btn' style='background:#d22d32; border:1px solid #d22d32; color:#fff 'disabled>예약취소</button>" + 
									 	"</td>" +
									"</tr>";
						selectCon += "<option>" + list[i].roomsTitle + "</option>";
								  }
			}			 		
			
			$(".reserv_tb tbody").html(content);
			$("#roomTitle").html(selectCon);
		

	},error:function(){
		console.log("통신실패!!");
	}
 });
});
</script>

<script>
	$(function(){
	    
	    $(".arrow").click(function(){
	        $("#slide_menu").slideToggle(500);
	    });
	});
</script>
<script>
$(document).on('click', ".reserv_tb tbody tr", function(){
	location.href="reservationRoomDetailView.rv?rpNo="+$(this).children().eq(0).html();
	
});
</script>

</body>
</html>