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
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                selectable: true,
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
<body class="page-body" data-url="http://neon.dev">

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
	            </div>
           
           
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
</body>

<script>
var vueapp = new Vue({
    el : "#vueapp",
    data : {
        dataList : [],
        search_nm : "",
        search_val : "",
    },
    mounted : function() { // 페이지 로드 시 실행
        this.getList();
    },
    methods : {
    	getList : function(isInit){ // 목록을 가져오는 함수 검색 조건과 정렬 조건을 설정 ajax 요청 후 데이터 가져옴

			cv_pagingConfig.func = this.getList;
			if(isInit === true){
				cv_pagingConfig.pageNo = 1;
				cv_pagingConfig.orders = [{target : "frst_reg_ymd", isAsc : false}]; 		// frst_reg_ymd(등록일) 필드를 기준으로 내림차순(isAsc: false)으로 정렬
			}
			
			var params = {
					search_nm : this.search_nm,
					search_val : this.search_val,
				}
			
			cv_sessionStorage		// cv_sessionStorage 객체에 pagingConfig와 params를 저장
				.setItem('pagingConfig', cv_pagingConfig)
				.setItem('params', params);

			cf_ajax("/system/notice_mng/getList", params, this.getListCB);  // 접속되는 URL을 적어야한다. (시스템 파일 경로 말고)
		},
		getListCB : function(data){  // ajax로 데이터를 받아와서 dataList에 담는다
			this.dataList = data.list;
			for(var i=0; i<this.dataList.length; i++){
				this.dataList[i].read_cnt = this.dataList[i].notice_no.numformat();
			}
			
			cv_pagingConfig.renderPagenation("system");
		},
		gotoDtl : function(notice_no){		// 상세 보기 페이지로 이동하는 함수
			var params = {
					notice_no : cf_defaultIfEmpty(notice_no, ""),
				}
			cf_movePage("/system/notice_mng/notice", params); // 자세히 보기 페이지로 이동
		},
		truncateText: function(text, length) {			// 글자 30자 이상일때 뒤에 ...
            if (text.length > length) {
                return text.substring(0, length) + '...';
            }
            return text;
        }
    }
});
</script>

</html>