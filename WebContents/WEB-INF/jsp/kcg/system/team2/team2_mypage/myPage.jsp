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
	<link rel="stylesheet" href="/static_resources/system/team2/team2_css/team2.css">
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
	
		<h2 class="header" onclick="location.reload();">마이페이지</h2>
		<br/>
		
		<div class="row">
			<div id="vueapp" style="display: flex; justify-content: center; width: 100%;">
				<template>
					<div class="panel-body" style="border: 2px solid #00CDFF; width: 100%; display: flex; justify-content: center;">
						<div class="left-panel" style="width: 50%; border: none;">
							<div class="form-group" style="display: flex; align-items: center; margin-bottom: 15px;">
								<label for="emp_no" class="fix-width-33" style="width: 150px;">사원번호 :</label>
								<input type="text" class="form-control" id="emp_no" v-model="info.emp_no" readonly style="flex: 1;">
							</div>
							
							<div class="form-group" style="display: flex; align-items: center; margin-bottom: 15px;">
								<label for="emp_nm" class="fix-width-33" style="width: 150px;">성명 :</label>
								<input type="text" class="form-control" id="emp_nm" v-model="info.emp_nm" style="flex: 1;">
							</div>
							
							<div class="form-group" style="display: flex; align-items: center; margin-bottom: 15px;">
								<label for="emp_dept" class="fix-width-33" style="width: 150px;">부서 :</label>
								<input type="text" class="form-control" id="emp_dept" v-model="info.emp_dept_nm" readonly style="flex: 1;">
							</div>
				
							<div class="form-group" style="display: flex; align-items: center; margin-bottom: 15px;">
								<label for="emp_posit" class="fix-width-33" style="width: 150px;">직위 :</label>
								<input type="text" class="form-control" id="emp_posit" v-model="info.emp_posit_nm" readonly style="flex: 1;">
							</div>
							
							<div class="form-group" style="display: flex; align-items: center; margin-bottom: 15px;">
								<label for="emp_ecny_dt" class="fix-width-33" style="width: 150px;">입사일자 :</label>
								<input type="date" class="form-control" id="emp_ecny_dt" v-model="info.emp_ecny_dt" readonly style="flex: 1;">
							</div>
							
							<div class="form-group" style="display: flex; align-items: center; margin-bottom: 15px;">
								<label for="emp_mbl_telno" class="fix-width-33" style="width: 150px;">전화번호 :</label>
								<input type="text" class="form-control" id="emp_mbl_telno" v-model="info.emp_mbl_telno" style="flex: 1;">
							</div>
							
							<div class="form-group" style="display: flex; align-items: center; margin-bottom: 15px;">
								<label for="emp_eml_addr" class="fix-width-33" style="width: 150px;">E-mail :</label>
								<input type="text" class="form-control" id="emp_eml_addr" v-model="info.emp_eml_addr" style="flex: 1;">
							</div>
							
							<div class="form-group" style="display: flex; gap: 10px;">
								<button type="button" class="btn btn-green btn-icon btn-small" @click="popUserPw">
									비밀번호변경
									<i class="entypo-check"></i>
								</button>
								<button type="button" class="btn btn-green btn-icon btn-small" @click="empUpdate">
									저장
									<i class="entypo-check"></i>
								</button>
								<button type="button" class="btn btn-blue btn-icon btn-small" onclick="cf_movePage('/system')">
									HOME
									<i class="fa fa-home"></i>
								</button>
							</div>
						</div>
					</div>						
				</template>		
			</div>
		</div>
		<br />
		<div class="modal fade" id="pop_user_pw" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog" style="width: 400px;">
		        <div class="modal-content">
		       	 <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" @click="close" aria-hidden="true" id="btn_popClose" >&times;</button>
						<h4 class="modal-title" id="modify_nm">비밀번호 변경</h4>
					</div> 
			            <div class="modal-body">
			                <div style="max-height: 700px; overflow: auto;" class="dataTables_wrapper">
			                    <div class="form-group" style="display: flex; align-items: center; margin-bottom: 15px;">
									<label for="user_pw" class="fix-width-33" style="width: 150px;">비밀번호 :</label>
									<input type="text" class="form-control" id="user_pw" v-model="user_pw" style="flex: 1;">
								</div>
			                    <div style="text-align: center; margin-bottom: 5px;">
			                		<button type="button" class="btn btn-green" style="margin-left: 5px;" @click="UserPwUpdate">변경</button>
		                		</div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
		
		
		
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
	            emp_posit_nm: "",
            	user_pw: ""
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
	                emp_eml_addr: this.info.emp_eml_addr,
	                user_pw: this.info.user_pw
	            }
	            cf_ajax("/empMng/empUpdate", params, this.updateStsCB);
	        },
	        updateStsCB: function (data) {
	            if (data.status == "OK") {
	                alert("변경 완료");
	            }
	            window.location.reload();
	        },
	        popUserPw: function () {
            	$('#pop_user_pw').modal('show');
            },
	    }
	});
	
	var pop_user_pw = new Vue({
	       el: "#pop_user_pw",
	       data: {
	           user_pw: "",
	       },
	       methods: {
	           UserPwUpdate: function() {
	        	   if (!this.user_pw) {
		                alert("비밀번호가 공란입니다.");
		                return;
		            }
	               var params = {
	               	update_user_pw: this.user_pw,
	               	emp_no: vueapp.info.emp_no,
	               }
	               cf_ajax("/empMng/userPwUpdate", params, this.updateStsCB);
	           },
	           updateStsCB: function (data) {
				if (data.status == "OK") {
					alert("비밀번호 변경이 완료되었습니다.");
				}
	          }
	       }
	   });
	
	
</script>
</html>