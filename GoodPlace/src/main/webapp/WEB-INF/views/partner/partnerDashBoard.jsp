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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css"> 
<style>
button:hover{cursor:pointer}
table tr:hover{background:#f1f1f1; cursor:pointer}

/*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer; border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
    
    #noticeList tr:hover{cursor:pointer;}
    
.dash_img{
    padding-top:45px
    }
    .dash_amount{
    font-size:20px;
    padding-top:10px
    }
    .amount{
    font-size:18px; 
    font-weight:600
    }
    .imgDiv{
    float:left;  
    width:32.5%;
    height:77.5%; 
    margin-left:4px;
    text-align:center;
    }    
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
	                        <p>파트너 현황</p><span style="font-size: 15px;">&nbsp;|&nbsp;새로운 정보가 실시간으로 바뀌여 보여집니다.</span>
	                    </div>
	                    <div class="imgDiv" >
	                    	<div style="float:left; height: 65%;  width:100%; text-align:center;">
	                    		<img src="${ pageContext.servletContext.contextPath }/resources/images/partner/building2.png"  width="70px" height="70px" class="dash_img">
	                    	</div>
	                    	<div style="float:left; height: 35%;  width:100%; text-align:center;">
	                    		<p style="font-size:15px; font-weigh:500">새로운 숙소 예약 내역<p>
	                    		 <p class="dash_amount"><a href="rvRoomList.rv?currentPage=1"><span class="amount" id="roomCount">5</span>건</a></p>
	                    	</div>
	                    </div>
	                    <div class="imgDiv">
	                    	<div style="float:left; height: 65%;  width:100%">
	                    		<img src="${ pageContext.servletContext.contextPath }/resources/images/partner/exp2.png" width="70px" height="70px" class="dash_img">
	                    	</div>
	                    	<div style="float:left; height: 35%;  width:100%; text-align:center;">
	                    		<p style="font-size:15px; font-weigh:500">새로운 체험 예약 내역<p>
	                    		  <p class="dash_amount"><a href="rvExpList.rv?currentPage=1"><span class="amount" id="expCount">10</span>건</a></p>
	                    	</div>
	                    </div>
	                    <div class="imgDiv" >
	                    	<div style="float:left; height: 65%;  width:100%">
	                    		<img src="${ pageContext.servletContext.contextPath }/resources/images/partner/money.png" width="70px" height="70px" class="dash_img">
	                    	</div>
	                    	<div style="float:left; height: 35%;  width:100%; text-align:center;">
	                    		<p style="font-size:15px; font-weigh:500">이번달 총 수입<p>
	                    		 <p class="dash_amount"><a href="partnerIncome.ac?currentPage=1"><span class="amount" id="sumIncome">
	                    		 0</span>원</a></p>
	                    	</div>
	                    </div>
	                </div>
	                <div class="calendar" style="margin-top:20px">
						<canvas id="myChart" width="350" height="300"></canvas>
	                </div>
	                <br clear="both">
	                <div class="reservDiv" style="height:380px">
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
	                <div class="reservDiv" style="height:380px">
	                    <div class="divTitle">
	                        <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/exp.jpg" style="float:left; padding-left:10px; vertical-align:bottom">
	                        <p>체험예약목록</p>
	                        <span style="float:right; margin-right:10px;">
	                            <a href="rvExpList.rv?currentPage=1" style="font-size: 18px;">더보기+</a>
	                        </span>
	                    </div>
	                    <div style="float:left; margin-top:30px;">
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
	                        <table class="reviewTb" cellpadding="0" cellspacing="0" style="table-layout: fixed">
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
	                        <table class="noticeTb" cellpadding="0" cellspacing="0" style="margin-bottom:20px">
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
		$.ajax({
			url:"incomeChart.me",
			success:function(result){

				var listRo = result.listRo;
				var listExp = result.listExp;
				//console.log(listRo); 
				//console.log(listExp);
				
				var today = new Date();		// 오늘날짜
				var months = new Array();	// 월을 담을 배열
				var num = 0;
				for(var i = 0; i < 6; i++){
					if((today.getMonth() + 1) - i > 0 && (today.getMonth() + 1) - i <= (today.getMonth() + 1)){
						months[i] = (today.getMonth() + 1) - i;
					}else{
						months[i] = 12 - num;
						num++;
					}
					
					if(months[i] < 10){				
						months[i] = "0" + months[i];		
					}else{
						months[i] = "" + months[i];
					}
				}
				months.reverse();
				//console.log(month);			// ["01", "02", "03", "04", "05", "06"]
				//console.log(month.length);	// 6
				
				var roomIncome = [];
				/*for(var i=0; i<listRo.length; i++){
					switch(listRo[i].month){
						case months[0] : roomIncome[0] = listRo[0].income; break;
						case months[1] : roomIncome[1] = listRo[1].income; break;
						case months[2] : roomIncome[2] = listRo[2].income; break;
						case months[3] : roomIncome[3] = listRo[3].income; break;
						case months[4] : roomIncome[4] = listRo[4].income; break;
						case months[5] : roomIncome[5] = listRo[5].income; break;
					}
				}*/
				
				for(var i= 0; i<months.length; i++){
					for(var j=0; j<listRo.length; j++){
						if(months[i]==listRo[j].month){
							roomIncome[i] = listRo[j].income;
						}
					}
				}
				//console.log(roomIncome);
				
				var expIncome = [];
				//console.log(listExp[0].month);
				/*console.log(listExp[3].income);
				
				for(var i=0; i<listExp.length; i++){
					switch(listExp[i].month){
						case months[0] : expIncome[0] = listExp[0].income; break;
						case months[1] : expIncome[1] = listExp[1].income; break;
						case months[2] : expIncome[2] = listExp[2].income; break;
						//case months[3] : expIncome[3] = listExp[3].income; break;
						//case months[4] : expIncome[4] = listExp[4].income; break;
						//case months[5] : expIncome[5] = listExp[5].income; break;
					}
				}*/
				
				for(var i= 0; i<months.length; i++){
					for(var j=0; j<listExp.length; j++){
						if(months[i]==listExp[j].month){
							expIncome[i] = listExp[j].income;
						}
					}
				}
				//console.log(expIncome);
			
			
				var ctx = document.getElementById('myChart');
				var myChart = new Chart(ctx, {
					type: 'bar',
					data: {
						labels: months,
						datasets: [{
							label: '숙소',
							backgroundColor: 'rgba(153, 102, 255, 0.2)',
							fill:false,
							data: roomIncome
						},{
							label : '체험',
							backgroundColor : 'rgba(255, 159, 64, 0.2)', 
							fill:false,
							data : expIncome
						}]
					},
					options: {
						maintainAspectRatio: false,
						title:{ 
							diaplay : true,
							text : '월별 수입내역' 
						},
						scales: {						
							yAxes: [{
								ticks: {
									beginAtZero: true
								}
							}],
							xAxes: [{
								ticks: {
									macTicksLimit:6,
									beginAtZero: true
								}
							}]
						},
					}
				});
				
			}, error:function(){
				console.log("월별 수입내역 조회용 ajax 실패");
			}
		});
	});
