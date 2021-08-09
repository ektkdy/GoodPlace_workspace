<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>체험메인</title>

    <style>
        /* content 스타일 시작*/
       	/* 여백 초기화 */
      	body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form, hr {margin: 0; padding: 0;}
        #content{
            clear: both;
            width: 1200px;
            margin: 0 auto;
            height: auto;
        }
        #content>div div{
            float:left; 
            box-sizing: border-box;
        }
        .exp1{
            margin:10px 0 8px 10px;
            color:gray;
        }
        .exp2{
            margin:0 10px 8px 0;
        }
        .exp3{
            margin:38px 10px 0 0;
        }
        .expCount{
            font-weight: 600; color:gray;
        }
        .expCategory{
            margin-bottom:5px;
        }
        .heartMargin{
            margin:10px;
        }
        .likeIt:hover{
            margin-right:20px;
        }
        .smallCategory{
            width:172px;
            height:76px;
            padding:10px;
            border-radius:4px;
            margin:10px;
            border:2px solid lightgray;
        }
        .biotoreGroup>div *{
            margin:0px;
        }
        .biotoreGroup h3{
            font-weight: 2000;
        }
        .backgroundGray{
            background-color:rgba(24, 76, 136, 0.33);
        }
        .buttonStyle1{
            border-radius: 5px;
            background-color:rgb(24, 76, 136);
            color:white;
            font-size: 1.5em;
            height:60px;
            width: 350px;
            border:none;
        }
        .alignRight{
            text-align:right;
        }
        .pointButton{
            height:44px; width:126px; margin-top:57px; font-size:14px; border:1px solid gray; background-color:white; font-weight:900; color: gray;
        }
        .buttonStyle3{
            background-color:gray;
            color:white;
        }
        .categoryPile{
            margin:60px 116px;
        }
        .sort{
            font-size: 17px;
            font-weight: 800;
            color: gray;
        }
        .sort:hover{
            color:black;
        }
        .smallCategory:hover .expCategory{
        	color:black;
        }
        .borderDefault{
        	border:2px solid lightgray;
        }
        .expArea{
            margin:35px 35px 35px 35px;
            border:2px solid lightgray;
        }
        /* 페이징바 시작 */ 
        .pagingBar{
            width:100%;
            margin:60px auto; 
            height:60px; 
            text-align:center;
            float:left;
            margin-left:40%;
        }
        .pagingBar button{
            width:40px;
            height:40px;
            color:gray;
            border-radius: 5px;
            background-color: ghostwhite;
            border:1px solid #dcdcdc;
        }
        .pagingBar a{
        	display:block;
            width:40px;
            height:30px;
            color:gray;
            border-radius: 5px;
            background-color: ghostwhite;
            border:1px solid #dcdcdc;
            float:left;
            margin:10px;
            padding-top:10px;
        }
        /* 페이징바 끝 */
        /* content 스타일 끝*/
    </style>
