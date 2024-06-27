<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp" flush="false"/>
	<link href="/static_resources/lib/summernote/0.8.18/summernote-lite.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/static_resources/system/team2/team2_css/team2.css">
	<script src="/static_resources/lib/summernote/0.8.18/summernote-lite.min.js"></script>
	<script src="/static_resources/lib/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	<!-- Imported styles on this page -->
	<title>관리자시스템</title>
</head>
<body class="page-body">

<div class="page-container">

	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false"/>

	<div class="main-content">

		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
		
		<ol class="breadcrumb bc-3">
			<li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
			<li class="active"><strong>공지사항</strong></li>
		</ol>
	
		<h2 class="header" onclick="location.reload();">공지사항 상세</h2>
		<br/>
		
		<div class="row">
			<div id="vueapp" style="width: 910px; margin: 0 auto; border: 2px solid #00CDFF;">
				<template>	
					<div class="panel panel-primary" data-collapsed="0">
						<div class="panel-body">
							<form class="form-horizontal form-groups-bordered">
					
								<div class="form-group" v-if="info.idx != ''">
								    <label for="frst_reg_ymd" class="sys_label_01 control-label" style="text-align: center;">작성일</label>
								    <div class="sys_col_02">
								        <span>{{ new Date(parseInt(info.frst_reg_ymd)).toISOString().slice(0, 10) }}</span>
								    </div>
								    
								    <label for="frst_reg_ymd" class="sys_label_01 control-label" style="text-align: center;">조회수</label>
								    <div class="sys_col_02">
								        <span>{{ info.rdcnt }}</span>
								    </div>
								</div>
								
								<div class="form-group">
								    <label for="notice_sb" class="sys_label_01 control-label" style="text-align: center;">제목</label>
								    <div class="sys_col_03">
								        <span>{{ info.notice_sb }}</span>
								    </div>
								</div>
								
								<div class="form-group">
								    <label for="notice_cn" class="sys_label_01 control-label" style="text-align: center;">내용</label>
								    <div class="sys_col_05">
								        <div v-html="info.notice_cn"></div>
								    </div>
								</div>
								
			
			
								<div class="form-group" style="width: 100%; text-align: center;">
									<div class="col-sm-offset-2 col-sm-5" style="text-align: center; margin-left: 270px;">
										<button type="button" class="btn btn-green btn-icon btn-small" @click="update(info.notice_no)">
											수정
											<i class="entypo-check"></i>
										</button>
										<button type="button" id="btn_delete" class="btn btn-red btn-icon btn-small" @click="delInfo">
											삭제
											<i class="entypo-trash"></i>
										</button>
										<button type="button" class="btn btn-blue btn-icon btn-small" @click="gotoList">
											목록
											<i class="entypo-list"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</template>
			</div>
		</div>
		
		<br/>
		
		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false"/>
		
	</div>
</div>
</body>
<script>
$(function(){	
	$('#ctnt').summernote({
		lang: 'ko-KR',
		tabsize: 2,
		height: 200,
		width: 700,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture']],
            ['view', ['codeview']],
            ['height', ['height']],
          ],
          styleTags: ['p','h1','h2','h3', 'h4','h5','h6',],
	});
});

var vueapp = new Vue({
	el : "#vueapp",
	data: {
        info: {
        	notice_no: "${notice_no}",
            notice_sb: "",
            notice_cn: "",
            frst_reg_ymd: "",
            last_mdf_ymd: "",
            rdcnt: ""
        },
    },
	mounted : function(){
		const urlParams = new URLSearchParams(window.location.search);
		this.info.idx = urlParams.get('notice_no');
		if(this.info.idx){
			this.getInfo();
		}
	},
	methods : {
		getInfo : function(){
			cf_ajax("/system/notice_mng/getInfo", {notice_no: this.info.notice_no}, this.getInfoCB);
		},
		getInfoCB : function(data){
			this.info = data;
			$("#ctnt").summernote("code", this.info.notice_cn);
		},
		
		update : function(notice_no){
			var params = {
					notice_no : cf_defaultIfEmpty(notice_no, ""),
				}
			
			cf_movePage('/system/notice_mng/update', params);

		},
		saveCB : function(data){
			alert("저장되었습니다.");
			this.info.idx = data.idx;
			this.getInfo();
		},
		delInfo : function(){
			if(!confirm("삭제하시겠습니까?")) return;
			cf_ajax("/system/notice_mng/delete", {notice_no: this.info.notice_no}, this.delInfoCB);
		},
		delInfoCB : function(){
			alert("삭제되었습니다.");
			this.gotoList();
		},
		gotoList : function(){
			cf_movePage('/system/notice_mng/list');
		},
	}
});
</script>
</html>