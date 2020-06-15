<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/partner/partnerReplyList.css" />
</head>
<style>
body{box-sizing:border-box;}
	section{
		display:none;
		
	}
	#noReply:checked ~ #content1,
	#response:checked ~ #content2{
		display:block;
	}
	
	table tr:hover{background:#f1f1f1}
</style>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" style="width:980px" >
         <div style="float:left; width:50%; height:40px; position:relative" ></div> 
         <br clear="both">
        <c:choose>
        	<c:when test="${empty status }">
        		<input type="radio"  class="input_ck" id="noReply" name="tabs" checked>
                <label for="noReply" class="lt_tab label_lb" onclick="location.href='reviewList.re?currentPage=1'">답변 전 후기</label>
                <input type="radio" class="input_ck" id="response" name="tabs">
                <label for="response" class="gt_tab label_lb">답변 완료 후기</label>
        	</c:when>
        	<c:otherwise>
        		<input type="radio"  class="input_ck" id="noReply" name="tabs" >
                <label for="noReply" class="lt_tab label_lb" onclick="location.href='reviewList.re?currentPage=1'">답변 전 후기</label>
                <input type="radio" class="input_ck" id="response" name="tabs" checked>
                <label for="response" class="gt_tab label_lb">답변 완료 후기</label>
        	</c:otherwise>
        </c:choose>   
			<br clear="both">
			<br>
            <!--  답글전  -->
            <section id="content1" style="flaot:left">
            <div class="sitemap" style="float:left; position:absolute; top:70px; left:1135px">
                <a href="#">
                    <span style="height: 30px;">HOME</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">후기관리</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">답변 전 후기</span>
                </a>
            </div>
            <div class="con" style="color:#000; float:left">
                <span id="page_title"><img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;"><p class="title_tt">답변 전 후기</p></span>
                <span class="up_btn_space">
                    <select style="width:250px; height:35px; border-radius: 5px;">
                    		<option>숙소 선택하기</option>
                    	<c:forEach var="r" items="${ list}">
                    		<option>${r.roomTitle }</option>
                    	</c:forEach>
                    </select>
                </span>
                <table id="noReply_tb" class="reply_tb" cellpadding="0" cellspacing="0">
                <c:if test="${empty noList}">
                <thead>
                	<tr>	
                		<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
                	</tr>
                </thead>
                </c:if>
                <c:if test="${!empty noList }">
		                <c:forEach  items="${ noList }" var="r"> 
		                	<c:if test="${ r.replyStatus eq 'N'}">
				                <c:choose>
				                	<c:when test="${empty r.reply }">
				                	<tbody>
					                   <tr>
					                    	<td style="display:none">${ r.reNo }</td> 
					                    	<td style="display:none">${ r.rpNo }</td> 
					                    	<c:choose>
					                    		<c:when test="${empty r.changeName }">
					                        		<td width="80px">
					                        			<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/userProfile/default.jpg">
					                        		</td>
					                        	</c:when>
					                        	<c:otherwise>
					                        		<td width="80px">
					                        			<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/userProfile/${changeName}">
					                        		</td>
					                        	</c:otherwise>
					                        </c:choose>
					                        <td width="80px">${r.userName }</td>
					                        <td width="500px">${r.reContent }</td>
					                        <c:choose>
					                        	<c:when test="${r.score eq 5}">
					                       			<td width="150">★★★★★</td>
					                       		</c:when>
					                       		<c:when test="${r.score eq 4 }">
					                       			<td width="150">★★★★</td>
					                       		</c:when>
					                       		<c:when test="${r.score eq 3 }">
					                       		 	<td width="150">★★★</td>
					                       		</c:when>
					                       		<c:when test="${r.score eq 2 }">
					                       			<td width="150">★★</td>
					                       		</c:when>
					                       		<c:when test="${r.score eq 1 }">
					                       			<td width="150">★</td>
					                       		</c:when>
					                        </c:choose><c:set var="TextValue" value="${r.reviewDate }"/>
					                        <td width="100" class="text_center">작성일<p>${fn:substring(TextValue,0,10) }</p></td>
					                    </tr>
					                 </tbody>
				                    </c:when>
			                	</c:choose>
			                </c:if>
		               </c:forEach>
		           </c:if>
                </table>
                <!--  상세조회용 서비스 -->
                    <script type="text/javascript">
			             $(function(){
			            	 $("#noReply_tb tbody tr").click(function(){
			            		 location.href="reviewForm.re?reNo="+$(this).children().eq(0).html()+"&rpNo="+$(this).children().eq(1).html();
			            	 });
			             });
		            </script>
                <c:if test="${ !empty noList }">
	                    <div id="pagingArea" style="margin-top: 22px;">
	                       <c:choose>
			                	<c:when test="${ noReplyPi.currentPage eq 1 }">
				                    <a href="#">&lt;</a>
				                </c:when>
				                <c:otherwise>
			                    	<a href="reviewList.re?currentPage=${ noReplyPi.currentPage -1 }">&lt;</a>
			                    </c:otherwise>
		                    </c:choose>
		                    
					        <c:forEach var="p" begin="${ noReplyPi.startPage }" end="${ noReplyPi.endPage }">
		                    	<c:choose>
		                    		<c:when test="${ p eq noReplyPi.currentPage }">
			                    		<a href="#">${p}</a>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<a class="page-link" href="reviewList.re?currentPage=${ p }">${p}</a>
			                    	</c:otherwise>
			                    </c:choose>
		                    </c:forEach>
		                    
					        <c:choose>
		                    	<c:when test="${ noReplyPi.currentPage eq noReplyPi.maxPage }">
				                    <a>&gt;</a>
				                </c:when>
				                <c:otherwise>
				                    <a href="reviewList.re?currentPage=${ noReplyPi.currentPage +1 }">&gt;</a>
				                </c:otherwise>
		                    </c:choose>
	                    </div>
                    </c:if>
            	</div>
            </section>
            <!--  //답글전  -->
            <!-- 답글후 -->
            <section id="content2" style="flaot:left">
            <div class="sitemap" style="float:left; position:absolute; top:70px; left:1125px">
                <a href="#">
                    <span style="height: 30px;">HOME</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">후기관리</span>&gt;
                </a>
                <a href="#">
                    <span style="height: 30px;">답변 완료 후기</span>
                </a>
            </div>
            <div class="con" style="color:#000; float:left">
                <span id="page_title"><img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;"><p class="title_tt">답변 완료 후기</p></span>
                <span class="up_btn_space">
                    <select style="width:250px; height:35px; border-radius: 5px;">
                        <option>숙소 선택하기</option>
                    </select>
                </span>
                <table class="reply_tb" id="reply_tb" cellpadding="0" cellspacing="0">
                <c:choose>
	                <c:when test="${empty reList}">
	                <thead>
	                	<tr>	
	                		<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
	                	</tr>
	                </thead>
	                </c:when>
	                <c:otherwise>
			                <c:forEach  items="${ reList }" var="r"> 
			                	<c:if test="${ r.replyStatus eq 'Y'}">
			                	<tbody>
					                    <tr>
					                    	<td style="display:none">${ r.reNo }</td>
					                    	<td style="display:none">${ r.rpNo }</td>
					                    	<c:choose>
					                    		<c:when test="${empty r.changeName }">
					                        		<td width="80px">
					                        			<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/userProfile/default.jpg">
					                        		</td>
					                        	</c:when>
					                        	<c:otherwise>
					                        		<td width="80px">
					                        			<img src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/userProfile/${changeName}">
					                        		</td>
					                        	</c:otherwise>
					                        </c:choose>
					                        <td width="80px">${r.userName }</td>
					                        <td width="500px">${r.reContent }</td>
					                        <c:choose>
					                        	<c:when test="${r.score eq 5}">
					                       			<td width="150">★★★★★</td>
					                       		</c:when>
					                       		<c:when test="${r.score eq 4 }">
					                       			<td width="150">★★★★</td>
					                       		</c:when>
					                       		<c:when test="${r.score eq 3 }">
					                       		 	<td width="150">★★★</td>
					                       		</c:when>
					                       		<c:when test="${r.score eq 2 }">
					                       			<td width="150">★★</td>
					                       		</c:when>
					                       		<c:when test="${r.score eq 1 }">
					                       			<td width="150">★</td>
					                       		</c:when>
					                        </c:choose><c:set var="TextValue" value="${r.reviewDate }"/>
					                        <td width="100" class="text_center">작성일<p>${fn:substring(TextValue,0,10) }</p></td>
					                    </tr>
					              </tbody>
				                </c:if>
			               </c:forEach>
			           </c:otherwise>
			     </c:choose>
                </table>
                <!--  상세조회용 서비스 -->
                    <script type="text/javascript">
			             $(function(){
			            	 $("#reply_tb tbody tr").click(function(){
								 location.href="reviewDetailView.re?reNo="+$(this).children().eq(0).html()+"&rpNo="+$(this).children().eq(1).html();
			            	 });
			             });
		            </script>
                <c:if test="${ !empty reList }">
	                    <div id="pagingArea" style="margin-top: 22px;">
	                       <c:choose>
			                	<c:when test="${ responsePi.currentPage eq 1 }">
				                    <a href="#">&lt;</a>
				                </c:when>
				                <c:otherwise>
			                    	<a href="reviewList.re?currentPage=${ responsePi.currentPage -1 }&status=Y">&lt;</a>
			                    </c:otherwise>
		                    </c:choose>
		                    
					        <c:forEach var="p" begin="${ responsePi.startPage }" end="${ responsePi.endPage }">
		                    	<c:choose>
		                    		<c:when test="${ p eq responsePi.currentPage }">
			                    		<a href="#">${p}</a>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<a class="page-link" href="reviewList.re?currentPage=${ p }&status=Y">${p}</a>
			                    	</c:otherwise>
			                    </c:choose>
		                    </c:forEach>
		                    
					        <c:choose>
		                    	<c:when test="${ responsePi.currentPage eq responsePi.maxPage }">
				                    <a>&gt;</a>
				                </c:when>
				                <c:otherwise>
				                    <a href="reviewList.re?currentPage=${ responsePi.currentPage +1 }&status=Y">&gt;</a>
				                </c:otherwise>
		                    </c:choose>
	                    </div>
                    </c:if>
            	</div>
            </section>
            <!-- //답글후 -->
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