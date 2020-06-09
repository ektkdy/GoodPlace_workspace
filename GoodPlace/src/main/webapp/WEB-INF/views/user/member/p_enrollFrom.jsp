<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*공통*/
    /*content*/
    #content{
        clear: both;
        width: 1200px;
        height: auto;
        margin: 0 auto;
    }
    #contents{
        width: 1000px;
        margin: 0 auto;
        text-align: center;
    }
    
    /* font */
    *{font-family: 'Noto Sans KR', sans-serif;}
    /* 여백 초기화 */
     body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form {margin: 0; padding: 0;}
    /* a 링크 초기화 */
    a {color: #333333; text-decoration: none;}
    /* body css */
    body {background: #fff;}
    #wrap {width: 1200px; height: auto; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }
    .title_tt{
        font-size: 24px;
    }
    #contents{height: auto;}

    /*상단 이미지 두개*/
    #backgroundImg{position: relative; z-index: 1;}
    #personalImg{position: relative; z-index: 2; margin-left: 300px;}

    /* 중앙 박스(div#stepOne) 내부공통 css */
    #stepOne{border: 1px solid #dbdbdb;}
    table th{width: 200px; padding-top: 30px; padding-left: 70px; vertical-align: top;}
    table td{width: 500px; padding-top: 30px; padding-left: 50px;}
    table td label{font-size: 15px; padding-left: 10px; padding-right: 30px;}
    h5{color: cornflowerblue; padding-bottom: 5px;} /*중앙박스 외 상단에도 하나 있음*/
    table td textarea{width: 500px; height: 170px; border-radius: 4px; resize: none; border: 1px solid #dbdbdb;}
    table input[type=text]{width: 500px; height:30px; border-radius: 4px; border: 1px solid #dbdbdb;}
    select{width: 140px; height: 35px; border-radius: 4px; margin-bottom: 10px;}

    /*하단 버튼 css*/
    #btns{margin-top: 20px; margin-bottom: 20px; margin-right: 20px; text-align: center;}
    #btns>input{cursor: pointer;  width: 140px; height: 35px; }
    #cancle{border: 1px solid #dbdbdb; border-radius: 4px; font-size: 15px;}
    #cancle:hover{background-color: white; border: solid 1px #dbdbdb;}
    #next{border: 1px solid #34538a; border-radius: 4px; font-size: 15px;}
    #next:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    #next{color: white; background-color: #34538a;}
    #stepOne h5{
        text-align: left;
    }
    
    /* 프로필 이미지 등록 */
    #profileImg{
    	position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0;
    }

    #stepOne td>label{
    	display: inline-block;
    	padding: .5em .75em;
    	color: white;
    	font-size: inherit;
    	line-height: normal;
    	vertical-align: middle;
    	background-color: #468ccf;
    	cursor: pointer;
    	border: 1px solid #ebebeb;
    	border-bottom-color: #e2e2e2;
    	border-radius: .25em;
    }
    
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../../common/menubar.jsp"/>

	<!-- content -->
    <div id="wrap">
        <div id="contents" style="float: none;" >
            <div id="tab"></div>
			<form action="insertPartner.me" method="post" enctype="multipart/form-data">
			<input type="hidden" name="usNo" value=${ loginUser.usNo }>
			<input type="hidden" name="email" value="${ loginUser.email }">
            <br clear="both">
            <br><br>
            <div class="con" style="color:#000">
                <span id="page_title">
                    <p class="title_tt" style="float:none; text-align: center;">개인 파트너 등록</p>
                </span><br>
                <div id="stepOne">
                    <table>
                        <tr>
                            <th>* 프로필 이미지 </th>
                            <td style="text-align: left">
                            	<img id="imgProfile" src="${pageContext.request.contextPath}/resources/uploadFiles/userProfile/${loginUser.changeName}" width="100px" height="100px" style="border-radius: 50px; background-color: darkblue;">
                                <c:choose>
	                                <c:when test="${loginUser.changeName eq 'default.jpg'}"> <!-- 프로필이 기본사진일 경우 사진 필수 -->
	                                	<label for="profileImg">업로드</label>
	                                	<input id="profileImg" type="file" name="uploadFile" onchange="loadImg(this, 1);" required style="border-top-width: 10px;top: 290px;left: 575px;">
	                                </c:when>
	                                <c:otherwise>
	                                	<label for="profileImg">업로드</label>
	                                	<input id="profileImg" type="file" name="uploadFile" onchange="loadImg(this, 1);" style="border-top-width: 10px;top: 290px;left: 575px;">
	                                </c:otherwise>
                                </c:choose>

                            </td>
                        </tr>
                        <tr>
                            <th>* 파트너 이름 </th>
                            <td>
                                <input type="text" value="${ loginUser.userName }" readonly>    
                            </td>
                        </tr>
                        <tr>
                            <th>* 연락처</th>
                            <td>
                                <input type="text" name="phone" value="${ loginUser.phone }" required>
                                <h5>• 상시 연락할 수 있는 전화번호를 알려주시면 여행자에게 큰 도움이 됩니다.</h5>
                            </td>
                        </tr>
                        <tr>
                            <th>* 소개</th>
                            <td>
                                <textarea name="partnerIntro" required></textarea>
                                <h5>• 예약 확정 후 서로의 연락처가 공개됩니다.<br>
                                    • 안전 거래를 위해 파트너님의 개인 연락처 및 SNS 페이지를 기재할 경우 수정되거나 삭제될 수 있습니다.</h5>   
                            </td>
                        </tr>
                        <tr>
                            <th>파트너약관</th>
                            <td>
                                <div style="text-align: left; border: 1px solid lightgray;">
                                    파트너 약관<br>
                                    제 1장 목적 및 정의<br>
                                    제 1조 (목적)<br>
                                    봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는
                                </div>
                            </td>
                        </tr>
                    </table>
                    <input type="checkbox">
                   		 파트너 약관에 동의합니다.
                    <br>
                    <br>
                </div>
                <div id="btns">
                    <input id="next" type="submit" value="등록하기">
                </div>
            </div>
            </form>
        </div>
    </div>
    <br><br>
    <!-- footer -->
	<jsp:include page="../../common/footer.jsp"/>
	
	<script>
	    function loadImg(inputFile, num){
			// inputFile : 현재 변화가 생긴 input type="file" 요소	
			// num : 몇번째 input요소인지 확인 후 해당 영역에 미리보기하려고
			
			// file이 존재할 경우 --> input요소의 files속성인 배열의 0번 인덱스에 담김
			if(inputFile.files.length == 1){
				// 파일을 읽어들일 FileReader 객체 생성
				var reader = new FileReader();
				
				// 파일을 읽어주는 메소드 --> 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
				reader.readAsDataURL(inputFile.files[0]);
				
				// 파일 읽기가 다 완료되었을 때 실행할 메소드
				reader.onload = function(e){
					switch(num){
					case 1: $("#imgProfile").attr("src", e.target.result); break;
					}
				}
			}
		}
	</script>
</body>
</html>