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
	<link rel="stylesheet" href="/static_resources/system/js/datatables/proddtl.css">
	
	<title>마이페이지</title>
</head>
<body class="page-body">

<div class="page-container">

	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false"/>
	<div class="main-content">
		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
		<ol class="breadcrumb bc-3">
			<li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
			<li class="active"><strong>마이페이지</strong></li>
		</ol>
	
		<h2>마이페이지</h2>
		<br/>
		
		<div class="row">
			<div id="vueapp" style="display: flex; justify-items: center;">
			<template>
				<div class="panel-body flex-100" >			
					<div class="left-panel flex-66">
						<div class="form-group">
							<label for="emp_no" class="fix-width-33">사원번호 :</label>
							<input type="text" class="form-control" id="emp_no" v-model="info.emp_no" readonly>
						</div>
						
						<div class="form-group">
							<label for="emp_nm" class="fix-width-33">성명 :</label>
							<input type="text" class="form-control" id="emp_nm" v-model="info.emp_nm">
						</div>
						
						<div class="form-group">
							<label for="emp_dept" class="fix-width-33">부서 :</label>
							<input type="text" class="form-control" id="emp_dept" v-model="info.emp_dept_nm" readonly>
						</div>
			
						<div class="form-group">
							<label for="emp_posit" class="fix-width-33">직위 :</label>
							<input type="text" class="form-control" id="emp_posit" v-model="info.emp_posit_nm" readonly>
						</div>
						
						<div class="form-group">
							<label for="emp_ecny_dt" class="fix-width-33">입사일자 :</label>
							<input type="date" class="form-control" id="emp_ecny_dt" v-model="info.emp_ecny_dt">
						</div>
						
						<div class="form-group">
							<label for="emp_mbl_telno" class="fix-width-33">전화번호 :</label>
							<input type="text" class="form-control" id="emp_mbl_telno" v-model="info.emp_mbl_telno">
						</div>
						
						<div class="form-group">
							<label for="emp_eml_addr" class="fix-width-33">E-mail :</label>
							<input type="text" class="form-control" id="emp_eml_addr" v-model="info.emp_eml_addr">
						</div>
						
						<div class="form-group">
							<div class="">
								<button type="button" class="btn btn-green btn-icon btn-small" @click="empUpdate">
									저장
									<i class="entypo-check"></i>
								</button>
								<button type="button" class="btn btn-blue btn-icon btn-small" onclick="cf_movePage('/system')">
									HOME
									<i class="entypo-list"></i>
								</button>
							</div>
						</div>
					</div>
				</div>						
			</template>		
			</div>
		</div>
		<br />
		
		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false"/>
		
	</div>
</div>
</body>
<script type="text/javascript">
	var vueapp = new Vue({
	    el: "#vueapp",
	    data: {
	        info: {
	            emp_no: "${emp_no}",
	            emp_nm: "",
	            emp_dept: "",
	            emp_posit: "",
	            emp_ecny_dt: "",
	            emp_mbl_telno: "",
	            emp_eml_addr: "",
	            emp_dept_nm: "",
	            emp_posit_nm: ""
	        }
	    },
	    mounted() {
	    	this.getInfo();
	    },
	    
	    methods: {
	        
	        getInfo: function () {
	            var params = {
	                emp_no: this.info.emp_no
	            }
	            console.log(this.info.emp_no);
	            cf_ajax("/empMng/getEmpOne", params, this.getInfoCB);
	        },
	        getInfoCB: function (data) {
	            this.info = data;
	        },
	        empUpdate: function () {
	        	
	        	if (!this.info.emp_no) {
	                alert("사원번호를 입력하세요.");
	                return;
	            }
	            if (!this.info.emp_nm) {
	                alert("성명을 입력하세요.");
	                return;
	            }
	            if (!this.info.emp_dept) {
	                alert("부서를 선택하세요.");
	                return;
	            }
	            if (!this.info.emp_posit) {
	                alert("직위를 선택하세요.");
	                return;
	            }
	            if (!this.info.emp_ecny_dt) {
	                alert("입사일자를 선택하세요.");
	                return;
	            }
	            if (!this.info.emp_mbl_telno) {
	                alert("전화번호를 입력하세요.");
	                return;
	            }
	            if (!this.info.emp_eml_addr) {
	                alert("E-mail을 입력하세요.");
	                return;
	            }
	        	
	            var params = {
	                emp_no: this.info.emp_no,
	                emp_nm: this.info.emp_nm,
	                emp_dept: this.info.emp_dept,
	                emp_posit: this.info.emp_posit,
	                emp_ecny_dt: this.info.emp_ecny_dt,
	                emp_mbl_telno: this.info.emp_mbl_telno,
	                emp_eml_addr: this.info.emp_eml_addr
	            }
	            cf_ajax("/empMng/empUpdate", params, this.updateStsCB);
	        },
	        updateStsCB: function (data) {
	            if (data.status == "OK") {
	                alert("변경 완료");
	            }
	            window.location.reload();
	        }
	    }
	});
</script>
</html>