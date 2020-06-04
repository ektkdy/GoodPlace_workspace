<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
                <h1>반갑습니다!</h1>
                <h2>여행의 모든 것, GoodPlace</h2>
            </div>
            <div>
                <a id="kakao-enroll-btn"></a>
				<a href="http://developers.kakao.com/logout"></a>
                <br>
                <b>
                    <a href="">네이버</a> | <a href="enrollEmailForm1.me">이메일</a><br><br>
                   	이미 아이디가 있으신가요?
                </b>
                <a href="loginForm.me" style="color: gray;"><b>로그인</b></a>
            </div>
        </div>
    </div>
    <form id="kakaoEnroll" action="kakaoEnroll.me">
    	<input id="kakaoEmail" type="hidden" name="email" value="">
    	<input id="kakaoName" type="hidden" name="userName" value="">
    	<input id="kakaoPwd" type="hidden" name="userPwd" value="">
    </form>
    <!-- footer -->
	<jsp:include page="../../common/footer.jsp"/>
	
	<script type="text/javascript">
	
	  // input your appkey
	  Kakao.init('62fda0bf46ca2ad372f7f5e69d04a01e')
	  Kakao.Auth.createLoginButton({
	    container: '#kakao-enroll-btn',
	    success: function(authObj) {
	      Kakao.API.request({
	        url: '/v2/user/me',
	        success: function(res) {
	          console.log(res.kakao_account['email']);
	          console.log(res.properties['nickname']);
	          $("#kakaoEmail").val(res.kakao_account['email']);
	          $("#kakaoName").val(res.properties['nickname']);
	          $("#kakaoPwd").val(res.id);
	          $("#kakaoEnroll").submit();
	        },
	        fail: function(error) {
	          alert(
	            'login success, but failed to request user information: ' +
	              JSON.stringify(error)
	          )
	        },
	      })
	    },
	    fail: function(err) {
	      alert('failed to login: ' + JSON.stringify(err))
	    },
	  });

	</script>
</body>
</html>