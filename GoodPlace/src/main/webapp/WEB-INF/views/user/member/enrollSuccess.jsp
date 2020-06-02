<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 /*content*/
        #content{
            clear: both;
            width: 1200px;
            margin: 0 auto;
            height: auto;
        }
        #content{
            text-align: center;
        }

        #content>input{
            margin-top: 50px;
            width: 200px;
            height: 60px;
            font-weight: 600;
            font-size: 25px;
            border: 1px solid #2f89ff; border-radius: 4px; color: white; background-color: #2f89ff;
        }
        #content>input:hover{color: #2f89ff; background-color: white; font-weight: bold; border: 1px solid #2f89ff;}

</style>
</head>
<body>
    <!-- footer -->
	<jsp:include page="../../common/menubar.jsp"/>
	
	<!-- content -->
    <div id="content" style="margin-bottom: 150px;">
        <h1 style="margin-top: 100px ;">굿플레이스의 회원이 되신것을 축하드립니다.</h1>
        <p>로그인 후 서비스 이용이 가능합니다.</p>

        <input onclick="location.href='loginForm.me'"type="button" value="로그인">
    </div>
    <!-- footer -->
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>