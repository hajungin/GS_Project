<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp" flush="false"/>
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="/static_resources/system/js/datatables/datatables.css">
	<link rel="stylesheet" href="/static_resources/system/js/select2/select2-bootstrap.css">
	<link rel="stylesheet" href="/static_resources/system/js/select2/select2.css">
	<title>공지사항 | 관리자</title>
	
<style>
.header {
    background-color: #A7EEFF;
    color: #333;
    padding: 12px 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    font-size: 1.5em;
    text-transform: uppercase;
    letter-spacing: 2px;
    margin: 20px 0;
    transition: background-color 0.3s ease;
    cursor: pointer;
}

.header:hover {
   	background-color: #66CCFF;
}
</style>
</head>
<body class="page-body">

<div class="page-container">

	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false"/>

	<div class="main-content">

		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
		
		<ol class="breadcrumb bc-3">
			<li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
			<li class="active"><strong>공지사항</strong></li>
		</ol>
	
		<h2 class="header" onclick="location.reload();">공지사항 목록</h2>
		<br/>
		
		<div class="dataTables_wrapper" id="vueapp" style="border: 2px solid #00CDFF;">
			<template>

				<div class="dt-buttons" style="padding-top: 15px;" v-if="userInfoVO.userId === 'admin001'">
				    <button type="button" class="btn btn-orange btn-icon icon-left btn-small" @click="gotoNew()">
				        새글작성<i class="entypo-plus"></i>
				    </button>

				</div>
				
				<div class="dataTables_filter">  
					<select id="search_nm" v-model="search_nm">
						<option value="notice_sb" style="text-align: center;">제목</option>
						<option value="notice_cn" style="text-align: center;">내용</option>
					</select>	
					<input type="search" placeholder="" style="width: 120px;" id="search_val" v-model="search_val" @keyup.enter="getList(true)">
					<button type="button" class="btn btn-primary btn-icon" style="margin-left: 5px;" @click="getList(true)">
						검색
						<i class="entypo-search"></i>
					</button>
				</div> 
				
				<table class="table table-bordered datatable dataTable" id="grid_app">
					<thead>
						<tr class="replace-inputs">
							<th style="width: 5%;" class="center nosort">No</th>
							<th style="width: 20%;" class="center sorting" @click="sortList(event.target)" sort_target="notice_sb">제목</th>
							<th style="width: 50%;" class="center sorting" @click="sortList(event.target)" sort_target="notice_cn">내용</th>
							<th style="width: 15%;" class="center sorting" @click="sortList(event.target)" sort_target="frst_reg_ymd">작성일</th>
							<th style="width: 10%;" class="center sorting" @click="sortList(event.target)" sort_target="rdcnt">조회</th>
						</tr>
					</thead>
					<tbody id="tbody_list">
						<tr v-for="item in dataList" @click="gotoDtl(item.notice_no)" style="cursor: pointer;">
							<td class="center">{{item.notice_no}}</td>
							<td class="center">{{item.notice_sb}}</td>
							<td class="center">{{item.notice_cn}}</td>
							<td class="center">{{ new Date(parseInt(item.frst_reg_ymd) + 86400000).toISOString().slice(0, 10) }}</td>
							<td class="center">{{item.rdcnt}}</td>
						</tr>
					</tbody>
				</table>
				<div class="dataTables_paginate paging_simple_numbers" id="div_paginate">
				</div>
			</template>
		</div>
		
		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false"/>
		
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
		userInfoVO: {
			userId: '${userInfoVO.userId}'
	    }
	},
	mounted : function(){		// 리로드 될때 바로 실행
		var fromDtl = cf_getUrlParam("fromDtl");
		var pagingConfig = cv_sessionStorage.getItem("pagingConfig");		
		if("Y" === fromDtl && !cf_isEmpty(pagingConfig)){
			cv_pagingConfig.pageNo = pagingConfig.pageNo;
			cv_pagingConfig.orders = pagingConfig.orders;
			
	 		var params = cv_sessionStorage.getItem("params");
	 		this.search_nm = params.search_nm;
	 		this.search_val = params.search_val;

			this.getList();
		} else {
			cv_sessionStorage
				.removeItem("pagingConfig")
				.removeItem("params");
			this.getList(true);
		}
	},
	methods : {
		getList : function(isInit){ // 목록을 가져오는 함수 검색 조건과 정렬 조건을 설정 ajax 요청 후 데이터 가져옴

			cv_pagingConfig.func = this.getList;
			if(isInit === true){
				cv_pagingConfig.pageNo = 1;
				cv_pagingConfig.orders = [{target : "notice_no", isAsc : false}]; 		// frst_reg_ymd(등록일) 필드를 기준으로 내림차순(isAsc: false)으로 정렬
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
		gotoNew : function(){		// 새 글 작성 페이지로 이동하는 함수
			
			cf_movePage("/system/notice_mng/new_notice"); // 새글 작성 페이지로 이동
		},
		
		gotoDtl : function(notice_no){		// 상세 보기 페이지로 이동하는 함수
			var params = {
					notice_no : cf_defaultIfEmpty(notice_no, ""),
				}
			cf_movePage("/system/notice_mng/notice", params); // 자세히 보기 페이지로 이동
		},		
		sortList : function(obj){		// 목록 정렬 함수 (클릭시 정렬 기준이 바뀜)
			cf_setSortConf(obj, "notice_no");
			this.getList();
		},
	},
})

</script>
</html>