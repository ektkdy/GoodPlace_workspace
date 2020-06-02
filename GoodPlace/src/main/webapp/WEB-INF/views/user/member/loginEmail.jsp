<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            height: auto;
            margin: 0 auto;
        }
        #content .loginBox{
            width: 350px;
            height: 350px;
            background-color: #ffffff;
            margin: 150px auto;
            padding: 40px 40px;
            border: 1px solid lightgray;
        }
        .form-group{
            -ms-flex:0 0 auto;
            flex:0 0 auto;
            -ms-flex-flow:row wrap;
            flex-flow:row wrap;
            -ms-flex-align:center;
            align-items:center;
            margin-bottom:1rem;
        }

        .form-group>div{
            margin: auto;
            text-align: center;
        }
        .form-group>p{
            float: left;
            margin: 10px 20px;
            padding: 0px 0px;
            font-size: 14px;
            color: #495056;
        }
        .form-group>div>.form-control{
            width: 300px;
            height: 40px;
            padding: 2px 12px;
            font-size: 14px;
        }

        .loginBox>form>div{
            text-align: center;
        }            
        /*로그인 버튼*/
        #loginBtn{
            border: 1px solid #2f89ff; border-radius: 4px; font-size: 15px;color: white; background-color: #2f89ff;
        }
        #loginBtn:hover{
            color: #2f89ff; background-color: white; font-weight: bold; border: 1px solid #2f89ff;
        }
</style>
</head>
<body>

	<!-- header -->
	<jsp:include page="../../common/menubar.jsp"/>
	
    <!-- content -->
    <div id="content">
        <div class="loginBox">
            <form action="login.me" method="post" onsubmit="">
                <div class="form-group">
                    <p for="userName"> 이메일 </p>
                    <div>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Please Enter Name" required><br>
                    </div>

                    <p for="email"> 비밀번호 </p>
                    <div>
                        <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="Please Enter Email"><br>
                    </div>
                </div>
                <div  style="margin-top:20px">
                    <span style="float: left;"> 
                        <input type="checkbox">로그인 상태 유지
                    </span>
                    <span style="float: right;"><a href="#">비밀번호 찾기</a></span>
                </div>
                <div>
                    <input id="loginBtn"type="submit" value="이메일로 로그인" style="width: 330px; height: 40px; margin-top:20px">
                </div>
                <div style="margin-top:20px">
                    <p>아직 회원이 아니신가요? <a href="enrollForm.me">회원가입</a></p>
                </div>
            </form>
        </div>
    </div>
        <!-- footer -->
	<jsp:include page="../../common/footer.jsp"/>
	
</body>
</html>