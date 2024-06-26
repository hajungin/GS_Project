<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp" flush="false" />
            <!-- Imported styles on this page -->
            <link rel="stylesheet" href="/static_resources/system/js/datatables/datatables.css">
            <link rel="stylesheet" href="/static_resources/system/js/select2/select2-bootstrap.css">
            <link rel="stylesheet" href="/static_resources/system/js/select2/select2.css">
            <link rel="stylesheet" href="/static_resources/system/js/datatables/proddtl.css">
            <title>관리자시스템</title>
        </head>


		<body class="page-body">
		    <div class="page-container">
		        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false" />
		
		        <div class="main-content">
		            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false" />
		
		            <ol class="breadcrumb bc-3">
		                <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
		                <li class="active"><strong>담당자정보 조회</strong></li>
		            </ol>
		
		            <h2>담당자 목록</h2>
		            <br />
		
		            <div class="flex-column flex-gap-10 dataTables_wrapper" id="vueapp">
		                <template>
		                    <div class="flex flex-100">
		                        <div class="flex-wrap flex-66 flex flex-gap-10 flex-padding-10">
		                            <div class="form-group flex-40">
		                                <label class="fix-width-33">사원번호 :</label>
		                                <input class="form-control" v-model="emp_no" value="">
		                            </div>
		                            <div class="form-group flex-40">
		                                <label class="fix-width-33">성명 :</label>
		                                <input class="form-control" v-model="emp_nm" value="">
		                            </div>
		                            <div class="form-group flex-40">
		                                <label class="fix-width-33">부서 :</label>
		                                <input type="text" class="form-control" v-model="emp_dept">
		                            </div>
		                            <div class="form-group flex-40">
		                                <label class="fix-width-33">직위 :</label>
		                                <input type="text" class="form-control" v-model="emp_posit">
		                            </div>
		                        </div>
		
		                        <div class="flex-wrap flex-33 flex flex-center flex-gap-10 flex-padding-10">
		                            <div class="form-group" style="width:20%;">
		                                <button type="button" class="btn btn-blue btn-icon icon-left form-control"
		                                    v-model="search_val" @click="getEmpMngList(true)">
		                                    검색
		                                    <i class="entypo-search"></i>
		                                </button>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="flex flex-100 flex-padding-10 flex-gap-10"
		                        style="justify-content:flex-end;border: 1px solid #999999;">
		                        <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;"
		                            @click="showRegisterPopup">
		                            담당자 등록
		                            <i class="entypo-archive"></i>
		                        </button>
		                    </div>
		                    <table class="table table-bordered datatable dataTable" id="grid_app"
		                        style="border: 1px solid #999999;">
		                        <thead>
		                            <tr class="replace-inputs">
		                                <th>No</th>
		                                <th style="width: 20%;" class="center">사원번호</th>
		                                <th style="width: 15%;" class="center">성명</th>
		                                <th style="width: 15%;" class="center">부서</th>
		                                <th style="width: 10%;" class="center">직위</th>
		                                <th style="width: 40%;" class="center">E-mail</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                            <tr v-for="(item, index) in dataList" @dblclick="showDetailPopup(item.emp_no)"
		                                style="cursor: pointer;">
		                                <td class="center">{{index + 1}}</td>
		                                <td class="center">{{item.emp_no}}</td>
		                                <td class="center">{{item.emp_nm}}</td>
		                                <td class="center">{{item.emp_dept}}</td>
		                                <td class="center">{{item.emp_posit}}</td>
		                                <td class="center">{{item.emp_eml_addr}}</td>
		                            </tr>
		                        </tbody>
		                    </table>
		                    <div class="dataTables_paginate paging_simple_numbers" id="div_paginate">
		                    </div>
		                </template>
		            </div>
		
		            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false" />
		        </div>
		    </div>
		
		    <!-- 담당자 등록 팝업 -->
		    <div class="modal fade" id="pop_emp_register">
		        <template>
		            <div class="modal-dialog modal-lg">
		                <div class="modal-content">
		                    <div class="modal-header">
		                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                        <h4 class="modal-title">담당자 등록</h4>
		                    </div>
		                    <div class="modal-body">
		                        <form class="form-horizontal">
		                            <div class="row">
		                                <div class="col-sm-6">
		                                    <div class="form-group">
		                                        <label for="reg_emp_no" class="col-sm-4 control-label">사원번호:</label>
		                                        <div class="col-sm-8">
		                                            <input type="text" id="reg_emp_no" v-model="reg_info.emp_no" class="form-control">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="reg_emp_nm" class="col-sm-4 control-label">성명 :</label>
		                                        <div class="col-sm-8">
		                                            <input type="text" id="reg_emp_nm" v-model="reg_info.emp_nm" class="form-control">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="reg_emp_dept" class="col-sm-4 control-label">부서 :</label>
		                                        <div class="col-sm-8" id="selectcr">
		                                            <select id="reg_emp_dept" class="form-control" v-model="reg_info.emp_dept" style="margin-left: 10px;">
		                                                <option value="DP01">영업1팀</option>
		                                                <option value="DP02">영업2팀</option>
		                                                <option value="DP03">영업3팀</option>
		                                            </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="reg_emp_posit" class="col-sm-4 control-label">직위 :</label>
		                                        <div class="col-sm-8" id="selectcr">
		                                            <select id="reg_emp_posit" class="form-control" v-model="reg_info.emp_posit" style="margin-left: 10px;">
		                                                <option value="PS01">부장</option>
		                                                <option value="PS02">차장</option>
		                                                <option value="PS03">과장</option>
		                                                <option value="PS04">대리</option>
		                                                <option value="PS05">사원</option>
		                                            </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="reg_emp_ecny_dt" class="col-sm-4 control-label">입사일자 :</label>
		                                        <div class="col-sm-8">
		                                            <input type="date" id="reg_emp_ecny_dt" v-model="reg_info.emp_ecny_dt" class="form-control">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="reg_emp_mbl_telno" class="col-sm-4 control-label">전화번호 :</label>
		                                        <div class="col-sm-8">
		                                            <textarea id="reg_emp_mbl_telno" v-model="reg_info.emp_mbl_telno" class="form-control" style="width: 100%; resize: none; margin-left: 10px;"></textarea>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="reg_emp_eml_addr" class="col-sm-4 control-label">E-mail :</label>
		                                        <div class="col-sm-8">
		                                            <textarea id="reg_emp_eml_addr" v-model="reg_info.emp_eml_addr" class="form-control" style="width: 100%; resize: none; margin-left: 10px;"></textarea>
		                                        </div>
		                                    </div>
		                                </div>
		                        </form>
		                    </div>
		                    <div class="modal-footer">
		                        <button type="button" class="btn btn-success btn-icon btn-small" @click="empInsert">
		                            담당자 등록
		                            <i class="entypo-user"></i>
		                        </button>
		                    </div>
		                </div>
		            </div>
		        </template>
		    </div>
		
		    <!-- 담당자 상세정보 팝업 -->
		    <div class="modal fade" id="pop_emp_info">
		        <template>
		            <div class="modal-dialog modal-lg">
		                <div class="modal-content">
		                    <div class="modal-header">
		                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                        <h4 class="modal-title">담당자 상세정보</h4>
		                    </div>
		                    <div class="modal-body">
		                        <form class="form-horizontal">
		                            <div class="row">
		                                <div class="col-sm-6">
		                                    <div class="form-group">
		                                        <label for="emp_no" class="col-sm-4 control-label">사원번호:</label>
		                                        <div class="col-sm-8">
		                                            <input type="text" id="emp_no" v-model="info.emp_no" class="form-control" readonly>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="emp_nm" class="col-sm-4 control-label">성명 :</label>
		                                        <div class="col-sm-8">
		                                            <input type="text" id="emp_nm" v-model="info.emp_nm" class="form-control">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="emp_dept" class="col-sm-4 control-label">부서 :</label>
		                                        <div class="col-sm-8" id="selectcr">
		                                            <select id="emp_dept" class="form-control" v-model="info.emp_dept" style="margin-left: 10px;">
		                                                <option value="DP01">영업1팀</option>
		                                                <option value="DP02">영업2팀</option>
		                                                <option value="DP03">영업3팀</option>
		                                            </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="emp_posit" class="col-sm-4 control-label">직위 :</label>
		                                        <div class="col-sm-8" id="selectcr">
		                                            <select id="emp_posit" class="form-control" v-model="info.emp_posit" style="margin-left: 10px;">
		                                                <option value="PS01">부장</option>
		                                                <option value="PS02">차장</option>
		                                                <option value="PS03">과장</option>
		                                                <option value="PS04">대리</option>
		                                                <option value="PS05">사원</option>
		                                            </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="emp_ecny_dt" class="col-sm-4 control-label">입사일자 :</label>
		                                        <div class="col-sm-8">
		                                            <input type="date" id="emp_ecny_dt" v-model="info.emp_ecny_dt" class="form-control">
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="emp_mbl_telno" class="col-sm-4 control-label">전화번호 :</label>
		                                        <div class="col-sm-8">
		                                            <textarea id="emp_mbl_telno" v-model="info.emp_mbl_telno" class="form-control" style="width: 100%; resize: none; margin-left: 10px;"></textarea>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label for="emp_eml_addr" class="col-sm-4 control-label">E-mail :</label>
		                                        <div class="col-sm-8">
		                                            <textarea id="emp_eml_addr" v-model="info.emp_eml_addr" class="form-control" style="width: 100%; resize: none; margin-left: 10px;"></textarea>
		                                        </div>
		                                    </div>
		                                </div>
		                        </form>
		                    </div>
		                    <div class="modal-footer">
		                        <button type="button" class="btn btn-success btn-icon btn-small" @click="empUpdate">
		                            담당자정보 변경
		                            <i class="entypo-user"></i>
		                        </button>
		                        <button type="button" class="btn btn-danger btn-icon btn-small" @click="empDelete">
		                            담당자 삭제
		                            <i class="entypo-trash"></i>
		                        </button>
		                    </div>
		                </div>
		            </div>
		        </template>
		    </div>
		
		    <script type="text/javascript">
		        var vueapp = new Vue({
		            el: "#vueapp",
		            data: {
		                dataList: [],
		                search_nm: "",
		                emp_no: "",
		                emp_nm: "",
		                emp_dept: "",
		                emp_posit: "",
		                search_val: ""
		            },
		            mounted: function () {
		                var fromDtl = cf_getUrlParam("fromDtl");
		                var pagingConfig = cv_sessionStorage.getItem("pagingConfig");
		                if ("Y" === fromDtl && !cf_isEmpty(pagingConfig)) {
		                    cv_pagingConfig.pageNo = pagingConfig.pageNo;
		                    cv_pagingConfig.orders = pagingConfig.orders;
		
		                    var params = cv_sessionStorage.getItem("params");
		                    this.search_nm = params.search_nm;
		                    this.emp_no = params.emp_no;
		                    this.emp_nm = params.emp_nm;
		                    this.emp_dept = params.emp_dept;
		                    this.emp_posit = params.emp_posit;
		                    this.search_val = params.search_val;
		
		                    this.getEmpMngList(true);
		                } else {
		                    cv_sessionStorage
		                        .removeItem("pagingConfig")
		                        .removeItem("params");
		                    this.getEmpMngList(true);
		                }
		            },
		            methods: {
		                getEmpMngList: function (isInit) {
		                    cv_pagingConfig.func = this.getEmpMngList;
		                    if (isInit === true) {
		                        cv_pagingConfig.pageNo = 1;
		                        cv_pagingConfig.orders = [{ target: "emp_no", isAsc: false }];
		                    }
		
		                    var params = {
		                        emp_no: this.emp_no,
		                        emp_nm: this.emp_nm,
		                        emp_dept: this.emp_dept,
		                        emp_posit: this.emp_posit,
		                        emp_eml_addr: this.emp_eml_addr
		                    }
		
		                    cv_sessionStorage
		                        .setItem('pagingConfig', cv_pagingConfig)
		                        .setItem('params', params);
		
		                    cf_ajax("/empMng/getEmpMngList", params, this.getListCB);
		                },
		                getListCB: function (data) {
		                    this.dataList = data.list;
		                    console.log(this.dataList);
		                    cv_pagingConfig.renderPagenation("system");
		                },
		                showDetailPopup: function (emp_no) {
		                    console.log(emp_no);
		                    pop_emp_info.init(emp_no);
		                    $('#pop_emp_info').modal('show');
		                },
		                showRegisterPopup: function () {
		                    pop_emp_register.init();
		                    $('#pop_emp_register').modal('show');
		                }
		            }
		        });
		
		        var pop_emp_register = new Vue({
		            el: "#pop_emp_register",
		            data: {
		                reg_info: {
		                    emp_no: "",
		                    emp_nm: "",
		                    emp_dept: "",
		                    emp_posit: "",
		                    emp_ecny_dt: "",
		                    emp_mbl_telno: "",
		                    emp_eml_addr: ""
		                },
		            },
		            methods: {
		                init: function () {
		                    this.reg_info = {
		                        emp_no: "",
		                        emp_nm: "",
		                        emp_dept: "",
		                        emp_posit: "",
		                        emp_ecny_dt: "",
		                        emp_mbl_telno: "",
		                        emp_eml_addr: ""
		                    };
		                },
		                empInsert: function () {
		                	
		                	if (!this.reg_info.emp_no) {
		                        alert("사원번호를 입력하세요.");
		                        return;
		                    }
		                    if (!this.reg_info.emp_nm) {
		                        alert("성명을 입력하세요.");
		                        return;
		                    }
		                    if (!this.reg_info.emp_dept) {
		                        alert("부서를 선택하세요.");
		                        return;
		                    }
		                    if (!this.reg_info.emp_posit) {
		                        alert("직위를 선택하세요.");
		                        return;
		                    }
		                    if (!this.reg_info.emp_ecny_dt) {
		                        alert("입사일자를 선택하세요.");
		                        return;
		                    }
		                    if (!this.reg_info.emp_mbl_telno) {
		                        alert("전화번호를 입력하세요.");
		                        return;
		                    }
		                    if (!this.reg_info.emp_eml_addr) {
		                        alert("E-mail을 입력하세요.");
		                        return;
		                    }
		                	
		                    var params = {
		                        emp_no: this.reg_info.emp_no,
		                        emp_nm: this.reg_info.emp_nm,
		                        emp_dept: this.reg_info.emp_dept,
		                        emp_posit: this.reg_info.emp_posit,
		                        emp_ecny_dt: this.reg_info.emp_ecny_dt,
		                        emp_mbl_telno: this.reg_info.emp_mbl_telno,
		                        emp_eml_addr: this.reg_info.emp_eml_addr
		                    }
		                    cf_ajax("/empMng/empInsert", params, this.insertStsCB);
		                },
		                insertStsCB: function (data) {
		                    if (data.status == "OK") {
		                        alert("등록 완료");
		                    }
		                    $('#pop_emp_register').modal('hide');
		                    window.location.reload();
		                }
		            }
		        });
		
		        var pop_emp_info = new Vue({
		            el: "#pop_emp_info",
		            data: {
		                info: {
		                    emp_no: "${emp_no}",
		                    emp_nm: "",
		                    emp_dept: "",
		                    emp_posit: "",
		                    emp_ecny_dt: "",
		                    emp_mbl_telno: "",
		                    emp_eml_addr: ""
		                },
		            },
		            methods: {
		                init: function (emp_no) {
		                    this.info.emp_no = emp_no;
		                    console.log(emp_no);
		                    if (!cf_isEmpty(this.info.emp_no)) {
		                        this.getInfo(); 
		                        }
		                },
		                getInfo: function () {
		                    var params = {
		                        emp_no: this.info.emp_no
		                    }
		                    console.log(params);
		                    cf_ajax("/empMng/getEmpOne", params, this.getInfoCB);
		                },
		                getInfoCB: function (data) {
		                    this.info = data;
		                    console.log(data);
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
		                    $('#pop_emp_info').modal('hide');
		                    window.location.reload();
		                },
		                empDelete: function () {
		                    var params = {
		                        emp_no: this.info.emp_no,
		                    }
		                    cf_ajax("/empMng/empDelete", params, this.changeStsCB);
		                },
		                changeStsCB: function (data) {
		                    if (data.status == "OK") {
		                        alert("삭제 완료");
		                    }
		                    $('#pop_emp_info').modal('hide');
		                    window.location.reload();
		                }
		            }
		        });
		    </script>
		</body>
		</html>
		