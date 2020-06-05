<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerCommon.css" />
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerDashBoard.css" />

<style>
button:hover{cursor:pointer}

/*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer; border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
    
    #noticeList tr:hover{cursor:pointer;}
</style>
</head>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px;">HOME</span>&gt;
                </a>
                <a href="#">
                    <span> 대쉬보드</span>
                </a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;">
                    <p class="title_tt">대쉬보드</p>
                </span>
                
                <div class="con2">
                    <div class="reservationArea" style="float:left; margin-top: 20px;">
	                    <div class="divTitle" style="float: left;">
	                        <img src="" width="24px"height="24px;" style="float: left;">
	                        <p>예약현황</p><span style="font-size: 15px;">|새로운 정보가 실시간으로 바뀌여 보여집니다.</span>
	                    </div>
	                </div>
	                <div class="calendar" style="margin-top:20px">
	
	                </div>
	                <br clear="both">
	                <div class="reservDiv">
	                    <div class="divTitle">
	                        <img src="" width="24px"height="24px" style="float:left">
	                        <p>숙소예약목록</p><span style="float:right; margin-right:10px;"><a href="#"  style="font-size: 18px;">더보기+</a></span></div>
	                    <div style="float:left; margin-top:30px">
	                        <table class="reservTb" cellpadding="0" cellspacing="0">
	                            <thead>
	                                <tr>
	                                    <th>예약번호</th>
	                                    <th>여행자</th>
	                                    <th>날짜</th>
	                                    <th>숙소이름</th>
	                                    <th>예약상태</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td>gp0423</td>
	                                    <td>방기남</td>
	                                    <td>2020-06-10~2020-06-30</td>
	                                    <td>제주 협재(산들바람피는마을)</td>
	                                    <td>확정완료</td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	                <br clear="both">
	                <div class="reservDiv">
	                    <div class="divTitle">
	                        <img src="" width="24px"height="24px" style="float:left">
	                        <p>체험예약목록</p>
	                        <span style="float:right; margin-right:10px;">
	                            <a href="#" style="font-size: 18px;">더보기+</a>
	                        </span>
	                    </div>
	                    <div style="float:left; margin-top:30px">
	                        <table class="reservTb" cellpadding="0" cellspacing="0">
	                            <thead>
	                                <tr>
	                                    <th>예약번호</th>
	                                    <th>여행자</th>
	                                    <th>날짜</th>
	                                    <th>체험이름</th>
	                                    <th>예약상태</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td>gp0423</td>
	                                    <td>방기남</td>
	                                    <td>2020-06-10</td>
	                                    <td>나나와 함께하는 쿠킹클래스</td>
	                                    <td>확정완료</td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	                <br clear="both">
	                <div class="reviewDiv">
	                    <div class="divTitle">
	                        <img src="" width="24px"height="24px" style="float:left">
	                        <p>최근등록후기</p>
	                        <span style="float:right; margin-right:10px;">
	                            <a href="#" style="font-size: 18px;">더보기+</a>
	                        </span>
	                    </div>
	                    <div style="float: left;">
	                        <table class="reviewTb">
	                            <tr class="reviewTr">
	                                <td class="reviewCon">최고에요! 주인분이 너무 친철하시고ddddddddddddddddddd</td>
	                                <td>별점(5.0)</td>
	                                <td>04-14</td>
	                            </tr>
	                            <tr class="reviewTr">
	                                <td class="reviewCon">최고에요! 주인분이 너무 친철하시고ddddddddddddddddddd</td>
	                                <td>별점(5.0)</td>
	                                <td>04-14</td>
	                            </tr>
	                            <tr class="reviewTr">
	                                <td class="reviewCon">최고에요! 주인분이 너무 친철하시고ddddddddddddddddddd</td>
	                                <td>별점(5.0)</td>
	                                <td>04-14</td>
	                            </tr>
	                            <tr class="reviewTr">
	                                <td class="reviewCon">최고에요! 주인분이 너무 친철하시고ddddddddddddddddddd</td>
	                                <td>별점(5.0)</td>
	                                <td>04-14</td>
	                            </tr>
	                            <tr class="reviewTr">
	                                <td class="reviewCon">최고에요! 주인분이 너무 친철하시고ddddddddddddddddddd</td>
	                                <td>별점(5.0)</td>
	                                <td>04-14</td>
	                            </tr>
	                        </table>
	                    </div>
	                </div>
	                <div class="noticeDiv">
	                    <div class="divTitle">
	                        <img src="" width="24px"height="24px" style="float:left">
	                        <p>공지사항</p>
	                        <span style="float:right; margin-right:10px;">
	                            <a href="#" style="font-size: 18px;">더보기+</a>
	                        </span>
	                    </div>
	                    <div>
	                        <table class="noticeTb">
	                            <tr>
	                                <td> [공지] 코로나19 대응 취소 정책 안내</td>
	                                <td>2020-06-10</td>
	                            </tr>
	                            <tr>
	                                <td> [공지] 코로나19 대응 취소 정책 안내</td>
	                                <td>2020-06-10</td>
	                            </tr>
	                            <tr>
	                                <td> [공지] 코로나19 대응 취소 정책 안내</td>
	                                <td>2020-06-10</td>
	                            </tr>
	                            <tr>
	                                <td> [공지] 코로나19 대응 취소 정책 안내</td>
	                                <td>2020-06-10</td>
	                            </tr>
	                            <tr>
	                                <td> [공지] 코로나19 대응 취소 정책 안내</td>
	                                <td>2020-06-10</td>
	                            </tr>
	                            <tr>
	                                <td> [공지] 코로나19 대응 취소 정책 안내</td>
	                                <td>2020-06-10</td>
	                            </tr>
	                            
	                        </table>
	                    </div>
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