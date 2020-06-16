<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* 페이징바 시작 */ 
        .pagingBar{
            width:100%;
            margin:30px auto; 
            height: 60px; 

            text-align:center;
            float:left;
        }
        .pagingBar button{
            width:40px;
            height:40px;
            color:gray;
            border-radius: 5px;
            background-color: fff;
            border:1px solid #dcdcdc;
        }
        /* 페이징바 끝 */
        a {
            margin: 0 0 20px;
            line-height:1.5;;
        }
        #content{
            clear: both;
            width: 1200px;
            margin: 0 auto;
            height: auto;
        }

        section {
            display:none;
            padding: 20px 0 0;
            border-top: 1px solid #ddd;
        }
        .tab_st{
            float:left;
            margin-left: 75px;
            width:1030px; 
            height:65px;
            background: #fff;
            box-shadow: -1px 0px 10px #e8e8e8;
            border-radius: 30px;
            }
        
        .tab_st input {
            display:none;
        }

        .tab_st button {
            height:45px;
            margin:10px 5px;
            float: left;
            width:160px;
            border-radius:25px;
            font-weight: 600;
            text-align:center;
            color:#333;
            background:#fff ;
            font-size: 15px;
            font-weight: 500;
            border: none;
        }
        .tab_st button:hover {
            cursor: pointer;
            background: #4f4ce7;
            color:#fff;
            font-weight:600;
        }

        .tab_st .button_on{
            background: #4f4ce7;
            color:#fff;
            font-weight:600;
        }
        /* content 끝*/
    </style>
</head>
<body>
	
	<!-- header -->
	<jsp:include page="../common/menubar.jsp"/>
	
    <!-- content -->
    <div id="content" class="main" style="text-align: center;">
       
        <div style=" width:1000px; margin-left: 100px;">
            <jsp:include page="../common/myPageMenubar.jsp"/>
        <h1 style="width:200px; float: left;">나의 예약</h1>
            
<!--             <select name="status" style="float: right; width:200px;">
                <option>진행중인 예약</option>
                <option>승인대기 예약</option>
            </select> -->
        </div>
        <hr width="1000px">
        <div style="margin: 20px auto; text-align: center; width: 1000px; height: 1000px;">
        	<c:forEach items="${ rPayList }" var="rPayList">
	        	<div>
	        		<form id="submitDetail" action="myReserveDetail.ro" method="post">
	        			<input type="hidden" name="rpNo" value="${ rPayList.rpNo }">
	        			<input type="hidden" name="roNo" value="${ rPayList.roNo }">
	        			<input type="hidden" name="userNo" value="${ rPayList.userNo }">
	        			<input type="hidden" name="amount" value="${ rPayList.amount }">
	        			<input type="hidden" name="brithDate" value="${ rPayList.brithDate }">
	        			<input type="hidden" name="payDate" value="${ rPayList.payDate }">
	        			<input type="hidden" name="addPoint" value="${ rPayList.addPoint }">
	        			<input type="hidden" name="checkIn" value="${ rPayList.checkIn }">
	        			<input type="hidden" name="reserveStatus" value="${ rPayList.reserveStatus }">
	        			<input type="hidden" name="usePoint" value="${ rPayList.usePoint }">
	        			<input type="hidden" name="people" value="${ rPayList.people }">
	        			<input type="hidden" name="concept" value="${ rPayList.concept }">
	        			<input type="hidden" name="request" value="${ rPayList.request }">
	        			<input type="hidden" name="startDays" value="${ rPayList.startDays }">
	        			<input type="hidden" name="endDays" value="${ rPayList.endDays }">
	        			<input type="hidden" name="roomsTitle" value="${ rPayList.roomsTitle }">
	        			<input type="hidden" name="changeName" value="${ rPayList.changeName }">
	        		</form>
		            <div id="detailView" style="border: 1px solid lightgray; margin: 0 30px; height: 200px;">            
		                <dvi style="float: left; width: 30%; height: 200px; background-color: gray;">
		                    <img src="${pageContext.request.contextPath}/resources/uploadFiles/${rPayList.changeName}" width="100%" height="100%" style="padding: 10px; box-sizing: border-box;">
		                </dvi>
		                
		                <div style=" width: 50%; height: 200px; text-align: left; float: left; padding: 30px 30px; box-sizing: border-box;">
		                    <div style="box-sizing: border-box;  height: 20%; font-size: 20px; font-weight: 700;">
		                        ${ rPayList.roomsTitle }
		                    </div>
		                    <div style="box-sizing: border-box;  height: 60%; font-size: 16px;">
		                    	${rPayList.concept }
		                    </div>
		                    <div style="box-sizing: border-box;  height: 20%; font-size: 15px;">
		                        ${ rPayList.startDays } ~ ${ rPayList.endDays }
		                    </div>
		                </div>
		                <div style="width: 20%; height: 100%; box-sizing: border-box; float:right;">
		                	<div style="width: 150px; height: 40px; margin: 83px 20px; border: 1px solid gray; font-size:25px;">
					        	완료된예약
					    		<button>후기작성</button>
					    	</div>
					    	
					    </div>
		            </div>
		            <hr style="clear: both; margin: 20px 0;">
	            </div>
			</c:forEach>
            
        </div>
        
        
        <hr width="1000px;">
    </div>
   
</div>
   <!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
    
    <script>
    	$("#detailView").click(function(){
    		$(this).siblings().eq(0).submit();
    	});
    </script>
</body>
</html>