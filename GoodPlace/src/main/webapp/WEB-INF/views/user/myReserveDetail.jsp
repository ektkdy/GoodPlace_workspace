<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소검색 > 숙소상세</title>
    <style>
        #content{
            clear: both;
            width: 1200px;
            height: auto;
            margin: 0 auto;
        }

        .reserveData{
            width: 100%;
            height: 12%;
            font-size: 20px;

        }

        .sub{
            float: left; width: 30%;
            font-weight: 800;
            border-top: 1px solid lightgray;
            padding: 10px 0;
        }
        .con{
            float: left; width: 70%;
            text-align: left;
            border-top: 1px solid lightgray;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <!-- header -->
	<jsp:include page="../common/menubar.jsp"/>
	
	<!-- content -->
	<div id="content" style="text-align: center;">
		<jsp:include page="../common/myPageMenubar.jsp"/>
        <div style="width: 900px; text-align: center; margin: 0 auto;">
            <div style="text-align: right;">
                <input type="button" value="목록보기" onclick="location.href='ReserveForm.ro?'">
            </div>
            <div>
                <div style="float: left; width:40%; height: 400px; ">
                    <div style="width:100%; height:70%; padding:20px; box-sizing: border-box;">
                        <img src="${pageContext.request.contextPath}/resources/uploadFiles/${rp.changeName}" alt=""  style="width:100%; height:100%; 1px soild gray;">
                    </div>
                    <div style="width:100%; height:30%; font-size: 20px;">
                        	숙소이름 : <br>
                        	${ rp.roomsTitle }
                    </div>  
                </div>
                <div style="box-sizing: border-box; float: left; width: 60%; height: 400px;">
                    <div class="reserveData">
                        <div class="sub">
                           	예약번호
                        </div>
                        <div class="con">
                            ${ rp.rpNo }
                        </div>
                    </div>           
                    <div class="reserveData">
                        <div class="sub">
                           	예약일자
                        </div>
                        <div class="con">
                            ${ rp.startDays } ~ ${ rp.endDays }
                        </div>
                    </div>  
                    <div class="reserveData">
                        <div class="sub">
                          	 예약인원
                        </div>
                        <div class="con">
                            ${ rp.people }
                        </div>
                    </div>  
                    <div class="reserveData">
                        <div class="sub">
                            	여행컨셉
                        </div>
                        <div class="con" >
                            ${ rp.concept }
                        </div>
                    </div>  
                    <div class="reserveData">
                        <div class="sub">
                            	요청사항
                        </div>
                        <div class="con">
                            ${ rp.request }
                        </div>
                    </div>  
                    <div class="reserveData">
                        <div class="sub" style="border-bottom: 1px solid lightgray;">
                            	결제금액
                        </div>
                        <div class="con" style="border-bottom: 1px solid lightgray;">
                            ${ rp.amount }
                        </div>
                    </div>  
                    <div class="reserveData">
                        <div class="sub" style="border-bottom: 1px solid lightgray;">
                            	결제일자
                        </div>
                        <div class="con" style="border-bottom: 1px solid lightgray;">
                            ${ rp.payDate }
                        </div>
                    </div>  
                </div>
            </div>
            <div style="text-align: left">
            	<input type="button" onclick="window.open('roomChatForm.ro?email=${loginUser.email}&roNo='+'${ rp.roNo }', '_blank', 'width=1000px,height=800px,toolbars=no,scrollbars=no')" value="1:1채팅">
            </div>
            
        </div>
    </div>
    
   	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	

</body>
</html>