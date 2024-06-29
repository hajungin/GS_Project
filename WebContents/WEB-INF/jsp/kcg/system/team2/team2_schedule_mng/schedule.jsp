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
    <style>
        body #calendar {
            height: 100%;
            width: 100%;
            margin: auto;
            margin-bottom: 200px;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body class="page-body" data-url="http://neon.dev">
    <div class="page-container">
        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false"/>
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
			                    <label for="eventSchType">일정 종류:</label>
			                    <select id="eventSchType" v-model="selectedEvent.schType" class="form-control">
		                            <option value="common">일반</option>
			                        <option value="consulting">상담</option>
			                        <option value="meeting">회의</option>
			                        <option value="edu">교육</option>
			                    </select>
			                </div>
                           <div class="form-group">
                               <label for="eventTitle">제목:</label>
                               <input type="text" id="eventTitle" v-model="selectedEvent.title" class="form-control">
                           </div>
                           <div class="form-group">
			                    <label for="eventSchCn">일정 내용:</label>
			                    <textarea id="eventSchCn" v-model="selectedEvent.schCn" rows="4" class="form-control"></textarea>
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
                       		<button v-if="isNewEvent" type="button" class="btn btn-primary" @click="addEvent">등록</button>
                       		<span v-else type="button">
	                       		<button class="btn btn-primary" @click="updateEvent">수정</button>
	                           <button class="btn btn-danger" @click="deleteEvent">삭제</button>
                       		</span>
                           <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                       </div>
                   </div>
               </div>
           </div>
       </div>
       <!-- 모달 창 끝 -->

    
    
</body>
<script>
function addHoursToISODate(dateString, hours) {
    const date = new Date(dateString);
    date.setHours(date.getHours() + hours);
    return date.toISOString();
}

function timestampToDatetimeLocal(timestamp) {
    // 타임스탬프를 기반으로 Date 객체 생성
    const date = new Date(timestamp);

    // +9시간을 더해줌
    date.setHours(date.getHours() + 9);

    // Date 객체를 ISO 8601 형식으로 변환 후, datetime-local 형식으로 자르기
    const datetimeLocal = date.toISOString().slice(0, 16);

    return datetimeLocal;
}

var app = new Vue({
    el: '#app',
    data: {
        selectedEvent: {
        	title: '',
            start: '',
            end: '',
            schCn: '',
            schType: '' // 초기값 설정
        },
        isNewEvent: true, // 새로운 이벤트인지 여부를 판단하는 데이터,
        empNo: "${userInfoVO.empNo}" // JSP에서 empNo를 Vue 인스턴스의 데이터로 전달
    },
    methods: {
        updateEvent: function() {
            var self = this;
            // 이벤트 ID를 정수형으로 변환
            var eventId = parseInt(self.selectedEvent.id, 10);
            // ISO 8601 형식의 문자열을 변환하여 UTC에 9시간을 더함
            var startTime = addHoursToISODate(self.selectedEvent.start, 9);
            var endTime = addHoursToISODate(self.selectedEvent.end, 9);

            // 유효성 검사: 종료일이 시작일보다 늦는지 확인
            if (new Date(endTime) < new Date(startTime)) {
                alert("종료일은 시작일보다 빠를 수 없습니다. 다시 확인하여주세요.");
                return; // 종료일이 시작일보다 늦으면 업데이트를 중지
            }

            cf_ajax("/system/schedule/update", {
                id: eventId,
                title: self.selectedEvent.title,
                start: startTime,
                end: endTime,
                schType: self.selectedEvent.schType,
                schCn: self.selectedEvent.schCn,
            }, function(response) {
                console.log("이벤트 수정 성공:", response);
                $('#eventModal').modal('hide');
                location.reload(); // 이벤트 수정 후 페이지 새로고침
            });
        },
        deleteEvent: function() {
            var self = this;
            if (confirm("정말로 이 일정을 삭제하시겠습니까?")) {
                // 이벤트 ID를 정수형으로 변환하여 삭제 요청
                var eventId = parseInt(self.selectedEvent.id, 10);
                cf_ajax("/system/schedule/delete", { id: eventId }, function(response) {
                    console.log("이벤트 삭제 성공:", response);
                    $('#eventModal').modal('hide');
                    location.reload(); // 이벤트 삭제 후 페이지 새로고침
                });
            }
        },
        addEvent: function() {
            var self = this;
            
         	// 시작일과 종료일을 입력하지 않은 경우
            if (!self.selectedEvent.start || !self.selectedEvent.end) {
                alert('시작 일자와 종료 일자를 모두 입력해주세요.');
                return;
            }
            
            var title = self.selectedEvent.title;
            var startTime = addHoursToISODate(self.selectedEvent.start, 9);
            var endTime = addHoursToISODate(self.selectedEvent.end, 9);
            var schType = self.selectedEvent.schType;
            var schCn = self.selectedEvent.schCn;
			
         	// 시작일과 종료일이 비어 있는지 확인
            if (!startTime || !endTime) {
                alert('시작 일자와 종료 일자를 모두 입력해주세요.');
                return;
            }
            
            // 유효성 검사: 종료일이 시작일보다 늦는지 확인
            if (new Date(endTime) < new Date(startTime)) {
                alert("종료일은 시작일보다 빠를 수 없습니다. 다시 확인하여주세요.");
                return; // 종료일이 시작일보다 늦으면 추가를 중지
            }

            if (title) {
                cf_ajax("/system/schedule/insert", {
                	empNo: self.empNo,
                    title: title,
                    start: startTime,
                    end: endTime,
                    schType: schType,
                    schCn: schCn,
                    allDay: false // allDay 값은 예시로 false로 설정
                }, function(response) {
                    console.log("이벤트 추가 성공:", response);
                    $('#eventModal').modal('hide');
                    location.reload(); // 이벤트 추가 후 페이지 새로고침
                });
            } else {
                alert("제목을 입력하세요.");
            }
        }
    }
});


