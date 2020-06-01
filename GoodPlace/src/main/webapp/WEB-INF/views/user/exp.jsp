<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>체험메인</title>
    <script src="../js/jquery-3.4.1.min.js"></script>
    <style>
        /* 여백 초기화 */
            body, div, ul, li, dl, dt, ol, h1, h2, h3, h4, h5, h6, input, fieldset, legend, p, select, table, th, td, tr, textarea, button, form, hr {margin: 0; padding: 0;}
        /* header(메뉴바) 스타일 시작*/
                body{
            margin:0px;   
        }
        #header {
            clear: both;
            width: 100%;
            background: linear-gradient(to left, #4f4ce7, #41a3ec );
            top: 0;
            z-index: 1000000;
            height: 60px;
            box-shadow: 0px 10px 10px 0px rgba(144, 144, 144, 0.1);
            /*
            position: fixed;
            position: absolute;
            */
        }

        #header_wrap {
            height: inherit;
            position: relative;
            width: 1200px;
            margin: 0 auto;
            left: 0;
            right: 0;
            text-align: center;
        }

        #header>#header_wrap>div {
            display: inline-block;
            height: 100%;
        }
        /*로고*/
        #header_1 {
            width: 30%;

            position: relative;
        }
        /*검색*/
        #header_2 {
            width: 35%;
            position: relative;
        }
        /*문의,로그인*/
        #header_3 {
            width: 30%;
        }
        #navi {
            list-style-type: none;
            width: 100%;
        }
        #navi>li {
            position: relative;
            float: left;
            font-weight: 600;
            font-size: 19px;
            height: 40px;
            text-align: center;
        }
        /*검색*/
        #navi .search {
            font-size: 16px;
            padding: 10px;
            border: 0px;
            outline: none;
            float: left;
        }
        /*검색버튼*/
        #navi .searchBtn{
            width: 45px;
            height: 39px;
            border: 0px;
            background: #ffffff;
            outline: none;
            float: left;
            color:#ffffff;
        }

        /*1:1채팅상담*/
        #navi .qBtn{
            margin: 0 40px;
            color: white;
        }
        /*로그인 버튼 */
        .loginBtn {
            box-shadow:inset 0px 1px 0px 0px #bee2f9;
            background:linear-gradient(to bottom, #63b8ee 5%, #468ccf 100%);
            background-color:#63b8ee;
            border-radius:6px;
            border:1px solid #3866a3;
            display:inline-block;
            cursor:pointer;
            color:#14396a;
            font-family:Arial;
            font-size:15px;
            font-weight:bold;
            padding:6px 37px;
            text-decoration:none;
            text-shadow:0px 1px 0px #7cacde;
        }
        .loginBtn:hover {
            background:linear-gradient(to bottom, #468ccf 5%, #63b8ee 100%);
            background-color:#468ccf;
        }
        .loginBtn:active {
            position:relative;
            top:1px;
        }
        /* header(메뉴바) 스타일 끝*/

        /* content 스타일 시작*/
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
        /* content 스타일 끝*/

         /*footer 스타일 시작*/
         #footer{
            box-sizing: border-box;
            border-top: solid 1px lightgray;
            background-color: rgb(231, 231, 231);

            height: 250px;
            left: 0;
            right: 0;
        }
        .footer_address{
            margin: 0 auto;
            width: 1200px;
            font-size: 11px;
            color: grey;
            padding-top: 20px;
            margin-left: 25%;
        }
        .footer_nav{
            padding-top: 18px;
            height: 20px;
        }
        .footer_menu{
            width: 210px;
            display: table-cell;
            text-align: center;
	        vertical-align: middle;
            font-weight: bold;
        }
        .footer_menu a {
            text-decoration: none;
            color: rgb(75, 75, 75);
            font-size: 20px;
        }

        /*고객센터 버튼*/
        .serBtn {
            box-shadow:inset 0px 1px 0px 0px #ffffff;
            background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
            background-color:#ffffff;
            border-radius:6px;
            border:1px solid #dcdcdc;
            display:inline-block;
            cursor:pointer;
            color:#666666;
            font-family:Arial;
            font-size:16px;
            font-weight:bold;
            padding:6px 24px;
            text-decoration:none;
            text-shadow:0px 1px 0px #ffffff;
            margin-top:-12px;
        }
        .serBtn:hover {
            background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
            background-color:#f6f6f6;
        }
        .serBtn:active {
            position:relative;
            top:1px;
        }
        .footerMargin{
            margin-top:14px;
            font-size:large;
            line-height: 152%;
        }
        /*footer 스타일 끝*/

    </style>
</head>
<body>
    <!-- header -->
    <div id="header">
        <div id="header_wrap">
            <div id="header_1">
                <a href=""><img id="home-logo" src="img/mainbar/투명배경.png" width="250px" height="40px" style="padding:10px"></a>
            </div>
            <div id="header_2">
                <ul id="navi" style="padding-left: 30px; margin-top: 10px">
                    <li>
                        <input class="list search" type="text" placeholder="여행이나 체험을 검색해보세요" style="width: 300px; height: 19px; ">
                        <div class="list searchBtn">
                            <a href=""><img id="searchbtn" src="img/mainbar/검색버튼.JPG" width="37px" height="37px"></a>
                        </div>
                    </li>
                </ul>
            </div>    
            <div id="header_3">
                <ul id="navi" style="padding-left: 0px; margin-top: 12px;">
                    <li style=" margin-top: 3px;">
                        <a class="list qBtn" href="" style="font-size: 15px;">1:1채팅상담</a>
                    </li>
                    <li>
                        <a href="#" class="list loginBtn">로그인</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- content -->
    <div id="content">
        <div style="width:100%; height:180px;">
            <div class="categoryPile">
                <div class="smallCategory">
                    <h3 class="expCategory">라이프 및 스타일</h3>
                    <p class="expCount expCategory">체험 10개</p>
                </div>
                <div class="smallCategory">
                    <h3 class="expCategory">문화와 역사</h3>
                    <p class="expCount">체험 10개</p>
                </div>
                <div class="smallCategory">
                    <h3 class="expCategory">미술과 디자인</h3>
                    <p class="expCount">체험 10개</p>
                </div>
                <div class="smallCategory">
                    <h3 class="expCategory">스포츠&피트니스</h3>
                    <p class="expCount">체험 10개</p>
                </div>
                <div class="smallCategory">
                    <h3 class="expCategory">야외활동</h3>
                    <p class="expCount">체험 10개</p>
                </div>
            </div>
        </div>
        
        <div style="width:100%;">
            <div style="width:100%; height:58px;">
                <div style="width:50%; height:100%; padding-top:14px;"><h2>모든 체험</h2></div>
                <div style="width:50%; height:100%; text-align:right; padding-top:20px;"><a class="sort">리뷰 많은 순</a>&nbsp;|&nbsp;<a class="sort">가격 낮은 순</a>&nbsp;|&nbsp;<a class="sort">가격 높은 순</a></div>
            </div><br><br>
            <hr style="border:2px solid lightgray; margin:15px 0 18px 0;">

            <div id="expArea1" style="width:100%;">
                <div style="width:94%;"  class="expArea">
                    <div style="width:26%; height:180px;">
                        <img src="../img/exp.jpg" width="100%;" height="100%;"/>
                    </div>
                    <div style="width:37%; height:180px;">
                        <h3 class="exp1">쿠킹</h3>
                        <h3 class="exp1" style="color:black;">자연속에서 함께하는 쿠킹클래스</h3>
                        <h3 class="exp1">홍길동</h3>
                        <br>
                        <h3 class="exp1">2시간 소요 * 장비포함</h3>
                    </div>
                    <div style="width:37%; height:180px;" class="alignRight">
                        <img class="likeIt" src="../img/emptyHeart.jpg" class="heartMargin" />
                        <br><br><br>
                        <h3 class="exp3">1인당 6,0000원</h3>
                    </div>
                </div>
            </div>
            <div id="expArea2" style="width:100%;">
                <div style="width:94%;"  class="expArea">
                    <div style="width:26%; height:180px;">
                        <img src="../img/exp.jpg" width="100%;" height="100%;"/>
                    </div>
                    <div style="width:37%; height:180px;">
                        <h3 class="exp1">쿠킹</h3>
                        <h3 class="exp1" style="color:black;">자연속에서 함께하는 쿠킹클래스</h3>
                        <h3 class="exp1">홍길동</h3>
                        <br>
                        <h3 class="exp1">2시간 소요 * 장비포함</h3>
                    </div>
                    <div style="width:37%; height:180px;" class="alignRight">
                        <img class="likeIt" src="../img/emptyHeart.jpg" class="heartMargin" />
                        <br><br><br>
                        <h3 class="exp3">1인당 6,0000원</h3>
                    </div>
                </div>
            </div>
            <div id="expArea3" style="width:100%;">
                <div style="width:94%;"  class="expArea">
                    <div style="width:26%; height:180px;">
                        <img src="../img/exp.jpg" width="100%;" height="100%;"/>
                    </div>
                    <div style="width:37%; height:180px;">
                        <h3 class="exp1">쿠킹</h3>
                        <h3 class="exp1" style="color:black;">자연속에서 함께하는 쿠킹클래스</h3>
                        <h3 class="exp1">홍길동</h3>
                        <br>
                        <h3 class="exp1">2시간 소요 * 장비포함</h3>
                    </div>
                    <div style="width:37%; height:180px;" class="alignRight">
                        <img class="likeIt" src="../img/emptyHeart.jpg" class="heartMargin" />
                        <br><br><br>
                        <h3 class="exp3">1인당 6,0000원</h3>
                    </div>
                </div>
            </div>
            <div id="expArea4" style="width:100%;">
                <div style="width:94%;"  class="expArea">
                    <div style="width:26%; height:180px;">
                        <img src="../img/exp.jpg" width="100%;" height="100%;"/>
                    </div>
                    <div style="width:37%; height:180px;">
                        <h3 class="exp1">쿠킹</h3>
                        <h3 class="exp1" style="color:black;">자연속에서 함께하는 쿠킹클래스</h3>
                        <h3 class="exp1">홍길동</h3>
                        <br>
                        <h3 class="exp1">2시간 소요 * 장비포함</h3>
                    </div>
                    <div style="width:37%; height:180px;" class="alignRight">
                        <img class="likeIt" src="../img/emptyHeart.jpg" class="heartMargin" />
                        <br><br><br>
                        <h3 class="exp3">1인당 6,0000원</h3>
                    </div>
                </div>
            </div>
            <div id="expArea5" style="width:100%;">
                <div style="width:94%;"  class="expArea">
                    <div style="width:26%; height:180px;">
                        <img src="../img/exp.jpg" width="100%;" height="100%;"/>
                    </div>
                    <div style="width:37%; height:180px;">
                        <h3 class="exp1">쿠킹</h3>
                        <h3 class="exp1" style="color:black;">자연속에서 함께하는 쿠킹클래스</h3>
                        <h3 class="exp1">홍길동</h3>
                        <br>
                        <h3 class="exp1">2시간 소요 * 장비포함</h3>
                    </div>
                    <div style="width:37%; height:180px;" class="alignRight">
                        <img class="likeIt" src="../img/emptyHeart.jpg" class="heartMargin" />
                        <br><br><br>
                        <h3 class="exp3">1인당 6,0000원</h3>
                    </div>
                </div>
            </div>


            
        </div>

        <!-- 페이징 바 -->
        <div class="pagingBar">
            <button>&lt;</button>
            <button style="background-color:rgb(24, 76, 136); color:white;">n</button>&nbsp;
            <button>n</button>&nbsp;
            <button>n</button>&nbsp;
            <button>n</button>&nbsp;
            <button>n</button>&nbsp;
            <button>&gt;</button>

        </div>
        <br style="clear:both;">
    </div>

    <script>
        // 찜하기 기능 : 하트 아이콘 색깔 바꿔주기
        $('#content').find('.likeIt').each(function( i , e ){
            $(this).toggleClass('heartMargin');
            $(this).click(function(){
                if($(this).attr('src') == '../img/emptyHeart.jpg'){
                    $(this).attr('src', '../img/redHeartIcon.png');
                    $(this).toggleClass('heartMargin');
                    alert('해당 체험을 찜하기 했습니다.');
                }else{
                    $(this).attr('src', '../img/emptyHeart.jpg');
                    $(this).toggleClass('heartMargin');
                    alert('찜하기를 취소하였습니다.');
                }
            });
        });
    </script>


    <!-- footer -->
    <div id="footer">
        <div class="footer_nav" align="center">
            <div class="footer_menu">
                <a href="">이용약관</a>
            </div>
            <div class="footer_menu">
                <a href="">개인정보 처리방침</a>
            </div>
            <div class="footer_menu">
                <a href="">취소 및 환불 정책</a>
            </div>
        </div>
        <div class="footer_address">
            <div>
                <a href="#" class="serBtn">고객센터</a>
            </div>
            <p class="footerMargin">
                상호명 (주)굿플레이스 | 대표 강보람 | 개인정보보호책임자 채희영 |사업자등록번호 209-81-55339 사업자정보확인 
                <br>통신판매업신고번호 2019-서울서초-0260 | 서울특별시 서초구 강남대로 327, 대륭서초타워 18층(서초동)
                <br>대표번호 : 1670-8208 | 일반 문의 09:00-22:00 | 연중무휴 / 점심 12:00-13:00
                <br>굿플레이스는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품·거래정보 및 거래에 대하여 책임을 지지않습니다.
                <br>자사는 서울특별시관광협회 공제영업보증보험에 가입되어 있습니다.
            </p>
        </div>
    </div>

</body>
</html> 