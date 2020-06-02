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
            height: 400px;
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

        /*비밀번호 확인 메세지*/
        .certify_Msg{
            visibility:hidden;
            text-align: center;
        }
        .failed_Msg{
            visibility: visible !important;
            color: crimson;
        }

        /*전송 버튼*/
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
            <form action="updatePwd.me" method="post" onsubmit="">
            	<input type="hidden" name="email" value=${ email }>
                <div class="form-group">
                    <div class="text">
                        <b>유의사항</b><br>
                        <p>
                            - 6자~15자 길이로 만들어주세요. <br>
                            - 영문 대/소문자, 숫자, 특수 문자 2가지를 조합해주세요 <br>
                            - 3자 이상 연속/동일한 문자, 숫자는 사용할 수 없습니다.

                        </p>
                    </div>
                    <p for="newPwd1" style="margin-bottom: 5px;"> 새 비밀번호 </p>
                    <div>
                        <input type="password" class="form-control" id="newPwd1" name="userPwd" placeholder="새로운 비밀번호를 입력하세요" required><br>
                    </div>
                    <p for="newPwd2" style="margin-bottom: 5px;"> 새 비밀번호 확인 </p>
                    <div>
                        <input type="password" class="form-control" id="newPwd2" name="newPwd2" placeholder="새로운 비밀번호를 입력해주세요" required><br>
                    </div>
                    <div class="certify_Msg">
                      	  비밀번호가 일치하지 않습니다.
                    </div>
                </div>
                <div>
                    <input type="submit" onclick="return pwdCheck();" id="sendBtn" value="이메일로 전송" style="width: 330px; height: 40px;">
                </div>
            </form>
        </div>
    </div>
    
        <!-- footer -->
	<jsp:include page="../../common/footer.jsp"/>
    <script>
        function pwdCheck(){
            if($('#newPwd1').val() == $('#newPwd2').val()){
                return true;
            } else {
                $('.certify_Msg').addClass("failed_Msg");
                
                return false;
            }
        }

    </script>
</body>
</html>