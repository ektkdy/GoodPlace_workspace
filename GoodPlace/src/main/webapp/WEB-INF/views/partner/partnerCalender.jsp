<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='${ pageContext.servletContext.contextPath }/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='${ pageContext.servletContext.contextPath }/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<link href='${ pageContext.servletContext.contextPath }/resources/fullcalendar/packages/timegrid/main.css' rel='stylesheet' />
<link href='${ pageContext.servletContext.contextPath }/resources/fullcalendar/packages/list/main.css' rel='stylesheet' />
<script src='${ pageContext.servletContext.contextPath }/resources/fullcalendar/packages/core/main.js'></script>
<script src='${ pageContext.servletContext.contextPath }/resources/fullcalendar/packages/interaction/main.js'></script>
<script src='${ pageContext.servletContext.contextPath }/resources/fullcalendar/packages/daygrid/main.js'></script>
<script src='${ pageContext.servletContext.contextPath }/resources/fullcalendar/packages/timegrid/main.js'></script>
<script src='${ pageContext.servletContext.contextPath }/resources/fullcalendar/packages/list/main.js'></script>

<style>
button:hover{cursor:pointer}


/*페이징바*/
    #pagingArea{width: 980px; text-align: right;}
    #pagingArea a{padding-left:12px; padding-right: 12px; padding-top: 5px; padding-bottom: 5px;border: 1px solid #dbdbdb; cursor: pointer; border-radius: 4px;}
    #pagingArea a:hover{color: white; background-color: #34538a;}
    
    #noticeList tr:hover{cursor:pointer;}
</style>
</head>
<body>
<div id="wrap">
        <jsp:include page="../common/partnerMenubar.jsp"/>
        <div id="contents" style="width:980px">
            <div id="tab"></div>
            <div class="sitemap">
                <a href="#">
                    <span style="height: 30px;">HOME</span>&gt;
                </a>
                <a href="#">
                    <span> 일정관리</span>
                </a>
            </div>
            <br clear="both">
            <div class="con" style="color:#000">
                <span id="page_title">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/partner/homelogo.jpg" style="vertical-align: middle;">
                    <p class="title_tt">일정관리</p>
                </span>
                <br clear="both">
                <br >
                <div class="con2">
                  <div id='calendar'></div>
                </div>
            </div>
        </div>
    </div>
    
<!-- 토글  -->
    <script>
        $(function(){
            
            $(".arrow").click(function(){
                $("#slide_menu").slideToggle(500);
            });
        });
    </script>
<!-- 캘린더 -->
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      defaultDate: '2020-05-12',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      events: [
        {
          title: 'Business Lunch',
          start: '2020-05-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2020-05-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2020-05-18',
          end: '2020-05-20'
        },
        {
          title: 'Party',
          start: '2020-05-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2020-05-11T10:00:00',
          end: '2020-05-11T16:00:00',
          rendering: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2020-05-13T10:00:00',
          end: '2020-05-13T16:00:00',
          rendering: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2020-05-24',
          end: '2020-05-28',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        },
        {
          start: '2020-05-06',
          end: '2020-05-08',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        }
      ]
    });

    calendar.render();
  });

</script>
</body>
</html>