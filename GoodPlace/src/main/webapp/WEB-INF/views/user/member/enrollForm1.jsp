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


        #content .enrollBox{
            width: 400px;
            height: 650px;
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
            margin: 10px 20px;
            padding: 0px 0px;
            font-size: 14px;
            color: #495056;
        }
        .form-group>div>.form-control{
            width: 372px;
            height: 40px;
            padding: 2px 12px;
            font-size: 14px;
        }
        .form-group .policy{
            font-size: 14px;
            margin-bottom: 8px;
        }
        

        .policyBox{
            width: 350px;
            margin: 0 auto;
            border: 1px solid lightgray;
        }
        .policyBox .policyText{
            margin: 20px 0;
            font-size: 14px;
        }

        label{
            padding-top:calc(.375rem + 1px);
            padding-bottom:calc(.375rem + 1px);
            margin-bottom:0;
            font-size:inherit;
            line-height:1.5;
        }
        /*하단 버튼*/

        .btns>.next{width:100px; height: 30px; border: 1px solid #2f89ff; border-radius: 4px; font-size: 15px;color: white; background-color: #2f89ff;}
        .btns>.next:hover{color: #2f89ff; background-color: white; font-weight: bold; border: 1px solid #2f89ff;}

        .btns>.cancle{width:80px; height: 30px; border: 1px solid #dbdbdb; border-radius: 4px; font-size: 15px;}
        .btns>.cancle:hover{background-color: white; border: solid 1px #dbdbdb;}


        .failed_Msg{
            visibility: visible !important;
        }
        
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../../common/menubar.jsp"/>
	
    <!-- content -->
    <div id="content" style="margin-bottom: 150px;">
        <h1 style="text-align: center; margin-top: 98px ;">회원가입</h1>
        <div class="enrollBox">
            <form id="enrollForm" action="enrollEmailForm2.me" method="post" onsubmit="">
                <div class="form-group">
                    <p for="userName">* 이름 </p>
                    <div>
                        <input type="text" class="form-control" id="userName" name="userName" placeholder="Please Enter Name" required><br>
                    </div>

                    <p for="email"> * 이메일 </p>
                    <div>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Please Enter Email" required><br>
                        <div id="checkResult" style="visibility:hidden; font-size:0.8em">ㅇ</div>
                    </div>

                    <p for="userPwd" style="margin-top: 0px;">* 비밀번호 </p>
                    <div>
                        <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="Please Enter Password" required><br>
                    </div>

                    <p for="checkPwd">* 비밀번호 확인 </p>
                    <div>
                        <input type="password" class="form-control" id="checkPwd" placeholder="Please Enter Password" required><br>
                    </div>

                    <p for="phone"> &nbsp; 핸드폰 </p>
                    <div>
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Please Enter Phone (-없이)" required><br>
                    </div>
                    <br>

                    <div class="policy" style="text-align: left;">
                        <input class="allCheck" type="checkbox"><b>전체 약관 동의</b>
                    </div>
                    

                    <div class="policyBox">
                        <div class="policyText">
                            <input class="subCheck" type="checkbox">
                            <a href="">
                                회원 가입 및 운영약관 동의
                                <img src="resources/images/user/info.JPG" width="15px" style="float: right;">
                            </a>
                        </div>
                        <div class="policyText">
                            <input class="subCheck" type="checkbox">
                            <a href="">
                                개인정보 수집 및 이용
                                <img src="resources/images/user/info.JPG" width="15px" style="float: right;">
                            </a>

                        </div>
                    </div>
                    <div class="policyMsg" style="color: crimson; margin-top: 10px; visibility: hidden;">
                        약관에 모두 동의 해야합니다.
                    </div>
                </div>

                <div class="btns" align="center">
                    <button class="cancle" type="reset"  class="btn btn-danger" style="margin-right: 30px;"> 초기화</button>
                    <button class="next" type="submit" id="enrollBtn" onclick="return allCheck();" class="btn btn-primary" disabled>회원가입</button>
                </div>
            </form>
        </div>
    </div>
    
    <!-- footer -->
	<jsp:include page="../../common/footer.jsp"/>
	
	<script>
	    function idCheckValidate(num){
	        
	        if(num == 1) { // 아이디 중복체크를 아직 안하는 경우 : 메세지 보여지지 않음 버튼 비활성화
	           
	           $("#checkResult").css("visibility", "hidden");
	           $("enrollBtn").attr("diasbled", true);
	           
	        }else if(num == 2){ // 아이디 중복체크 후 사용불가능한 아이디일 경우 : "중복아이디 존재 사용불가능" 메세지 보여짐, 버튼 비활성화
	           
	           $("#checkResult").css("color", "red").text("이미 가입된 이메일입니다.");
	           $("#checkResult").css("visibility", "visible");
	           $("#enrollBtn").attr("disabled", true);
	                        
	        }else{ // 아이디 중복체크 후 사용가능한 아이디일 경우 : "사용 가능한 아이디임" 메세지 보여짐, 버튼 활성화
	           
	           $("#checkResult").css("color", "green").text("사용 가능한 이메일입니다.");
	           $("#checkResult").css("visibility", "visible");
	           $("#enrollBtn").removeAttr("disabled");
	           
	        }
	     }
		
        $(function(){
			// 약관동의
            $('.allCheck').change(function(){
                if($('.allCheck').is(":checked")){
                    $('.subCheck').attr("checked", true);
                } else {
                    $('.subCheck').attr("checked", false);
                }
            });
            
         	// 이벤트 걸고자 하는 input 요소 변수에 기록해놓기
            var $emailInput = $("input[name=email]");
            
            $emailInput.keyup(function(){
          	 //console.log($idInput.val());
          	 if($emailInput.val().length >= 10){ // 적어도 아이디가 5글자 이상 되었을 때 본격적으로 중복체크
          		 $.ajax({
          			url:"emailCheck2.me",
          			data:{email:$emailInput.val()},
          			success:function(status){
          				
          				if(status == "fail"){ // 중복 아이디 존재 == 사용불가
          					idCheckValidate(2);
          				
          				} else { // 중복된 아이디 없음 == 사용가능
          					idCheckValidate(3);
          				}
          			}, error:function(){
          				console.log("아이디 중복체크용 ajax 통신 실패");
          			}
          		 });
          	 
          	 } else { // 중복체크 X
          		 idCheckValidate(1);
          	 }
          	 
            });
        });
        


        function allCheck() {
            if($('.subCheck').is(":checked")){
                $('.policyMsg').removeClass("failed_Msg");
                return true;
            } else {
                $('.policyMsg').addClass("failed_Msg");
                return false;
            }
        }

    </script>
</body>
</html>