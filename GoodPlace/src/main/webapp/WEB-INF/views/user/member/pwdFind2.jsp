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
            margin: 0 auto;
            height: auto;
        }
        #content .enrollBox{
            width: 400px;
            height: 300px;
            background-color: #ffffff;
            margin: 0 auto;
            border: 1px solid lightgray;
        }
        
        /*이메일 인증(박스)*/
        .enrollBox>div{
            height: 40px;
            width: 100%;
            text-align: center; 
            background-color: #1679c5;
            color: white;
            font-size: 24px;
            font-weight: 500;
            padding: 10px 0;
            vertical-align: middle;
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
            margin-top: 20px;
        }
        .certify>div{
            margin: auto;
            text-align: center;
            margin-top: 10px;
            border: 1px solid lightgray;
            width: 215px;
            height: 39px;
        }
        .certify>div>input{
            float: left;
            width: 140px;
            padding-top: 1px;
            padding-left: 5px;
            padding-right: 5px;
            font-size: 26px;
            border:none;

        }
        .certify>div>.certify_Btn{
            border: 0px;
            height: 100%;
            width: 60px;
            float: right;
            background-color: #1679c5;
            color: white;
            box-sizing: border-box;
            font-size: 18px;
        }

        /*라벨*/
        .certify>p{
            text-align: center;
            margin: 10px 20px;
            padding: 0px 0px;
            font-size: 14px;
        }
        /*텍스트박스*/
        .form-group>div>.form-control{
            text-align: center;
            width: 190px;
            height: 40px;
            padding: 2px 12px;
            font-size: 14px;
        }

        label{
            padding-top:calc(.375rem + 1px);
            padding-bottom:calc(.375rem + 1px);
            margin-bottom:0;
            font-size:inherit;
            line-height:1.5;
        }

        .certify_Msg{
            visibility:hidden;
            text-align: center;
        }
        .success_Msg{
            visibility: visible !important;
            color: blue;
        }
        .failed_Msg{
            visibility: visible !important;
            color: crimson;
        }

        /*하단 버튼 2개*/
        .btns>button{
            width: 80px;
            height: 30px;
            margin: 0 20px;
        }
        .btns>.next{border: 1px solid #2f89ff; border-radius: 4px; font-size: 15px;color: white; background-color: #2f89ff;}
        .btns>.next:hover{color: #2f89ff; background-color: white; font-weight: bold; border: 1px solid #2f89ff;}

        .btns>.cancle{border: 1px solid #dbdbdb; border-radius: 4px; font-size: 15px;}
        .btns>.cancle:hover{background-color: white; border: solid 1px #dbdbdb;}

        .btns>.disable{border: 1px solid #dbdbdb; border-radius: 4px; font-size: 15px; background-color: rgb(240, 240, 240); color: gray;}
        
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../../common/menubar.jsp"/>
	
    <!-- content -->
    <div id="content" style="margin: 150px 0px;">
        <div class="enrollBox">
            <div>
                이메일 인증
            </div>
            <form action="pwdResetForm.me" method="post" onsubmit="">
                <div class="form-group">
                    <div>
                        <input type="text" class="form-control" name="email" value=${ email } readonly><br>
                    </div>
                </div>
                <div class="certify">
                    <p for="userName">이메일로 인증번호를 발송했습니다! </p>
                    <div>
                        <input class="certify_input" maxlength="6" style="height: 36px; width: 145px; text-align: center;" type="text" class="form-control"  placeholder="" required>
                        <input class="certify_Btn" type="button" onclick="certify_check();" style="margin: 0px;" value="인증">
                    </div>
                </div>
                <div class="certify_Msg">
                    	인증번호가 일치하지 않습니다.
                </div>



                <br>
                <div class="btns" align="center">
                    <button class="cancle" type="reset" class="btn btn-primary">뒤로</button>
                    <button class="next_Btn disable" type="submit" class="btn btn-danger" disabled>확인</button>
                </div>
            </form>
        </div>
    </div>
    <!-- footer -->
	<jsp:include page="../../common/footer.jsp"/>
	<script>
        // 인증번호 체크 스크립트
        function certify_check(){
            if( $('.certify_input').val() == '${random}'){ // 인증번호(랜덤)
                $('.certify_Msg').text("인증 성공!");
                $('.certify_Msg').removeClass("failed_Msg");
                $('.certify_Msg').addClass("success_Msg");
                $('.next_Btn').addClass("next");
                $('.next_Btn').removeClass('disable');
                $('.next_Btn').attr("disabled",false);
                $('.certify_Btn').attr("disabled",true);
                $('.certify_input').attr("readonly", true);
                $('.certify_Btn').css("background-color","lightgray");
            } else {
                $('.certify_Msg').text("인증에 실패하였습니다.");
                $('.certify_Msg').removeClass("success_Msg");
                $('.certify_Msg').addClass("failed_Msg");
            }
        }

    </script>
</body>
</html>