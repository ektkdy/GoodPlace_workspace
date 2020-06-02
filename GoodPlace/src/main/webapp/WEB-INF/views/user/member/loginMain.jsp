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
        #content .loginBox{
            width: 350px;
            height: 350px;
            background-color: #ffffff;
            text-align: center;
            margin: 150px auto;
            padding: 40px 40px;
            border: 1px solid lightgray;
        }

        #content .loginBox>div{
            text-align: center;
            margin: 0 auto;
        }

        #content .loginBox>div>b{
            font-size: 15px;
            color:gray;
        }

        #content .loginBox>div>b>a{
            text-decoration: none;
            color:gray;
        }
</style>
</head>
<body>

	<!-- header -->
	<jsp:include page="../../common/menubar.jsp"/>
	
    <!-- content -->
    <div id="content">
        <div class="loginBox">
            <div>
                <img src="resources/images/user/집로고.jpg" width="100px" height="100px" alt=""><br>
                <h1>Welcome back!</h1>
                <h2>여행의 모든 것, GoodPlace</h2>
            </div>
            <div>
                <a href="">카카오로 로그인</a> <br>
                <b>
                    <a href="">네이버</a> | <a href="loginEmailForm.me">이메일</a><br><br>
                    아직 회원이 아니신가요?
                </b>
                <a href="enrollForm.me" style="color: gray;"><b>회원가입</b></a>
            </div>
        </div>
    </div>
    
    	<!-- footer -->
	<jsp:include page="../../common/footer.jsp"/>
	
</body>
</html>