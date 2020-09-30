<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
#content div {
	box-sizing: border-box;
}

#content a {
	text-decoration: none;
}

#roomList {
	width: 80%;
	float: left;
}
/* 페이징바 시작 */
.pagingBar {
	width: 100%;
	margin: 30px auto;
	height: 60px;
	text-align: center;
	float: left;
}

.pagingBar button {
	width: 40px;
	height: 40px;
	color: gray;
	border-radius: 5px;
	background-color: fff;
	border: 1px solid #dcdcdc;
}
/* 페이징바 끝 */
section {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}

.common_tb {
	width: 980px;
	padding-top: 15px;
	margin: 0 auto;
}

.common_tb thead tr td {
	background-color: #f1f1f1;
	font-size: 18px;
	color: #333;
	padding: 10px 0;
	text-align: center;
	border-top: 1px solid #bebebe;
	border-bottom: 1px solid #bebebe;
}

.common_tb tbody tr td {
	padding: 10px 0;
	text-align: center;
	border-bottom: 1px solid rgb(241, 241, 241);
	color: #505050;
	font-size: 15px;
}

#roomList>div>h1>.Btn {
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

/* content 끝*/
</style>

</head>
<body>
	<!-- header -->
	<jsp:include page="../common/menubar.jsp" />

	<!-- content -->
	<div id="content">
		<jsp:include page="../common/myPageMenubar.jsp" />

		<br>
		<div id="content" style="height: 100%">


			<!-- 인기등록 숙소-->
			<div id="roomList" style="width: 100%; margin: 0 auto;">
				<div>
					<h1 style="width: 1000px; padding-left: 80px; text-align: center;">
						1:1문의 <input type="button"
							onclick="location.href='inqueryEnroll.bo'" class="Btn"
							value="1:1문의하기">
					</h1>

				</div>

				<div>
					<table id="subBtn" class="common_tb" cellpadding="0" cellspacing="0">
						<thead>
							<tr>
								<td width="150px">상담구분</td>
								<td width="500px">제목</td>
								<td width="200px">문의신청일</td>
								<td width="200px">상태</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ qList }" var="qList">
								
									<tr id="">
										<td style="display:none">${ qList.inNo }</td>
										<c:choose>
											<c:when test="${  qList.inqCategory eq 1 }">
												<td>일반</td>
											</c:when>
											<c:when test="${  qList.inqCategory eq 2 }">
												<td>상품</td>
											</c:when>
											<c:when test="${  qList.inqCategory eq 3 }">
												<td>취소환불</td>
											</c:when>
											<c:when test="${  qList.inqCategory eq 4 }">
												<td>포인트</td>
											</c:when>
											<c:when test="${  qList.inqCategory eq 5 }">
												<td>숙소신고</td>
											</c:when>
											<c:when test="${  qList.inqCategory eq 6 }">
												<td>체험신고</td>
											</c:when>
										</c:choose>
											<td>${ qList.inqTitle }</td>
											<td>${ qList.inqDate}</td>
										<c:choose>
											<c:when test="${ qList.inqReStatus eq 1 }">
												<td>답변대기</td>
											</c:when>
											<c:otherwise>
												<td>답변완료</td>
											</c:otherwise>
										</c:choose>
									</tr>
								
							</c:forEach>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>

	

		<!-- /content -->
		<br clear="both">
	</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp" />
	<script>
		$(function(){
			 $("#subBtn tbody tr").click(function(){
                 location.href="inQuiryDt.bo?inNo=" + $(this).children().eq(0).text();
              });  
		});
		//$("#subBtn").click(function(){
		//	$(this).children().eq(0).submit();
		//})
	</script>
</body>
</html>