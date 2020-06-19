<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소검색</title>
    
    <style>
	/*메인 검색바(숙소, 체험)*/
		#mainSearch{
		    clear: both;
		    height: 100px;
		    width: 1200px;
		    float: left;
		    left: 0;
		    right: 0;
		}
	/*숙소,체험 버튼*/
		#mainSearch .chgBtn{
		    height: 30px;
		}
		#mainSearch .chgBtn>a{
		    cursor:pointer;
		}
		.search *{ box-sizing:border-box; border}
	/*검색텍스트박스 (위치, 날짜, 인원수)*/
		#mainSearch .input{
		    height: 60px;
		}
		#mainSearch .input .liBox{
		    border: solid 1px lightgray;
		    height: 58px;
		    width: 260px; 
		}
		#mainSearch .input>li{
		    display: inline-block;
		    position: relative;
		    list-style-type: none;
		    margin:auto;
		    text-align: left;
		}
	/* content 시작*/
		#content{
		    clear: both;
		    width: 1200px;
		    height: auto;
		    margin: 0 auto;
		}
		#searchbar{
		      clear: both;
		      width: 1200px;
		      height: auto;
		      margin: 0 auto;
		      margin-top:40px;
		}
		#content div{
		    box-sizing:border-box;
		}
		#content a{
		    text-decoration: none;
		}
	
	/*인풋 태그*/
		#mainSearch .input>li>input{
		    width: 100%;
		    height: 35px;
		    box-sizing: border-box;
		    border:0px;
		    padding: 7px 15px;
		}
		#mainSearch .input>li>b{
		    margin-left: 15px;
		    font-size: 12px;
		}
	/*submit버튼 검색*/
		#mainSearch .input>li>#sub{
		    width: 120px;
		    height: 50px;
		    background-color: #63b8ee;
		    color: #fff;
		    font-family:Arial;
		    font-size:15px;
		    font-weight:bold;
		}
		#mainSearch .input>li>#sub:hover{
		    background-color: #2aa3f3;
		}
		
	/*이벤트 슬라이더*/
		.bxslider img{
		    height: auto;
		    max-height: 475px;
		    margin: auto;
		}
		/*슬라이더 크기*/
		#eventSlider{
		    min-width:840px; 
		    width: auto; 
		    max-width: 840px; 
		    margin: 0 auto;
		    clear: both;
		}
		.bx-wrapper{
		    margin-bottom: 50px;
		}
	
	/*파워등록숙소,인기숙소*/
	   #roomList{
	
	   }
	   #roomList .menu{
	       height: 30px;
	       margin-left: 130px;
	   }
	   #roomList .menu>a{
	       cursor: pointer;
	   }
	   #roomList .rooms{
	       list-style-type: none;
	   }
	   #roomList .searchRoom{
	       margin: 0 auto;
	       text-align: center;
	       height:auto;
	   }
	   #roomList .power>li{
	       display: inline-block;
	       width: 20%;
	   	vertical-align: top;
	   }
	   #roomList .power>li>a{
	   	text-decoration: none;
	   }
	   #roomList .power>li>a>div{
	   	width: 220px;
	   	text-align: left;
	   	margin-left: 10px;
	   }
	   .halfWidth{
	       width:50%;
	       float:left;
	   }
		a{
			color:black;
		}
	/* 페이징바 시작 */ 
		.pagingBar{
		    width:100%;
		    margin:30px auto; 
		    height: 60px; 
		
		    text-align:center;
		    float:left;
		}
		.pagingBar button{
		    width:40px;
		    height:40px;
		    color:gray;
		    border-radius: 5px;
		    background-color: ghostwhite;
		    border:1px solid #dcdcdc;
		}
	/* 페이징바 끝 */
	/* content 끝*/
    </style>
    
