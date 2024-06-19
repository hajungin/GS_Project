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
            <style type="text/css">
    .flex-container {
        display: flex;
        justify-content: space-between;
    }

    .left {
        width: 50%; /* 왼쪽 컬럼 너비 조정 */
        padding-right: 10px; /* 오른쪽과의 간격을 조정할 수 있습니다 */
    }

    .right {
        width: 50%; /* 오른쪽 컬럼 너비 조정 */
        padding-left: 10px; /* 왼쪽과의 간격을 조정할 수 있습니다 */
    }

    .consulting {
        border: 1px solid #ccc;
        padding: 10px;
    }

    .consulting h2 {
        margin-top: 0;
    }

    .table {
        width: 100%;
        max-width: 100%;
        margin-bottom: 20px;
        background-color: transparent;
    }

    .table-bordered {
        border: 1px solid #ddd;
    }

    .dataTable {
        width: 100%;
    }

    .center {
        text-align: center;
    }

    .form-control {
        width: 100%;
    }

    .btn {
        display: inline-block;
        padding: 6px 12px;
        margin-bottom: 0;
        font-size: 14px;
        font-weight: normal;
        line-height: 1.42857143;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        touch-action: manipulation;
        cursor: pointer;
        user-select: none;
        background-image: none;
        border: 1px solid transparent;
        border-radius: 4px;
    }

    .btn-blue {
        color: #fff;
        background-color: #337ab7;
        border-color: #2e6da4;
    }

    .icon-left {
        margin-right: 5px;
    }

    .fix-width-30 {
        width: 30%;
    }

    .flex {
        display: flex;
    }

    .flex-wrap {
        flex-wrap: wrap;
    }

    .flex-center {
        justify-content: center;
    }

    .flex-gap-10 {
        gap: 10px;
    }

    .flex-padding-10 {
        padding: 10px;
    }
    .form-group {
    	
    }
</style>
            
            <title>관리자시스템</title>
        </head>

        <body class="page-body">
    <div class="page-container">
        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false" />

        <div class="main-content">
            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false" />

            <ol class="breadcrumb bc-3">
                <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
                <li class="active"><strong>고객 정보 관리</strong></li>
            </ol>

            <h2>고객 정보 관리</h2>
            <br/>

            <div class="flex-container" id="vueapp">
                <div class="left">
                    <div class="flex flex-wrap flex-gap-10">
                        <div class="form-group flex-30">
                            <label class="fix-width-30">고객명 :</label>
                            <input class="form-control" v-model="cust_nm" value="">
                        </div>
                        <div class="form-group flex-30">
                            <label class="fix-width-30">생년월일 :</label>
                            <input type="text" class="form-control" v-model="">
                        </div>
                        <div class="form-group flex-30">
                            <label class="fix-width-30">전화번호 :</label>
                            <input type="text" class="form-control" v-model="">
                        </div>
                        <div class="right">
                            <button type="button" class="btn btn-blue btn-icon icon-left form-control" @click="getCustInfoList(true)">
                                검색
                                <i class="entypo-search"></i>
                            </button>
                        </div>
                    </div>

                    <table class="table table-bordered dataTable" id="grid_app">
                        <thead>
                            <tr class="replace-inputs">
                                <th style="width: 5%;" class="center"></th>
                                <th style="width: 10%;" class="center">성명</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="item in dataList" @dblclick="gotoDtl(item.cust_mbl_telno)" style="cursor: pointer;">
                                <td class="center"><input type="radio" :data-idx="item.cust_nm" name="is_check" @click.stop="onCheck" style="cursor: pointer;"></td>
                                <td class="center">{{ item.cust_nm }}</td>
                            </tr>
                </table>
                    <div class="dataTables_paginate paging_simple_number" id="div_paginate"></div>
                </div>
                <div class="right">
                    <form class="form-horizontal">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="cust_nm" class="col-sm-4 control-label">성명</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cust_nm" v-model="" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_pridtf_no" class="col-sm-4 control-label">실명번호</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cust_pridtf_no" v-model="" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_eml_addr" class="col-sm-4 control-label">E-mail</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cust_eml_addr" v-model="" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_home_telno" class="col-sm-4 control-label">전화번호</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cust_home_telno" v-model="" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_mbl_telno" class="col-sm-4 control-label">핸드폰번호</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cust_mbl_telno" v-model="" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_cr_no" class="col-sm-4 control-label">직업</label>
                                    <div class="col-sm-8" id="selectcr">
                                       <select id="cust_cr_no" class="form-control" v-model="" style="margin-left: 10px;">
											<option value="JB01">학생</option>
											<option value="JB02">공무원</option>
											<option value="JB03">회사원</option>
											<option value="JB04">자영업자</option>
											<option value="JB05">프리랜서</option>
											<option value="JB06">무직</option>
											<option value="JB07">기타</option>
										</select>
										<input v-if="" type="text" class="form-control" v-model="" placeholder="직업명 입력">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_road_addr" class="col-sm-4 control-label">주소</label>
                                    <div class="col-sm-8">
                                        <textarea id="cust_road_addr" v-model="" class="form-control" style="width: 100%; resize: none; margin-left: 10px;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="emp_nm" class="col-sm-4 control-label">담당자명</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" id="emp_nm" v-model="" class="form-control">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button" @click=""><i class="fa fa-search"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="emp_dept" class="col-sm-4 control-label">부서</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="emp_dept" v-model="" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="emp_posit" class="col-sm-4 control-label">직위</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="emp_posit" v-model="" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="emp_mbl_telno" class="col-sm-4 control-label">연락처</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="emp_mbl_telno" v-model="" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="cnslt_cn" class="col-sm-4 control-label">상담내역</label>
                                    <div class="col-sm-8">
                                        <textarea id="cnslt_cn" class="form-control" style="width: 100%; height: 300px; resize: none;" readonly></textarea>
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <label for="cnslt_cn" class="col-sm-4 control-label">상담추가입력</label>
                                    <div class="col-sm-8">
                                        <textarea id="cnslt_cn" class="form-control" v-model="" style="width: 100%; height: 150px; resize: none;"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false" />
        </div>
    </div>