</script>

<script>
	$(function(){
		$.ajax({
			url:"partnerDashboardIncome.me",
			success:function(sum){
				//console.log(sum);
				var sum = sum;
				$("#sumIncome").text(sum);
			}, error:function(){
				console.log("이번달 총수입 내역 조회용 ajax 실패")
			}
		});
	});
</script>
    
 <script>
 	$(function(){
 		//숙소 예약 count
 		$.ajax({
 			url:"dashboardRoomCount.rv",
 			data:{currentPage:1},
 			type:"post",
 			success:function(count){
 				var count = count;
 				
 				$("#roomCount").html(count);
 			},error:function(){
 	 			console.log("통신실패!!");
 	 		}
 	 	 });
 	 		//체험 예약 count
 	 		$.ajax({
 	 			url:"dashboardExpCount.rv",
 	 			type:"post",
 	 			success:function(count){
 	 				var count = count;
 	 				$("#expCount").html(count);
 	 			},error:function(){
 	 	 			console.log("통신실패!!");
 	 	 		}
 	 	 	 });
 	 		
 		
 		
 		//후기
 		$.ajax({
 			url:"reviewListDashboard.bo",
 			data:{currentPage:1 },
 			type:"post",
 			success:function(result){
 				var list = result.list;
 				
 				//console.log(result);
 				
 				var content = "";
 				if(list.length == 0){
 						
 					 content += '<tr>' +
 							   		"<td colspan='2' style='text-align:center'>후기가 없습니다.</td>" +
 							   	"</tr>";
 					
 				}else{
 					
 					for(var i in list){
 						var start = list[i].reviewDate;
 								content +=  "<tr>" +
 											"<td style='display:none'>" + list[i].reNo + "</td>" +
 											"<td style='display:none'>" + list[i].rpNo + "</td>" +
 										 	"<td width='70%'style=' max-height:0.8em; line-height:1.5em; display: inline-block;max-width: 300px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;' id='cutCon'>" + list[i].reContent + "</td>" +
 										 	"<td width='20%' style='text-align:right'>" + start.substring( 0, 10 )+"</td>" +
 										"</tr>";
 									  }
 				}			 		
 				
 				$(".reviewTb tbody").html(content);
 			

 		},error:function(){
 			//console.log("통신실패!!");
 		}
 	 });
 		
	$(document).on('click', ".reviewTb tbody tr", function(){
		location.href="reviewDetailView.re?reNo="+$(this).children().eq(0).html()+"&rpNo="+$(this).children().eq(1).html();
		
	});
 		
 		//공지사항
 		$.ajax({
 			url:"noticeListDashboard.bo",
 			data:{currentPage:1 },
 			type:"post",
 			success:function(result){
 				var list = result.list;
 				
 				//console.log(result);
 				
 				var content = "";
 				if(list.length == 0){
 						
 					 content += '<tr>' +
 							   		"<td colspan='2' style='text-align:center'>공지사항이 없습니다.</td>" +
 							   	"</tr>";
 					
 				}else{
 					for(var i in list){
 						var start = list[i].noticeDate;
 								content +=  "<tr>" +
 											"<td style='display:none'>" + list[i].noNo + "</td>" + 
 										 	"<td width='80%' class='reviewCon'>" + list[i].noticeTitle + "</td>" +
 										 	"<td width='20%'>" + start.substring( 0, 5)+"일</td>" +
 										"</tr>";
 									  }
 				}			 		
 				
 				$(".noticeTb tbody").html(content);
 			

 		},error:function(){
 			//console.log("통신실패!!");
 		}
 	 });
 		
 		$(document).on('click', ".noticeTb tbody tr", function(){
 			location.href="pNoticeListDetail.bo?noNo="+$(this).children().eq(0).text();
 			
 		});
 		
 	//체험예약
 		$.ajax({
 			url:"dashboardExpList.rv",
 			data:{currentPage:1 },
 			type:"post",
 			success:function(result){
 				var pi = result.pi;
 				var list = result.list;
 				
 				//console.log(list);
 				
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
					 	"<td style='color:#024d9a'>예약대기</td>" +
					 	"</tr>";
 					}
 				}	 		
 				
 				$("#expReservationTb tbody").html(content);
 			

 		},error:function(){
 			//console.log("통신실패!!");
 		}
 	 });
 	
 		$(document).on('click', "#expReservationTb tbody tr", function(){
 			location.href="reservationExpDetailView.rv?epNo="+$(this).children().eq(0).html();
 			
 		});

 		//숙소예약
 		$.ajax({
 			url:"dashboardRoomList.rv",
 			data:{currentPage:1 },
 			type:"post",
 			success:function(result){
 				var pi = result.pi;
 				var list = result.list;
 				
 				//console.log(list);
 				
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
 										 	"<td style='color:#024d9a'>예약대기</td>" +
 										"</tr>";
 									  }
 					}	 		
 				
 				$("#roomReservationTb tbody").html(content);
 			

 		},error:function(){
 			//console.log("통신실패!!");
 		}
 	 });
 		
 		$(document).on('click', "#roomReservationTb tbody tr", function(){
 			location.href="reservationRoomDetailView.rv?rpNo="+$(this).children().eq(0).html();
 			
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