<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ 상세 > 상품문의</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="../main_css/jquery.bxslider.css">
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/jquery.bxslider.js"></script>
    <style>

        /* content 스타일 시작*/
        /* 여백 초기화 */
        body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form {margin: 0; padding: 0;}
	    #listArea p{
            padding:5px;
        }
        #content{
            clear: both;
            width: 1200px;
            margin: 0 auto;
            height: auto;
        }
        #content>div div{
            float:left; 
            box-sizing: border-box;
        }
        .alignCenter{
            vertical-align: middle;
            text-align: center;
        }
        .biotoreGroup>div *{
            margin:0px;
        }
        .biotoreGroup h3{
            font-weight: 2000;
        }
        .backgroundGray{
            background-color:rgba(24, 76, 136, 0.33);
        }
        .buttonStyle1{
            border-radius: 5px;
            background-color:rgb(24, 76, 136);
            color:white;
            font-size: 1.5em;
            height:60px;
            width: 350px;
            border:none;
        }
        #content .list li{
            list-style:none;
            margin: 10px 0;
        }
        #content #listArea .hide{
            display:none;
        }
        /* content 스타일 끝*/

    </style>
</head>
<body>
    <!-- header -->
	<jsp:include page="../common/menubar.jsp"/>

    <!-- content -->
    <div id="content">
            <div style="width:100%; height:140px;" class="alignCenter backgroundGray">
                <h1 style="font-weight:4000; font-size:2.5em;  padding-top:40px;">자주묻는 질문 FAQ</h1>
            </div>
           
            <div style="width:100%; margin-top:60px;">
                
                <div style="width:1000px; margin:0 100px; ">
                   <div style="width:100%; height: 60px; ">
                        <div style="width:50%; height:100%; "><h2 style="margin:2%;">상품문의</h2></div>
                        <div style="width:50%; height:100%; text-align: right; "> <button class="buttonStyle1" style="width:90px; height:30px; font-size: 80%; margin: 12px 5px;">목록으로</button></div>
                    </div>
                    <hr>
                    <div style="width:100%;" class="list">
                        <ul id="listArea">
                            <li><h4>계정 탈퇴는 어떻게 하나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>로그인 이메일 주소를 변경하고 싶어요.</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>비밀번호/계정을 잊어버렸는데 초기화 할수 있나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>회원가입은 어떻게 하나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>로그인 이메일 주소를 변경하고 싶어요.</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>계정 탈퇴는 어떻게 하나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>비밀번호/계정을 잊어버렸는데 초기화 할수 있나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                            <li><h4>회원가입은 어떻게 하나요?</h4></li><hr><div id="addExplain" class="hide" style="width:100%; height:200px; border:1px solid gray;"><p>이메일로 받으신 비밀번호 재설정 링크를 통해 비밀번호 설정을 변경하신 후, 재로그인 해주시기 바랍니다.<br><br>비밀번호 변경이 어려우신 경우 아래의 "고객센터 문의하기"를 통해 고객센터로 접수해주세요.<br>* 로그인 이메일 계정 주소를 잊어버리신 경우, 페이지 하단의 콘텐츠를 참고해주세요.<br><br>1. 로그인 페이지의 비밀번호 찾기<br>2. 이메일 계정 입력 후, 해당 계정에서 비밀번호 재설정 메일 확인<br>3. 비밀번호 재설정후, 재로그인</p></div>
                        </ul>
                    </div>
                </div>
                <br style="clear:both;">
            </div>
            <div style="width:100%; height:120px; color:gray; margin:60px auto;" class="biotoreGroup">
                <div style="width:100%; height:40px; text-align: center;">
                    <h3>찾는 내용이 없으신가요?</h3>
                </div>
                <div style="width:100%; height:80px; text-align: center;">
                    <button class="buttonStyle1">1:1문의 하러 가기</button>
                </div>
            </div>
    </div>

    <script>
        // html dom 이 다 로딩된 후 실행된다.
        $(document).ready(function(){
            // "로그인 이메일 주소를 변경하고 싶어요." 같은 li를 클릭했을때
            $("#content #listArea li").click(function(){
                var submenu = $(this).next().next();
                var hideHr = $(this).next();
                // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
                if( submenu.is(":visible") ){
                    submenu.slideUp();
                    hideHr.toggleClass('hide');
                }else{
                    submenu.slideDown();
                    hideHr.toggleClass('hide');
                }
            });
        });
    </script>

    <!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>