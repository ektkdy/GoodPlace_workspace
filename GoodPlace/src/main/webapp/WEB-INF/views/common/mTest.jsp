<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>

	<div class="col-8" style="float: left; text-align: center;">
		${ room.tutorEmail } 님과 대화</div>
	<div class="col-2" style="float: right">
	
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="submit"/>
	<div id="messageArea">
	
	</div>
</body>
<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});

	let sock = new SockJS("http://localhost:8888/goodplace/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송

	function sendMessage() {
		var msg = $("#message").val();
		if(msg != ""){
			message = {};
			message.chNo = '${room.chNo}'
		  	message.messageContent = $("#message").val()
	  	  	message.messageReceiver = '${tutorEmail}'
	  	  	message.messageSender = '${loginUser.email}'
	  	  	message.CLASS_class_id = 1//'${room.CLASS_class_id}'
		}
		console.log(message);
		sock.send(JSON.stringify(message));
		$("#message").val("");
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
</script>
</html>