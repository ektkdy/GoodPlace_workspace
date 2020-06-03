<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/adminCommon.css" />
<style>
    /*공통*/
    /* font */
    *{font-family: 'Noto Sans KR', sans-serif;}
    /* 여백 초기화 */
     body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form {margin: 0; padding: 0;}
    /* a 링크 초기화 */
    a {color: #333333; text-decoration: none;}
    /* body css */
    body {background: #fff;}
    #wrap {width: 1200px; margin: 0 auto; height: 900px; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }

    /*모든 버튼*/
    button{cursor: pointer; width: 140px; height: 35px; border-radius: 6px; border: 1px solid #34538a; background-color: #34538a; color: #fff;}
    button:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    .modifiyBtn{width:70px;}

    .lt_tab{border-radius: 0px;}

    .gt_tab{border-radius: 0px;}

    #blue_btn1{
        font-size: 1.0em;
        height: 50px;
        border-radius: 0px;
        border-top-left-radius: 6px;
        border-bottom-left-radius: 6px;
    }
    #blue_btn2:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    #blue_btn2 {
        font-size: 1.0em;
        color:black;
        background: #dbdbdb;
        border: 1px solid #dbdbdb;
        margin-right: 500px;
        height: 50px;
        border-radius: 0px;
        border-top-right-radius: 6px;
        border-bottom-right-radius: 6px;
    }
    #delete_btn{
        color:black;
        background: #dbdbdb;
        border: 1px solid #dbdbdb;
    }
    #delete_btn:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}

    /*content*/
    .con3{
        width:600px;
        height:300px;
        border:1px solid #34538a;
        margin:0 auto;
        text-align: center;
        margin-top: 30px;
    }
    .con3 table{margin:auto;}
    .con3 table tr {
        line-height:50px;
    }
    .con3 input{
        height:30px;
        border-radius: 3px;
    }

    input{        
        padding-left: 5px;
        border:1px solid #dbdbdb;
    }

</style>  
</head>
<body>
    <div id="wrap">

		<jsp:include page="../common/adminMenubar.jsp"/>

        <div id="contents" >
            <div id="tab">
                <button class="on lt_tab" onclick="location.href='aPowerList.po'">파워등록 관리</button>
                <button class="off gt_tab">파워등록 목록</button>
            </div>
            <div class="sitemap">
                <a href="#"><span style="width: 30px;height: 30px;">파워등록관리</span></a>
            </div>
            <br><br><br><br><br>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">파워등록추가</p></span>
                <div class="con2">
                    <br><br>
                    <div class="con3">
	                    <form id="powerEnrollForm" method="post" action="powerInsert.po">
	                        <table>
	                            <tr>
	                                <th colspan="3" style="line-height:70px;"><h2>파워등록 정보입력</h2></th>
	                            </tr>
	                            <tr>
	                                <td width="100px">파워등록명</td>
	                                <td colspan="1"><input type="text" name="powerKind" placeholder="파워등록명을 입력하세요." style = "text-align: center;" required></td>
	                            </tr>
	                            
	                            <tr>
	                                <td width="100px">금 액</td>
	                                <td><input type="text" name="powerPrice" placeholder="금액을 입력하세요." style = "text-align: center;" required></td>
	                                <td>원</td>
	                            </tr>
	                            <tr>
	                                <td width="100px">기 간</td>
	                                <td><input type="text" name="period" placeholder="기간을 입력하세요." style = "text-align:center;" required></td>
	                                <td>일</td>
	                            </tr>
	                            <tr>
	                                <td colspan="3">
	                                    <button type="button" id="delete_btn" onclick="location.href='aPowerList.po'">목록으로</button>
	                                    <button type="submit" class="insert_btn">등록하기</button>
	                                </td>
	                            </tr>
	                        </table>
	                    </form>
                    </div>
            	</div>
        	</div>
        </div>
    </div>

    <script>
        $(function(){
            
            $(".arrow").click(function(){
                $("#slide_menu").slideToggle(500);
            });
        });
    </script>

</body>
</html>