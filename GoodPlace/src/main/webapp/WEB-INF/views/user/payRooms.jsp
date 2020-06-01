<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소결제</title>
    <script src="../js/jquery-3.4.1.min.js"></script>

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
        .alignCenter{
            vertical-align: middle;
            text-align: center;
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
        .pointButton{
            height:44px; width:126px; margin-top:57px; font-size:14px; border:1px solid gray; background-color:white; font-weight:900; color: gray;
        }
        .buttonStyle3{
            background-color:gray;
            color:white;
        }
        /* content 스타일 끝*/
        
    </style>
</head>
<body>
    
    <!-- header -->
	<jsp:include page="../common/menubar.jsp"/>
    
    
    <!-- content -->
    <div id="content">
        <div style="width:100%; height:140px;" class="alignCenter backgroundGray">
            <h1 style="font-weight:4000; font-size:2.5em;  padding-top:40px;">예약결제</h1>
        </div>
        
        <div style="width:100%;">
            <div style="width:70%;">
                <div style="width:100%; margin-bottom:80px; margin-top:60px;">
                    <h2>예약상품 확인</h2><br><br> 

                    <h2 style="font-weight:500;">숙소 정보</h2><hr style="border:2px solid lightgray; margin:15px 0 18px 0;"> 
                    <div style="width:34%; height:180px;">
                        <img src="../img/street.jpg" width="100%;" height="100%;"/>
                    </div>
                    <div style="width:20%; height:180px; padding:10px 0 0 16px;">
                        <h3 style="margin-bottom:10px;">숙소명</h3>
                        <h3 style="margin-bottom:10px;">예약일자</h3>
                        <h3 style="margin-bottom:10px;">예약인원</h3>
                        <h3 style="margin-bottom:10px;">가격</h3>
                        <h3 style="margin-bottom:10px;">총 금액</h3>
                    </div>
                    <div style="width:46%; height:180px; padding:10px 0 0 16px; ">
                        <p3 style="margin-bottom:12px; font-size:17px; display:block; color:dimgray; font-weight:900;">유럽갬성 강남역세권 게스트하우스</p3>
                        <p3 style="margin-bottom:12px; font-size:17px; display:block; color: dimgray; font-weight:550;">2020.03.06 ~ 2020.03.07</p3>
                        <p3 style="margin-bottom:12px; font-size:17px; display:block; color: dimgray; font-weight:550;">2명</p3>
                        <p3 style="margin-bottom:12px; font-size:17px; display:block; color: dimgray; font-weight:550;">30,000원</p3>
                        <p3 style="margin-bottom:12px; font-size:17px; display:block; color: dimgray; font-weight:550;">60,000원</p3>
                    </div>

                </div>
                <div style="width:100%; margin-bottom:80px;">

                    <h2 style="font-weight:500;">포인트 사용</h2><hr style="border:2px solid lightgray; margin:15px 0 18px 0;"> 
                    <div style="width:50%; height:auto;  padding-left:10px;">
                        <h3 style="margin-bottom:34px;">보유포인트</h3>
                        <h3 style="margin-bottom:34px; padding-top:6px;">사용할 포인트</h3>
                        <h3 style="margin-bottom:34px; padding-top:6px;">여행컨셉</h3>
                    </div>
                    <div style="width:50%; height:auto;">
                        <h3 style="margin-bottom:34px; color: dimgray; font-weight:550;">1,000원</h3>
                        <div style="width:100%; margin-bottom:34px;">
                            <input type="text" id="myPoint" size="36px;" style="width:180px; height:42px; float:left; border-radius:5px; border:1px solid gray; padding-left:8px; font-size:14px; font-weight:bold;" placeholder="보유 포인트 : 500점"/>
                            <input type="hidden" id="myPointHidden" val="500" />
                            <div style="width:24%; float:left;">
                                <button type="button" id="pointButton" class="pointButton" style="border-radius:4px; margin:0 0 0 10px;">포인트 사용</button>
                            </div>
                        </div>
                    </div>
                    <div style="width:50%; height:auto;">
                        <select name="job" class="pointButton" style="width:327px; height:42px; margin:unset; float:left; border-radius:5px; border:1px solid gray; padding-left:8px; font-size:14px; font-weight:bold;">
                            <option value="" class="pointButton" selected>혼자 떠나는 여행</option>
                            <option value="학생" class="pointButton">친구들과 떠나는 여행</option>
                            <option value="회사원" class="pointButton">연인과 함께 떠나는 로맨틱한 여행</option>
                            <option value="기타" class="pointButton">허니문</option>
                            <option value="" class="pointButton" selected>배우자와 단 둘이 떠나는 여행</option>
                            <option value="학생" class="pointButton">부모님과떠나는 여행</option>
                            <option value="회사원" class="pointButton">출장 / 학회</option>
                            <option value="기타" class="pointButton">기타</option>
                        </select>
                    </div>
                    
                </div>

                <div style="width:100%; margin-bottom:40px;">

                    <h2 style="font-weight:500;">예약자 정보</h2><hr style="border:2px solid lightgray; margin:15px 0 18px 0;"> 
                    <div style="width:34%; padding-left:10px;">
                        <h3 style="margin-bottom:34px; padding-top:28px;">이름</h3>
                        <h3 style="margin-bottom:34px; padding-top:14px;">연락처</h3>
                        <h3 style="margin-bottom:34px; padding-top:14px;">이메일</h3>
                        <h3 style="margin-bottom:34px; padding-top:14px;">생년월일 (주민번호 앞 6자리)</h3>
                        <h3 style="margin-bottom:34px; padding-top:14px;">체크인 시간</h3>
                    </div>
                    <div style="width:66%; height:235px;">
                        <input type="text" size="36px;" style="height:42px; border-radius:5px; border:1px solid gray; margin:20px 0 14px 0; padding-left:8px; font-size:16px;" disabled placeholder="홍길동"/>
                        <input type="text" size="36px;" style="height:42px; border-radius:5px; border:1px solid gray; margin:14px 0; padding-left:8px; font-size:16px;" disabled placeholder="010-0000-8282"/>
                        <input type="text" size="36px;" style="height:42px; border-radius:5px; border:1px solid gray; margin:14px 0; padding-left:8px; font-size:16px;" disabled placeholder="happy@gmail.com"/>
                        <input type="text" id="birth" size="36px;" maxlength="6" style="height:42px; border-radius:5px; border:1px solid gray; margin:14px 0; padding-left:8px; font-size:16px;" placeholder="예) 960102"/><br>
                        <div style="width:100px; margin-top:14px;">
                            <select name="job" class="pointButton" style="width:60px; height:42px; margin:unset; float:left; border-radius:5px; border:1px solid gray; padding-left:8px; font-size:14px; font-weight:bold;">
                                <option value="" class="pointButton">9</option>
                                <option value="" class="pointButton">10</option>
                                <option value="" class="pointButton" selected>11</option>
                            </select>
                            <h3 style="margin-bottom:34px; color: dimgray; font-weight:550; margin:10px;">&nbsp;시</h3>
                        </div>
                        <div style="width:100px; margin-top:14px;">
                            <select name="job" class="pointButton" style="width:60px; height:42px; margin:unset; float:left; border-radius:5px; border:1px solid gray; padding-left:8px; font-size:14px; font-weight:bold;">
                                <option value="" class="pointButton">00</option>
                                <option value="" class="pointButton">10</option>
                                <option value="" class="pointButton">20</option>
                                <option value="" class="pointButton" selected>30</option>
                                <option value="" class="pointButton">40</option>
                                <option value="" class="pointButton">50</option>
                            </select>
                            <h3 style="margin-bottom:34px; color: dimgray; font-weight:550; margin:10px;">&nbsp;분</h3>
                        </div>
                    </div>
                    </div>
                    <div style="width:90%; margin-bottom:80px;">
                        <textarea id="request" style="width:100%; height:300px; border-radius:5px; border:1px solid gray; font-size:20px; padding:10px;">요청사항을 입력하세요.</textarea>
                    </div>
                </div>
            </div>
        
            <div id="receipt" style="width:310px; margin: 110px 0 0 30px; position:absolute; left:1200px; top:200px;">
                <hr>
                <div style="width:100%; height:70px; padding:22px 14px;">
                    <h3 style="margin-bottom:10px;">최종 결제 금액</h3>
                </div>
                <hr>
                <div style="width:50%;padding:22px 14px;">
                    <h3 style="margin-bottom:10px;">가격</h3>
                    <h3 style="margin-bottom:10px;">총 금액</h3>
                    <h3>포인트 할인</h3>
                </div>
                <div style="width:50%;padding:22px 14px; text-align:right;">
                    <h3 style="margin-bottom:10px; font-weight:550; color:dimgray;">30,000원</h3>
                    <h3 style="margin-bottom:10px; font-weight:550; color:dimgray;">60,000원</h3>
                    <h3 style="color:dimgray; font-weight:550;">-3,000원</h3>
                </div>
                <hr>
                <div style="width:50%; height:70px; padding:22px 14px;">
                    <h3 style="margin-bottom:10px;">총 결제 금액</h3>
                </div>
                <div style="width:50%; height:70px; padding:22px 14px; text-align:right;">
                    <h3 style="color:dimgray; font-weight:550;">57,000원</h3>
                </div>
                <hr>
                <div style="width:100%; padding:22px 14px 0px 14px;">
                    <p style="color:dimgray; font-weight:550;">
                        위 상품의 판매조건을 명확히 확인<br>
                        하였으며, 구매 진행에 동의 합니다.<br>
                        (전자상거래법 제8조 2항)<br>
                    </p>
                    <input type="checkbox" name="clause" style="float:left; zoom:2.0; margin:10px 5px 10px 5px;"/><p style="float:left; margin:22px 5px;">동의합니다.</p>
                </div>
                <hr>
                <div style="width:100%; height:120px; padding:22px 14px; text-align:center;">
                    <input type="button" style="height:58px; width:180px; font-size:18px; font-weight:900; border:1px solid gray; background-color:white; color:gray; margin:10px auto;"  value="결제하기"/>
                </div>
                <hr>
            </div>

            <br style="clear:both;">
        </div>
    </div>

    <!-- '포인트 사용' 클릭 시 -->
    <script>
        $("#pointButton").click(function(){

            var myPoint = $('#myPointHidden').val();

            if(myPoint <= 500){
                alert('포인트는 3000점 이상부터 사용가능합니다.'); return;
            }

            if($('#pointButton').text() == '포인트 사용'){
                $('#pointButton').toggleClass('buttonStyle3');
                $('#pointButton').text('사용 취소');
                $('#myPoint').attr('placeholder', '500원');

            }else if($('#pointButton').text('사용 취소')){
                $('#pointButton').toggleClass('buttonStyle3');
                $('#pointButton').text('포인트 사용');
            }

        });

        $(window).scroll(function(){
        var position = $(document).scrollTop();

        console.log(position);
        $("#receipt").css({ width:'310px',
                            margin:'314px 0 0 20px;'
                                    });

        if($(document).scrollTop() != 0){
            $("#receipt").stop().animate({top:position+30+"px"}, 1); //해당 오브젝트 위치값 재설정

        }else{
            $("#receipt").stop().animate({top:position+204+"px"}, 1); //해당 오브젝트 위치값 재설정
            $("#receipt").css({ width:'310px',
                            margin:'0 0 0 20px;'
                                    });
        }
    });

    // 생년월일 작성 시
    $('#birth').click(function(){
        $(this).attr('placeholder', ' ');
        $(this).attr('max', '6');   
    });

    // 요청사항 작성 시
    $('#request').click(function(){
        $(this).text("");
    });

    </script>

    <!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

</body>
</html> 
