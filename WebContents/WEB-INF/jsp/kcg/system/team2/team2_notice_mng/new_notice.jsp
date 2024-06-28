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

	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false"/>

	<div class="main-content">

		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
		
		<ol class="breadcrumb bc-3">
			<li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
			<li class="active"><strong>공지사항</strong></li>
		</ol>
	
		<h2 class="header" onclick="location.reload();">새 공지 작성</h2>
		<br/>
		
		<div class="row">
			<div id="vueapp" style="width: 910px; margin: 0 auto;">
				<template>	
					<div class="panel panel-primary" data-collapsed="0" style="border: 2px solid #00CDFF;">
						<div class="panel-body">
							<form class="form-horizontal form-groups-bordered">
					
								<div class="form-group">
									<label for="notice_sb" class="sys_label_01 control-label" style="display: flex; flex-direction: column; align-items: center;">제목</label>
									<div class="sys_col_03">
										<input type="text" class="form-control" id="notice_sb" v-model="info.notice_sb">
									</div>
								</div>
					
								<div class="form-group">
									<label for="notice_cn" class="sys_label_01 control-label" style="display: flex; flex-direction: column; align-items: center;">작성내용</label>
									<div class="sys_col_05">
										<textarea class="form-control" rows="5" id="notice_cn" v-model="info.notice_cn"></textarea>
									</div>
								</div>
			
								<div class="form-group" style="width: 100%; text-align: center;">
									<div class="col-sm-offset-2 col-sm-5" style="text-align: center; margin-left: 270px;">
										<button type="button" class="btn btn-green btn-icon btn-small" @click="save">
											등록
											<i class="entypo-check"></i>
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
})

var vueapp = new Vue({
    el : "#vueapp",
    data : {
        info : {
            notice_sb: "",
            notice_cn: ""
        },
    },
    methods : {
        save : function(){
        	var dataToSave = {
                    notice_sb: this.info.notice_sb,
                    notice_cn: this.info.notice_cn
                };

            if(!confirm("작성 하시겠습니까?")) return;

            cf_ajax("/system/notice_mng/insert", dataToSave, this.saveCB);
        },
        saveCB : function(data){
        	alert("저장되었습니다.");
            // 저장 후 다른 처리를 할 수 있음
        },
        gotoList : function(){
            cf_movePage('/system/notice_mng/list?fromDtl=Y');
        },
    }
});
</script>
</html>