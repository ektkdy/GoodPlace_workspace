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
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
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

    /*대시보드*/
    #dbTable01{
        margin:auto;
        margin-right: 50px;
        text-align: center;
    }
    #dbTable01 b{font-size: 25px;}
    .bline {
        background-color: #34538a;
        height: 2px;
        border:0px;
        margin-bottom: 20px;
    }
    #myChart {
      width: 100%;
      height: 300px;
    }
</style>   
</head>
<body>
	
	
    <div id="wrap">
        
		<jsp:include page="../common/adminMenubar.jsp"/>
        
        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#"><span style="width: 30px;height: 30px;">대시보드</span></a>
            </div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">대시보드</p></span>
                <br><br><br><br><br><br>
                <div style="height:200px;">
                    <span ><b style="font-weight:bold; font-size: 1.3em;">오늘매출현황</b> <span id="todayAmount" style="font-size:0.8em">(05월17일 13:10 기준)</span>
                    <br>
                    
                    <table id="dbTable01">
                        <th rowspan="2" height="150px" width="100px">
                            <img src="${pageContext.request.contextPath}/resources/images/admin/calendar2.png" style="vertical-align: middle; width: 70px; height: 70px; padding-left: 60%;">
                        </th>
                        <th rowspan="2" width="200px" style="padding-left: 3%;">총매출<small>(${ r1.countNo + e1.countNo }건)</small><br><b>${ r1.sumAmount +  e1.sumAmount }</b> 원</th>
                        <th rowspan="2" height="150px" width="100px">
                            <img src="${pageContext.request.contextPath}/resources/images/admin/cash2.png" style="vertical-align: middle; width: 70px; height: 70px; padding-left: 60%;">
                        </th>
                        <th rowspan="2" width="200px">숙소<small>(${ r1.countNo }건)</small><br><b>${ r1.sumAmount }</b> 원</th>
                        <th rowspan="2" height="150px" width="100px">
                            <img src="${pageContext.request.contextPath}/resources/images/admin/nocash2.png" style="vertical-align: middle; width: 70px; height: 70px; padding-left: 60%;">
                        </th>
                        <th rowspan="2" width="200px">체험<small>(${ e1.countNo }건)</small><br><b>${ e1.sumAmount }</b> 원</th>
                    </table>
                    
                    <script>
                    
	                    let today = new Date();   
	
	                    let year = today.getFullYear(); // 년도
	                    let month = today.getMonth() + 1;  // 월
	                    let date = today.getDate();  // 날짜
	                    let day = today.getDay();  // 요일
	                  
	                    $(function(){
	                    	$("#todayAmount").html("(" + year + '/' + month + '/' + date + ")");
	                    })
	                    
	                    $(function(){
	                    	$("#month").html("(" + month + "월" + ")");
	                    })
	                    
	                    
                    </script>
                    
                    <br>
                    <hr class="bline">

                    <span><b style="font-weight:bold; font-size: 1.3em;">예약 현황</b> <small id="month">월</small></span>
                    <br>
                    
                    <table id="dbTable01">
                        <tr height="100px">
                            <th width="300px"><b style="font-size: 2.0em;">${ r2.countNo + e2.countNo }</b></th>
                            <th width="300px"><b style="font-size: 2.0em;">${ r2.countNo }</b></th>
                            <th width="300px"><b style="font-size: 2.0em;">${ e2.countNo }</b></th>
                        </tr>
                        <tr>
                            <th width="300px" style="color:#34538a"><b>전체예약</b></th>
                            <th width="300px" style="color:#34538a"><b>숙소</b></th>
                            <th width="300px" style="color:#34538a"><b>체험</b></th>
                        </tr>
                    </table>
                    <br>
                    <hr class="bline">

                    <span><b style="font-weight:bold; font-size: 1.3em;">회원 & 파트너 현황</b></span>
                    <br>
                    
                    <table id="dbTable01">
						<div id='myChart'></div>
                    </table>
                      
					  <script>
					  
					  $(function(){
						 
						  $.ajax({
							 url:"mainchartList.mc",
							 success:function(data){
								 
								 console.log(data);
								 
								 var value= [];
								 var value2= [];
								 
								 for(var i in data.list){
									 value.push(data.list[i].mainChartBlockOff);
								 }
								 
								 
								 for(var i in data.list2){
									 value2.push(data.list2[i].mainChartBlockOn);
								 }
								 
								 console.log(value);
								 console.log(value2);
								 
								 console.log(myConfig);
								 console.log(myConfig.series[0].values);
								 console.log(myConfig.series[1].values);
								 
								 myConfig.series[0].values = value;
								 myConfig.series[1].values = value2;
								 
							    zingchart.render({
								      id: 'myChart',
								      data: myConfig,
								      height: "100%",
								      width: "100%"
							    });
								 
								 
								 
							 }, error:function(){
								 console.log("통계 자료용 ajax 통신실패");
							 }
							  
							  
						  });
						 
						  
					  
					  
					    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
					    var myConfig = {
					      type: "bar",
					      plotarea: {
					        adjustLayout: true
					      },
					      scaleX: {
					        label: {
					          text: "회원 & 파트너 현황"
					        },
					        labels: ["회원&정지회원", "파트너&정지파트너"]
					      },
					      series: [{
					          values: [20, 90]
					        },
					        {
					          values: [5, 30]
					        }
					      ]
					    };
					 
					    zingchart.render({
					      id: 'myChart',
					      data: myConfig,
					      height: "100%",
					      width: "100%"
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