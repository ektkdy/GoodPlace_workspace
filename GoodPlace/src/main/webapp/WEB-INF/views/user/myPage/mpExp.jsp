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
            
     <h1 style="width:200px; float: left;">나의 체험</h1>
<!--             <select name="status" style="float: right; width:200px;">
                <option>진행중인 예약</option>
                <option>승인대기 예약</option>
            </select> -->
        </div>
        <hr width="1000px">
        <div style="margin: 20px auto; text-align: center; width: 1000px; height: 1000px;">
        	<c:forEach items="${ ePayList }" var="ePayList">
        		<div>	
	                <form id="submitDetail" action="myExperienceDetail.exp" method="post">
	        			<input type="hidden" name="epNo" value="${ ePayList.epNo }">
	        			<input type="hidden" name="exNo" value="${ ePayList.exNo }">
	        			<input type="hidden" name="usNo" value="${ ePayList.usNo }">
	        			<input type="hidden" name="amount" value="${ ePayList.amount }">
	        			<input type="hidden" name="payDate" value="${ ePayList.payDate }">
	        			<input type="hidden" name="expDate" value="${ ePayList.expDate }">
	        			<input type="hidden" name="people" value="${ ePayList.people }">
	        			<input type="hidden" name="status" value="${ ePayList.status }">
	        			<input type="hidden" name="expClassNo" value="${ ePayList.expClassNo }">
	        			<input type="hidden" name="people" value="${ ePayList.expTitle }">
	        			<input type="hidden" name="changeName" value="${ ePayList.changeName }">
	        			<input type="hidden" name="supplies" value="${ ePayList.supplies }">
	        			<input type="hidden" name="useTime" value="${ ePayList.useTime }">
	        			<input type="hidden" name="addBasic" value="${ ePayList.addBasic }">
	   
	        		</form>
	        		<div id="detailView" style="border: 1px solid lightgray; margin: 0 30px; height: 200px;">
		               	<dvi style="float: left; width: 30%; height: 200px; background-color: gray;">
		                	<img src="${pageContext.request.contextPath}/resources/uploadFiles/${ePayList.changeName}" width="100%" height="100%" style="padding: 10px; box-sizing: border-box;">
		               	</dvi>
		                
		                <div style=" width: 50%; height: 200px; text-align: left; float: left; padding: 30px 30px; box-sizing: border-box;">
		                    <div style="box-sizing: border-box;  height: 20%; font-size: 20px; font-weight: 700;">
		                        ${ ePayList.expTitle }
		                    </div>
		                    <div style="box-sizing: border-box;  height: 60%; font-size: 16px;">
		                    	
		                    </div>
		                    <div style="box-sizing: border-box;  height: 20%; font-size: 15px;">
		                        ${ ePayList.expDate }
		                    </div>
		                </div>
		                <div style="width: 20%; height: 100%; box-sizing: border-box; float:right;">
		                	<div style="width: 150px; height: 40px; margin: 83px 20px; border: 1px solid gray; font-size:25px;">
					        	완료된예약
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