<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
#roomList {
	width: 80%;
	float: left;
}

section {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}
  /* content 시작*/
        #content{
            clear: both;
            width: 1200px;
            height: 100%;
            margin: 0 auto;
        }
        #content div{
            box-sizing:border-box;
        }
        #content a{
            text-decoration: none;
        }

        #roomList{
            width:80%;
            float:left;
        }

        #content{
            clear: both;
            width: 1200px;
            margin: 0 auto;
            height: auto;
        }

        section {
            display:none;
            padding: 20px 0 0;
            border-top: 1px solid #ddd;
        }
        /* 마이리스트 메뉴바 */
        .tab_st{
            float:left;
            margin-left: 75px;
            width:1030px; 
            height:65px;
            background: #fff;
            box-shadow: -1px 0px 10px #e8e8e8;
            border-radius: 30px;
            }
        
        .tab_st input {
            display:none;
        }

        .tab_st button {
            height:45px;
            margin:10px 5px;
            float: left;
            width:160px;
            border-radius:25px;
            font-weight: 600;
            text-align:center;
            color:#333;
            background:#fff ;
            font-size: 15px;
            font-weight: 500;
            border: none;
        }
        .tab_st button:hover {
            cursor: pointer;
            background: #4f4ce7;
            color:#fff;
            font-weight:600;
        }

        .tab_st .button_on{
            background: #4f4ce7;
            color:#fff;
            font-weight:600;
        }

     
        /* content 끝*/

/* 마이리스트 메뉴바 */
.tab_st {
	margin-left: 75px;
	width: 1030px;
	height: 65px;
	background: #fff;
	box-shadow: -1px 0px 10px #e8e8e8;
	border-radius: 30px;
}

.tab_st input {
	display: none;
}

.tab_st button {
	height: 45px;
	margin: 10px 5px;
	float: left;
	width: 160px;
	border-radius: 25px;
	font-weight: 600;
	text-align: center;
	color: #333;
	background: #fff;
	font-size: 15px;
	font-weight: 500;
	border: none;
}

.tab_st button:hover {
	cursor: pointer;
	background: #4f4ce7;
	color: #fff;
	font-weight: 600;
}

.tab_st .button_on {
	background: #4f4ce7;
	color: #fff;
	font-weight: 600;
}

/* 마이리스트 메뉴바 끝*/
.common_tb {
	width: 980px;
	padding-top: 15px;
	margin: 0 auto;
}

.common_tb thead tr th, .common_tb tbody tr th {
	background-color: #f1f1f1;
	font-size: 18px;
	color: #333;
	padding: 10px 0;
	text-align: center;
	border-top: 1px solid #bebebe;
	border-bottom: 1px solid #bebebe;
}

.common_tb thead tr td {
	border-bottom: 1px solid rgb(241, 241, 241);
	font-size: 15px;
}

.common_tb tbody tr td {
	padding: 10px 0;
	text-align: center;
	border-bottom: 1px solid rgb(241, 241, 241);
	color: #505050;
	font-size: 15px;
}

.common_tb .category {
	font-size: 16px;
}

.common_tb .category>input {
	margin-left: 20px
}

.Btn {
	border: 0px;
	height: 30px;
	width: 120px;
	float: right;
	background-color: #1679c5;
	color: white;
	box-sizing: border-box;
	font-size: 18px;
	margin-top: 15px;
}

.disable {
	display: none;
}

/* content 끝*/
</style>
<body>

	<!-- header -->
	<jsp:include page="../common/menubar.jsp" />
	<!-- content -->
	<div id="content" style="height: 100%">
		<jsp:include page="../common/myPageMenubar.jsp" />
		<!-- 인기등록 숙소-->
			 <div id="content" style="height:100%">
       
        <!-- 인기등록 숙소-->
        <div id="roomList" style="width:100%; margin:0 auto;" >
            <div>
                <h1 style="width:1000px; padding-left:80px;">1:1문의</h1>
                
            </div>
            <form>
                <div>
                    <table class="common_tb" cellpadding="0" cellspacing="0" >
                        <thead>
                            <tr>
                                <th width="150px">상담구분</th>
                                <td class="category" colspan="3" width="600px">
                                    <span style="margin-left: 20px;">
                                        ${ b.inqCategory }
                                    </span>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr >
                                <th>제목</th>
                                <td style="text-align: left;">
                                    <span style="margin-left: 20px;">
                                        ${ b.inqTitle }
                                    </span>
                                </td>
                                <th style="width: 100px;">
                                    작성일
                                </th>
                                <td style="width: 200px;">
                                    ${ b. inqDate}
                                </td>
                            </tr>
                            <!-- 만약 상담 구분이 신고 였을경우 disable클래스 삭제-->
                            <tr class="roomsDisable " colspan="4">
                                <th>신고숙소</th>
                                <td colspan="3"style="text-align: left;">
                                    <span style="margin-left: 20px;">
                                        숙소이름 : 첫번째 숙소 이름 / 다녀간 날짜 : 2020-05-20
                                    </span>
                                </td>
                            </tr>
                            <tr style="width: 100px;">
                                <td colspan="4" style="height: 200px;">
                                    <div style="text-align: left; padding: 0 20px;">
                                       ${ b.inqContent}
                                    </div>
                                </td>
                            </tr>

                            <!-- 답변 -->
                            
                             <tr>
                                <td colspan="4" style="border: none; text-align: center; font-size: 16px; color:#1679c5"> 
                                    	<strong>답변</strong>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top:auto" colspan="4" style="border: none; text-align: center; font-size: 16px; color:#1679c5"> 
                                    ${ b.inqReContent }
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="height: 200px;">
                                    <div style="text-align: left; padding: 0 20px;">
                                     ${ $.inqReContent }
                                    </div>
                                </td>
                            </tr>
                            <!-- 답변 끝 -->

                            <tr>
                                <td colspan="4">
                                    <div>
                                        <input onclick="location.href='Binquery.bo'" type="button" class="Btn" value="목록" style="text-align: center; float: none; margin-top: 0px;">
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                </div>
            </form>
        </div>


    <!-- /content -->
    <br clear="both">
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp" />
	<script>
		$(function() {
			$('.category').click(function() {
				if ($("#declaration:checked").val() == "5") {
					$('.roomsDisable').removeClass("disable");
					$('.requiredOption').attr("required", true);
				} else {
					$('.roomsDisable').addClass("disable");
					$('.requiredOption').attr("required", false);
				}
			});

			$('.category').click(function() {
				if ($("#declaration1").is(":checked") == true) {
					$('.expDisable').removeClass("disable");
					$('.requiredOption1').attr("required", true);
				} else {
					$('.expDisable').addClass("disable");
					$('.requiredOption1').attr("required", false);
				}
			});

		});
	</script>
</body>
</html>