<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>
    <style>
        /* content 스타일 시작*/
        /* 여백 초기화 */
        body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form {margin: 0; padding: 0;}
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
        /* content 스타일 끝*/

    </style>
</head>
<body>

    <!-- header -->
	<jsp:include page="../common/menubar.jsp"/>

    <!-- content -->
    <div id="content">
            <div style="width:100%; height:140px;" class="alignCenter backgroundGray">
                <h1 style="font-weight:4000; font-size:2.5em; padding-top:40px;">자주묻는 질문 FAQ</h1>
            </div>
           
            <div style="width:100%; height:500px; margin-top:60px;">
                
                <div style="width:35%; height:auto; margin-left:14%; margin-right:4%;" class="biotoreGroup">
                    <div style="width:100%; height:auto;">
                        <h3>공지사항</h3><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                    </div>
                    <div style="width:100%; height:auto;">
                        <h3>일반문의</h3><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                    </div>
                    <div style="width:100%; height:auto;">
                        <h3>예약방법</h3><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                    </div>
                </div>
                
                <div style="width:35%; height:auto;" class="biotoreGroup">
                    <div style="width:100%; height:auto;">
                        <h3>취소환불</h3><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                    </div>
                    <div style="width:100%; height:auto;">
                        <h3>상품문의</h3><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                    </div>
                    <div style="width:100%; height:auto;">
                        <h3>파트너등록</h3><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                        <p>무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 </p><br>
                    </div>
                </div>
                
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


    <!-- footer -->
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>