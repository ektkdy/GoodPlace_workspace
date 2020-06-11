<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<style>
	body{
		margin:0px;
	}
	/* font */
	*{font-family: 'Noto Sans KR', sans-serif;}

	    /* header(메뉴바) */
	#header {
	    clear: both;
	    width: 100%;
	    background: linear-gradient(to left, #734ce7, #41a3ec );
	    top: 0;
	    z-index: 1000000;
	    height: 60px;
	    box-shadow: 0px 10px 10px 0px rgba(144, 144, 144, 0.1);
	    /*
	    position: fixed;
	    position: absolute;
	    */
	}
	#content{
	    clear: both;
	    width: 1200px;
	    height: auto;
	    margin: 0 auto;
	}
	#footer{
        clear: both;
        border-top: solid 1px lightgray;
        background-color: rgb(231, 231, 231);
        height: 250px;
	}

	#header_wrap {
	    height: inherit;
	    position: relative;
	    width: 1200px;
	    margin: 0 auto;
	    left: 0;
	    right: 0;
	    text-align: center;
	}

	#header>#header_wrap>div {
	    display: inline-block;
	    height: 100%;
	}
	/*로고*/
	#header_1 {
	    width: 30%;

	    position: relative;
	}
	/*검색*/
	#header_2 {
	    width: 35%;
	    position: relative;
	}
	/*문의,로그인*/
	#header_3 {
	    width: 30%;
	}
	#navi {
	    list-style-type: none;
	    width: 100%;
	}
	#navi>li {
	    position: relative;
	    float: left;
	    font-weight: 600;
	    font-size: 19px;
	    height: 40px;
	    text-align: center;
	}
	/*검색*/
	#navi .search {
	    font-size: 16px;
	    padding: 10px;
	    border: 0px;
	    outline: none;
	    float: left;
	}
	/*검색버튼*/
	#navi .searchBtn{
	    width: 45px;
	    height: 39px;
	    border: 0px;
	    background: #ffffff;
	    outline: none;
	    float: left;
	    color:#ffffff;
	}

	/*1:1채팅상담*/
	#navi .qBtn{
	    margin: 0 10px;
	    color: white;
	}
	/*로그인 버튼 */
	.loginBtn {
	    box-shadow:inset 0px 1px 0px 0px #bee2f9;
	    background:linear-gradient(to bottom, #63b8ee 5%, #468ccf 100%);
	    background-color:#63b8ee;
	    border-radius:6px;
	    border:1px solid #3866a3;
	    display:inline-block;
	    cursor:pointer;
	    color:#14396a;
	    font-family:Arial;
	    font-size:15px;
	    font-weight:bold;
	    padding:6px 37px;
	    text-decoration:none;
	    text-shadow:0px 1px 0px #7cacde;
	}
	.loginBtn:hover {
	    background:linear-gradient(to bottom, #468ccf 5%, #63b8ee 100%);
	    background-color:#468ccf;
	}
	.loginBtn:active {
	    position:relative;
	    top:1px;
	}

	/*채팅박스*/
    #sidebox {
        background-color: white;
        position:absolute;
        width:280px;
        height: 520px;
        bottom:30px;
        right:30px;
        border-radius: 20px;
    }


    .chat_content{
        height: 310px;
        background-color:
        white; padding: 10px;
        overflow-y: auto;
    }

    /*채팅 관리자 회원 공통*/
    .chat_content .chat_common{
        height: 30px;
        clear: both;
    }
    .chat_content .chat_common>img{
        border-radius: 50px;
        background-color: darkblue;
    }
    .chat_content .chat_common>span{
        font-size: 20px;
        vertical-align:top;
        font-weight: 400;
        color: black;
    }
    .chat_content .chat{
        float: left;
        position: relative;
        min-width: calc(50%);
        max-width: calc(100% - 44px);
        word-break:break-all; padding:
        5px; border-radius: 10px;
        font-size: 15px;
        color: black;
    }
    .chat_content .chat_date{
        clear: both;
        margin: 0px 10px;
        color:grey;
        font-size: 12px;
    }

    /*채팅 관리자 css*/
    .chat_content .chat_admin{
        background-color: lightgrey;
    }

    /*채팅 회원(사용자)*/
    .chat_content .chat_userId>img, .chat_content .chat_userId>span, .chat_content .chat_user, .chat_content .chat_userDate{
        float: right;
    }
    .chat_content .chat_user{
        background-color: rgb(10, 0, 150);
        color: white;
    }
        /*로그인 드롭박스*/
    .drop-down ul{
        display:none;
        padding-left: 0px;
        width: 190px;
        border-right-width: 50px;
        right: 1px;
        position: absolute;
        list-style-type: none;
        z-index: 1111111111;
        background-color: white;
        font-size: 16px;
    }
    .drop-down ul>li{
        padding: 8px 0px;
        border: rgb(0, 0, 0) 1px solid;
    }
    .drop-down ul>li>a{
        text-decoration: none;
        color: black
    }
    li:hover > ul{
        display:block;
    }
    .drop-down ul a:hover{
        background: rgb(71,71,71);
        border:0px;
        color:#ffffff;
        text-decoration:none;
    }
    .drop-down .drop-down ul {
        top: 0;
        left: calc(100% - 300px);

    }
    .drop-down .drop-down:hover > ul {
            left: -100%;
    }
    .drop-down .drop-down > a:after {
            content: "\ea9d";
    }

</style>
</head>
<body>
	<!-- 반응 메세지 출력 -->
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");	// alert(회원가입성공!!)
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
  <!-- header -->
    <div id="header">
        <div id="header_wrap">
            <div id="header_1">
                <a href="${pageContext.servletContext.contextPath}"><img id="home-logo" src="resources/images/user/menubarLogo.png" width="250px" height="40px" style="padding:10px"></a>
            </div>
            <div id="header_2">
                <ul id="navi" style="padding-left: 30px; margin-top: 10px">
                    <li>
                        <input class="list search" type="text" placeholder="여행이나 체험을 검색해보세요" style="width: 300px; height: 19px; ">
                        <div class="list searchBtn">
                            <a href=""><img id="searchbtn" src="resources/images/user/searchBtn.JPG" width="37px" height="37px"></a>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="header_3">
                <ul id="navi" style="padding-left: 0px; margin-top: 5px;">

                	<c:choose>
	                	<c:when test="${ empty loginUser }">
	                		<!-- 로그인 전 -->
	                		<li style="margin-top: 10px;">
		                        <a class="list qBtn" href="enrollForm.me" style="font-size: 15px; margin-left: 50px;">회원가입</a>
		                    </li>
		                    <li style="margin-top: 10px;">
		                        <a href="loginForm.me" class="list loginBtn" style="margin-left: 30px;">로그인</a>
		                    </li>
	                	</c:when>
						<c:otherwise>
							<!-- 로그인 후 -->
		                    <li style=" margin-top: 10px;">
		                    	<c:choose>
		                    		<c:when test="${ loginUser.userKind eq 1 }">
		                    			<a class="list qBtn" href="enrollPartnerForm.me" style="font-size: 15px;">파트너등록하기</a>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<a class="list qBtn" href="partnerMain.me" style="font-size: 15px;">파트너 페이지 가기</a>
		                    		</c:otherwise>
		                    	</c:choose>

		                        <a class="list qBtn" onclick="boxSlide();" style="font-size: 15px; cursor:pointer ">1:1채팅문의</a>
		                    </li>
		                    <li>
		                        <div id="personalImg" style="margin-left: 10px;">

		                            <li class="drop-down" style="top: 5px;">
		                                <a><img src="${pageContext.request.contextPath}/resources/uploadFiles/userProfile/${loginUser.changeName}" width="40px" height="40px" style="border-radius: 50px; background-color: darkblue;"></a>
		                                <ul>
		                                    <li style="background-color: rgb(43, 41, 150); color:white">${ loginUser.userName }님 환영합니다</li>
		                                    <li><a href="">my굿플레이스</a></li>
		                                    <li><a href="ReserveForm.ro">숙소예약내역</a></li>
		                                    <li><a href="">위시리스트</a></li>
		                                    <li><a href="partnerMain.me">파트너 페이지 가기</a></li>
		                                    <c:if test="${ loginUser.userKind eq 0 }">
		                                    	<li><a href="adminForm.me">관리자페이지</a></li>
		                                    </c:if>
		                                    <li><a href="logout.me">로그아웃</a></li>
		                                </ul>
		                            </li>
		                        </div>
		                    </li>
						</c:otherwise>
                 	</c:choose>

                </ul>
            </div>
        </div>
    </div>
    <div id="sidebox" style="box-shadow: 5px 5px 10px black; z-index: 99999; display:none;">
        <!-- 채팅헤더 -->
        <div class="chat_header" style="width:240px; padding: 10px 20px; height: 80px; border-top-left-radius: 20px; border-top-right-radius: 20px; background-color:#184c88;">
            <div style="color: white;">
                <b style=" font-weight: 800; font-size: 24px;">GoodPlace</b>
                <span style="float: right; margin-top:10px">
                    <a>
                        <img onclick="boxClose();" style="cursor: pointer;" src="resources/images/user/clear-button.png" width="18px">
                    </a>
                </span>
                <div style="font-size: 14px; font-weight: 600; padding-top: 10px; padding-left: 10px;">
                    실시간 채팅 상담 시간<br>
                    평일 08:00 ~ 18:00
                </div>
            </div>
        </div>
        <!-- 채팅박스 -->
        <div class="chat_content" id="messageArea" style="box-shadow: lightgray;">

<!-- 
            <div>
                <div class="chat_common">
                    <img src="" width="28px" height="28px"> 
                    <span>GoodPlace</span>
                </div>
                <div class="chat chat_admin">
                    안녕하세요! 여행 플랫폼 서비스! GoodPlace입니다!
                </div>
                <div class="chat_date chat_adminDate" style="clear: both; margin: 0px 10px; color:grey; font-size: 12px;">20:20</div>
            </div>
            <div>
                <div class="chat_common chat_userId">
                    <img src="" width="28px" height="28px">
                    <span>GoodPlace</span>
                <div class="chat chat_user">
                    숙소 환불하려고 하는데요
                </div>
                <div class="chat_date chat_userDate">20:21</div> 
            </div>
-->
        </div>

        <div class="chat_bottom" style="height: 90px; width: 280px; border-bottom-left-radius: 20px; border-radius: 20px; border: 1px solid lightgray; box-sizing: border-box;">
            <div style="float: left; height: 100%; width: 75%; padding: 5px;">
                <!-- 채팅 문자열 입력(chat_str) -->
                <textarea type="text" name="chat_str" id="message" style="overflow-y: auto; width: 100%; height: 87%; box-sizing: border-box; border:none; resize:none"></textarea>
            </div>

            <div style="float: right;height: 100%;width: 21%;background-color: #184c88;border-bottom-right-radius: 20px;border-top-right-radius: 20px;box-sizing: border-box;text-align: center;padding: 34px 0px;">
                <a id="sendBtn" style="text-align: center; cursor: pointer;">전송</a>
            </div>
        </div>
    </div>

    <input type="hidden" id="loginEmail" value="${ loginUser.email }">
    <input type="hidden" id="myName" value="${ loginUser.userName }">
    <input type="hidden" id="myChangeName" value="${loginUser.changeName}">
    <input type="hidden" id="tutorChangeName" value="">
    <script>
	    var currentPosition = parseInt($("#sidebox").css("top"));
	    $(window).scroll(function() {
	        var position = $(window).scrollTop();
	        $("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
	    });

	    $(function(){
	    	$("#sidebox").slideUp("fast");
	    });
		
	    let sock = null;
	    
	    
	    // 메세지
	   	// 1:1상담문의 버튼을 클릭했을 때
	    function boxSlide(){
	    	$("#sidebox").slideDown("fast");
	    	$("#sidebox").css("display","block");
	    	if(sock == null){
				$.ajax({
					// ajax1.do?name=홍길동&age=20
					url:"selectTutor",
					data:{email:"ektkdy@naver.com"},		// 관리자 이메일
					type:"post",
					success:function(tutor){				// 관리자 이메일 정보를 찾아 가져옴
						sock = new SockJS("http://localhost:8888/goodplace/echo/");	// 사용자 세션 연결 (세션ID : 사용자이메일)
						sock.onmessage = onMessage;
						sock.onclose = onClose;
						
						$("#tutorChangeName").val(tutor.changeName);	// 관리자 이메일로 프로필 사진을 가져옴
					},error:function(){
						console.log("ajax 통신 실패");
					}
				})
	    	}
	    };

		$("#sendBtn").click(function() {
			sendMessage();
			$('#message').text("");
		});
		
		
		// 메시지 전송
		function sendMessage() {
			var msg = $("#message").val();
			if(msg != ""){
				message = {};
			  	message.messageContent = $("#message").val();
		  	  	message.messageReceiver = "ektkdy@naver.com";	// 관리자 이메일
		  	  	message.messageSender = '${loginUser.email}';
		  	  	message.class_class_id = 1;					 	// 사용자가 보낸경우 1
		  	  	var Now = new Date();						 	// Now --> 메세지를 보낼때마다 현재시간으로 초기화 됨
		  	  	message.messageSendTime = moment(Now).format('YYYY-MM-DD   h:mm a');	// 현재시간 포맷
			}
			console.log(message);
			sock.send(JSON.stringify(message));					// 메세지 전송
			$("#message").val("");
		};
		
		// 서버로부터 메시지를 받았을 때
		function onMessage(msg) {
			var data = JSON.parse(msg.data);					// 받은 메시지 정보 (내용,시간)
			var name = $("#myName").val();						// 내 이름
			var tutorChangeName = $("#tutorChangeName").val();	// 관리자 프로필

			if(data.class_class_id != 1){		// 1 : 사용자 (사용자가 보낸 메세지가 아닐때)
				$("#messageArea").append("<div><div class="+"'chat_common'"+"><img src='"+"${pageContext.request.contextPath}/resources/uploadFiles/userProfile/" + tutorChangeName +"' width='28px' height='28px'><span>GoodPlace</span></div><div class='chat chat_admin'>"+ data.messageContent + "</div><div class='chat_date chat_adminDate' style='clear: both; margin: 0px 10px; color:grey; font-size: 10px;'>" + data.messageSendTime + "</div></div>");
			} else {
				$("#messageArea").append("<div><div class="+"'chat_common chat_userId'"+"><img src='"+"${pageContext.request.contextPath}/resources/uploadFiles/userProfile/" + $("#myChangeName").val() +"' width='28px' height='28px'><span>"+ name +"</span></div><div class='chat chat_user'>"+ data.messageContent + "</div><div class='chat_date chat_userDate'>" + data.messageSendTime + "</div></div>");
			}
			$("#messageArea").scrollTop($("#messageArea")[0].scrollHeight); // 채팅창 스크롤 맨아래로 내리기
		};

	    function boxClose(){
	    	console.log("123");
	    	$("#sidebox").slideUp("fast");
	    };

		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			$("#messageArea").append("연결 끊김");

		};
    </script>
</body>
</html>
