<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="common.utils.common.CmmnMap" %>
<%@ page import="common.utils.json.JsonUtil" %>
<jsp:useBean id="nowday" class="java.util.Date" />
<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd HH:mm:ss" />

<!DOCTYPE html>
<html>
<head>
<!-- 헤더META-->
    <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp" flush="false"/>
    <script src="/static_resources/lib/Chart.js/2.9.4/Chart.min.js"></script>
    
    <script src="/static_resources/system/js/bootstrap-datepicker.js"></script>
    <script src="/static_resources/system/js/bootstrap-datepicker.ko.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/googlecalendar@6.1.8/index.global.min.js"></script>
   
    <style>
        .news-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            text-align: center;
        }
        .news-header {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px; 
            font-weight: bold; 
            color: #646464;"
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
            top: 115px;
            width: 150px;
            height: 80%;
            background-color: #f0f0f0;
            padding: 10px;
            box-shadow: -2px 0 5px rgba(0,0,0,0.1);
/*             overflow-y: auto; */
        }
        body #calendar {
          height: 80%;
          width: 80%;
          text-align: center;
          margin: auto;
          border: 1px solid #ccc; /* 경계선을 추가하여 위치 확인 */
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
        h4.main-header {
            color: #4A90E2;  /* 부드러운 파란색 */
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
            font-family: 'Arial', sans-serif;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }

        .table {
            width: 100%;
            border-collapse: collapse;  /* 테두리 제거 */
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }

        .table th, .table td {
            padding: 12px 15px;
        }

        .table thead tr {
            background-color: #009879;  /* 눈에 띄는 배경색 */
            color: #ffffff;
            text-align: center;  /* 헤더 가운데 정렬 */
            font-weight: bold;
        }

        .table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }
		.center {
            text-align: center;
        }

        .table-bordered td, .table-bordered th {
            border: none;  /* 테두리 제거 */
        }

    </style>
    <meta charset="UTF-8">
    <title>GSITM | 메인</title>
</head>
<body class="page-body" data-url="http://neon.dev">

    <div class="page-container main-content";">

        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false"/>
        <div style="opacity:0.9">
           <div style= "width: 100%;">
<!--               헤더 -->
<%--                <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/> --%>
               
<!--                <ol class="breadcrumb bc-3"> -->
<!--                    <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li> -->
<!--                    <li class="active"><strong>메인화면</strong></li> -->
<!--                </ol> -->
               <hr/>
               <br/>
               
               <div class="news-container">
                  <span class="news-header">금융 소식</span>
                  <br>
                  <c:if test="${not empty news}">
                      <%
                          try {
                              JSONObject jsonResponse = new JSONObject((String)request.getAttribute("news"));
                              JSONArray items = jsonResponse.getJSONArray("items");
                              for (int i = 0; i < items.length(); i++) {
                                  JSONObject item = items.getJSONObject(i);
                                  String title = item.getString("title");
                                  String originallink = item.getString("originallink");
                      %>
                                  <span>
                                      <a href="<%= originallink %>" target="_blank"><%= title %></a>
                                  </span>
                      <%
                              }
                          } catch (JSONException e) {
                              e.printStackTrace();
                          }
                      %>
                  </c:if>
               </div>
               <hr>
               <br>
               <div id='calendar' style="width: 50%; height: 50%;"></div>
              
           </div>
            
           <div class="main-info" style= "width: 15%;">
               <div>
               <div class="row justify-content-center">
                    <div class="col-md-4">
                <div class="card" style="width: 200px; border: 2px solid #464646">
                    <div class="card-body" >
                        <p class="card-text" style="width: 230px;">
                        <div style="text-align: right; width: 180px; margin-right: 20px; font-size: 15px; font-weight: bold; color: #828282;">
                           <a href="#gm" onclick="cf_logout()" >
                        LogOut <i class="entypo-logout right"></i>
                     </a>
                  </div>
                  <div style="margin-left:10px;">
                     <br>
                           <i class="entypo-user"></i>
                           <span style="font-size: 15px; font-weight: bold; color: #828282;">${userInfoVO.name}</span>&nbsp;님, 안녕하세요 <br/>
                           <span style="font-size: 12px; color: #828282;">${userInfoVO.tdeptNm}</span><br/>
                           <span style="font-size: 12px; color: #828282;">${userInfoVO.empNo}</span> <br/>
                        </p>
                        </div>
                    </div>
                </div>
               </div>
               </div>
               
               
               <div id="vueapp">
                  <h4 class="main-header">우수사원</h4>
				    <table class="table table-bordered dataTable" style="width: 200px;" id="grid_app">
				        <thead>
				            <tr class="replace-inputs">
				                <th style="width: 3%;" class="center">순위</th>
				                <th style="width: 5%;" class="center">담당자</th>
				            </tr>
				        </thead>
				        <tbody>
				            <tr v-for="(ite, index) in dataLis" :key="index">
				                <td class="center">{{ index + 1 }}</td>
				                <td class="center">{{ ite.emp_nm }}</td>
				            </tr>
				        </tbody>
				    </table>
               </div>
               <br>
           
           
               <h4>공지사항</h4>
               
<!--                    <span class="notice-container" style="width: 250px;"> -->
<!--                        <span class="notice-item" v-for="(item, index) in dataList.slice(0, 5)" :key="index" @click="gotoDtl(item.notice_no)" style="cursor: pointer;"> -->
<!--                            <span>{{item.notice_no}}</span> -->
<!--                            <span>[ {{item.notice_sb}} ]</span> <br/> -->
<!--                            <span>{{truncateText(item.notice_cn, 15)}}</span> <br/> -->
<!--                        </span> -->
<!--                    </span> -->
               
            
         </div>
    </div> 
    
