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

        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false" />

        <div class="main-content">

            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false" />

            <ol class="breadcrumb bc-3">
                <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
                <li class="active"><strong>고객정보 목록 조회</strong></li>
            </ol>

            <h2>고객정보 목록</h2>
            <br />

            <div class="flex-column flex-gap-10" id="vueapp">
                <template>
                    <div class="flex flex-100">
                        <div class="flex-wrap flex-90 flex flex-gap-10 flex-padding-10">
                            <div class="form-group flex-40">
                                <label class="fix-width-33">고객명 :</label>
                                <input class="form-control" v-model="cust_nm" value="">
                            </div>
                           	<div class="form-group flex-40">
                                <label class="fix-width-33">생년월일 :</label>
                                <input type="text" class="form-control" v-model="cust_pridtf_no">
                            </div>
                            <div class="form-group flex-40">
                                <label class="fix-width-33">관리담당자 :</label>
                                <input class="form-control" v-model="emp_nm" value="">
                            </div>
           				    <div class="form-group flex-40">
                                <label class="fix-width-33">이벤트구분 :</label>
                                <select id ="event">
                                	<option value="">전체</option>
                                	<option value="">생일</option>
                                	<option value="">만기도래</option>
                                	<option value="">기타</option>
                                </select>
                            </div>

                        </div>

                        <div class="flex-wrap flex-10 flex flex-center flex-gap-10 flex-padding-10">
                            <div class="form-group" style="width:30%;">
                                <button type="button" class="btn btn-blue btn-icon icon-left form-control "
                                    v-model="search_val" @click="getCustInfoList(true)">
                                    검색
                                    <i class="entypo-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="flex flex-100 flex-padding-10 flex-gap-10"
                        style="justify-content:flex-end;border: 1px solid #999999;">
                        <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;"
                            >
                            신규회원등록
                            <i class="entypo-archive"></i>
                        </button>
                        <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;"
                            >
                            관리대장출력
                            <i class="entypo-vcard"></i>
                        </button>
                        <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;"
                            >
                            상담내역
                            <i class="entypo-user"></i>
                        </button>
                        <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" 
                        	@click="popDamdangSet">
                            담당자설정
                            <i class="entypo-clipboard"></i>
                        </button>
                    </div>
                    <table class="table table-bordered datatable dataTable" id="grid_app"
                        style="border: 1px solid #999999;">
                        <thead>
                            <tr class="replace-inputs">
                                <th style="width: 5%;" class="center"><input type="checkbox" id="allCheck"
                                        @click="all_check(event.target)" style="cursor: pointer;"></th>
                                <th style="width: 10%;" class="center">성명</th>
                                <th style="width: 15%;" class="center">생년월일</th>
                                <th style="width: 15%;" class="center">이메일주소</th>
                                <th style="width: 15%;" class="center">핸드폰번호</th>
                                <th style="width: 25%;" class="center">주소</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="item in dataList" @dblclick="gotoDtl(item.cust_pridtf_no)"
                                style="cursor: pointer;">
                                <td class="center" @dblclick.stop="return false;"><input type="checkbox"
                                        :data-idx="item.cust_nm" name="is_check" @click.stop="onCheck"
                                        style="cursor: pointer;">
                                </td>
                                <td class="center">{{item.cust_nm}}</td>
                                <td class="center">{{item.cust_pridtf_no.substring(0,6)}}</td>
                                <td class="center">{{item.cust_eml_addr}}</td>
                                <td class="center">{{item.cust_mbl_telno}}</td>
                                <td class="center">{{item.cust_road_nm_addr}}</td>
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
	   
	   
	   
