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
 <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
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
    #wrap {width: 1200px; height: 950px; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }

	.zc-body { background:#ecf2f6; }

	.chart--container {
	  height: 100%;
	  width: 100%;
	  min-height: 530px;
	}
	
	.zc-ref {
	  display: none;
	}


</style>  
</head>
<body class="zc-body">
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" style="width:1000px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px; padding-right:30px;">정산관리</span></a></div>
            <div class="con" style="color:#000" style="width:"1000px;">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">수익내역</p></span>
                <button class="blue_btn" style="margin-left:33%;" onclick="location.href='aAccountsList.ac?currentPage=1'">내역화면</button>

                <div class="con2">
                    <table class="common_tb" cellpadding="0" cellspacing="0">
                        <thead>
                            <tr>
							  <div style="width: 980px; padding-top:30px;" id="myChart" class="chart--container">
							    <a href="https://www.zingchart.com/" rel="noopener" class="zc-ref">Powered by ZingChart</a>
							  </div>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
    
                </div>
            </div>

            
            
        </div>
    </div>
    

	
	
  <script>
  
  //let model = [];
  
  $(function(){
	  
	  $.ajax({
		 url:"chartList.ac",
		 success:function(data){
			 console.log(data);
			 
			 var mon = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
			 
			 var value = [];
			 var value2 = [];
			 var value3 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			 
			 var num1 = 40;
			 var num2 = 20;
			 var num3 = 0;
			 var num4 = 0;
			 var resultRo = 0;
			 var resultEx = 0;
			 console.log(data.roNum);
			 console.log(data.exNum);
			 //console.log(num1);
			 resultRo = data.roNum / (data.roNum+data.exNum)*100;
			 console.log(resultRo);
			 resultEx = data.exNum / (data.roNum+data.exNum)*100;
			 console.log(resultEx);
			 num3= num1 / (num1+num2)*100;
			 num4= num2 / (num1+num2)*100;
			 //console.log(Math.floor(num3));
			 
			 
			 for(var i in mon){
				 
				 var flag = false;
				 
				 for(var j in data.list){
					 if(("20/" + mon[i]) == data.list[j].expPayDate){
						value.push(data.list[j].chartamountExp);
						flag = true;
						break;
					 }
				 }
				 
				 if(!flag){ // 그 월에 대한게 없음
					 value.push(0);
				 }
				 
			 }
			 
			 for(var i in mon){
				 
				 var flag = false;
				 
				 for(var j in data.list2){
					 if(("20/" + mon[i]) == data.list2[j].expPayDate){
						value2.push(data.list2[j].chartamountExp);
						flag = true;
						break;
					 }
				 }
				 
				 if(!flag){ // 그 월에 대한게 없음
					 value2.push(0);
				 }
				 
			 }
			 
			 for(var i in value){
				 value3[i] += value[i] + value2[i];
			 }
			 
			 //console.log(chartData.graphset[0].series[0].values);
			 console.log(value);
			 console.log(value2);
			 console.log(value3);
			 console.log(chartData);
			 //console.log(chartData.graphset[2].series[0].values);
			 //console.log(chartData.graphset[2].series[1].values);
			 //console.log(chartData.graphset[1].series[0].values);
			 //console.log(chartData.graphset[1].series[1].values);
			 //console.log(chartData.graphset[1].labels[0].text);
			 resultRo
			 
			 chartData.graphset[0].series[0].values = value3;	// 룸, 숙소 합
			 chartData.graphset[2].series[0].values = value;	// 룸
			 chartData.graphset[2].series[1].values = value2;	// 체험
			 
			 chartData.graphset[1].series[0].values[0] = Math.floor(resultRo);
			 chartData.graphset[1].series[1].values[0] = Math.floor(resultEx);
			 
			 zingchart.render({
			      id: 'myChart',
			      data: chartData,
			      height: '100%',
			      width: '100%',
			    });
			 
			
/* 			 var value = null;
			 for(var i in list){
				console.log(list[0].chartamountExp);
				model.push(list[i].chartamountExp);
			 };
			 console.log(medel); */
			 
		 }, error:function(){
			 console.log("통계 자료용 ajax 통신실패");
		 }
		 
	  });
	  
	  
  
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
    let chartData = {
      graphset: [{
          type: 'line',
          backgroundColor: '#00BAF0 #0C9BBC',
          fontFamily: 'Arial',
          width: '100%',
          x: '0px',
          y: '0px',
          title: {
            text: '2020 Total Sales',
            paddingLeft: '25px',
            backgroundColor: 'none',
            fontColor: '#ffffff',
            fontFamily: 'Arial',
            fontSize: '22px',
            fontWeight: 'normal',
            height: '70px',
            textAlign: 'left'
          },
          subtitle: {
            text: 'Sales shown by month',
            paddingTop: '20px',
            paddingLeft: '25px',
            alpha: 0.7,
            fontColor: '#ffffff',
            fontFamily: 'Arial',
            fontSize: '13px',
            fontStyle: 'italic',
            fontWeight: 'normal',
            height: '40px',
            textAlign: 'left'
          },
          plot: {
            tooltip: {
              text: '%k: %v',
              padding: '5px 10px',
              backgroundColor: '#016B8B',
              borderRadius: '6px',
              shadow: false,
              thousandsSeparator: ','
            },
            alphaArea: 1,
            hoverMarker: {
              type: 'circle',
              backgroundColor: '#016B8B',
              borderWidth: '1px',
              size: '6px'
            },
            hoverState: {
              visible: false
            },
            lineColor: '#ffffff',
            lineWidth: '2px',
            marker: {
              type: 'circle',
              backgroundColor: '#0C9BBC',
              borderColor: '#ffffff',
              borderWidth: '1px',
              shadow: false,
              size: '5px'
            },
            shadow: false,
            stacked: true
          },
          plotarea: {
            marginTop: '40px',
            marginRight: '30px',
            marginBottom: '5px',
            marginLeft: '30px',
            backgroundColor: 'none'
          },
          scaleX: {
            values: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            guide: {
              visible: false
            },
            visible: false
          },
          scaleY: {
            guide: {
              visible: false
            },
            visible: false
          },
          series: [{
            values: []
          }]
        },
        {
          type: 'pie',
          backgroundColor: '#F4F4F4 #EAEAEA',
          fontFamily: 'Arial',
          width: '50%',
          height: '50%',
          x: '0px',
          y: '50%',
          title: {
            text: 'Exp & Room',
            paddingLeft: '25px',
            backgroundColor: 'none',
            fontColor: '#505050',
            fontFamily: 'Arial',
            fontSize: '18px',
            fontWeight: 'normal',
            height: '70px',
            textAlign: 'left'
          },
          subtitle: {
            text: 'Rate',
            paddingTop: '20px',
            paddingLeft: '25px',
            alpha: 0.7,
            fontColor: '#505050',
            fontFamily: 'Arial',
            fontSize: '13px',
            fontStyle: 'italic',
            fontWeight: 'normal',
            height: '40px',
            textAlign: 'left'
          },
          plot: {
            tooltip: {
              visible: false
            },
            valueBox: {
              alpha: 1,
              connected: false,
              lineWidth: '10px'
            },
            slice: 35
          },
          plotarea: {
            marginTop: '5px',
            marginRight: '5%',
            marginBottom: '0px',
            marginLeft: '10%',
            backgroundColor: 'none'
          },
          scaleR: {
            refAngle: 40
          },
          labels: [{
            text: 'compare',
            anchor: 'c',
            fontColor: '#505050',
            fontFamily: 'arial',
            fontSize: '20px',
            x: '52.5%',
            y: '50%'
          }],
          series: [{
              text: 'Internet',
              values: [36],
              valueBox: {
                fontColor: '#E25833',
                fontSize: '11px',
                fontStyle: 'italic',
                offsetX: '10px',
                offsetY: '0px'
              },
              backgroundColor: '#ff9525 #fc6222',
              borderColor: '#F4F4F4',
              shadow: false
            },
            {
              text: 'Retail',
              values: [64],
              valueBox: {
                fontColor: '#5D7F13',
                fontSize: '11px',
                fontStyle: 'italic',
                offsetX: '-10px',
                offsetY: '0px'
              },
              backgroundColor: '#9dc644 #608215',
              borderColor: '#F4F4F4',
              shadow: false
            }
          ]
        },
        {
          type: 'line',
          labels: [
        	    // Label 1
        	    {
        	      text: "O숙소",
      	        'font-color': '#E25833',
    	        'font-family': "Georgia",
    	        'font-size': "20",
        	      x: "80%",
        	      y: "15%"
        	    },
        	    {
        	        text: "O체험",
        	        'font-color': '#5D7F13',
        	        'font-family': "Georgia",
        	        'font-size': "20",
        	        x: "65%",
        	        y: "15%"
        	      }
          ],
          backgroundColor: '#F4F4F4 #EAEAEA',
          fontFamily: 'Arial',
          width: '50%',
          height: '50%',
          x: '50%',
          y: '50%',
          title: {
            text: '2020 Sales by Type',
            paddingLeft: '25px',
            backgroundColor: 'none',
            fontColor: '#505050',
            fontFamily: 'Arial',
            fontSize: '18px',
            fontWeight: 'normal',
            height: '70px',
            textAlign: 'left'
          },
          subtitle: {
            text: 'Sales shown by month',
            paddingTop: '20px',
            paddingLeft: '25px',
            alpha: 0.7,
            fontColor: '#505050',
            fontFamily: 'Arial',
            fontSize: '13px',
            fontStyle: 'italic',
            fontWeight: 'normal',
            height: '40px',
            textAlign: 'left'
          },
          legend: {
            margin: '80% 10% auto auto',
            backgroundColor: 'none',
            borderWidth: '0px',
            item: {
              alpha: 0.7,
              fontColor: '#505050'
            },
            layout: 'float',
            shadow: false,
            textAlign: 'left'
          },
          plot: {
            alphaArea: 1,
            hoverState: {
              visible: false
            },
            shadow: false,
            thousandsSeparator: ',',
            tooltipText: '%t views: %v'
          },
          plotarea: {
            marginTop: '80px',
            marginRight: '30px',
            marginBottom: '40px',
            marginLeft: '30px',
            backgroundColor: 'none'
          },
          scaleX: {
            values: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            guide: {
              visible: false
            },
            visible: false
          },
          scaleY: {
            guide: {
              visible: false
            },
            visible: false
          },
          series: [{
              text: '숙소',
              values: [],
              tooltip: {
                text: '%k: %v',
                padding: '0px 10px',
                backgroundColor: '#E25833',
                borderRadius: '6px',
                shadow: false
              },
              hoverMarker: {
                type: 'circle',
                backgroundColor: '#E25833',
                borderWidth: '1px',
                size: '6px'
              },
              legendMarker: {
                type: 'circle',
                backgroundColor: '#F4F4F4',
                borderColor: '#E25833',
                borderWidth: '1px',
                shadow: false,
                size: '5px'
              },
              lineColor: '#E25833',
              lineWidth: '2px',
              marker: {
                type: 'circle',
                backgroundColor: '#F4F4F4',
                borderColor: '#E25833',
                borderWidth: '1px',
                shadow: false,
                size: '5px'
              }
            },
            {
              text: '체험',
              values: [],
              tooltip: {
                text: '%k: %v',
                padding: '5px 10px',
                backgroundColor: '#5D7F13',
                borderRadius: '6px',
                shadow: false
              },
              hoverMarker: {
                type: 'circle',
                backgroundColor: '#5D7F13',
                borderWidth: '1px',
                size: '6px'
              },
              legendMarker: {
                type: 'circle',
                backgroundColor: '#F4F4F4',
                borderColor: '#5D7F13',
                borderWidth: '1px',
                shadow: false,
                size: '5px'
              },
              lineColor: '#5D7F13',
              lineWidth: '2px',
              marker: {
                type: 'circle',
                backgroundColor: '#F4F4F4',
                borderColor: '#5D7F13',
                borderWidth: '1px',
                shadow: false,
                size: '5px'
              }
            }
          ]
        }
      ]
    };
    zingchart.render({
      id: 'myChart',
      data: chartData,
      height: '100%',
      width: '100%',
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