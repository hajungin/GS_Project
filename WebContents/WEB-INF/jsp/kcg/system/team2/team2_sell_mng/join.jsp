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
                <li class="active"><strong>가입관리</strong></li>
            </ol>

            <h2>판매관리 > 가입관리</h2>
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
                            <input type="text" class="form-control" v-model="cust_pridtf_no">
                        </div>
                        <div class="form-group flex-30">
                            <label class="fix-width-30">전화번호 :</label>
                            <input type="text" class="form-control" v-model="cust_mbl_telno">
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
                                <th style="width: 10%;" class="center">생년월일</th>
                                <th style="width: 10%;" class="center">핸드폰번호</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="item in dataList" @dblclick="gotoDtl(item.cust_mbl_telno)" style="cursor: pointer;">
                                <td class="center"><input type="radio" :data-idx="item.cust_nm" name="is_check" @click.stop="onCheck" style="cursor: pointer;"></td>
                                <td class="center">{{ item.cust_nm }}</td>
                                <td class="center">{{ item.cust_pridtf_no.substring(0, 6) }}</td>
                                <td class="center">{{ item.cust_mbl_telno }}</td>
                            </tr>
                </table>
                    <div class="dataTables_paginate paging_simple_number" id="div_paginate"></div>
                </div>
                <div class="right">
                    <div class="consulting">
                        <h2>가입등록</h2>
                        <table style="height: 610px;">
                            <tr>
                                <td style="vertical-align: top;">
                                    <br>
                                    
                                </td>
                            </tr>
                        </table>
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