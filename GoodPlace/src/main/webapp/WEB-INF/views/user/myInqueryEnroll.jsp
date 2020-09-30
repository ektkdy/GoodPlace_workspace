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
		<div id="roomList" style="width: 100%; margin: 0 auto;">
			<div>
				<h1 style="width: 1000px; padding-left: 80px;">1:1문의하기</h1>

			</div>
			<div>
				<table class="common_tb" cellpadding="0" cellspacing="0">
					<form action="enrollInquery.bo" method="post">
						<input type="hidden" name="userNo" value="${ loginUser.usNo }">
					<thead>
						<tr>
							<th width="150px">상담구분</th>
							<c:choose>
								<c:when test="${ !empty review }">
									<td class="category" colspan="3" width="600px" style="padding-left: 20px;">
										후기신고
										<input type="hidden" name="inqCategory" value="5">
									</td>
								</c:when>
								<c:otherwise>
									<td class="category" colspan="3" width="600px">
										<input type="radio" name="inqCategory" value="1" selected> 일반문의
										<input type="radio" name="inqCategory" value="2"> 상품문의 <input
										type="radio" name="inqCategory" value="3"> 취소, 환불 
										<input type="radio" name="inqCategory" value="4"> 포인트
										<input id="declaration" type="radio" name="inqCategory" value="5"> 숙소신고 
										<input id="declaration1" type="radio" name="inqCategory" value="5"> 체험신고
									</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${ !empty review }">
								<input type="hidden" name="reNo" value="${ review.reNo }">
								<tr>
									<th>제목</th>
									<td colspan="3" style="text-align: left;">
										<input type="text" name="inqTitle" style="width: 400px; margin-left: 20px;" required>
									</td>
								</tr>
								<tr>
									<th>신고후기 제목</th>
									<td style="text-align: left; padding-left: 20px;">
										${ review.reTitle }
									</td>
								</tr>
								<tr>
									<th>신고후기 내용</th>
									<td style="text-align: left; padding-left: 20px;">
										${ review.reContent }
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th>제목</th>
									<td colspan="3" style="text-align: left;"><input type="text"
										name="inqTitle" style="width: 400px; margin-left: 20px;"
										required></td>
								</tr>
								<tr class="roomsDisable disable">
									<th>신고숙소</th>
									<td style="text-align: left;"><select class="requiredOption"
										name="roNo" style="margin-left: 20px;">
											<option value=0>숙소를 선택해주세요</option>
											<c:forEach items="${ myRoomPay }" var="myRoomPay">
												<option value="${ myRoomPay.roNo }">숙소이름 : ${ myRoomPay.roomsTitle }
													/ 다녀간 날짜 : ${myRoomPay.startDays} ~ ${ myRoomPay.endDays }</option>
											</c:forEach>
									</select></td>
								</tr>
		
								<tr class="expDisable disable">
									<th>신고숙소</th>
									<td style="text-align: left;">
										<select class="requiredOption1" name="exNo" style="margin-left: 20px;">
												<option value=0>체험을 선택해주세요</option>
												<c:forEach items="${ myExpPay }" var="myExpPay">
													<option value="${ myExpPay.exNo }">숙소이름 : ${ myExpPay.expTitle }
														/ 다녀간 날짜 : ${myExpPay.expDate}</option>
												</c:forEach>
										</select>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>

						<tr style="width: 100px;">
							<td colspan="4" style="height: 200px;"><textarea
									name=inqContent style="width: 100%; height: 100%;" required></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<div>
									<input type="submit" class="Btn" value="1:1문의하기"
										style="text-align: center; float: none; margin-top: 0px;">
								</div>
							</td>
						</tr>
					</tbody>
					</form>
				</table>
			</div>
		</div>
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