</head>
<body>

    <!-- header -->
	<jsp:include page="../common/menubar.jsp"/>

    <!-- content -->
    <div id="content">
    	<!-- 체험 카테고리, 카테고리별 등록 개수 -->
        <div style="width:100%; height:180px;">
            <div class="categoryPile">
        	 	<c:forEach items="${ exp.expCountPerCategory }" var="count" varStatus="status">
	                <div class="smallCategory" id="category${ status.count }">
	                	<c:if test="${status.index eq 0}"><h3 class="expCategory">라이프 및 스타일</h3></c:if>
	                    <c:if test="${status.index eq 1}"><h3 class="expCategory">문화와 역사</h3></c:if>
	                    <c:if test="${status.index eq 2}"><h3 class="expCategory">미술과 디자인</h3></c:if>
	                    <c:if test="${status.index eq 3}"><h3 class="expCategory">스포츠&amp;피트니스</h3></c:if>
	                    <c:if test="${status.index eq 4}"><h3 class="expCategory">야외활동</h3></c:if>
	                    <p class="expCount expCategory">체험 ${ count }개</p>
	                </div>
	                	<input type="hidden" name="expCategory" value="${status.count}"/>
                </c:forEach>
            </div>
        </div>
        <div style="width:100%;">
        
            <div style="width:100%; height:58px;">
                <div style="width:50%; height:100%; padding-top:14px;"><h2>모든 체험</h2></div>
                <div style="width:50%; height:100%; text-align:right; padding-top:20px;"><a id="popularSort" class="sort">인기순</a>&nbsp;|&nbsp;<a id="cheapSort" class="sort">가격 낮은 순</a>&nbsp;|&nbsp;<a id="expensiveSort" class="sort">가격 높은 순</a></div>
            </div><br><br>
            <hr style="border:2px solid lightgray; margin:15px 0 18px 0;">
            <div id="expContainer" style="width:1200px;">
			
			<c:choose>
				<c:when test="${ pi.currentPage eq 1}">
					<c:forEach items="${ expList }" var="exp" varStatus="status" begin="0" end="4">
			            <div style="width:100%;" class="expContainer">
			                <div style="width:94%;"  class="expArea">
			                    <div style="height:216px; width:292px;" class="expContainerSubmit">
			                        <img src="${pageContext.request.contextPath}/resources/uploadFiles/${ exp.changeName }" width="100%;" height="100%;"/>
			                    </div>
			                    <div style="height:auto; width:830px; float:left;" class="expContainerSubmit">
			                    <div style="width:50%; height:auto;">
			                        <h3 class="exp1">${ exp.expCategoryString }</h3>
			                        <h3 class="exp1" style="color:black;">${ exp.expTitle }</h3>
			                        <h3 class="exp1">${ exp.paName }</h3>
			                        <h3 class="exp1" style="margin-top:6px; font-weight:520; color:rosybrown; text-shadow:0.8px 0.8px 1px brown;">${ exp.expTag }</h3>	
			                        <h3 class="exp1">${ exp.useTime }시간 소요</h3>
			                        <h3 class="exp1">준비물 : ${ exp.supplies }</h3>
			                    </div>
			                    <div style="width:50%;" class="alignRight">
			                        <img class="likeIt" src="${pageContext.request.contextPath}/resources/images/user/emptyHeart.jpg" class="heartMargin" />
			                        <br><br><br><br><br>
			                        <h3 class="exp3">1인당 <fmt:formatNumber type='number' value='${ exp.price }'/>원</h3>
			                    </div>
			                    </div>
			                </div>
			                <form action="showExp.exp" class="showExpDetail">
			                	<input type="hidden" name="exNo" value="${ exp.exNo }"/>
			                	<c:choose>
			                		<c:when test="${ exp.expDateString ne null} or ${ exp.expDateString ne ''}" >
			                			<input type="hidden" name="expDateString" value="${ exp.expDateString }"/>
			                		</c:when>
			                		<c:when test="${ expDateString ne null} or ${ !empty expDateString} or ${ expDateString ne ''}" >
			                			<input type="hidden" name="expDateString" value="${ expDateString }"/>
			                		</c:when>
			                	</c:choose>
			                </form>
			            </div>
		          	</c:forEach>
				</c:when>
				<c:when test="${ pi.currentPage ge 2 }">
					<c:forEach items="${ expList }" var="exp" varStatus="status" begin="${ ((pi.currentPage - 1) * pi.pageLimit)}" end="${ (pi.currentPage * pi.pageLimit) - 1 }">
			            <div style="width:100%;" class="expContainer">
			                <div style="width:94%;"  class="expArea">
			                    <div style="height:216px; width:292px;" class="expContainerSubmit">
			                        <img src="${pageContext.request.contextPath}/resources/uploadFiles/${ exp.changeName }" width="100%;" height="100%;"/>
			                    </div>
			                    <div style="height:auto; width:830px; float:left;" class="expContainerSubmit">
			                    <div style="width:50%; height:auto;">
			                        <h3 class="exp1">${ exp.expCategoryString }</h3>
			                        <h3 class="exp1" style="color:black;">${ exp.expTitle }</h3>
			                        <h3 class="exp1">${ exp.paName }</h3>
			                        <h3 class="exp1" style="margin-top:6px; font-weight:520; color:rosybrown; text-shadow:0.8px 0.8px 1px brown;">${ exp.expTag }</h3>	
			                        <h3 class="exp1">${ exp.useTime }시간 소요</h3>
			                        <h3 class="exp1">준비물 : ${ exp.supplies }</h3>
			                    </div>
			                    <div style="width:50%;" class="alignRight">
			                        <img class="likeIt" src="${pageContext.request.contextPath}/resources/images/user/emptyHeart.jpg" class="heartMargin" />
			                        <br><br><br><br><br>
			                        <h3 class="exp3">1인당<fmt:formatNumber type='number' value='${ exp.price }'/>원</h3>
			                    </div>
			                    </div>
			                </div>
			                <form action="showExp.exp" class="showExpDetail">
			                	<input type="hidden" name="exNo" value="${ exp.exNo }"/>
			                	<c:choose>
			                		<c:when test="${ exp.expDateString ne null} or ${ exp.expDateString ne ''}" >
			                			<input type="hidden" name="expDateString" value="${ exp.expDateString }"/>
			                		</c:when>
			                		<c:when test="${ expDateString ne null} or ${ !empty expDateString} or ${ expDateString ne ''}" >
			                			<input type="hidden" name="expDateString" value="${ expDateString }"/>
			                		</c:when>
			                	</c:choose>
			                </form>
			            </div>
		          	</c:forEach>
				</c:when>
				<c:when test="${ pi.currentPage eq pi.maxPage }">
					<c:forEach items="${ expList }" var="exp" varStatus="status" begin="${ ((pi.currentPage - 1) * pi.pageLimit) }" end="${ pi.listCount - 1 }">
			            <div style="width:100%;" class="expContainer">
			                <div style="width:94%;"  class="expArea">
			                    <div style="height:216px; width:292px;" class="expContainerSubmit">
			                        <img src="${pageContext.request.contextPath}/resources/uploadFiles/${ exp.changeName }" width="100%;" height="100%;"/>
			                    </div>
			                    <div style="height:auto; width:830px; float:left;" class="expContainerSubmit">
			                    <div style="width:50%; height:auto;">
			                        <h3 class="exp1">${ exp.expCategoryString }</h3>
			                        <h3 class="exp1" style="color:black;">${ exp.expTitle }</h3>
			                        <h3 class="exp1">${ exp.paName }</h3>
			                        <h3 class="exp1" style="margin-top:6px; font-weight:520; color:rosybrown; text-shadow:0.8px 0.8px 1px brown;">${ exp.expTag }</h3>	
			                        <h3 class="exp1">${ exp.useTime }시간 소요</h3>
			                        <h3 class="exp1">준비물 : ${ exp.supplies }</h3>
			                    </div>
			                    <div style="width:50%;" class="alignRight">
			                        <img class="likeIt" src="${pageContext.request.contextPath}/resources/images/user/emptyHeart.jpg" class="heartMargin" />
			                        <br><br><br><br><br>
			                        <h3 class="exp3">1인당 <fmt:formatNumber type='number' value='${ exp.price }'/>원</h3>
			                    </div>
			                    </div>
			                </div>
			                <form action="showExp.exp" class="showExpDetail">
			                	<input type="hidden" name="exNo" value="${ exp.exNo }"/>
			                	<c:choose>
			                		<c:when test="${ exp.expDateString ne null} or ${ exp.expDateString ne ''}" >
			                			<input type="hidden" name="expDateString" value="${ exp.expDateString }"/>
			                		</c:when>
			                		<c:when test="${ expDateString ne null} or ${ !empty expDateString} or ${ expDateString ne ''}" >
			                			<input type="hidden" name="expDateString" value="${ expDateString }"/>
			                		</c:when>
			                	</c:choose>
			                </form>
			            </div>
		          	</c:forEach>
				</c:when>
			</c:choose>
	            
          	
          	<c:if test="${ empty expList }">
          		<div class="expContainer"><h2 style="color:gray;">해당 카테고리에 등록된 체험이 없습니다.</h2></div>
          	</c:if>
            </div>
        </div>
        
        <!-- [이전] -->
        <div class="pagingBar expContainer">
		<c:if test="${ pi.currentPage ne 1 }">
			<a href="showExpList.exp?expCategoryString=${ expCategoryString }&expDateString=${ expDateString }&expTitle=${ expTitle }&currentPage=${ pi.currentPage - 1 }">&lt;</a>
		</c:if>
		<!-- [중간버튼들] -->
		<c:forEach var="p" begin="${ pi.startPage }" end ="${ pi.endPage }">
			<c:choose>
				<c:when test="${ p eq pi.currentPage }">
					<a href="showExpList.exp?expCategoryString=${ expCategoryString }&expDateString=${ expDateString }&expTitle=${ expTitle }&currentPage=${ p }" style="color:red; font-weight:bold;">${ p }</a>
				</c:when>
				<c:otherwise>
					<a href="showExpList.exp?expCategoryString=${ expCategoryString }&expDateString=${ expDateString }&expTitle=${ expTitle }&currentPage=${ p }">${ p }</a>
				</c:otherwise>
			</c:choose>    
       	</c:forEach>
       	
       	<!-- [다음] -->
       	<c:if test="${ pi.currentPage ne pi.maxPage }">
       		<a href="showExpList.exp?expCategoryString=${ expCategoryString }&expDateString=${ expDateString }&expTitle=${ expTitle }&currentPage=${ pi.currentPage + 1 }">&gt;</a>
       	</c:if>
		</div>
        <br style="clear:both;">
    </div>

    <script>
    
        // 찜하기 기능 : 하트 아이콘 색깔 바꿔주기
        $('#content').find('.likeIt').each(function( i , e ){
            $(this).toggleClass('heartMargin');
            $(this).click(function(){
                if($(this).attr('src') == '${pageContext.request.contextPath}/resources/images/user/emptyHeart.jpg'){
                    $(this).attr('src', '${pageContext.request.contextPath}/resources/images/user/redHeartIcon.png');
                    $(this).toggleClass('heartMargin');
                    alert('해당 체험을 찜하기 했습니다.');
                }else{
                    $(this).attr('src', '${pageContext.request.contextPath}/resources/images/user/emptyHeart.jpg');
                    $(this).toggleClass('heartMargin');
                    alert('찜하기를 취소하였습니다.');
                }
            });
        });
    
    	// 체험상세 페이지로 이동
   		$(function(){
    		$(".expContainerSubmit").click(function(){
    			$(this).closest('.expContainer').find(".showExpDetail").submit();
    		});
    	});
  		$(document).on("click",".expContainerSubmit",function(){
  			$(this).closest('.expContainer').find(".showExpDetail").submit();
  		});
    	
    	// 상단의 카테고리 클릭시 해당 카테고리의 모든 체험 조회
    	$(".smallCategory").on("click",function(){  
    		
    		// 클릭한 카테고리의 border색 변경
    		var id = $(this).attr("id");
    		var idNo = id.substr(8, 1);
    		
    		for(var i=1; i<=5; i++){
    				$("#category" + i).css("border", "2px solid lightgray");
    		}
    		
    		$(this).css("border", "2px solid #FFBB00");
    		
    		var id = $(this).attr("id");
    		var i = id.substr(8, 1);
    		
			$.ajax({
				url:"showCategory.exp",
				data:{categoryNo:i},
				type:"post",
				success:function(expListPerCategory){
					
					if(expListPerCategory != null){
						var expList = expListPerCategory;
						$(".expContainer").remove();
						$.each(expList, function (index, exp) {
							let priceTemp = exp.price.toLocaleString('ko-KR');
							$("#expContainer").append(	'<div style="width:100%;" class="expContainer">' +
											                '<div style="width:94%;"  class="expArea">' +
											                    '<div style="height:216px; width:292px;" class="expContainerSubmit">' +
											                        '<img src="${pageContext.request.contextPath}/resources/uploadFiles/' + exp.changeName + '" width="100%;" height="100%;"/>' +
											                    '</div>' +
											                    '<div style="height:auto; width:830px; float:left;" class="expContainerSubmit">' +
											                    '<div style="width:50%; height:auto;">' +
											                        '<h3 class="exp1">' + exp.expCategoryString + '</h3>' +
											                        '<h3 class="exp1" style="color:black;">' + exp.expTitle + '</h3>' +
											                        '<h3 class="exp1">' + exp.paName +'</h3>' +
											                        '<h3 class="exp1" style="margin-top:6px; font-weight:520; color:rosybrown; text-shadow:0.8px 0.8px 1px brown;">' + exp.expTag + '</h3>' +	
											                        '<h3 class="exp1">' + exp.useTime + '시간 소요</h3>' +
											                        '<h3 class="exp1">준비물 : ' + exp.supplies + '</h3>' +
											                    '</div>' +
											                    '<div style="width:50%;" height:100%; class="alignRight">' +
											                        '<img class="likeIt" src="${pageContext.request.contextPath}/resources/images/user/emptyHeart.jpg" class="heartMargin" />' +
											                        '<br><br><br><br><br>' +
											                        '<h3 class="exp3">1인당 ' + priceTemp + '원</h3>' +
											                    '</div>' +
											                    '</div>' +
											                '</div>' +
											                '<form action="showExp.exp" class="showExpDetail">' +
											                	'<input type="hidden" name="exNo" value="' + exp.exNo + '"/>' +
											                	'<input type="hidden" name="expDateString" value="${ expDateString }"/>' +
											                '</form>' +
									            		'</div>');
					});
						
					}
				},
				error:function(){
					//alert("해당 카테고리에 등록된 체험이 없습니다.");
					$("#expContainer").children(".expContainer").remove();
					$("#expContainer").append("<div class='expContainer'><h2 style='color:gray;'>해당 카테고리에 등록된 체험이 없습니다.</h2></div>");
				}
			});
    	});
    	
    	// 인기순 정렬
		$("#popularSort").on("click",function(){     
			$.ajax({
				url:"popularSortExp.exp",
				data:{},
				type:"post",
				success:function(expListAddExppay){
					var expList = expListAddExppay;
					$("#expContainer").children(".expContainer").remove();
					$.each(expList, function (index, exp) {
						let priceTemp = exp.price.toLocaleString('ko-KR');
						$("#expContainer").append(	'<div style="width:100%;" class="expContainer">'+
										                '<div style="width:94%;"  class="expArea">'+
										                    '<div style="height:216px; width:292px;" class="expContainerSubmit">'+
										                        '<img src="${pageContext.request.contextPath}/resources/uploadFiles/'+ exp.changeName + '" width="100%;" height="100%;"/>'+
										                    '</div>'+
										                    '<div style="height:auto; width:830px; float:left;" class="expContainerSubmit">'+
										                    '<div style="width:50%; height:auto;">'+
										                        '<h3 class="exp1">'+ exp.expCategoryString + '</h3>'+
										                        '<h3 class="exp1" style="color:black;">'+ exp.expTitle + '</h3>'+
										                        '<h3 class="exp1">'+ exp.paName +'</h3>'+
										                        '<h3 class="exp1" style="margin-top:6px; font-weight:520; color:rosybrown; text-shadow:0.8px 0.8px 1px brown;">'+ exp.expTag + '</h3>'+	
										                        '<h3 class="exp1">'+ exp.useTime + '시간 소요</h3>'+
										                        '<h3 class="exp1">준비물 : '+ exp.supplies + '</h3>'+
										                    '</div>'+
										                    '<div style="width:50%;" class="alignRight">'+
										                        '<img class="likeIt" src="${pageContext.request.contextPath}/resources/images/user/emptyHeart.jpg" class="heartMargin" />'+
										                        '<br><br><br><br><br>'+
										                        '<h3 class="exp3">1인당 '+ priceTemp + '원</h3>'+
										                    '</div>'+
										                    '</div>'+
										                '</div>'+
										                '<form action="showExp.exp" class="showExpDetail">'+
										                	'<input type="hidden" name="exNo" value="'+ exp.exNo + '"/>'+
										                	'<input type="hidden" name="expDateString" value="${ expDateString }"/>'+
										                '</form>'+
								            		'</div>');
					})

				},
				error:function(msg){
					console.log("ajax 통신실패");	
				}
			});
		});
    	
    	// 가격 낮은 순 정렬
		$("#cheapSort").on("click",function(){     
			$.ajax({
				url:"cheapSortExp.exp",
				data:{},
				type:"post",
				success:function(expListCheapSort){
					var expList = expListCheapSort;
					$("#expContainer").children(".expContainer").remove();
					$.each(expList, function (index, exp) {
						let priceTemp = exp.price.toLocaleString('ko-KR');
						$("#expContainer").append(	'<div style="width:100%;" class="expContainer">'+
										                '<div style="width:94%;"  class="expArea">'+
										                    '<div style="height:216px; width:292px;" class="expContainerSubmit">'+
										                        '<img src="${pageContext.request.contextPath}/resources/uploadFiles/'+ exp.changeName + '" width="100%;" height="100%;"/>'+
										                    '</div>'+
										                    '<div style="height:auto; width:830px; float:left;" class="expContainerSubmit">'+
										                    '<div style="width:50%; height:auto;">'+
										                        '<h3 class="exp1">'+ exp.expCategoryString + '</h3>'+
										                        '<h3 class="exp1" style="color:black;">'+ exp.expTitle + '</h3>'+
										                        '<h3 class="exp1">'+ exp.paName +'</h3>'+
										                        '<h3 class="exp1" style="margin-top:6px; font-weight:520; color:rosybrown; text-shadow:0.8px 0.8px 1px brown;">'+ exp.expTag + '</h3>'+	
										                        '<h3 class="exp1">'+ exp.useTime + '시간 소요</h3>'+
										                        '<h3 class="exp1">준비물 : '+ exp.supplies + '</h3>'+
										                    '</div>'+
										                    '<div style="width:50%;" class="alignRight">'+
										                        '<img class="likeIt" src="${pageContext.request.contextPath}/resources/images/user/emptyHeart.jpg" class="heartMargin" />'+
										                        '<br><br><br><br><br>'+
										                        '<h3 class="exp3">1인당 '+ priceTemp + '원</h3>'+
										                    '</div>'+
										                    '</div>'+
										                '</div>'+
										                '<form action="showExp.exp" class="showExpDetail">'+
										                	'<input type="hidden" name="exNo" value="'+ exp.exNo + '"/>'+
										                	'<input type="hidden" name="expDateString" value="${ expDateString }"/>'+
										                '</form>'+
								            		'</div>');
					})

				},
				error:function(msg){
					console.log("ajax 통신실패");	
				}
			});
		});
    	
    	// 가격 높은 순 정렬
    	$("#expensiveSort").on("click",function(){     
			$.ajax({
				url:"expensiveSortExp.exp",
				data:{},
				type:"post",
				success:function(expListExpensiveSort){
					var expList = expListExpensiveSort;
					$("#expContainer").children(".expContainer").remove();
					$.each(expList, function (index, exp) {
						let priceTemp = exp.price.toLocaleString('ko-KR');
						$("#expContainer").append(	'<div style="width:100%;" class="expContainer">'+
										                '<div style="width:94%;"  class="expArea">'+
										                    '<div style="height:216px; width:292px;" class="expContainerSubmit">'+
										                        '<img src="${pageContext.request.contextPath}/resources/uploadFiles/'+ exp.changeName + '" width="100%;" height="100%;"/>'+
										                    '</div>'+
										                    '<div style="height:auto; width:830px; float:left;" class="expContainerSubmit">'+
										                    '<div style="width:50%; height:auto;">'+
										                        '<h3 class="exp1">'+ exp.expCategoryString + '</h3>'+
										                        '<h3 class="exp1" style="color:black;">'+ exp.expTitle + '</h3>'+
										                        '<h3 class="exp1">'+ exp.paName +'</h3>'+
										                        '<h3 class="exp1" style="margin-top:6px; font-weight:520; color:rosybrown; text-shadow:0.8px 0.8px 1px brown;">'+ exp.expTag + '</h3>'+	
										                        '<h3 class="exp1">'+ exp.useTime + '시간 소요</h3>'+
										                        '<h3 class="exp1">준비물 : '+ exp.supplies + '</h3>'+
										                    '</div>'+
										                    '<div style="width:50%;" class="alignRight">'+
										                        '<img class="likeIt" src="${pageContext.request.contextPath}/resources/images/user/emptyHeart.jpg" class="heartMargin" />'+
										                        '<br><br><br><br><br>'+
										                        '<h3 class="exp3">1인당 '+ priceTemp + '원</h3>'+
										                    '</div>'+
										                    '</div>'+
										                '</div>'+
										                '<form action="showExp.exp" class="showExpDetail">'+
										                	'<input type="hidden" name="exNo" value="'+ exp.exNo + '"/>'+
										                	'<input type="hidden" name="expDateString" value="${ expDateString }"/>'+
										                '</form>'+
								            		'</div>');
					})

				},
				error:function(msg){
					console.log("ajax 통신실패");
				}
			});
		});
    	
    </script>
	
    <!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	

</body>
</html> 