</head>
<body>
    <!-- header -->
	<jsp:include page="../common/menubar.jsp"/>
    
    <!-- filter -->
	<jsp:include page="../common/filter.jsp"/>
    
    <!-- searchbar -->
	<div id="searchbar">
	    <div id="mainSearch">
	        <div class="search chgBtn">
	            <a style="color:#63b8ee; cursor: inherit;" onclick="searchView1();">숙소</a> | 
	           <a onclick="searchView2();">체험</a>
	       </div>
	
	       <!-- 숙소검색 -->
	       <form action="searchRoWithFilter.ro" id="roomSearchArea" method="get" >
	           <div class="search input" style="display: block;">
	               <li class="liBox">
	                   <b>위치</b>
	                   <input type="text" name="tripArea" id="tripArea" placeholder="${ tripArea }" value="${ tripArea }">
	               </li>
	               <li class="liBox">
	                   <b>가는날짜</b>
	                   <input type="date" name="tripStartDate" id="tripStartDate" placeholder="${ tripStartDate }" value="${ tripStartDate }">
	               </li>
	               <li class="liBox">
	                   <b>오는날짜</b>
	                   <input type="date" name="tripEndDate" id="tripEndDate" placeholder="${ tripEndDate }" value="${ tripEndDate }">
	               </li>
	               <li class="liBox">
	                   <b>인원수</b>
	                   <input type="number" name="tripPeople" id="tripPeople" placeholder="${ tripPeople }" value="${ tripPeople }">
	               </li>
	               <li style="position:absolute; margin-left:5px;">
	                   <input id="subRoomInfo" type="submit" value="숙소검색" style="width:80px; height:58px; padding:0px;">
	               </li>
	           </div>
	           <input type="hidden" id="filterValue" name="filterValue"/>
	       </form>
	    	<script>
	       	$(function(){
	       		$("#roomSearchArea #subRoomInfo").click(function(){
	
	       			$("#roomSearchArea").submit();
	       			
	       		});
	       	});
	       </script>
	     	 	<!-- 체험검색 -->
	        <form action="showExp.exp" id="expSearchArea" method="get">
	            <div class="experience input" style="display: none;">
	                <li class="liBox1">
	                    <b>태그</b>
	                    <select name="expCategoryString" placeholder="체험 목록을 선택하세요">
	                    	<option value="라이프 및 스타일">라이프 및 스타일</option>
	                    	<option value="문화와 역사">문화와 역사</option>
	                    	<option value="미술과 디자인">미술과 디자인</option>
	                    	<option value="스포츠&피트니스">스포츠&피트니스</option>
	                    	<option value="야외활동">야외활동</option>
	                    </select>
	                </li>
	                <li class="liBox1">
	                    <b>날짜</b>
	                    <input type="date" name="expDateString" placeholder="날짜를 입력하세요" >
	                </li>
	                <li class="liBox1">
	                    <b>키워드</b>
	                    <input type="text" name="expTitle" placeholder="키워드를 입력하세요">
	                </li>
	                <li style="margin: auto; text-align: center;">
	                    <input id="subExpInfo" type="button" value="체험검색">
	                </li>
	            </div>
	        </form>
	        <script>
	        	$(function(){
	        		$("#expSearchArea #subExpInfo").click(function(){
	
	        			$("#expSearchArea").submit();
	        			
	        		});
	        	});
	        </script>
	    </div>
	</div><!-- /searchbar -->
    
    <!-- content -->
    <br>
    <div id="content">
        
		
		
		<script>
	    function searchView1(){
	        $('#mainSearch form .search').css("display","block");
	        $('#mainSearch .chgBtn').children().eq(0).css("color","#63b8ee");
	        $('#mainSearch .chgBtn').children().eq(0).css("cursor","inherit");
	        $('#mainSearch form .experience').css("display","none");
	        $('#mainSearch .chgBtn').children().eq(1).css("color","gray");
	        $('#mainSearch .chgBtn').children().eq(1).css("cursor","pointer");
	    }
	    function searchView2(){
	        $('#mainSearch form .experience').css("display","block");
	        $('#mainSearch .chgBtn').children().eq(0).css("color","gray");
	        $('#mainSearch .chgBtn').children().eq(0).css("cursor","pointer");
	        $('#mainSearch form .search').css("display","none");
	        $('#mainSearch .chgBtn').children().eq(1).css("color","#63b8ee");
	        $('#mainSearch .chgBtn').children().eq(1).css("cursor","inherit");
	    }
		</script>
        
        <!-- 인기등록 숙소 -->
        <div id="roomList" style="float:left;">
            <div style="margin:60px 0 0 30px;"><h2>HOT 인기숙소</h2></div>
            <div class="rooms power" id="popList">
                
            </div>
        </div>

	        <!-- 검색된 숙소 -->
	        <div id="roomList">
	            <div style="margin:50px 0 20px 0; height:40px; width:100%;">
	                <div class="halfWidth" style="height:100%;"><h3 style="margin:0px;">검색된 숙소 (${ roomListSize }개)</h3></div>
	                <div class="halfWidth" style="height:100%; width:50%; text-align: right;"><a href="#">리뷰 많은 순</a> | <a href="#">가격 낮은 순</a> | <a href="#">가격 높은 순</a></div>
	            </div>
	            
	           	<div class="rooms searchRoom bottomArea">
		           		<c:forEach items="${ roomList }" var="roomList" varStatus="status">
			               	<li class="roomDetail" style="margin:0 20px 40px 20px; float:left;">
			                    <a style="display:inline-block; width:260px;" href="roomDe.ro?roNo=${ roomList.roNo }&tripStartDate=${ tripStartDate }&tripEndDate=${ tripEndDate }&tripPeople=${ tripPeople }">
			                        <img src="${pageContext.request.contextPath}/resources/uploadFiles/${ roomList.changeName }" width="260px" height="170px"><br>
			                        	${ roomList.roomsTitle }<br>
				                       	#<c:out value="${fn:replace(roomList.roomsTag, ',', ' #')}"/><br>
			                        <p style="text-align:center; margin:unset;">${ roomList.reviewCount }개의 이용후기</p>
			                    </a>
			                    <!-- <input type="hidden" name="roNo" value="${ roomList.roNo }" />
			                    <input type="hidden" name="tripStartDate" value="${ tripStartDate }" />
			                    <input type="hidden" name="tripEndDate" value="${ tripEndDate }" />
			                    <input type="hidden" name="tripPeople" value="${ tripPeople }" /> -->
	                		</li>
	               	 	</c:forEach>
	           	</div>

	        <!-- 페이징 바 -->
	        <div class="pagingBar">
	            <button>&lt;</button>&nbsp;
	            <button style="background-color:rgb(24, 76, 136); color:white;">1</button>&nbsp;
	            <button>2</button>&nbsp;
	            <button>3</button>&nbsp;
	            <button>4</button>&nbsp;
	            <button>5</button>&nbsp;
	            <button>&gt;</button>
	        </div>
	    </div>	
	    	
   	</div>
    <!-- /content -->
    
   	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	<script>
		$.ajax({
			url:"selectPopList.ro",
			data:{},		
			type:"post",
			success:function(popList){				// 관리자 이메일 정보를 찾아 가져옴
				var value ="";
				for(var i in popList){
					value += "<li style='border: 1px soild black; margin:0 30px 40px 30px;'>" +
			                    "<a href='powerRoomDe.ro?roNo="+ popList[i].roNo +"'>" +
			                        "<img src='resources/uploadFiles/" + popList[i].changeName +"' width='260px' height='170px'><br>" +
			                        	
			                        "<div>" +
			                        	popList[i].roomsTitle + "<br>" +
			                        	popList[i].addBasic + 
			                        "</div>" +	
			                    "</a>" +
			                "</li>";
				}
				
				$("#popList").html(value);
			},error:function(){
				console.log("ajax 통신 실패");
			}
		})
	</script>
</body>
</html>