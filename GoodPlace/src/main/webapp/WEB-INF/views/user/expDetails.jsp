<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>체험검색 > 체험상세</title>

    <!-- 슬라이더를 생성하는 부분 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.js"></script>

     <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/swiper.css">

    <!-- Swiper JS -->
    <script src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>

    <style>
        /* content 시작*/
        /* 여백 초기화 */
        body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form {margin: 0; padding: 0;}
        #content{
            clear: both;
            width: 1200px;
            margin: 0 auto;
            height: auto;
        }
        #content div{
            float:left;
            box-sizing:border-box;
           
        }
        #content p{
            font-weight:600;
            color:dimgray;
        }
        .img_container{
            width:80%; height:430px; margin:0 10%;
        }
        .hide{
            display:none;
        }
        .red{
            background-color:red;
            color:white;
            font-weight: 900;
        }
        .noFunction{
            pointer-events: none; /*(a링크를 비활성화 해준다.)  */
            cursor: default; /*(마우스 커서를 가져갔을때의 모양을 지정하는 것으로 굳이 작성하지 않아도 된다.) */
        }
        .category{
            width:20%; height:40px; background-color:rgb(224, 224, 224); text-align:center; padding-top:8px; border:1px solid gray;
        }
        #content .fullWidth{
            width:100%;
        }
        .c_profileArea{
            width:10%; text-align:center; margin-right:5%;
        }
        .c_profile{
            width:50px; height:50px; border-radius:70%;
            border:1px solid lightgrey;
        }
        .p_profileArea{
            width:100%; height:180px;
        }
        .p_profile{
            width:160px; height:160px; border-radius:70%;
            border:1px solid lightgrey;
        }
        .marginBottom_40px{
            margin-bottom:40px;
        }
        .marginBottom_60px{
            margin-bottom:60px;
        }
        .padding_10px{
            padding:10px;
        }
        .pointColor{
            color:rgb(52, 152, 219);
        }
        .buttonStyle1{
            border:1px solid rgb(24, 76, 136);
            color:rgb(24, 76, 136);
            font-weight: 900;
        }
        .buttonStyle2{
            background-color:rgb(24, 76, 136);
            color:white;
            font-weight: 900;
        }
        .replyStyle1{
            border: 2px solid lightgray;
        }
        .replyStyle2{
            margin-left:25%;
            border: 2px solid lightgray;   
        }
        .bookItStyle{
            width:360px; border:2px solid lightgray; position:absolute; left:1190px; top:80px;
        }
        .aTagStyle1{
            display:block; width:270px; height:42px; font-size:20px; padding-top:12px; margin:10px 46px; float: left;
        }
        .getPeriodStylw1{
            height:54px; float:left; width:270px; margin:10px 46px; padding: 5px 0 0 30px;
        }
        .hover{
            color:black;
        }
        /* 페이징바 시작 */ 
        .pagingBar{
            width:100%;
            padding-left:10%;
            margin:30px auto; 
            height: 60px; 
            text-align:center;
            padding-top:15px;   
        }
        .pagingBar button{
            width:30px;
            height:30px;
            color:gray;
            border-radius: 5px;
            background-color: ghostwhite;
            border:1px solid #dcdcdc;
        }
        #currentPage{
            background-color:rgb(24, 76, 136); color:white;
        }
        /* 페이징바 끝 */
        /* content 끝*/
    </style>
