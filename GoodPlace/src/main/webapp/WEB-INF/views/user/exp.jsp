<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>체험메인</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
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
    </style>
</head>
<body>

    <!-- header -->
	<jsp:include page="../common/menubar.jsp"/>

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
	<jsp:include page="../common/footer.jsp"/>
	

</body>
</html> 