</body>

        <script>
            var vueapp = new Vue({
                el: "#vueapp",
                data: {
                    dataList: [],
                    cust_pridtf_no:"",
                    cust_nm: "",
                    cust_mbl_telno:"",
                },
                mounted: function () {
                    var fromDtl = cf_getUrlParam("fromDtl");
                    var pagingConfig = cv_sessionStorage.getItem("pagingConfig");
                    if ("Y" === fromDtl && !cf_isEmpty(pagingConfig)) {
                        cv_pagingConfig.pageNo = pagingConfig.pageNo;
                        cv_pagingConfig.orders = pagingConfig.orders;

                        var params = cv_sessionStorage.getItem("params");
                        this.cust_pridtf_no = params.cust_pridtf_no;
                        this.cust_mbl_telno = params.cust_mbl_telno;
                        this.cust_nm = params.cust_nm;
                        this.getCustInfoList(true);
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
                        	cust_pridtf_no: this.cust_pridtf_no,
                            cust_mbl_telno: this.cust_mbl_telno,
                            cust_nm: this.cust_nm,
                        }

                        cv_sessionStorage
                            .setItem('pagingConfig', cv_pagingConfig)
                            .setItem('params', params);

                        cf_ajax("/sell/getcustomer", params, this.getListCB);
                    },
                    getCustInfoListAll: function (isInit) {

                        cv_pagingConfig.func = this.getCustInfoListAll;
                        if (isInit === true) {
                            cv_pagingConfig.pageNo = 1;
                            cv_pagingConfig.orders = [{ target: "cust_nm", isAsc: false }];
                        }

                        var params = {
                        	cust_pridtf_no: this.cust_pridtf_no,
                        	cust_mbl_telno: this.cust_mbl_telno,
                        	cust_nm: this.cust_nm,
                        }

                        cv_sessionStorage
                            .setItem('pagingConfig', cv_pagingConfig)
                            .setItem('params', params);

                        cf_ajax("/sell/getcustomer", params, this.getListCB);
                    },
                    getListCB: function (data) {
                        //console.log(data);
                        this.dataList = data.list;
                        cv_pagingConfig.renderPagenation("system");
                    },
                    
                    sortList: function (obj) {
                        cf_setSortConf(obj, "cust_nm");
                        this.getCustInfoList();
                    },
                    sortListAll: function (obj) {
                        cf_setSortConf(obj, "cust_nm");
                        this.getCustInfoListAll();
                    },
                    all_check: function (obj) {
                        $('[name=is_check]').prop('checked', obj.checked);
                    },
                    onCheck: function () {
                        $("#allCheck").prop('checked',
                            $("[name=is_check]:checked").length === $("[name=is_check]").length
                        );
                    },
                    
                   
                    
                },
            });   
        </script>

        </html>