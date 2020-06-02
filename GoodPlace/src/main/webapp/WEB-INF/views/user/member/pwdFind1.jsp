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
        #content .form-group>.text{
            font-size: 14px;
            color: #495056;
            text-align: left;
            margin: 0 11px;
            margin-bottom: 10px;
        }
        

        #content .pwdFindBox{
            width: 350px;
            height: 250px;
            background-color: #ffffff;
            margin: 0 auto;
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
            margin: 20px 20px;
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

        .pwdFindBox>form>div{
            text-align: center;
        }            
        /*로그인 버튼*/
        #sendBtn{
            border: 1px solid #1353c0;
            border-radius: 4px;
            font-size: 15px;
            color: white;
            background-color: #2f89ff;
        }
        #sendBtn:hover{
            color: #2f89ff; background-color: white; font-weight: bold; border: 1px solid #34538a;
        }

</style>
</head>
<body>

	<!-- header -->
	<jsp:include page="../../common/menubar.jsp"/>
	
    <!-- content -->
    <div id="content" style="margin-bottom: 150px;">
        <h1 style="text-align: center; margin-top: 98px ;">비밀번호 찾기</h1>
        <div class="pwdFindBox">
            <form id="formSub" action="emailCheck.me" method="post" onsubmit="">
                <div class="form-group">
                    <div class="text">
                        굿플레이스 가입 시 사용한 이메일 주소를 입력해 주시면 비밀번호를 재설정 할 수 있는 링크를 보내드립니다.
                    </div>
                    <p for="email" style="margin-bottom: 5px;"> 이메일 </p>
                    <div>
                        <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" required><br>
                    </div>
                </div>
                <div>
                    <input id="sendBtn"type="submit" value="이메일로 전송" style="width: 330px; height: 40px;">
                </div>
            </form>
        </div>
    </div>
    
            <!-- footer -->
	<jsp:include page="../../common/footer.jsp"/>
	
</body>
</html>