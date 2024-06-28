<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="common.utils.common.CmmnMap"%>
<%@ page import="common.utils.json.JsonUtil"%>
<jsp:useBean id="nowday" class="java.util.Date" />
<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd HH:mm:ss" />

<!DOCTYPE html>
<html>
<head>
<!-- 헤더META-->
<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp"
   flush="false" />
<script src="/static_resources/lib/Chart.js/2.9.4/Chart.min.js"></script>

<script src="/static_resources/system/js/bootstrap-datepicker.js"></script>
<script src="/static_resources/system/js/bootstrap-datepicker.ko.js"></script>

<script
   src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/@fullcalendar/googlecalendar@6.1.8/index.global.min.js"></script>

<style>
.news-container {
   display: flex;
   justify-content: left;
   align-items: left;
   flex-direction: column;
   text-align: center;
   width: 50%;
}

.news-header {
   display: flex;
   justify-content: center;
   align-items: center;
   font-size: 20px;
   font-weight: bold;
   color: #646464;
}

.news-header span {
   margin-right: 10px;
}

.news-item {
   margin-top: 10px;
}

.news-item h4 {
   margin: 0;
}

.main-info {
   position: fixed;
   right: 0;
   top: 143px;
   width: 180px;
   height: 65%;
   background-color: #f0f0f0;
   padding: 10px;
   box-shadow: -2px 0 5px rgba(0, 0, 0, 0.1);
   /*             overflow-y: auto; */
}

.notice-container {
   display: flex;
   justify-content: right;
   align-items: right;
   flex-direction: column;
   text-align: center;
   width: 50%;
}

.notice-header {
   display: flex;
   justify-content: center;
   align-items: center;
   font-size: 20px;
   font-weight: bold;
   color: #646464;
}

.notice-header span {
   margin-right: 10px;
}

.notice-item {
   margin-top: 10px;
}

.notice-item h4 {
   margin: 0;
}

.calendar-container {
          display: flex;
/*           justify-content: center; /* 요소 사이의 간격을 동일하게 배치 */  */
          align-items: flex-start; /* 요소들을 수직 방향으로 맨 위로 정렬 */
          padding: 20px 10px 10px 30px; /* 요소 사이 간격을 주기 위한 패딩 설정 */
      }
      
      .calendar-container #calendar1,
      .calendar-container #calendar2 {
          border-radius: 6px;
          box-shadow: 0 0 10px rgba(0,0,0,0.1);
          background-color: aliceblue;
      }

      .calendar-container #calendar1 {
         margin-left: 130px;
          width: 40%; /* 첫 번째 캘린더 너비 */
          height: 100%;
      }
      
      .calendar-container #calendar2 {
          width: 30%; /* 두 번째 캘린더 너비 */
          height: 620px;
      }


.card {
   background: #f0f0f0;
   color: #000;
   border: none;
   border-radius: 10px;
   box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
   transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
   transform: translateY(-5px);
   box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card-body {
   text-align: left;
}

.card-title {
   margin-bottom: 15px;
   font-weight: bold;
   font-size: 1.2em;
}
 /* 테이블 기본 스타일 */
        .table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
            border: 2px solid #464646;
        }

        /* 테이블 헤더 스타일 */
        .table thead tr {
            background-color: #B9FFFF;
            font-weight: bold;
        }

        /* 테이블 셀 스타일 */
        .table th, .table td {
            padding: 12px 15px;
            border: 2px solid #dddddd;
        }

        /* 테이블 바디 셀 텍스트 굵게 */
        .table tbody tr td {
            font-weight: bold;
        }

        /* 테이블 바디 행 마우스 오버 스타일 */
        .table tbody tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }

        /* 중앙 정렬 */
        .center {
            text-align: center;
        }


