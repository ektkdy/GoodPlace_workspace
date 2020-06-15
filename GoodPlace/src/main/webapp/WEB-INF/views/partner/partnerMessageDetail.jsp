<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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

    /* 메세지 상세 */
    .msgDetail{ width: 980px; padding-top:50px;}
    .msgDetail p{padding-top: 20px; padding-bottom: 20px;}
    .msgUser{border-top: 1px solid #bebebe; border-bottom: 1px solid #dbdbdb;}
    .msgSend{border-top: 1px solid #dbdbdb; border-bottom: 1px solid #bebebe;}
    .msgSend input{height: 60px; width: 830px; border: 0px;}
    .msgSend button{float: right;margin-top: 12px; width: 140px; height: 35px; border-radius: 6px; border: 0; background-color: #34538a; color: #fff;}

    /*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
    
    .msgContents{
        height: 500px;
        background-color:
        white; padding: 10px;
        overflow-y: auto;
    }
    
    .msgContents .chat_common{
        height: 30px;
        clear: both;
    }
    .msgContents .chat_common>img{
        border-radius: 50px;
        background-color: darkblue;
    }
    .msgContents .chat_common>span{
        font-size: 20px;
        vertical-align:top;
        font-weight: 400;
        color: black;
    }
    .msgContents .chat{
        float: left;
        position: relative;
        min-width: calc(50%);
        max-width: calc(100% - 44px);
        word-break:break-all; padding:
        5px; border-radius: 10px;
        font-size: 15px;
        color: black;
    }
    .msgContents .chat_date{
        clear: both;
        margin: 0px 10px;
        color:grey;
        font-size: 12px;
    }

     /*채팅 관리자 css*/
    .msgContents .chat_admin{
        background-color: lightgrey;
    }

    /*채팅 회원(사용자)*/
    .msgContents .chat_userId>img, .msgContents .chat_userId>span, .msgContents .chat_user, .msgContents .chat_userDate{
        float: right;
    }
    .msgContents .chat_user{
        background-color: rgb(10, 0, 150);
        color: white;
    }
</style>     
</head>
<body>
    <div id="wrap">

		<jsp:include page="../common/partnerMenubar.jsp"/>

        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap"><a href="#"><span style="width: 30px;height: 30px; margin-right: 30px;">메세지상세</span></a></div>
            <div class="con" style="color:#000">
                <span id="page_title"><img src="${pageContext.request.contextPath}/resources/images/admin/집로고.jpg" style="vertical-align: middle;"><p class="title_tt">메세지상세</p></span>
                <div class="con2">
                    <div class="msgDetail">
                        <div class="msgUser">
                            <br><img src="${pageContext.request.contextPath}/resources/uploadFiles/userProfile/${user.changeName}" width="50px" height="50px"> ${ user.userName } 님과의 대화
                        </div>
                        
                        
                        <div class="msgContents" id="messageArea">
                        	<c:forEach items="${ meList }" var="m">
                  				<c:choose>
                  					<c:when test="${ m.class_class_id eq 1 }">
			                            <div>
			                            	<div class="chat_common">
			                            		<img src= "${pageContext.request.contextPath}/resources/uploadFiles/userProfile/${user.changeName}" width='28px' height='28px'>
			                            		<span>${ user.userName }</span>
			                            	</div>
			                            	<div class='chat chat_admin'>
			                            		${ m.messageContent }
			                            	</div>
			                            	<div class='chat_date chat_adminDate' style='clear: both; margin: 0px 10px; color:grey; font-size: 10px;'>
			                            		${ m.messageSendTime }
			                            	</div>
			                            </div>
		                            </c:when>
		                            <c:otherwise>
		                            	<div>
		                            		<div class="chat_common chat_userId">
		                            			<img src="${pageContext.request.contextPath}/resources/uploadFiles/userProfile/${loginUser.changeName}" width='28px' height='28px'>
		                            			<span>GoodPlace</span>
		                            		</div>
	                            			<div class="chat chat_user">
	                            				${ m.messageContent }
	                            			</div>
	                            			<div class="chat_date chat_userDate">
	                            				${ m.messageSendTime }
	                            			</div>
		                            	</div>
		                            </c:otherwise>
	                            </c:choose>
                            </c:forEach>
                        </div>
                    
                        <div class="msgSend">
                            <input type="text" id="message" placeholder="메세지를 입력하세요">
                            <button onclick="sendBtn();">SEND</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<input type="hidden" id="userEmail" value="${ user.email }">
    <script>
        $(function(){
            $(".arrow").click(function(){
                $("#slide_menu").slideToggle(500);
            });
        });
        
 
	    // 메세지

	    

		function sendBtn(){
			sendMessage();
			$('#message').text("");
	    }
		
		// 날짜
		var Now = new Date();
		// 메시지 전송
	    let sock = new SockJS("http://192.168.30.197:8888/goodplace/echo/");
   		sock.onmessage = onMessage;
   		sock.onclose = onClose;
		function sendMessage() {
			var msg = $("#message").val();
			if(msg != ""){
				message = {};
			  	message.messageContent = $("#message").val();
		  	  	message.messageReceiver =  '${loginUser.email}';
		  	  	message.messageSender = '${user.email}';
		  	  	message.class_class_id = 2;
		  	  	message.messageSendTime = moment(Now).format('YYYY-MM-DD   h:mm a');	// 현재시간
			}
			console.log(message);
			sock.send(JSON.stringify(message));
			$("#message").val("");
		};
		
		// 서버로부터 메시지를 받았을 때
		function onMessage(msg) {
			var data = JSON.parse(msg.data);					// 받은 메시지 정보 (내용,시간)
			var name = $("#myName").val();						// 내 이름
			var tutorChangeName = $("#tutorChangeName").val();	// 관리자 프로필

			if(data.class_class_id != 1){		// 0: 회원  (회원이 보낸 메세지가 아닐때)
				$("#messageArea").append("<div><div class="+"'chat_common chat_userId'"+"><img src='"+"${pageContext.request.contextPath}/resources/uploadFiles/userProfile/" + '${loginUser.changeName}' +"' width='28px' height='28px'><span>GoodPlace</span></div><div class='chat chat_user'>"+ data.messageContent + "</div><div class='chat_date chat_userDate'>" + data.messageSendTime + "</div></div>");
			} else {							// 내가 보낸 메세지 일때
				$("#messageArea").append("<div><div class="+"'chat_common'"+"><img src='"+"${pageContext.request.contextPath}/resources/uploadFiles/userProfile/" + '${user.changeName}' +"' width='28px' height='28px'><span>"+ '${user.userName }' +"</span></div><div class='chat chat_admin'>"+ data.messageContent + "</div><div class='chat_date chat_adminDate' style='clear: both; margin: 0px 10px; color:grey; font-size: 10px;'>" + data.messageSendTime + "</div></div>");
			}
			$("#messageArea").scrollTop($("#messageArea")[0].scrollHeight); // 채팅창 스크롤 맨아래로 내리기
		};

		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			$("#messageArea").append("연결 끊김");

		};
    </script>

</body>
</html>