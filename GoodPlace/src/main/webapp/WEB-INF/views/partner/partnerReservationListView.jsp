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
</head>
<body>
 <div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" >
            <div id="tab">
                <button id="ing" class="on lt_tab">진행중인 예약</button>
                <button id="confirm" class="off mid_tab">확정된 예약</button>
                <button id="cancel" class="off gt_tab">취소된 예약</button>
            </div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px; margin:0">대시보드</span>
                </a>
                <a href="#">
                    <span>&gt;&nbsp;예약관리</span>
                </a>
                <a href="#">
                    <span>&gt;&nbsp;진행중인예약</span>
                </a>
            </div>
             <br clear="both"><br>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;">
                	<p class="title_tt">진행중인예약(${pi.listCount })</p></span>
                <br clear="both">
                <div class="choose_area"style="clear: both;">
                    <select id="roomTitle" class="select_st">
                        <option>제주산들바람부는마을</option>
                        <option>제주 협재 작은 마음</option>
                        <option>제주 게스트하우스 풍랑</option>
                    </select>
                    <input class="ch_date" type="date">
                    <select class="select_st">
                        <option>예약일순</option>
                        <option>여행임박일순</option>
                    </select>
                    <input type="text" name="keyword" class="keyword_search" placeholder="검색할 키워드를 입력해주세요.">
                    <button class="search_btn"type="submit" style=" vertical-align: middle;"><img  src="" style="width: 30px;height: 27px; background: gray;"></button>
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
	                                	${r.startDays }
	                                	~
	                                	${r.endDays }
	                                </td>
	                                <td>${r.roomsTitle }</td>
	                                <td><button class="confirm_btn">확정하기</button></td>
	                            </tr>
                           </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
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
			
			//button class 바꿔주기
			$("#ing").attr('class', "on lt_tab");
			$("#confirm").attr('class', "off mid_tab");
			$("#cancel").attr('class', "off gt_tab");
			
			if(list.length == 0){
					
				content += "<tr>" +
						   "<td colspan='6'>예약 목록이 없습니다.</td>" +
						   "</tr>";
						   
				selectCon += "<option>값이 없습니다.</option>";
			}else{
				
				for(var i in list){
						content +=  "<tr>" +
								 	"<td>" + list[i].rpNo + "</td>" +
								 	"<td>예약확정</td>" +
								 	"<td>" + list[i].userName +"</td>" + 
								 	"<td>" + list[i].startDays + "~" + list[i].endDays + "</td>" +
								 	"<td>" +  list[i].roomsTitle + "</td>" +
								 	"<td><button class='confirm_btn' disabled>예약완료</button></td>" +
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
				
				//button class 바꿔주기
				$("#ing").attr('class', "off lt_tab");
				$("#confirm").attr('class', "on mid_tab");
				$("#cancel").attr('class', "off gt_tab");
				
				if(list.length == 0){
						
					content += "<tr>" +
							   "<td colspan='6'>예약 목록이 없습니다.</td>" +
							   "</tr>";
					selectCon += "<option>값이 없습니다.</option>";
				}else{
					
					for(var i in list){
							content +=  "<tr>" +
										 	"<td>" + list[i].rpNo + "</td>" +
										 	"<td>예약확정</td>" +
										 	"<td>" + list[i].userName +"</td>" + 
										 	"<td>" + list[i].startDays + "~" + list[i].endDays + "</td>" +
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
			
			//
			
			//button class 바꿔주기
			$("#ing").attr('class', "off lt_tab");
			$("#confirm").attr('class', "off mid_tab");
			$("#cancel").attr('class', "on gt_tab");
			
			if(list.length == 0){
					
				content += "<tr>" +
						   "<td colspan='6'>예약 목록이 없습니다.</td>" +
						   "</tr>";
				selectCon += "<option>값이 없습니다.</option>";
			}else{
				
				for(var i in list){
					
						content +=  "<tr>" +
									 	"<td>" + list[i].rpNo + "</td>" +
									 	"<td>여행완료</td>" +
									 	"<td>" + list[i].userName +"</td>" + 
									 	"<td>" + start+i + "~" + end+i + "</td>" +
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