</style>
<meta charset="UTF-8">
<title>GSITM | 메인</title>
</head>
<body class="page-body" data-url="http://neon.dev">

   <div class="page-container main-content"
      style="background-image: url('/static_resources/system/team2/team2_images/team2bg2.jpg'); background-size: cover; background-position: center; repeat: no-repeat;">

      <jsp:include
         page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp"
         flush="false" />
      <div style="width: 100%;">
         <div style="opacity: 0.9">
            <br>
            <div style="width: 100%;">
               <br>
               <div
                  style="display: flex; justify-content: center; background-color: white;">

                  <div style="height: 100px;"></div>
                  <div class="news-container">
                     <br> <span class="news-header">금융 소식</span> <br>
                     <c:if test="${not empty news}">
                        <%
                        try {
                           JSONObject jsonResponse = new JSONObject((String) request.getAttribute("news"));
                           JSONArray items = jsonResponse.getJSONArray("items");
                           for (int i = 0; i < items.length(); i++) {
                              JSONObject item = items.getJSONObject(i);
                              String title = item.getString("title");
                              String originallink = item.getString("originallink");
                        %>
                        <span> <a href="<%=originallink%>" target="_blank"><%=title%></a>
                        </span>
                        <%
                        }
                        } catch (JSONException e) {
                        e.printStackTrace();
                        }
                        %>
                     </c:if>
                  </div>
                  <div class="notice-container">
                     <br> <span class="notice-header">공지사항</span> <br>
                     <div id="notice">
                        <span> <span class="notice-item"
                           @click="gotoDtl(notice.notice_no)" style="cursor: pointer;">
                           {{notice.notice_sb}}
                        </span>
                        </span>
                     </div>
                  </div>
                  <div style="height: 100px;"></div>
                  <hr>
               </div>

               <br>
               <div id="vueapp">
                  <button type="button"
                     class="btn btn-default btn-small" 
                     style="margin-left: 5px;  margin-right: 10%; width: 60px; height: 60px;" @click="toggleShow">
                     <img src='/static_resources/system/team2/team2_images/calendar.png' style="width: 40px; height: 40px; margin: auto;"></i>
                  </button>
                        <!-- <div>
                            <div id='calendar'  style="width: 40%; height: 50%; text-align: left; background-color: white;"></div>
                        </div> -->
                        <div class="calendar-container" v-if="show">
                         <span id="calendar1" style="padding:30px;"></span>
                         <span id="calendar2" style="padding:30px;"></span>
                     </div>
                        
                        
                    </div>
            </div>

         </div>

         <div class="main-info" style="width: 12%; opacity: 0.9">
            <div>
               <div class="row justify-content-center">
                  <div class="col-md-4">
                     <div class="card" style="width: 200px; border: 2px solid #464646">
                        <div class="card-body">
                           <p class="card-text" style="width: 230px;">
                           <div
                              style="text-align: right; width: 190px; margin-right: 20px; font-size: 15px; font-weight: bold; color: #828282;">
                              <a href="#gm" onclick="cf_logout()"> LogOut <i
                                 class="entypo-logout right"></i>
                              </a>
                           </div>
                           <div style="margin-left: 10px;">
                              <br> <i class="entypo-user"></i> <span
                                 style="font-size: 15px; font-weight: bold; color: #828282;">${userInfoVO.name}</span>&nbsp;님,
                              안녕하세요 <br /> <span style="font-size: 12px; color: #828282;">${userInfoVO.tdeptNm}</span><br />
                              <span style="font-size: 12px; color: #828282;">${userInfoVO.empNo}</span>
                              <br />
                              </p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <div id="data">
               <br>
               <br>
                   <img src='/static_resources/system/team2/team2_images/best.png' style="width: 200px; height: 80px; margin: auto;">
                  <table class="table table-bordered dataTable"
                     style="border: 2px solid #464646; width: 200px;" id="grid_app">
                     <thead>
                        <tr class="replace-inputs">
                           <th style="width: 3%; background-color: #B9FFFF;"
                              class="center">순위</th>
                           <th style="width: 5%; background-color: #B9FFFF;"
                              class="center">담당자</th>

                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                            <tr v-for="(item,index) in dataList">
                           <td class="center">{{index+1}}</td>
                           <td class="center">{{item.emp_nm}}</td>
                        </tr>
                     </tbody>
                  </table>
                  
               </div>
               <br>

</div>

            </div>
</body>

<script>
   var vueapp = new Vue({
            el : "#vueapp",
            data : {
               dataList : [],
               search_nm : "",
               search_val : "",
               events : [],
               show : false,
               empNo: "${userInfoVO.empNo}"
            },
            
//             mounted : function() { // 페이지 로드 시 실행
//                this.getCalendarEvents();
//             },
            methods : {
               getCalendarEvents : function() {
                  var self = this;

                  cf_ajax("/system/schedule/calendars", { empNo: self.empNo }, function(response) {
                      self.events = response;
                      self.initCalendar();
                  });

               },
               initCalendar : function() {
                  var self = this;

               // Calendar 1 초기화
                  var calendarEl1 = document.getElementById('calendar1');
                  var calendar1 = new FullCalendar.Calendar(calendarEl1, {
                      initialDate: new Date(),
                      timeZone: 'local',
                      initialView: 'dayGridMonth',
                      nowIndicator: true,
                      locale: 'ko',
                      eventColor: '#00567A',
                      events: self.events,
                      headerToolbar: {
                          left: 'prev,next today',
                          center: 'title',
                          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                      },
                      eventClick: function(info) {
                          cf_movePage("/system/schedule");
                      },
                      select: function(arg) {
                          cf_movePage("/system/schedule");
                      }
                  });
                  calendar1.render();
                  
                  
               // Calendar 2 초기화
                  var calendarEl2 = document.getElementById('calendar2');
                  var calendar2 = new FullCalendar.Calendar(calendarEl2, {
                      initialDate: new Date(),
                      timeZone: 'local',
                      initialView: 'listWeek', 
                      nowIndicator: true,
                      locale: 'ko',
                      events: self.events,
                      eventColor: '#00567A',
                      headerToolbar: {
                          left: 'prev,next',
                          center: 'title',
                          right: 'today'
                      },
                      eventClick: function(info) {
                          cf_movePage("/system/schedule");
                      },
                      select: function(arg) {
                          cf_movePage("/system/schedule");
                      }
                  });
                  calendar2.render();

                  
               },
               toggleShow: function() {
                       this.show = !this.show;
                       if (this.show) {
                           this.getCalendarEvents();
                       }
                   }
            }
         });
   var data = new Vue({
      el : "#data",
       data : {
          dataList : [],
          
       },
       mounted : function() { // 페이지 로드 시 실행
       this.getInfo();
       },
    methods : {
       getInfo : function() {
          cf_ajax("/sell/topCustomer", null, this.getInfoCB);
       },
         getInfoCB : function(data){
            this.dataList = data;
      },      
    }  
   });
   var notice = new Vue({
      el : "#notice",
       data : {
           notice: "",
       },
       mounted : function() { // 페이지 로드 시 실행
          this.getNotice();
          },
          methods : {
         getNotice : function() {
             cf_ajax("/sell/Notice", null, this.getNCB);
          },
          getNCB : function(data){
               this.notice = data;
         },
         gotoDtl : function(notice_no){   
             cf_movePage('/system/notice_mng/notice?notice_no=' + notice_no);
         },

    }
   });
</script>

</html>