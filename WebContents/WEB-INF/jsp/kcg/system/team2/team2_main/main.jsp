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
<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd" />

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
    html{
/*     	background-color: lightblue; */
 	    background-position: center; 
 	 	background-size: cover; 
	  	background-image: url(system/team2/team2_images/team2bg.jpg); 
 		background-repeat: no-repeat; 
   		 }
    
    
    	body{
/*     	background-color: lightblue; */
 	    background-position: center; 
 	 	background-size: cover; 
	  	background-image: url(kcg/system/team2/team2_images/team2bg.jpg); 
 		background-repeat: no-repeat; 
   		 }
    	  
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
            top: 0;
            width: 200px;
            height: 100vh;
            background-color: #f0f0f0;
            padding: 10px;
            box-shadow: -2px 0 5px rgba(0,0,0,0.1);
            overflow-y: auto;
        }
        body #calendar {
		    height: 80%;
		    width: 80%;
		    margin: auto;
		    border: 1px solid #ccc; /* 경계선을 추가하여 위치 확인 */
		}
		.card {
            background: #fff;
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
            text-align: center;
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
<body class="page-body" data-url="http://neon.dev" style="backgroud-img: url(team2/team2_images/team2bg.jpg);">

    <div class="page-container main-content";" style="backgroud-img: url(team2/team2_images/team2bg.jpg);">

        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false"/>
        <div style="opacity:0.9">
        	<div style= "width: 80%;">
	        	<!-- 헤더 -->
	            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
	            
	            <ol class="breadcrumb bc-3">
	                <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
	                <li class="active"><strong>메인화면</strong></li>
	            </ol>
	            <br/>
	            <br/>
	            
	            <div class="news-container">
		            <span class="news-header">금융 소식</span>
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
	            <div>캘린더</div>
	            <div id='calendar'></div>
        	</div>
            
           <div class="main-info" style= "width: 15%;">
	            <div>
	            <div class="row justify-content-center">
           			<div class="col-md-4 mb-0">
                <div class="card text-bg-light">
                    <div class="card-header">
                        <i class="fas fa-user"></i>
                        <span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.name}</span>&nbsp;님 <br/>
                    </div>
                    <div class="card-body">
                        <p class="card-text">
                            <span th:text="부서 : ${userInfoVO.tdeptNm}"></span><br>
                            <span th:text="로그인 일시 : "></span>
                        </p>
                    </div>
                </div>
           	 </div>
<%-- 	            	<span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.userId}</span>&nbsp;님 <br/> --%>
<%-- 	            	<span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.name}</span>&nbsp;님 <br/> --%>
<%-- 	            	<span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.tdeptNm}</span>&nbsp;부서 <br/> --%>
<%-- 	            	<span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.jikgubNm}</span>&nbsp;직급 <br/> --%>
<%-- 	            	<span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.email}</span>&nbsp;이메일 <br/> --%>
	            </div>
	            
	            <div>
	            	<h4>우수사원 리스트 출력 예정!!!!</h4>
		            	<table class="table table-bordered dataTable" style="border: 2px solid #00CDFF;" id="grid_app">
					        <thead>
					            <tr class="replace-inputs">
					            	<th style="width: 5%; background-color: #B9FFFF;" class="center">순위</th>
					                <th style="width: 10%; background-color: #B9FFFF;" class="center">담당자</th>
					                      
					            </tr>
					        </thead>
					        <tbody>
					            <tr v-for="(item,index) in dataList">
					               	<td class="center">{{index+1}}</td>
					                <td class="center">{{item.emp_nm}}</td>
					            </tr>
					        </tbody>
					    </table>
	            </div>
	            <br>
           
           
	            <h4>공지사항</h4>
	            <div id="vueapp">
	                <span class="notice-container">
	                    <span class="notice-item" v-for="(item, index) in dataList.slice(0, 5)" :key="index" @click="gotoDtl(item.notice_no)" style="cursor: pointer;">
	                        <span>{{item.notice_no}}</span>
	                        <span>[ {{item.notice_sb}} ]</span> <br/>
	                        <span>{{truncateText(item.notice_cn, 15)}}</span> <br/>
	                    </span>
	                </span>
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
var vueapp = new Vue({
    el : "#vueapp",
    data : {
        dataList : [],
        search_nm : "",
        search_val : "",
        events: []
    },
    mounted : function() { // 페이지 로드 시 실행
//         this.getList();
        this.getCalendarEvents();
    },
    methods : {
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
//     	getList : function(isInit){ // 목록을 가져오는 함수 검색 조건과 정렬 조건을 설정 ajax 요청 후 데이터 가져옴

// 			cv_pagingConfig.func = this.getList;
// 			if(isInit === true){
// 				cv_pagingConfig.pageNo = 1;
// 				cv_pagingConfig.orders = [{target : "frst_reg_ymd", isAsc : false}]; 		// frst_reg_ymd(등록일) 필드를 기준으로 내림차순(isAsc: false)으로 정렬
// 			}
			
// 			var params = {
// 					search_nm : this.search_nm,
// 					search_val : this.search_val,
// 				}
			
// 			cv_sessionStorage		// cv_sessionStorage 객체에 pagingConfig와 params를 저장
// 				.setItem('pagingConfig', cv_pagingConfig)
// 				.setItem('params', params);

// 			cf_ajax("/system/notice_mng/getList", params, this.getListCB);  // 접속되는 URL을 적어야한다. (시스템 파일 경로 말고)
// 		},
// 		getListCB : function(data){  // ajax로 데이터를 받아와서 dataList에 담는다
// 			this.dataList = data.list;
// 			for(var i=0; i<this.dataList.length; i++){
// 				this.dataList[i].read_cnt = this.dataList[i].notice_no.numformat();
// 			}
			
// 			cv_pagingConfig.renderPagenation("system");
// 		},
// 		gotoDtl : function(notice_no){		// 상세 보기 페이지로 이동하는 함수
// 			var params = {
// 					notice_no : cf_defaultIfEmpty(notice_no, ""),
// 				}
// 			cf_movePage("/system/notice_mng/notice", params); // 자세히 보기 페이지로 이동
// 		},
// 		truncateText: function(text, length) {			// 글자 30자 이상일때 뒤에 ...
//             if (text.length > length) {
//                 return text.substring(0, length) + '...';
//             }
//             return text;
//         }
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