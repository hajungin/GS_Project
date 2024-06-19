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
<!-- 헤더META-->
    <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp" flush="false"/>
    <script src="/static_resources/lib/Chart.js/2.9.4/Chart.min.js"></script>
    
    <script src="/static_resources/system/js/bootstrap-datepicker.js"></script>
    <script src="/static_resources/system/js/bootstrap-datepicker.ko.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/googlecalendar@6.1.8/index.global.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                events: {
                    googleCalendarId: '5432b3bdbcdb50fb5d17bc4d226fcc781dfe6cf7c68370db4ba483ac4d1fc8cf@group.calendar.google.com',
                    googleCalendarApiKey: 'AIzaSyCJiqbx-F1oTv5DGDhdrWDumnR9sgr7ISo',
                    className: 'gcal-event' // optional
                }
            });
            calendar.render();
        });
    </script>
    <style>
        body {
            /* Add your styles here */
        }
    </style>
    <meta charset="UTF-8">
    <title>GSITM | 메인</title>
</head>
<body class="page-body" data-url="http://neon.dev">
    <div class="page-container main-content";">
        <!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false"/>
        <div style="opacity:0.9">
            <!-- 헤더 -->
            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
            
            <ol class="breadcrumb bc-3">
                <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
                <li class="active"><strong>메인화면</strong></li>
            </ol>
            <br/>
            <br/>
            
            <div>금융 뉴스 출력</div>
            <c:if test="${not empty news}">
                <%
                    try {
                        JSONObject jsonResponse = new JSONObject((String)request.getAttribute("news"));
                        JSONArray items = jsonResponse.getJSONArray("items");
                        for (int i = 0; i < items.length(); i++) {
                            JSONObject item = items.getJSONObject(i);
                            String title = item.getString("title");
                            String description = item.getString("description");
                %>
                            <div>
                                <h3><%= title %></h3>
                                <p><%= description %></p>
                            </div>
                <%
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                %>
            </c:if>
            
            <div>캘린더 출력</div>
            <div id='calendar'></div>
            
           
            <div>현재 로그인 정보 출력</div>
            <div>
            	<span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.userId}</span>&nbsp;님
            	<span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.name}</span>&nbsp;님
            	<span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.tdeptNm}</span>&nbsp;부서
            	<span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.jikgubNm}</span>&nbsp;직급
            	<span style="font-size: 18px; font-weight: bold; color: black;">${userInfoVO.email}</span>&nbsp;이메일
            </div>
            
            <div>공지사항 출력</div>
            <table class="table table-bordered datatable dataTable">
	            <thead>
	                <tr class="replace-inputs">
	                    <th style="width: 5%;" class="center">번호</th>
	                    <th style="width: 18%;" class="center sorting" @click="sortList(event.target)" sort_target="name">제목</th>
	                </tr>
	            </thead>
	            <tbody id="tbody_list">
	                <tr v-for="item in dataList"  @click="gotoDtl(item.user_id)" style="cursor: pointer;">
	                    <td class="center">{{item.rownum}}</td>
	                    <td class="center">{{item.name}}</td>
	                </tr>
	            </tbody>
	        </table>
	       
        </div>
    </div> 
</body>
</html>