<!-- 	   고객 정보 팝업 		-->
	   <div class="modal fade" id="pop_cust_info">
                <template>
                    <div class="modal-dialog4">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                    id="btn_popClose">&times;</button>
                                <h4 class="modal-title" id="modify_nm">고객기본정보</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal form-groups-bordered">
                                    <div class="clearAfter">
                                        <div class="left">
                                            <div class="form-group">
                                                <table class="defalut">
													<tr>
														<td>**작성일자: </td>
														<td><input type="date" class="form-control form-control-sm"></td>
													</tr>
													<tr>
														<td>*고객명: </td>
														<td><input type="text" class="form-control form-control-sm"></td>
													</tr>
													<tr>
														<td>*실명번호: </td>
														<td><input type="text" class="form-control form-control-sm"></td>
													</tr>
													<tr>
														<td>*E-mail: </td>
														<td><input type="email" class="form-control form-control-sm"></td>
													</tr>
													<tr>
														<td>*전화번호: </td>
														<td><input type="text" class="form-control form-control-sm"></td>
													</tr>
													<tr>
														<td>*핸드폰번호: </td>
														<td><input type="text" class="form-control form-control-sm"></td>
													</tr>
													<tr>
														<td>*직업: </td>
														<td><input type="text" class="form-control form-control-sm"></td>
													</tr>
													<tr>
														<td>*주소: </td>
														<td><textarea class="form-control" rows='2' ></textarea></td>
													</tr>
												</table>
												<table class="defalut">
													<tr>
														<td>관리담당자: </td>
														<td>
														<div class="input-group input-group-sm">
														    <input type="text" class="form-control" aria-label="Text input with icon">
														    <span id="searchIcon" class="input-group-text"><i class="bi bi-search"></i></span>
														 </div>
														</td>
													</tr>
													<tr>
														<td>**부서: </td>
														<td><input type="text" class="form-control form-control-sm"></td>
													</tr>
													<tr>
														<td>**직위: </td>
														<td><input type="text" class="form-control form-control-sm"></td>
													</tr>
													<tr>
														<td>**연락처: </td>
														<td><input type="text" class="form-control form-control-sm"></td>
													</tr>
												</table>
                                        </div>
                                        <div class="right">
                                            <div class="form-group">
                                                <label for="err_eng_nm" class="col-sm-2 control-label">상담내역</label>
                                            </div>
                                            <div class="col-sm-10">
                                                <tr>
                                                    <textarea id="tsk_dtl_cn" v-model="info.tsk_dtl_cn"
                                                        style="width:100%;"></textarea>
                                                </tr>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </template>
            </div>
<!-- 	   담당자 설정 팝업		 -->
	   <div class="modal fade" id="pop_pic_info">
                <template>
                    <div class="modal-dialog" style="width: 500px;">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div style="height: 400px;overflow: auto;" class="dataTables_wrapper">
                                    <table class="table table-bordered datatable dataTable">
                                        <thead style="position: sticky;top: 0px;">
                                            <tr>
                                                <th class="center" style="width: 20%;">담당자명</th>
                                                <th class="center" style="width: 20%;">부서명</th>
                                                <th class="center" style="width: 20%;">직위</th>
                                                <th class="center" style="width: 50%;">연락처</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="item in picInfo" @click="selItem(item.emp_nm)"
                                                style="cursor: pointer;">
                                                <td class="center">{{item.emp_nm}}</td>
                                                <td class="center">{{item.emp_dept}}</td>
                                                <td class="center">{{item.emp_posit}}</td>
                                                <td class="center">{{item.emp_mbl_telno}}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </template>
            </div>
	   
	   
