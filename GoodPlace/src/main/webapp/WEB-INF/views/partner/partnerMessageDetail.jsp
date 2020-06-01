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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/partner/partnerCommon.css" />
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
    #wrap {width: 1200px; height: 900px; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }
    
    /* message table (메세지 테이블)*/
    .message_tb{width:980px; border:1px solid #bebebe; margin: 20px 0 100px 0 ;}
    .message_tb thead tr td{padding:15px 40px; border-bottom:1px solid #bebebe;font-size: 20px;}
    #user_img{width: 60px;height: 60px;  background: gray;}
    #chat_area{height: 200px;}
    .chat_tb{width: 100%; height: inherit;}
    .chat_tb .other{float: left; width: 100%; margin: 20px 0 0 20px;vertical-align: top;}
    .chat_tb .other .chat{border:1px solid #bebebe; padding:10px; color:#5e5e5e}
    .chat p{font-size: 14px; color:#9e9e9e}
    .chat_tb img{width: 60px;height: 60px; border:1px solid gray; border-radius: 50%;}
    .chat_tb .me{float:right; width: 100%;}
    .chat_tb .me .chat{float:right; border:1px solid #bebebe; padding:10px; color:#5e5e5e}

    .message_tb tfoot tr .text_input{width: 870px;height: 40px;}
    .message_tb tfoot tr td button{width: 100px; height: 44px;  background: #34538a; color:#fff; border: 1px solid #34538a;
                                border-top-right-radius: 5px; border-bottom-right-radius: 5px;
                              }

    /*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
    
    /*하단 버튼 css*/
    button{cursor: pointer;  width: 140px; height: 35px; }
    .gotoList{border: 1px solid #dbdbdb; border-radius: 4px; font-size: 15px;}
    .gotoList:hover{background-color: white; border: solid 1px #dbdbdb;}
    
</style>        
</head>
<body>
<div id="wrap">
    <jsp:include page="../common/partnerMenubar.jsp"/>
    <div id="contents" >
        <div id="tab"></div>
        <div class="sitemap">
            <a href="#"><span style="height: 30px;">HOME</span></a>
            <a href="#"><span style="margin-right: 30px;"> &gt; 메세지</span></a>
        </div>
        <br clear="both"> 
        <div class="con" style="color:#000">
            <span id="page_title">
                <img src="${pageContext.request.contextPath}/resources/images/partner/집로고.jpg" style="vertical-align: middle;">
                <p class="title_tt">메세지상세</p>
            </span>
            
            <div class="con2">
                <table class="message_tb">
                    <thead>
                        <tr>
                            <td colspan="2"><img src="${pageContext.request.contextPath}/resources/images/partner/step_icon3.png" width="30px" height="30px" >방기남 님과의 대화</td>
                        </tr>
                    </thead>
                    <tbody id="chat_area">
                        <tr>
                            <td>
                                <div style="height: 400px;">
                                    <table class="chat_tb">
                                        <tr class="other"> 
                                            <td width="80"><img src=""></td>
                                            <td class="chat">
                                                	방기남 
                                                <p>숙소앞에 도착했는데 들어가도될까요?</p>
                                            </td>
                                        </tr>
                                        <tr class="me">
                                            <td width="80" style="float: right; margin-left:20px"><img src=""></td>
                                            <td class="chat">
                                                	나
                                                <p>네 들어오셔도되요~^^</p>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr></tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2">
                                <input type="text" class="text_input"><button type="submit" >send</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <button class="gotoList" style="margin-left:400px;">목록으로</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>