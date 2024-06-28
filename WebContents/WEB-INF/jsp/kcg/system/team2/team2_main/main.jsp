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
	width: 100%;
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
	height: 70%;
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
	"
}

.notice-header {
	display: flex;
	justify-content: left;
	align-items: left;
	font-size: 20px;
	font-weight: bold;
	color: #646464;
	"
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

body #calendar {
	height: 60%;
	width: 60%;
	text-align: left;
	margin-left: 10%;
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
<!-- 						<div class="notice-container"> -->
<!-- 							<h4>공지사항</h4> -->
<!-- 							<div id="notice"> -->
<!-- 								<span> <span class="notice-item" -->
<!-- 									v-for="(item, index) in dataList.slice(0, 5)" :key="index" -->
<!-- 									@click="gotoDtl(item.notice_no)" style="cursor: pointer;"> -->
										
<!-- 								</span> -->
<!-- 								</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
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
                        <div v-if="show">
                            <div id='calendar'  style="width: 40%; height: 50%; text-align: left; background-color: white;"></div>
                        </div>
                        
                    </div>
				</div>

			</div>

			<div class="main-info" style="width: 13%; opacity: 0.9">
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

					<div>
						<h4>우수사원 리스트 출력 예정!!!!</h4>
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
									<td class="center">1</td>
									<td class="center">김철수</td>
								</tr>
							</tbody>
						</table>
						
					</div>
					<br>



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
				},
				
// 				mounted : function() { // 페이지 로드 시 실행
// 					this.getCalendarEvents();
// 				},
				methods : {
					getCalendarEvents : function() {
						var self = this;

						cf_ajax("/system/schedule/calendars", {}, function(
								response) {
							self.events = response;
							self.initCalendar();
						});
					},
					initCalendar : function() {
						var self = this;

						var calendarEl = document.getElementById('calendar');
						var today = new Date();
						var calendar = new FullCalendar.Calendar(
								calendarEl,
								{
									initialDate : today,
									timeZone : 'local',
									initialView : 'dayGridMonth',
									nowIndicator : true,
									locale : 'ko',
									navLinks : true,
									editable : true,
									expandRows : true,
									slotMinTime : '09:00',
									slotMaxTime : '18:00',
									selectable : true,
									events : self.events,

									headerToolbar : {
										left : 'prev,next today',
										center : 'title',
										right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
									},
									eventClick : function(info) {
										app.selectedEvent = {
											id : info.event.id,
											title : info.event.title,
											start : info.event.start
													.toISOString().slice(0, 16),
											end : info.event.end.toISOString()
													.slice(0, 16)
										};
										$('#eventModal').modal('show');
									},
									select : function(arg) {
										var title = prompt('일정을 입력하세요:');

										if (title) {
											cf_ajax("/system/schedule/insert",
													{
														title : title,
														start : arg.start,
														end : arg.end,
														allDay : arg.allDay
													}, function(response) {
														console.log(
																"이벤트 추가 성공:",
																response);
														calendar.addEvent({
															title : title,
															start : arg.start,
															end : arg.end,
															allDay : arg.allDay
														});
													});
										} else {
											calendar.unselect();
										}
									},
									droppable : true,
									drop : function(arg) {
										if (document
												.getElementById('drop-remove').checked) {
											arg.draggedEl.parentNode
													.removeChild(arg.draggedEl);
										}
									},
									
								});
						calendar.render();
						
					},
					toggleShow: function() {
	                    this.show = !this.show;
	                    if (this.show) {
	                        this.getCalendarEvents();
	                    }
	                }
				}
			});

</script>

</html>