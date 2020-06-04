<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
        /*이벤트 리스트*/
        .eventPage{
            text-align: center;
        }
        .eventBox{
            margin: 20px auto;
            width: 840px;
            height: 220px;
            background-color: rgb(247, 144, 144);
            color: white;
        }
        .eventBox>.event{
            font-size: 16px;
            font-weight: 900;
            float: left;
            width: 33%;
            height: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        /*버튼*/
        #detailBtn{width: 150px; height: 50px; ;border: 1px solid #ffffff; border-radius: 4px; font-size: 15px;color: #2f89ff; background-color: #ffffff;}
        #detailBtn:hover{color: #ffffff; background-color: #2f89ff; font-weight: bold; border: 1px solid #2f89ff;}


</style>
</head>
<body>
    <!-- header -->
	<jsp:include page="../../common/menubar.jsp"/>
    <!-- content -->
    <br>
    <div id="content" style="margin-bottom: 100px;">
        <jsp:include page="../../common/searchbar.jsp"/>
        <div class="eventPage">
            <h1>이벤트</h1>
            <div class="eventBox">
                <div class="event img">
                   <img src="${pageContext.request.contextPath}/resources/images/user/굿플레이스로고02.jpg" width="100%" height="100%">
                </div>
                <div class="event title">
                    <div style="height: 40%;"></div>
                    <div style="height: 20%;">국내 최초, 굿플레이스 단독 혜택</div>
                    <div style="height: 40%;">최대 50,000포인트 받기 현금처럼 사용 가능한 굿플레이스 포인트 지급</div>
                </div>
                <div class="event point">
                    <p style="font-size: 30px;">50,000ⓟ</p>
                    <input id="detailBtn" type="button" value="포인트받기" style="font-size: 20px; font-weight: 600;">
                </div>
            </div>

            <div class="eventBox">
                <div class="event img">
                   <img src="${pageContext.request.contextPath}/resources/images/user/굿플레이스로고02.jpg" width="100%" height="100%">
                </div>
                <div class="event title">
                    <div style="height: 40%;"></div>
                    <div style="height: 20%;">국내 최초, 굿플레이스 단독 혜택</div>
                    <div style="height: 40%;">최대 50,000포인트 받기 현금처럼 사용 가능한 굿플레이스 포인트 지급</div>
                </div>
                <div class="event point">
                    <p style="font-size: 30px;">50,000ⓟ</p>
                    <input id="detailBtn" type="button" value="포인트받기" style="font-size: 20px; font-weight: 600;">
                </div>
            </div>

            <div class="eventBox">
                <div class="event img">
                   <img src="${pageContext.request.contextPath}/resources/images/user/굿플레이스로고02.jpg" width="100%" height="100%">
                </div>
                <div class="event title">
                    <div style="height: 40%;"></div>
                    <div style="height: 20%;">국내 최초, 굿플레이스 단독 혜택</div>
                    <div style="height: 40%;">최대 50,000포인트 받기 현금처럼 사용 가능한 굿플레이스 포인트 지급</div>
                </div>
                <div class="event point">
                    <p style="font-size: 30px;">50,000ⓟ</p>
                    <input id="detailBtn" type="button" value="포인트받기" style="font-size: 20px; font-weight: 600;">
                </div>
            </div>
        </div>
    </div><!-- /content -->
    
        <!-- footer -->
	<jsp:include page="../../common/footer.jsp"/>

</body>
</html>