</body>

<script>
var vueapp = new Vue({
    el : "#vueapp",
    data : {
        dataList : [],
        dataLis: [],
        search_nm : "",
        search_val : "",
        events: []
    },
    mounted : function() { // 페이지 로드 시 실행
        this.getCalendarEvents();
    	this.getInfo();
    },
    methods : {
    	getInfo: function() {
    		cf_ajax("/sell/topCustomer", null, this.getInfoCB);
    	},
    	getInfoCB : function(data){
    		this.dataLis = data;
    		console.log(this.dataLis);
    	},
    	
       getCalendarEvents: function() {
            var self = this;

            cf_ajax("/system/schedule/calendars", {}, function(response) {
                self.events = response;
                self.initCalendar();
            });
        },
        initCalendar: function() {
            var self = this;

            var calendarEl = document.getElementById('calendar');
            var today = new Date();
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialDate: today,
                timeZone: 'local',
                initialView: 'dayGridMonth',
                nowIndicator: true,
                locale: 'ko',
                navLinks: true,
                editable: true,
                expandRows: true,
                slotMinTime: '09:00',
                slotMaxTime: '18:00',
                selectable: true,
                events: self.events,

                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                eventClick: function(info) {
                    app.selectedEvent = {
                        id: info.event.id,
                        title: info.event.title,
                        start: info.event.start.toISOString().slice(0,16),
                        end: info.event.end.toISOString().slice(0,16)
                    };
                    $('#eventModal').modal('show');
                },
                select: function(arg) {
                    var title = prompt('일정을 입력하세요:');
                    
                    if (title) {
                        cf_ajax("/system/schedule/insert", {
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay
                        }, function(response) {
                            console.log("이벤트 추가 성공:", response);
                            calendar.addEvent({
                                title: title,
                                start: arg.start,
                                end: arg.end,
                                allDay: arg.allDay
                            });
                        });
                    } else {
                        calendar.unselect();
                    }
                },
                droppable: true,
                drop: function(arg) {
                    if (document.getElementById('drop-remove').checked) {
                        arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                    }
                }
            });
            calendar.render();
        },
//        getList : function(isInit){ // 목록을 가져오는 함수 검색 조건과 정렬 조건을 설정 ajax 요청 후 데이터 가져옴

//          cv_pagingConfig.func = this.getList;
//          if(isInit === true){
//             cv_pagingConfig.pageNo = 1;
//             cv_pagingConfig.orders = [{target : "frst_reg_ymd", isAsc : false}];       // frst_reg_ymd(등록일) 필드를 기준으로 내림차순(isAsc: false)으로 정렬
//          }
         
//          var params = {
//                search_nm : this.search_nm,
//                search_val : this.search_val,
//             }
         
//          cv_sessionStorage      // cv_sessionStorage 객체에 pagingConfig와 params를 저장
//             .setItem('pagingConfig', cv_pagingConfig)
//             .setItem('params', params);

//          cf_ajax("/system/notice_mng/getList", params, this.getListCB);  // 접속되는 URL을 적어야한다. (시스템 파일 경로 말고)
//       },
//       getListCB : function(data){  // ajax로 데이터를 받아와서 dataList에 담는다
//          this.dataList = data.list;
//          for(var i=0; i<this.dataList.length; i++){
//             this.dataList[i].read_cnt = this.dataList[i].notice_no.numformat();
//          }
         
//          cv_pagingConfig.renderPagenation("system");
//       },
//       gotoDtl : function(notice_no){      // 상세 보기 페이지로 이동하는 함수
//          var params = {
//                notice_no : cf_defaultIfEmpty(notice_no, ""),
//             }
//          cf_movePage("/system/notice_mng/notice", params); // 자세히 보기 페이지로 이동
//       },
      truncateText: function(text, length) {         // 글자 30자 이상일때 뒤에 ...
            if (text.length > length) {
                return text.substring(0, length) + '...';
            }
            return text;
        }
    }
});




var app = new Vue({
    el: '#app',
    data: {
        selectedEvent: {}
    },
    methods: {
    	
       updateEvent: function() {
           var self = this;
           // 이벤트 ID를 정수형으로 변환
           var eventId = parseInt(self.selectedEvent.id, 10);
           // ISO 8601 형식의 문자열을 그대로 사용 (PostgreSQL의 timestamp와 호환됨)
           var startTime = new Date(self.selectedEvent.start).toISOString();
           var endTime = new Date(self.selectedEvent.end).toISOString();
           
           cf_ajax("/system/schedule/update", {
               id: eventId,
               title: self.selectedEvent.title,
               start: startTime,
               end: endTime
           }, function(response) {
               console.log("이벤트 수정 성공:", response);
               $('#eventModal').modal('hide');
               location.reload(); // 이벤트 수정 후 페이지 새로고침
           });
       },
       
        deleteEvent: function() {
            var self = this;
            if (confirm("정말로 이 이벤트를 삭제하시겠습니까?")) {
                // 이벤트 ID를 정수형으로 변환하여 삭제 요청
                var eventId = parseInt(self.selectedEvent.id, 10);
                cf_ajax("/system/schedule/delete", { id: eventId }, function(response) {
                    console.log("이벤트 삭제 성공:", response);
                    $('#eventModal').modal('hide');
                    location.reload(); // 이벤트 삭제 후 페이지 새로고침
                });
            }
        }
    }
});

</script>

</html>