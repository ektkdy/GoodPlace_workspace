<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/partner/partnerCommon.css" />
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
    #wrap {width: 1200px; height: 900px; margin: 0 auto; font-size: 18px; color: #fff; text-align: center; text-transform: uppercase; }
    #contents{height: 1600px;}

    /* 중앙 박스(div#stepOne) 내부공통 css */
    #stepOne{width:950px; border: 1px solid #dbdbdb;}
    table th{width: 200px; padding-top: 30px; padding-left: 70px; vertical-align: top;}
    table td{width:500px; padding-top: 30px; padding-left: 50px; font-size:13px;}
    h5{color: cornflowerblue; padding-bottom: 5px;} /*중앙박스 외 상단에도 하나 있음*/
    table td textarea{width: 500px; height: 170px; border-radius: 4px; resize: none; border: 1px solid #dbdbdb;}
    table input[type=radio]{margin-right:5px;}
    table input[type=checkbox]{margin-right:5px;}
    table input[type=text]{height: 30px; border-radius: 4px; border: 1px solid #dbdbdb;}
    table td input[type=number]{width:100px; height:30px; border-radius: 4px; border: 1px solid #dbdbdb;}
    table select{width: 200px; height: 30px; border-radius: 4px;}
    .maxPeople {width: 200px; height: 30px; border-radius: 4px; border: 1px solid #dbdbdb; padding-left: 5px;}
    #oprateTimes input{width:100px; height:30px;border-radius:4px; border: 1px solid #dbdbdb; padding-left:5px;}

    /*하단 버튼 css*/
    #btns{width:950px; text-align: right; margin-top: 20px; margin-bottom: 20px; margin-right: 20px;}
    button{cursor: pointer;  width: 140px; height: 35px; }
    #cancle{border: 1px solid #dbdbdb; border-radius: 4px; font-size: 15px;}
    #cancle:hover{background-color: white; border: solid 1px #dbdbdb;}
    #next{border: 1px solid #34538a; border-radius: 4px; font-size: 15px;}
    #next:hover{color: #34538a; background-color: white; font-weight: bold; border: 1px solid #34538a;}
    #next{color: white; background-color: #34538a;}
</style>  
</head>
<body>
<div id="wrap">
    <jsp:include page="../common/partnerMenubar.jsp"/>
    <div id="contents" >
        <div id="tab"></div>
        <div class="sitemap">
            <a href="#"><span style="height: 30px;">HOME</span></a>
            <a href="#"><span> &gt; 체험관리</span></a>
            <a href="#"><span style="margin-right: 30px;"> &gt; 체험정보입력</span></a>
        </div>
        <br clear="both">
        <div class="con" style="color:#000">
            <div style="text-align: center;">
                <span><h2>체험 정보 입력</h2></span>
                <h5 style="margin-bottom: 50px;">안내에 따라 체험 내용을 정확하게 설명하여 주세요. /  상품 등록이 완료되면, 승인을 위한 심사가 진행됩니다. </h5>
            </div>
            <form id="insertExp" action="insert.exp" method="post" enctype="multipart/form-data">
	            <div id="stepOne">
	            
	            	<input type="hidden" name="usNo" value="${ loginUser.usNo }">
	            	<input type="hidden" name="expCategory" value="${ e.expCategory }">
	            	<input type="hidden" name="language" value="${ e.language }">
	            	<input type="hidden" name="expTag" value="${ e.expTag }">
	            	<input type="hidden" name="expTitle" value="${ e.expTitle }">
	            	<input type="hidden" name="expContent" value="${ e.expContent }">
	            	<input type="hidden" name="addBasic" value="${ e.addBasic }">
	            	<input type="hidden" name="addDetail" value="${ e.addDetail }">
	            	<input type="hidden" name="addRef" value="${ e.addRef }">
	            	<input type="hidden" name="zipCode" value="${ e.zipCode }">
	            	
	                <table>
	                    <tr>
	                        <th>* 활동강도</th>
	                        <td>
	                            <label><input type="radio" class="activity" name="activity" value=1>가벼움</label><br>
	                            <label><input type="radio" class="activity" name="activity" value=2>보통</label><br>
	                            <label><input type="radio" class="activity" name="activity" value=3>격렬한</label><br>
	                            <label><input type="radio" class="activity" name="activity" value=4>익스트림</label><br>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 최대 인원수</th>
	                        <td>
	                            <input type="number" class="maxPeople" name="maxPeople" min="1" required style="width:100px;margin-right:5px;">명
	                            <h5>• 최소 인원수는 1명입니다. 한 회차당 운영 가능한 최대인원수를 입력하세요.</h5>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 체험 시간</th>
							<td id="oprateTimes">
								운영 시작 시간은 <input type="time" name="startTime" id="startTime"> 입니다.<br><br>
								운영 마감 시간은 <input type="time" name="endTime" id="endTime"> 입니다.<br><br>
								체험 소요 시간은  <input type="number" name="useTime" min=1 placeholder="1">시간 입니다. 
								<h5>• 최소 소요시간은 1시간입니다.</h5><br>
								체험 운영 간격은	<input type="number" name="intervalTime" id="intervalTime" min=30 placeholder="30">분 입니다.
								<h5>• 최소 운영간격은 30분입니다.</h5>
							</td>
						</tr>
	                    <tr>
	                        <th>* 게스트 준비물</th>
	                        <td>
	                            <input type="text" id="supplies" name="supplies" style="width:500px;">
	                            <input type="checkbox" id="noSupplies" name="supplies" value="별도의 준비물이 필요없는 체험입니다.">
	                            	<label for="noSupplies">게스트가 준비할 사항이 전혀 없습니다.</label>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 대표 사진</th>
	                        <td colspan="2">
	                          	<img id="titleImg" style="border:0.5px solid #bebebe; width: 200px; height:150px" >
	                         	<div id="fileArea">
									<input type="file" name="thumb" id="thumb" onchange="loadImg(this,1);"required>
								</div>
	                          <h5>• 텍스트 및 로고가 있을 경우 관리자가 사진을 수정 혹은 삭제할 수 있습니다.</h5>
	                       </td>
	                    </tr>
	                    <tr>
	                        <th>* 상세 사진</th>
	                        <td class="photo_btn" colspan="2">
								<div id="parah"></div>
	                        	<input type="button" value="추가" onclick="addInput();" style="width:50px; height:35px; background:#184c88; color:#fff; border:none; border-radius:4px;" />
								<input type="button" value="삭제" onclick="deleteInput();" style="width:50px; height:35px; border:none; border-radius:4px;"/>
								<h5>• 1장 이상의 상세 사진을 등록해주세요. 최대 5장까지 가능합니다.</h5>
							</td>
	                    </tr>
	                    <tr>
	                        <th>* 예약 설정</th>
	                        <td>
	                        	<input type="number" name="deadline" id="deadline" min=1 placeholder="1" style="padding-rignt:5px; text-align:right;">시간 전 부터 예약을 받지 않겠습니다.
	                            <h5>• 예약 마감 시간을 체험시작 1시간 전으로 설정하실 것을 권해드립니다.<br>
	                                	나중에 언제든지 변경하실수 있습니다.</h5>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 요금 책정</th>
	                        <td>
	                            <span>1인 예약시 요금</span>
	                            <span><input type="number" class="price" name="price" style="text-align:right; padding-right:5px;">원</span>
	                            <br><br>
	
	                            <span>파트너 예상수익</span>
	                            <span><input type="number" class="priceCal" name="priceCal" style="text-align:right; padding-right:5px;" readonly disabled>원</span><br>
	                            <span></span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>* 검토 후 제출</th>
	                        <td>
	                        	<label>
	                            	<input type="checkbox" class="checkRow" name="checkRow">서비스 수수료에 동의합니다.<br>
					                                굿플레이스는 각 예약당 요금의 20%에 해당하는 수수료를 받습니다. 
					                                모든 결제는 굿플레이스를 통해 진행되며 고객센터를 통한 24시간 지원과 함께 
					                                대부분의 체험에 대해 책임 보험도 제공하고 있습니다. 
					                                서비스 수수료에 대해 자세히 알아보세요.
	                            </label>
	                            <br><br>
	                            <label>
		                            <input type="checkbox" class="checkRow" name="checkRow">굿플레이스 회원만을 위한 체험을 진행합니다.<br>
					                                굿플레이스를 통해 체험예약을 받는 날에는 
					                                굿플레이스 게스트만 체험예약을 진행해야만 합니다. 
					                                다른 플랫폼을 통해 예약하고 결제한 게스트는 별도로 체험 진행해야 합니다.
	                            </label>
	                            <br><br>
	                            <label>
	                            	<input type="checkbox" class="checkRow" name="checkRow">
	                            	굿플레이스의 안전관리 지침을 읽고 이해했으며 진행하는 체험이 지침을 준수함을 확인합니다.
	                            </label>
	                            <br><br>
	                            <label>
	                            	<input type="checkbox" class="checkRow" name="checkRow">
	                            	현지가이드라인 및 현지 안전 법규를 준수하며 이를 어길 시 굿플레이스 플랫폼에서 삭제될 수 있음을 이해합니다.
	                            </label>
	                            <br><br>
	                            <label>
	                            	<input type="checkbox" class="checkRow" name="checkRow">
	                            	굿플레이스 체험 서비스와 게스트 환불 정책에 동의합니다.
	                            </label>
	                            <br><br>
	                            <label>
	                            	<input type="checkbox" id="checkAll">전체 동의 후 체험 제출
	                           	</label>
	                        </td>
	                    </tr>
	                </table>
	                <br>
	            </div>
	            <div id="btns">
                <button id="cancle">취소하기</button>
                <button type="submit" id="next">체험등록신청</button>
            </div>
            
            </form>
            
            <!-- 준비물 쪽 체크박스 -->
            <script type="text/javascript">
            	$(function(){
            		$("#noSupplies").click(function(){
            			if($("#noSupplies").is(":checked")){
            				var a = $("#noSupplies").val("장비포함");
            				$("#supplies").attr("disabled", true);
			            	//console.log(a.val()); // "장비포함"
            			} else{
            				$("#supplies").attr("disabled", false);
            			}
            		});
            	});
            </script>
            
            <!-- 대표사진 fileArea -->
			<script>
				$(function(){
					$("#fileArea").hide();
					
					$("#titleImg").click(function(){
						$("#thumb").click();
					});
				
				});
				
				function loadImg(inputFile, num) {
					if(inputFile.files.length==1){
		       			// 파일을 읽어들일 FileReader 객체생성
		       			var reader = new FileReader();
			
		       			// 파일을 읽어주는 메소드 : 파일을 읽어들이는 순간 고유한 url부여
		       			reader.readAsDataURL(inputFile.files[0]);
		       			
		       			//파일 읽기가 완료 되었을때 실행할 메소드
						// e : 현재 이벤트가 발생한 이벤트객체
		       			reader.onload = function(e){
							$("#titleImg").attr("src", e.target.result); 
						};
					}
				}
			</script>
			
			<!-- 상세사진용 input 추가 -->
		    <script>
				var maxAppend = 0; 
		    	function addInput(){
		    		if (maxAppend >= 5) return; 
		    		$("#parah").append('<input type="file" name="file">');
		    		maxAppend++;
		    	}
		    	
		    	function deleteInput(){
		    		$("#parah input:last-child").remove();
		    		maxAppend--;
		    	}
		    </script>
		    
		    <script>
		    	$(function(){
		    		var startTime = $("#startTime").val();
							    		
		    	});
		    </script>
			
			<!-- 사용자가 가격을 입력할 때, 자동으로 수익계산(수수료20%제외) -->
			<script>
				$(function(){
					// 이벤트 걸고자하는 input요소
					var price = $(".price");
					
					price.keyup(function(){
						// 금액이 4자리 이상 되었을 때 예상가격 출력 -- 소수점이하 버림
						if(price.val().length>=4){
							//console.log(price.val());
							var priceCal = Math.floor(price.val()*0.8);
							$(".priceCal").val(priceCal);
						}else{
							$('.priceCal').val('');
						}					
					});
				});
			</script>
			
			<!-- 검토 후 제출 쪽 체크박스  -->
            <script>
				$(function(){
					$("#checkAll").click(function(){
						if($("#checkAll").is(":checked")){
							$(".checkRow").prop("checked", true);
						}else{
							$(".checkRow").prop("checked", false);
						}
					});
					$(".checkRow").click(function(){
						if($("input[name=checkRow]:checked").length==5){
							$("#checkAll").prop("checked", true);
						} else{
							$("#checkAll").prop("checked", false);
						}
					});
					/* $("#next").click(function(){
						if($("#checkAll").is(":checked")){
							$("#insertExp").submit();
						}else{
							alert("모두 동의 후 체험 신청이 가능합니다.");
						}
					} */
				});
			</script>
        </div>
    </div>
</div>
</body>
</html>