var vueapp = new Vue({
    el: "#vueapp",
    data: {
        events: [],
        empNo: "${userInfoVO.empNo}"
    },
    mounted: function() {
        this.getCalendarEvents();
    },
    methods: {
        getCalendarEvents: function() {
            var self = this;

            cf_ajax("/system/schedule/calendars", { empNo: self.empNo }, function(response) {
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
                eventColor: '#00567A',
                events: self.events,

                headerToolbar: {
                    left: 'prev,next today addEventButton',
                    center: 'title',
                    right:'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },customButtons: {
                    addEventButton: {
                        text : "일정 추가",
                        click : function() {
                        	// 새로운 이벤트 추가로 설정
                            app.isNewEvent = true;
                         	// 데이터 초기화
                            app.selectedEvent = {
                                title: '',
                                start: '',
                                end: '',
                                schCn: '',
                                schType: '',
                            };
                            $('#eventModal').modal('show');
                        }
                    }
                },
                eventClick: function(info) {
                    try {
                        // Event data 로그 추가
                        console.log('Event data:', info.event);

                        var self = this;
                        var eventId = parseInt(info.event.id, 10);

                        // 이벤트 데이터에서 필요한 값 로그 추가
                        console.log('Event ID:', eventId);

                        // 서버에 해당 이벤트의 정보 요청
                        cf_ajax("/system/schedule/getEvent", { id: eventId }, function(response) {

                            // 응답으로 받은 데이터를 selectedEvent에 설정
                            app.selectedEvent = {
				                id: response.id,
				                title: response.title,
				                schCn: response.schcn, // 응답 데이터에서 schcn을 schCn으로 매핑
				                schType: response.schtype, // 응답 데이터에서 schtype을 schType으로 매핑
				                start: timestampToDatetimeLocal(response.start),
				                end: timestampToDatetimeLocal(response.end)
				            };
                            

                            // 이벤트 수정으로 설정
                            app.isNewEvent = false;

                            // 모달 창 열기
                            $('#eventModal').modal('show');
                        });
                    } catch (error) {
                        console.error('Error processing event click:', error);
                        alert('이벤트를 처리하는 중 오류가 발생했습니다. 콘솔 로그를 확인하세요.');
                    }
                },
                select: function(arg) {
                    var title = prompt('일정을 입력하세요:');
                    
                    // ISO 8601 형식의 문자열을 변환하여 UTC에 9시간을 더함
                    var startTime = addHoursToISODate(arg.start.toISOString(), 9);
    				var endTime = addHoursToISODate(arg.end.toISOString(), 9);
                    
                    if (title) {
                        cf_ajax("/system/schedule/insert", {
                        	empNo: self.empNo,
                            title: title,
                            start: startTime,
                            end: endTime,
                            schCn: '',
                            schType: 'common',
                            allDay: arg.allDay
                        }, function(response) {
                            console.log("이벤트 추가 성공:", response);
                            calendar.addEvent({
                                title: title,
                                start: arg.start,
                                end: arg.end,
                                schCn: arg.schCn,
                                schType: arg.schType,
                                allDay: arg.allDay
                            });
                            location.reload();
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