</body>

    <script type="text/javascript">
    var vueapp = new Vue({
        el: "#vueapp",
        data: {
            dataList: [],
            search_nm: "",
            cust_nm: "",
    		cust_pridtf_no: "",
    		emp_nm: "",
            search_val: "",
        },
        mounted: function () {
            var fromDtl = cf_getUrlParam("fromDtl");
            var pagingConfig = cv_sessionStorage.getItem("pagingConfig");
            if ("Y" === fromDtl && !cf_isEmpty(pagingConfig)) {
                cv_pagingConfig.pageNo = pagingConfig.pageNo;
                cv_pagingConfig.orders = pagingConfig.orders;
                var params = cv_sessionStorage.getItem("params");
                this.search_nm = params.search_nm;
                this.cust_nm = params.cust_nm;
                this.cust_pridtf_no = params.cust_pridtf_no;
                this.emp_nm = params.emp_nm;
                this.search_val = params.search_val;

                this.getCustInfoList();
            } else {
                cv_sessionStorage
                    .removeItem("pagingConfig")
                    .removeItem("params");
                this.getCustInfoList(true);
            }
        },
        methods: {
            getCustInfoList: function (isInit) {

                cv_pagingConfig.func = this.getCustInfoList;
                if (isInit === true) {
                    cv_pagingConfig.pageNo = 1;
                    cv_pagingConfig.orders = [{ target: "cust_nm", isAsc: false }];
                }

                var params = {
                    search_nm: this.search_nm,
                    search_val: this.search_val,
                    cust_nm: this.cust_nm,
                    cust_pridtf_no: this.cust_pridtf_no,
                }

                cv_sessionStorage
                    .setItem('pagingConfig', cv_pagingConfig)
                    .setItem('params', params);

                cf_ajax("/customer/getCustInfoList2", params, this.getListCB);
            },
            getCustInfoListAll: function (isInit) {

                cv_pagingConfig.func = this.getCustInfoListAll;
                if (isInit === true) {
                    cv_pagingConfig.pageNo = 1;
                    cv_pagingConfig.orders = [{ target: "cust_nm", isAsc: false }];
                }

                var params = {
                    search_nm: this.search_nm,
                    search_val: this.search_val,
                }

                cv_sessionStorage
                    .setItem('pagingConfig', cv_pagingConfig)
                    .setItem('params', params);

                cf_ajax("/customer/getCustInfoList2", params, this.getListCB);
            },
            getListCB: function (data) {
                //console.log(data);
                this.dataList = data.list;
                cv_pagingConfig.renderPagenation("system");
            },
            gotoDtl: function (cust_pridtf_no) {
                console.log(cust_pridtf_no);
                pop_cust_info.init(cust_pridtf_no);
                $('#pop_cust_info').modal('show');
            },
            all_check: function (obj) {
                $('[name=is_check]').prop('checked', obj.checked);
            },
            onCheck: function () {
                $("#allCheck").prop('checked',
                    $("[name=is_check]:checked").length === $("[name=is_check]").length
                );
            },
            popDamdangSet: function () {
                var checkedList = $("[name=is_check]:checked");
                if (checkedList.length == 0) {
                    alert("담당자 설정 대상을 선택하여 주십시오.");
                    return;
                }
                //check list 가져오기..
                var dateCopyList = [];
                var idx;
                checkedList.each(function (i) {
                    idx = $(this).attr("data-idx");
                    dateCopyList.push(vueapp.dataList.getElementFirst("cust_nm", idx));
                });

                console.log(dateCopyList);

                //설정팝업 띄우기
//                 pop_damdang_set.init(dateCopyList);
                $('#pop_pic_info').modal('show');
            },
            
        }
    });
    var pop_cust_info = new Vue({
        el: "#pop_cust_info",
        data: {
            info: {
            	cust_pridtf_no: "${cust_pridtf_no}",
                wrt_dt: "",
                cust_nm: "",
                rrno: "",
                cust_eml_addr: "",
                co_telno: "",
                occp_ty_cd_nm: "",
                cust_addr: "",
                tsk_dtl_cn: "",
            }
        },
        methods: {
            init: function (cust_mbl_telno) {
                this.initInfo();
                this.info.cust_mbl_telno = cust_mbl_telno;
                if (!cf_isEmpty(this.info.cust_mbl_telno)) {
                    this.getInfo();
                }
            },
            initInfo: function () {
                this.info = {
                    cust_mbl_telno: "",
                    wrt_dt: "",
                    cust_nm: "",
                    rrno: "",
                    cust_eml_addr: "",
                    co_telno: "",
                    occp_ty_cd_nm: "",
                    cust_addr: "",
                    tsk_dtl_cn: "",
                }
            },
            getInfo: function () {
                var params = {
                    cust_mbl_telno: this.info.cust_mbl_telno,
                }
                cf_ajax("/custMng/getInfo", params, this.getInfoCB);
            },
            getInfoCB: function (data) {
                this.info = data;
            },
        },
    });
    
    var pop_pic_info = new Vue({
        el: "#pop_pic_info",
        data: {
            picInfo: [],
        },
        methods: {
            init: function () {
                this.getPicInfo();
            },
            getPicInfo: function () {
                this.dataList = [];
                var params = {
                    cust_nm: "",
                }

                cf_ajax("/customer/getPicInfo", params, function (data) {
                	pop_pic_info.picInfo = data;
                });
            },
//             selItem: function (cust_nm) {

//                 //$('#pop_pic_info').modal('hide');
//                 $('#pop_pic_info').hide();
//                 pop_damdang_set.getPicSelInfo(cust_nm);
//             },
        },
    });
    </script>
</body>
</html>