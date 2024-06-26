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

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp"
	flush="false" />
<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@fullcalendar/googlecalendar@6.1.8/index.global.min.js"></script>
<script src="/static_resources/system/js/bootstrap-datepicker.js"></script>
<script src="/static_resources/system/js/bootstrap-datepicker.ko.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@fullcalendar/googlecalendar@6.1.8/index.global.min.js"></script>
<style>
#calendar {
	height: 80%;
	width: 80%;
	margin: auto;
	margin-bottom: 200px;
	border-radius: 6px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<div id="vueapp">
		<div id='calendar'>

			<button @click="aaaa">aaa</button>
			<div v-for="eve in events">{{eve.title}}</div>
		</div>
	</div>

	<script>
		var vueapp = new Vue({
			el: "#vueapp",
			data: {
				events: [],
				title: "",
				start: "",
				end: ""
			},
			mounted: function() {
// 				this.getCalendarEvents();
			},
			methods: {
				aaaa: function(){
					this.getCalendarEvents();
					console.log("aaaaa");
				},
				getCalendarEvents: function() {
					// cf_ajax 형식으로 AJAX 요청
					 var params = {
							
					}; // 필요한 경우 데이터를 params에 추가
        axios.get('/system/schedule/calendars', { params: params })
            .then(response => {
                this.events = response.data;
//                 this.initCalendar(); // 데이터 로드 후 캘린더 초기화
            })
            .catch(error => {
                console.error('Failed to load calendar events:', error);
                alert('Failed to load calendar events.');
            });
				},
					
			}
					
// 					var params = {
// 							title : this.title,
// 							start : this.start,
// 							end : this.end
// 					}; 
// 					cf_ajax("/system/schedule/calendars", params, this.getCalendarEventsCB);
// 				},
// 				getCalendarEventsCB: function(response) {
// 					if (response && response.data) {
// 						this.events = response.data;
// 						this.initCalendar(); // 데이터 로드 후 캘린더 초기화
// 					} else {
// 						console.error("Response data is empty or undefined.");
// 						alert("Failed to load calendar events.");
// 					}
// 				},
// 				initCalendar: function() {
// 					var calendarEl = document.getElementById('calendar');
// 					var today = new Date();  // 현재 날짜를 가져옴
// 					var calendar = new FullCalendar.Calendar(calendarEl, {
// 						initialDate: today,
// 						initialView: 'dayGridMonth',
// 						locale: 'ko', // 한국어 설정
// 						navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
// 						editable: true, // 수정 가능
// 						expandRows: true,
// 						slotMinTime: '09:00', // Day 캘린더에서 시작 시간
// 						slotMaxTime: '18:00', // Day 캘린더에서 종료 시간
// 						headerToolbar: {
// 							left: 'prev,next today',
// 							center: 'title',
// 							right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
// 						},
// 						eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
// 							console.log(obj);
// 						},
// 						eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
// 							console.log(obj);
// 						},
// 						eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
// 							console.log(obj);
// 						},
// 						select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
// 							var title = prompt('Event Title:');
// 							if (title) {
// 								calendar.addEvent({
// 									title: title,
// 									start: arg.start,
// 									end: arg.end,
// 									allDay: arg.allDay
// 								});
// 							}
// 							calendar.unselect();
// 						},
// 						editable: true,
// 						droppable: true,
// 						selectable: true, // 이 부분을 추가하고 데이터 로드 후에 설정되도록 함
// 						drop: function(arg) {
// 							if (document.getElementById('drop-remove').checked) {
// 								arg.draggedEl.parentNode.removeChild(arg.draggedEl);
// 							}
// 						},
// 						events: this.events // 로드된 이벤트 데이터 설정
// 					});
// 					calendar.render();
// 				}
// 			}
		});
	</script>
</body>
</html>