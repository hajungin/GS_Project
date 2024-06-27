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

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp" flush="false"/>
    <script src="/static_resources/lib/Chart.js/2.9.4/Chart.min.js"></script>
    <script src="/static_resources/system/js/bootstrap-datepicker.js"></script>
    <script src="/static_resources/system/js/bootstrap-datepicker.ko.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/googlecalendar@6.1.8/index.global.min.js"></script>
    <meta charset="UTF-8">
    <title>GSITM | 캘린더</title>
    <style>
        body #calendar {
            height: 80%;
            width: 80%;
            margin: auto;
            margin-bottom: 200px;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body class="page-body" data-url="http://neon.dev">
    <div class="page-container">
        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false"/>
        <div class="main-content">
        <div style="opacity:0.9">
            <div style="width: 100%;">
                <!-- 헤더 -->
                <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
                <ol class="breadcrumb bc-3">
                    <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
                    <li class="active"><strong>스케줄 관리</strong></li>
                </ol>
                <br/>
                <div>캘린더</div>
                <span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.userId}</span>&nbsp;님 <br/>
	               <div id='calendar' style="padding:30px; z-indax: 999999px;" ></div>
                </div>  
                
                
            </div>
        </div>
    </div>

    <!-- 모달 창 -->
                <div id="app">
                    <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="eventModalLabel">이벤트 상세 정보</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="eventTitle">제목:</label>
                                        <input type="text" id="eventTitle" v-model="selectedEvent.title" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="eventStart">시작:</label>
                                        <input type="datetime-local" id="eventStart" v-model="selectedEvent.start" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="eventEnd">종료:</label>
                                        <input type="datetime-local" id="eventEnd" v-model="selectedEvent.end" class="form-control">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" @click="updateEvent">수정</button>
                                    <button type="button" class="btn btn-danger" @click="deleteEvent">삭제</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 모달 창 끝 -->

    
    
</body>
<script>
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

var vueapp = new Vue({
    el: "#vueapp",
    data: {
        events: []
    },
    mounted: function() {
        this.getCalendarEvents();
    },
    methods: {
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
        }
    }
});
</script>
</html>