</head>
	
    <!-- header -->
	<jsp:include page="../common/menubar.jsp"/>
   
    <!-- content -->
    <br>
    <div id="content">
            <div style="width:70%;">
                <!-- Swiper -->
                <div class="swiper-container" style="width:80%;  height:430px; margin:0 10%; position:relative; z-index:1;">
                    <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="../img/exp1.jpg" width="100%" height="100%"></div>
                    <div class="swiper-slide"><img src="../img/exp2.jpg" width="100%" height="100%"></div>
                    <div class="swiper-slide"><img src="../img/exp3.jpg" width="100%" height="100%"></div>
                    <div class="swiper-slide"><img src="../img/exp4.jpg" width="100%" height="100%"></div>
                    </div>
                    <!-- Add Arrows -->
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>

                <div style="width:80%; height:120px; margin:0 10%;">
                    <div style="width:80%;">
                        <br><h1>투명한 아름다움 레진 아트</h1>
                    </div><br>
                    <div style="float:left;">
                        <h3 style="margin-top:6px; font-weight:520; color:rosybrown; text-shadow:0.8px 0.8px 1px brown;">#태그1 #태그2</h3>
                    </div>
                </div>
                <div style="width:80%; margin:0 10%;">
                    <div style="width:20%; margin-right:5%;">
                        <img src="${pageContext.request.contextPath}/resources/images/user/clock.jpg" style="float:left; margin-right:5px;"/><h3 style="text-align:left; margin-bottom:10px;">진행시간</h3>
                        <img src="${pageContext.request.contextPath}/resources/images/user/personIcon.jpg" style="float:left; margin-right:5px;"/><h3 style="text-align:left; margin-bottom:10px;">그룹당 인원</h3>
                    </div>
                    <div style="width:75%;">
                        <div class="fullWidth marginBottom_40px">   
                            <p style="margin-bottom:14px; font-size:18px;">3시간</p>
                            <p style="margin-bottom:14px; font-size:18px;">최대 6명</p>
                        </div>
                        
                    </div>
                    <div style="width:20%; margin-right:5%;">
                        <h1 style="text-align:left;">프로그램</h1>
                    </div>
                    <div style="width:75%;" class="marginBottom_60px">
                        <div class="fullWidth">
                            <h3 style="margin:10px 0;">소개</h3>
                            <p>
                                규정된 시간 외 체크인 시 사전에 협의 요망.<br>
                                23시 이후 귀가 시 이웃 주민들에게 피해를 주지 않도록 조용하게 이동 바랍니다.<br>
                                짐보관은 사전에 문의부탁드립니다.<br>
                                모든 고객의 편의를 위하여 예약된 입실 인원 외 방문을 제한합니다.<br>
                                귀중품의 파손 및 현금분실 등은 숙박업소에서 책임지지 않습니다.<br>
                                숙소 내 금연/금주입니다.<br>
                                예약 확정 후 받아보시는 카톡ID로 자세한 약도 등의 안내가 발송됩니다.<br>
                            </p>
                            <h3 style="margin:10px 0;">포함사항</h3>
                            <p>
                                규정된 시간 외 체크인 시 사전에 협의 요망.<br>
                                23시 이후 귀가 시 이웃 주민들에게 피해를 주지 않도록 조용하게 이동 바랍니다.<br>
                                짐보관은 사전에 문의부탁드립니다.<br>
                                모든 고객의 편의를 위하여 예약된 입실 인원 외 방문을 제한합니다.<br>
                            </p>
                        </div>
                    </div>
                    <div class="fullWidth"> 
                        <div style="width:20%; margin-right:5%;">
                            <h1 style="text-align: left;">파트너</h1>
                        </div>
                        <div style="width:75%; padding:10px;"  class="marginBottom_60px replyStyle1">
                            <div class="fullWidth">
                                <div class="p_profileArea">
                                    <div style="width:50%; text-align: center;">
                                        <img src="${pageContext.request.contextPath}/resources/images/user/partnerImg2.jpg" class="p_profile"/>
                                    </div>
                                    <div style="width:50%; text-align:center; height:166px; padding:20px 0;">
                                        <h1>파트너명</h1><br>
                                        <div class="buttonStyle1" style="margin-left:21.8%;"><a style="display:inline-block; width:150px; height:50px; font-size:20px; padding-top:20px;">문의하기</a></div>
                                    </div>  
                                </div><hr><br>
                                <div class="fullWidth">
                                    <p>
                                        홍플에대한 설명 홍플에대한 설명문구1줄<br>
                                        하지만 이렇게 글자를 무작위로 나열하는 것은 아무런 의미를<br>
                                        하지만 이렇게 글자를 무작위로 나열하는 것은 아무런 의미를<br>
                                        하지만 이렇게 글자를 무작위로 나열하는 것은 아무런 의미를<br>
                                        하지만 이렇게 글자를 무작위로 나열하는 것은 아무런 의미를<br>
                                        하지만 이렇게 글자를 무작위로 나열하는 것은 아무런 의미를<br>
                                    </p>
                                </div>
                            </div>
                        </div>  
                    </div>
                    <div class="fullWidth">
                        
                    </div>
                </div>
            

        </div>

        <div id="bookIt" class="bookItStyle">
            <div class="fullWidth" style="margin-bottom:10px;">
                <h1 style="float:left; margin:15px 0 15px 46px;">30,000원&nbsp;</h1><h3 style="float:left; margin-top: 25px;"><sub>/&nbsp;1인</sub></h3><br>
                <div style="text-align:center;" class="fullWidth">
                    <div id="getPeriod" style="height:54px; float:left; width:270px; margin:10px 46px; padding: 5px 0 0 30px;" class="buttonStyle1">
                        <img src="${pageContext.request.contextPath}/resources/images/user/calendarLetter.jpg" alt="날짜선택"/>
                    </div>
                    <div id="calenderArea" style="height:260px; float:left; width:270px; margin:10px 46px;" class="buttonStyle1 hide">
                        calender API
                    </div>
                    <div id="getTime" style="height:54px; float:left; width:270px; margin:10px 46px; padding: 5px 0 0 30px;" class="buttonStyle1">
                        <img src="${pageContext.request.contextPath}/resources/images/user/chooseTime.jpg" alt="시간선택"/>
                    </div>
                    <div id="timeArea" style="height:auto; float:left; width:270px; margin:10px 46px;" class="buttonStyle1 hide">
                        <div style="width:100%; height:38px; padding:5px; border:1px solid rgb(24, 76, 136); color:rgb(24, 76, 136); font-weight: 900;">
                            <div style="width:30%; text-align:right;">시작 ~ 끝</div><div style="width:70%; text-align:center;">(남은자리/최대인원)</div>
                        </div>
                        <div style="width:100%; height:38px; padding:5px;" class="buttonStyle1">
                            <div style="width:55%; text-align:right;">10:00 ~ 11:00</div><div style="width:45%; text-align:center;">(3/5)</div>
                        </div>
                        <div style="width:100%; height:38px; padding:5px;" class="buttonStyle1">
                            <div style="width:55%; text-align:right;">11:30 ~ 12:30</div><div style="width:45%; text-align:center;">(2/5)</div>
                        </div>
                        <div style="width:100%; height:38px; padding:5px;" class="buttonStyle1">
                            <div style="width:55%; text-align:right;">13:00 ~ 14:00</div><div style="width:45%; text-align:center;">(1/5)</div>
                        </div>
                        <div style="width:100%; height:38px; padding:5px; color:black;" class="buttonStyle2">
                            <div style="width:55%; text-align:right;">14:30 ~ 15:30</div><div style="width:45%; text-align:center;">(0/5)</div>
                        </div>
                        <div style="width:100%; height:38px; padding:5px;" class="buttonStyle1">
                            <div style="width:55%; text-align:right;">16:00 ~ 17:00</div><div style="width:45%; text-align:center;">(4/5)</div>
                        </div>
                    </div>
                    <div id="getPeople" style="height:54px; float:left; width:270px; margin:10px 46px; padding: 8px 0 0 34px;" class="buttonStyle1">
                        <img src="${pageContext.request.contextPath}/resources/images/user/adjustPeople.jpg"  alt="인원선택"/>
                    </div>
                    <div id="peopleArea" style="height:auto; float:left; width:270px; margin:10px 46px;" class="buttonStyle1 hide">
                        <div style="width:100%; height:38px; padding:5px;" class="buttonStyle1">
                            1명
                        </div>
                        <div style="width:100%; height:38px; padding:5px;" class="buttonStyle1">
                            2명
                        </div>
                        <div style="width:100%; height:38px; padding:5px;" class="buttonStyle1">
                            3명
                        </div>
                        <div style="width:100%; height:38px; padding:5px;" class="buttonStyle1">
                            4명
                        </div>
                        <div style="width:100%; height:38px; padding:5px;" class="buttonStyle1">
                            5명
                        </div>
                        <div style="width:100%; height:38px; padding:5px;" class="buttonStyle1">
                            6명
                        </div>
                    </div>
                    <a id="bookItButton" class="buttonStyle2 aTagStyle1">예약하기</a>
                    <a id="addWishList" class="buttonStyle1 aTagStyle1">위시리스트에 담기</a>
                </div>
            </div>
            <hr style="margin:unset;">
            <div class="fullWidth" style=" height:100px;">
                <div class="c_profileArea" style="width:70px; margin:24px;">
                    <img src="${pageContext.request.contextPath}/resources/images/user/partnerImg2.jpg" class="c_profile"/>
                </div>
                <h3 style="margin:40px 10px 0 0; float: left;">김가가</h3>
                <div style="width:160px;">
                    <a style="float: left; padding:10px; text-align:center; margin:30px 20px;" class="buttonStyle1">
                        <img src="${pageContext.request.contextPath}/resources/images/user/letterIcon.jpg" style="vertical-align:middle;">문의하기
                    </a>
                </div>
            </div>
        </div>

        <div id="receipt" class="hide" style="width:500px; height:400px; position:relative; z-index:2; left:200px; top:200px; border:2px solid lightgray; background-color:white; float:unset;">
            <div style="float:unset; width:100%; height:200px; border-bottom:2px solid lightgray;">
                <div style="height:40px; float:unset; position:relative; z-index:3; padding:8px; margin:20px;"><h3 style="position: absolute;">체험일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20.03.05 (월)</h3></div>
                <div style="height:40px; float:unset; position:relative; z-index:3; padding:8px; margin:20px;"><h3 style="position:absolute; right:0;">30,000원 x 5명</h3></div>
                <div style="height:40px; float:unset; position:relative; z-index:3; margin:20px; text-align:center; text-align:right;"><h2 style="position: absolute; right:0px; padding:8px;">150,000원</h2>
                    <div style="height:40px; width:50%; padding:8px; float:unset; position:relative; z-index:3;">
                        <h2 style="position: absolute;">총 금액</h2>
                    </div>  
                </div>
            
            </div>
            <div style="float:unset; width:100%; padding:30px 30px 12px 30px;">
                <p style="position:absolute;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;해당 내용으로 예약하시겠습니까?</p>
                <p style="position:absolute; margin-top:40px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;확인버튼을 누르면 예약이 진행됩니다.</p>
                    <button style="width:80px; height:40px; position:absolute; z-index:4; left:150px; bottom:30px; border-radius:5px; font-weight:bold; font-size:16px;" class="buttonStyle2">확인</button>
                    <button id="closeReceipt" style="width:80px; height:40px; position:absolute; z-index:4; left:240px; bottom:30px; border-radius:5px; font-weight:bold; font-size:16px;" class="buttonStyle1">취소</button>
            </div>

            
            <form>
                <input type="hidden" value="히든으로 필요한 값들 적어서 넘기기">
                
            </form>
        </div>

        <div style="text-align:center; margin:60px 0;" class="fullWidth">
            <a style="display:inline-block; width:130px; height:42px; font-size:20px; font-weight:900; padding-top:12px; border:1px solid rgb(24, 76, 136); color:rgb(24, 76, 136);">더보기</a>
        </div>
        

    </div>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper('.swiper-container', {
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        });
    </script>
    
    <!-- bookIt뷰 스크롤 따라다니는 기능 -->
    <script>
        $(window).scroll(function(){
            var position = $(document).scrollTop();

            if($(document).scrollTop() != 0){
                $("#bookIt").stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
                $("#bookIt").css({ width:'360px',
                                    marginTop:'20px'
                                        });
            }else{
                $("#bookIt").stop().animate({top:position+"80px"}, 1); //해당 오브젝트 위치값 재설정
                $("#bookIt").css({ width:'360px',
                                    marginTop:'0px'
                                        });
            }                          
            console.log(position);
        });
    </script>

    
    <script>
        // receipt뷰 스크롤 따라다니는 기능
        $(window).scroll(function(){
            var position = $(document).scrollTop();

            if($(document).scrollTop() != 0){
                $("#receipt").stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
                $("#receipt").css({ marginTop:'200px'
                                        });
            }else{
                $("#receipt").stop().animate({top:position+"80px"}, 1); //해당 오브젝트 위치값 재설정
                $("#receipt").css({ marginTop:'0px'
                                        });
            }                          
            console.log(position);
        });
        
       // 영수증 펼치기
        $('#bookItButton').click(function(){
            if(!$('#recepit').hasClass('hide')){
                $('#receipt').toggleClass('hide');
                $('#bookItButton').toggleClass('noFunction'); return;
            }else{
                $('#receipt').toggleClass('hide');
            }
        });

        // 영수증 끄기
        $('#closeReceipt').click(function(){
            $('#receipt').toggleClass('hide');
            $('#bookItButton').toggleClass('noFunction');
        });

        // 위시리스트에 담기 & 위시리스트에서 지우기
        $('#addWishList').click(function (){

            if($('#addWishList').text() == '위시리스트 ♥'){
                alert('위시리스트에서 삭제되었습니다.');
                $('#addWishList').text('위시리스트에 담기');
                $('#addWishList').toggleClass('red');
                $('#addWishList').toggleClass('buttonStyle1');
            }else{
                alert('위시리스트에 담겼습니다');
                $('#addWishList').text('위시리스트 ♥');
                $('#addWishList').toggleClass('red');
                $('#addWishList').toggleClass('buttonStyle1');
            }
            
        });

        // 날짜선택
        $('#getPeriod').mouseenter(function(){
            $('#calenderArea').toggleClass('hide');
        });
        $('#getPeriod' & '#calenderArea').mouseleave(function(){
            $('#calenderArea').toggleClass('hide');
        });

        // 시간선택
        $('#getTime').mouseenter(function(){
            $('#timeArea').toggleClass('hide');
        });
        $('#getTime' & '#timeArea').mouseleave(function(){
            $('#timeArea').toggleClass('hide');
        });

        // 인원선택
        $('#getPeople').mouseenter(function(){
            $('#peopleArea').toggleClass('hide');
        });
        $('#getPeople' & '#peopleArea').mouseleave(function(){
            $('#peopleArea').toggleClass('hide');
        });

        // 시간선택 : 특정시간 칸에 마우스 올려놓을 시 컬러변경 이벤트
        $('#timeArea>.buttonStyle1').mouseover(function(){
            $(this).toggleClass('hover');
        });
        $('#timeArea>.buttonStyle1').mouseleave(function(){
            $(this).toggleClass('hover');
        });

        // 인원선택 : 특정시간 칸에 마우스 올려놓을 시 컬러변경 이벤트
        $('#peopleArea>div').mouseover(function(){
            $(this).toggleClass('hover');
        });
        $('#peopleArea>div').mouseleave(function(){
                $(this).toggleClass('hover');
        });
    </script>

    <!-- /content -->

    <!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
    
    
</body>
</html>