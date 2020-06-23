<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소검색 > 숙소상세</title>

     <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/swiperEditJinah.css">

    <!-- Swiper JS -->
    <script src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
    
	<!-- 결제 API 관련 -->
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=62fda0bf46ca2ad372f7f5e69d04a01e&libraries=services"></script>
	
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
        .marginBottom_10px{
            margin-bottom:10px;
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
	            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/uploadFiles/${ room.changeName }" width="100%" height="100%"></div>
	            <c:forEach items="${ at }" var="detailImg" varStatus="status">
	            <div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/uploadFiles/${ detailImg.changeName }" width="100%" height="100%"></div>
	            </c:forEach>
	            </div>
	           
	            <!-- Add Arrows -->
	            <div class="swiper-button-next"></div>
	            <div class="swiper-button-prev"></div>
	        </div>
	
	        <div style="width:80%; margin:0 10%;">
	            <div style="width:80%; height:120px;">
	                <br><h1>${ room.roomsTitle }</h1>
	            </div><br>
	            <div class="fullWidth">
	                <h4>${ room.region }</h4><br><br>
	            </div>
	        </div>
	        <div style="float:left;width:80%; margin:0 10%;">
	            <div style="width:20%; margin-right:5%;">
	                <h1 style="text-align:left;">시설 및<br>서비스</h1>
	            </div>
	            <div style="width:75%;">
	                <div class="fullWidth marginBottom_40px">
	                    <div style="width:50%;"><h3>객실정보</h3></div><div style="width:30%; margin-left:20%; background-color:tomato; color:white; font-weight:900;" class="category">숙소 신고하기</div><br><br>
	                    <p>
	                  		방 ${ room.roomCount }개, 침대 ${ room.bedCount }개, 	화장실 ${ room.restroomCount }개, 샤워실 ${ room.bathCount }개<br>
	                      	기본인원 ${ room.minPeople }명, 최대인원 ${ room.maxPeople }명<br>
	                      	1박 금액 : ${ room.price }원<br>
	                    </p>
	                </div>
	                <div class="fullWidth marginBottom_40px">
	                    <div style="width:50%;"><h3>숙소시설</h3></div><br><br>
	                    <p>${ room.facility }</p>
	                </div>
	                <div class="fullWidth marginBottom_40px">
	                    <h3>제공서비스</h3><br>
	                    <p>${ room.service }</p>
	                </div>
	                <div class="fullWidth marginBottom_60px">
	                    <h3>포함사항</h3><br>
	                    <p>${ room.meal }
	                    </p>
	                </div>
	            </div>
	            <div style="width:20%; margin-right:5%;">
	                <h1 style="text-align:left;">숙소태그</h1>
	            </div>
	            <div style="width:75%;">
	                <div class="fullWidth marginBottom_40px">
	                    <div style="width:100%;"><h2 style="margin-top:6px; font-weight:546; color:rosybrown; text-shadow:0.8px 0.8px 1px brown;">${ room.roomsTag }</h2></div>
	                </div>
	            </div>
	            <div style="width:20%; margin-right:5%;">
	                <h1 style="text-align:left;">이용안내</h1>
	            </div>
	            <div style="width:75%;" class="marginBottom_60px">
	                <div style="margin-bottom: 28px;" class="fullWidth marginBottom_40px">
	                    <div style="width:40%;"><h2 class="pointColor"style="margin-top:2px;">체크인 시간</h2></div><div style="width:60%;"><h2 class="pointColor">${ room.checkIn }</h2></div>
	                    <br><br>
	                    <div style="width:40%;"><h2 class="pointColor" style="margin-top:6px;">체크아웃 시간</h2></div><div style="width:60%;"><h2 class="pointColor">${ room.checkOut }</h2></div>
	                	<div style="width:80%;"><h3 style="color:tomato; margin-top:12px;">※ 예약은 이용일 36시간 전까지 가능합니다.</h3></div>
	                	
	                </div>
	                <div class="fullWidth">
	                    <h3>특이사항</h3><br>
	                    ${ room.roomsNotice }
	                </div><br><br>
	            </div>
	            <div style="width:20%; margin-right:5%;">
	                <h1 style="text-align: left;">오시는길</h1>
	            </div>
	            <div style="width:75%;" class="marginBottom_60px">
	                <div class="fullWidth">
	                    <div style="width:100%; margin-bottom: 28px;"><h2 class="pointColor">${ room.addBasic }&nbsp;&nbsp;${ room.addDetail }</h2></div>
	                    <div id="map" style="width:100%; height:300px; border:1px solid black;">[내용] 지도 api : 위치 표시</div>
	                </div><br><br>
	                <script>
		                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		                mapOption = {
		                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		                    level: 3 // 지도의 확대 레벨
		                };  
	
		               // 지도를 생성합니다    
		               var map = new kakao.maps.Map(mapContainer, mapOption); 
	
		               // 주소-좌표 변환 객체를 생성합니다
		               var geocoder = new kakao.maps.services.Geocoder();
	
		               // 주소로 좌표를 검색합니다
		               geocoder.addressSearch('${ room.addBasic }', function(result, status) {
	
		                   // 정상적으로 검색이 완료됐으면 
		                    if (status === kakao.maps.services.Status.OK) {
	
		                       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		                       // 결과값으로 받은 위치를 마커로 표시합니다
		                       var marker = new kakao.maps.Marker({
		                           map: map,
		                           position: coords
		                       });
	
		                       // 인포윈도우로 장소에 대한 설명을 표시합니다
		                       var infowindow = new kakao.maps.InfoWindow({
		                           content: '<div style="width:150px;text-align:center;padding:6px 0;">숙소위치</div>'
		                       });
		                       infowindow.open(map, marker);
	
		                       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		                       map.setCenter(coords);
		                   } 
		               });    
	                </script>
	            </div>
	            <div class="fullWidth"> 
	                <div style="width:20%; margin-right:5%;">
	                    <h1 style="text-align: left;">호스트</h1>
	                </div>
	                <div style="width:75%; padding:10px;"  class="marginBottom_60px replyStyle1">
	                    <div class="fullWidth">
	                        <div class="p_profileArea">
	                            <div style="width:50%; text-align: center;">
	                                <img src="${pageContext.request.contextPath}/resources/uploadFiles/userProfile/${ room.paPofile }" class="p_profile"/>
	                            </div>
	                            <div style="width:50%; text-align:center; height:166px; padding:20px 0;">
	                                <h1>${ room.paName }</h1><br>
	                                <div class="buttonStyle1 inquirePartner" style="margin-left:21.8%;"><a style="display:inline-block; width:150px; height:50px; font-size:20px; padding-top:20px;">문의하기</a></div>
	                            </div>  
	                        </div><hr><br>
	                        <div class="fullWidth">
	                            <p>${ room.partnerIntro }</p>
	                        </div>
	                    </div><br><br>
	                </div>  
	            </div>
	            <br><br>    
	            <hr style="border:1px solid lightgray;">
	            <br><br>
	            <div class="fullWidth">
	                <div style="width:20%; margin-right:5%; position:absolute;">
	                    <h1 style="text-align:left;">후기</h1>
	                </div>
	                <c:if test="${ empty room.reviewList}">
					   	<div class="fullWidth" style="text-align:center;">
					   		<br><br><br><br>
					   		<h2 style="font-weight:500; color:gray;">등록된 후기가 없습니다.</h2>
					   	</div>		
					</c:if>
	                <c:forEach items="${ room.reviewList }" var="review" varStatus="status">
	                
	                	<div style="width:75%;"  class="marginBottom_10px padding_10px replyStyle2">
	                    <div class="fullWidth">
	                        <div class="c_profileArea">
	                            <img src="${pageContext.request.contextPath}/resources/uploadFiles/userProfile/${ review.usChangeName }" class="c_profile"/>
	                        </div> 
	                        <div style="width:85%; margin-top:5px;">
	                            <div style="width:20%;">
	                                <h4>${ review.userName }</h4>
	                            </div>
	                            <div style="width:80%;">
	                                <h4>${ review.reviewDate }</h4>
	                            </div>
	                        </div>
	                        <h3>
	                        	<c:forEach begin="1" end="5" varStatus="currentNum">
	                        		<c:choose>
	                        			<c:when test="${currentNum.current le review.score }"><c:out value="★"/></c:when>
	                        			<c:otherwise><c:out value="☆"/></c:otherwise>
	                        		</c:choose>
	                        	</c:forEach>
	                        </h3>
	                    </div>
	                    <div class="fullWidth">
                     		<p class="reviewContainer">${ review.reTitle }</p>
                    	   <p class="reviewContainer">${ review.reContent }</p>
	                    </div>
	                	</div>

					<c:choose>
						<c:when test="${ loginUser.usNo eq room.userNo }">
							<input type="hidden" name="reNo" value="${ review.reNo }">
							<div
								style="width: 75%; margin-left: 25%; text-align: right; padding: 3.5px;"
								class="marginBottom_40px">
								<button class="category postComment"
									style="padding: 6px; width: 110px; margin: 5px;">
									<h3>댓글달기</h3>
								</button>
								<button class="category reportReview"
									style="padding: 6px; width: 110px; margin: 5px; background-color: tomato; color: white;">
									<h3>후기신고</h3>
								</button>
							</div>
						</c:when>
						<c:when test="${ loginUser.usNo eq review.userNo }">
							<input type="hidden" name="reNo" value="${ review.reNo }">
							<div
								style="width: 75%; margin-left: 25%; text-align: right; padding: 3.5px;"
								class="marginBottom_40px">
								<button class="category modifyReview"
									style="padding: 6px; width: 110px; margin: 5px;">
									<h3>수정</h3>
								</button>
								<button class="category saveReview"
									style="padding: 6px; width: 110px; margin: 5px;">
									<h3>저장</h3>
								</button>
							</div>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="reNo" value="${ review.reNo }">
							<div
								style="width: 75%; margin-left: 25%; text-align: right; padding: 3.5px;"
								class="marginBottom_40px">
								<button class="category reportReview"
									style="padding: 6px; width: 110px; margin: 5px; background-color: tomato; color: white;">
									<h3>후기신고</h3>
								</button>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
	
	            </div>
	            
	        </div>
		</div>
	

	
        <div id="bookIt" class="bookItStyle">
            <div class="fullWidth" style="margin-bottom:10px;">
                <h1 style="float:left; margin:15px 0 15px 46px;">${ room.price }원&nbsp;</h1><h3 style="float:left; margin-top: 25px;"><sub>/&nbsp;${ room.minPeople }인</sub></h3><br>
                <div style="text-align:center;" class="fullWidth">
                    <div style="height:54px; float:left; width:270px; margin:10px 46px;" class="buttonStyle1 hide">
                        <h2 style="font-weight:unset; padding-top:10px;">${ room.startDays } ~ ${ room.endDays }</h2>
                    </div>
                    <div style="height:54px; float:left; width:270px; margin:10px 46px;" class="buttonStyle1 hide">
                        <h2 style="font-weight:unset; padding-top:10px;">${ room.people }명</h2>
                    </div>
                    <a id="bookItButton" class="buttonStyle2 aTagStyle1">예약하기</a>
                    <a id="addWishList" class="buttonStyle1 aTagStyle1 inquirePartner">위시리스트에 담기</a>
                </div>
            </div>
            <hr style="margin:unset;">
            <div class="fullWidth" style=" height:100px;">
                <div class="c_profileArea" style="width:70px; margin:24px;">
                    <img src="${pageContext.request.contextPath}/resources/images/user/partnerImg.jpg" class="c_profile"/>
                </div>
                <h3 style="margin:40px 10px 0 0; float: left;">${ room.userName }</h3>
                <div style="width:160px;">
                    <a style="float: left; padding:10px; text-align:center; margin:30px 20px;" class="buttonStyle1">
                        <img src="${pageContext.request.contextPath}/resources/images/user/letterIcon.jpg" style="vertical-align:middle;">문의하기
                    </a>
                </div>
            </div>
        </div>

		<c:choose>
			<c:when test="${ room.people > room.minPeople }"><c:set var="price" value="${ room.price + ( (room.people - room.minPeople) * 10000 ) }"></c:set></c:when>
			<c:otherwise><c:set var="price" value="${ room.price}"></c:set></c:otherwise>
		</c:choose>
        <div id="receipt" class="hide" style="width:500px; height:400px; position:relative; z-index:2; left:200px; top:200px; border:2px solid lightgray; background-color:white; float:unset;">
            <div style="float:unset; width:100%; height:200px; border-bottom:2px solid lightgray;">
                <div style="height:40px; float:unset; position:relative; z-index:3; padding:8px; margin:20px;"><h3 style="position: absolute;">예약날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ room.tripStartDate }&nbsp;~&nbsp;${ room.tripEndDate }</h3></div>
                <div style="height:40px; float:unset; position:relative; z-index:3; padding:8px; margin:20px;"><h3 style="position:absolute; right:0;">기본금액 : ${ room.price }원&nbsp;&nbsp;&nbsp;&nbsp;추가금액 : <c:if test="${ room.people > room.minPeople }" >${ (room.people - room.minPeople) * 10000 }</c:if>원</h3></div>
                <div style="height:40px; float:unset; position:relative; z-index:3; margin:20px; text-align:center; text-align:right;"><h2 style="position: absolute; right:0px; padding:8px;">${ price }원</h2>
                    <div style="height:40px; width:50%; padding:8px; float:unset; position:relative; z-index:3;">
                        <h2 style="position: absolute;">총 금액</h2>
                    </div>  
                </div>
            
            </div>
            <div style="float:unset; width:100%; padding:30px 30px 12px 30px;">
                <p style="position:absolute;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;해당 내용으로 예약하시겠습니까?</p>
                <p style="position:absolute; margin-top:40px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;확인버튼을 누르면 예약이 진행됩니다.</p>
                    <button id="payRoom" style="width:80px; height:40px; position:absolute; z-index:4; left:150px; bottom:30px; border-radius:5px; font-weight:bold; font-size:16px;" class="buttonStyle2">확인</button>
                    <button id="closeReceipt" style="width:80px; height:40px; position:absolute; z-index:4; left:240px; bottom:30px; border-radius:5px; font-weight:bold; font-size:16px;" class="buttonStyle1">취소</button>
            </div>

        </div>
        <div style="text-align:center; margin:60px 0;" class="fullWidth">
            <a href="javascript:history.back();" style="text-decoration:none; display:inline-block; width:130px; height:42px; font-size:20px; font-weight:900; padding-top:12px; border:1px solid rgb(24, 76, 136); color:rgb(24, 76, 136);">더보기</a>
        </div>
        <br style="clear:both;">

    </div>
    <!-- Roompay 테이블에 넘겨줄 값-->
	<form action="insertRoomPay.ro" method="get" id="showPayRooms">
		<input type="hidden" name="roNo" value="${ room.roNo }"/>
		<input type="hidden" name="roomsTitle" value="${ room.roomsTitle }"/>
		<input type="hidden" name="userNo" value="${ room.userNo }"/>
		<input type="hidden" name="amount" value="${ price }"/>
		<input type="hidden" name="addPrice" value="${ price - room.price }"/>
		<input type="hidden" name="tripStartDate" value="${ room.tripStartDate }"/>
		<input type="hidden" name="tripEndDate" value="${ room.tripEndDate }"/>
		<input type="hidden" name="people" value="${ room.people }"/>
		<input type="hidden" name="price" value="${ room.price }"/>
	</form>
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

    <!-- receipt뷰 스크롤 따라다니는 기능 -->
    <script>
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
        });
        
       // 영수증 펼치기
        $('#bookItButton').click(function(){
        	
        	if(${empty loginUser}){
        		alert("로그인 후 이용해주세요.");
        	}else{
	            if(!$('#recepit').hasClass('hide')){
	                $('#receipt').toggleClass('hide');
	                $('#bookItButton').toggleClass('noFunction'); return;
	            }else{
	                $('#receipt').toggleClass('hide');
	            }
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
        
        // 예약하기 -> 결제페이지
        $('#payRoom').click(function(){
        	$("#showPayRooms").submit();
        });

        // 후기 내용 저장용 필드
        var reviewContent = "";
        // 댓글달기
        $('.postComment').click(function(){
        	
       	});
        // 후기 수정
        $('.modifyReview').click(function(){
        	var reviewContainer = $(this).parent().prev().find(".reviewContainer");
        	reviewContainer.text("");
        	
        	reviewContainer.parent().append("<textarea class='newReview'>");
       	});
        // 후기 작성 // ajax로 해야될듯 물어보기!!!!!!!!!!!!!!!!!!!!!!!!!!!1
        $('.newReview').click(function(){
       		
       	});
        // 후기 저장
        $('.saveReview').click(function(){
        	var	newReview = $(this).prev().parent().prev().find(".newReview").text();
        	//var newReviwe = getContent.replace("</teatarea>", "");
        	console.log("newReview : " + newReview);
       	});
        // 후기신고
        $('.reportReview').click(function(){
        	
       	});
        // 문의하기
        $('.inquirePartner').click(function(){
        	
       	});
        
        $(".reportReview").click(function(){
        	location.href="reviewInq.ro?reNo=" + $(this).parent().siblings().eq(2).val();
        });
        
    </script>

    <!-- /content -->

   	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	

</body>
</html>