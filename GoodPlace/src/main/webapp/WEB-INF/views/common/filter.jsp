<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>필터</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
	<style type="text/css">
		/* 필터 부분 시작 */
		   #filterArea{
		       width:90%;
		       height:100%;
		       float:left;
		   }
		   .filterCheckBox{
		       width:20px;
		       height:20px;
		       float:left;
		   }
		   #filterArea label{
		       display: block;
		       float: left;
		       margin-left:5px;
		       margin-top: 2px;
		   }
		   .hide{
		       display:none;
		   }
		   .display{
		       display: block;
		       width:88px;
		       height:28px;
		   }
		   /* 필터 부분 끝 */
	</style>
</head>
<body>
    <!-- filter -->
	<div style="width:20%; height:auto; margin-left:40px; float:left;">
            <div id="filterArea">
                <div id="filterAreaInner" style="position:absolute; width:220px; float:left;">   
                    <div style="width:220px; height:70%; float:left">
                        <div style="width:50%; height:54px; float:left;"><h3>필터</h3></div>
                        <div style="width:50%; height:54px; float:left; vertical-align:sub; text-align:right;"><h4 style="color:darkgray;" onclick="filterReset();">필터초기화</h4></div>
                        <hr style="height:0.2px; border-color:lightgray; background-color:lightgray;">
                        <div>
                            <table>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>다리미</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>주방</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>식기류</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>인덕션</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>옷걸이</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>세탁기</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>침구</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>케이블 TV</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>드라이기</label></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="filterCheckBox"/><label>조리도구(냄비 등)</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>냉장고</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>전자레인지</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>에어컨</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>공용PC</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>커피포트</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>아기욕조</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>아기침대</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>여분의 침구</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>온수 및 난방</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>주차가능</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>짐보관서비스</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>Free wifi</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>침대 수</label><input type="number" class="filterCheckBox" style="margin-left:10px; width:30px;"/><label>이상</label></td>
                                </tr>
                                <tr class="hide">
                                    <td><input type="checkbox" class="filterCheckBox"/><label>화장실 개수</label><input type="number" max="6" class="filterCheckBox" style="margin-left:10px; width:30px;"/><label>이상</label></td>
                                </tr>
                            </table>
                            <div style="width:100%" id="openFilter">   
                                <h4 style="color:darkslategray; margin-left:2%;" onclick="openFilter()" >필터펼치기</h4>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <script>
            $(window).scroll(function(){
                var position = $(document).scrollTop();
                $("#filterAreaInner").css({ width:'220px', 
                                            margin:'60px auto'
                                            });
                if($(document).scrollTop() != 0){
                    $("#filterAreaInner").stop().animate({top:position-40 + "px"}, 1); //해당 오브젝트 위치값 재설정
                }else{
                    $("#filterAreaInner").stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
                }
            });
        </script>
        <script>
            // 필터 펼치기 & 필터 접기 클릭 시
            function openFilter(){
                if($('#openFilter h4').text() == "필터펼치기"){
                    $('#filterArea tr').toggleClass("display");
                    $('#filterArea tr').css('width', '100%');
                    $('#openFilter h4').text("필터접기")
                }else if($('#openFilter h4').text() == "필터접기"){
                    $('#filterArea tr').toggleClass("display");
                    $('#openFilter h4').text("필터펼치기")
                }
            }
            function filterReset(){
                $(".filterCheckBox[type=checkbox]").prop("checked", false);
            }
        </script>
</body>
</html>