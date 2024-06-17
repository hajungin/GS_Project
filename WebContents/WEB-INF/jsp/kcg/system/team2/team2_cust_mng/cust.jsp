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
                        <div class="flex-wrap flex-66 flex flex-gap-10 flex-padding-10">
                            <div class="form-group flex-40">
                                <label class="fix-width-33">고객명 :</label>
                                <input class="form-control" v-model="cust_nm" value="">
                            </div>
                               	<div class="form-group flex-40">
                                <label class="fix-width-33">생년월일</label>
                                <input type="text" class="form-control" v-model="cust_pridtf_no">
                            </div>
                            <div class="form-group flex-40">
                                <label class="fix-width-33">관리담당자:</label>
                                <input class="form-control" v-model="emp_nm" value="">
                            </div>
           				        <div class="form-group flex-40">
                                <label class="fix-width-33">이벤트구분:</label>
                                <input class="form-control" value="">
                            </div>

                        </div>

                        <div class="flex-wrap flex-33 flex flex-center flex-gap-10 flex-padding-10">
                            <div class="form-group" style="width:45%;">
                                <button type="button" class="btn btn-blue btn-icon icon-left form-control "
                                    v-model="search_val" @click="getCustInfoList(true)">
                                    검색
                                    <i class="entypo-search"></i>
                                </button>
                            </div>
<!--                             <div class="form-group" style="width:45%;"> -->
<!--                                 <button type="button" class="btn btn-blue btn-icon icon-left form-control" -->
<!--                                     v-model="search_val" @click="getCustInfoListAll(true)"> -->
<!--                                     전체검색 -->
<!--                                     <i class="entypo-search"></i> -->
<!--                                 </button> -->
<!--                             </div> -->
                        </div>
                    </div>
<!--                     <div class="flex flex-100 flex-padding-10 flex-gap-10" -->
<!--                         style="justify-content:flex-end;border: 1px solid #999999;"> -->
<!--                         <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" -->
<!--                             @click="popCustmnglistPrint"> -->
<!--                             관리대장출력 -->
<!--                             <i class="entypo-archive"></i> -->
<!--                         </button> -->
<!--                         <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" -->
<!--                             @click="popCustmngCardPrint"> -->
<!--                             관리카드출력 -->
<!--                             <i class="entypo-vcard"></i> -->
<!--                         </button> -->
<!--                         <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" -->
<!--                             @click="popDamdangSet"> -->
<!--                             담당자설정 -->
<!--                             <i class="entypo-user"></i> -->
<!--                         </button> -->
<!--                         <button type="button" class="btn btn-orange btn-icon icon-left" -->
<!--                             style="margin-left: 5px;" @click="custInfoMng"> -->
<!--                             고객관리 -->
<!--                             <i class="entypo-users"></i> -->
<!--                         </button> -->
<!--                         <button type="button" class="btn btn-orange btn-icon icon-left" -->
<!--                             style="margin-left: 5px;" @click="picInfoMng"> -->
<!--                             담당자관리 -->
<!--                             <i class="entypo-clipboard"></i> -->
<!--                         </button> -->
<!--                     </div> -->
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
                            <tr v-for="item in dataList"
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
		</div>
	</div>
	   <jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false" />
</body>

    <script type="text/javascript">
    var vueapp = new Vue({
        el: "#vueapp",
        data: {
            dataList: [],
            search_nm: "",
//             cust_sn: "",
            cust_nm: "",
//     		cust_eml_addr: "",
//     		cust_home_telno: "",
//     		cust_mbl_telno: "",
    		cust_pridtf_no: "",
//     		cust_road_nm_addr: "",
    		emp_nm: "",
//     		comm_nm: "",
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
//                 this.cust_sn = params.cust_sn;
                this.cust_nm = params.cust_nm;
//                 this.cust_eml_addr = params.cust_eml_addr;
//                 this.cust_home_telno = params.cust_home_telno;
//                 this.cust_mbl_telno = params.cust_mbl_telno;
                this.cust_pridtf_no = params.cust_pridtf_no;
//                 this.cust_road_nm_addr = params.cust_road_nm_addr;
                this.emp_nm = params.emp_nm;
//                 this.comm_nm = params.comm_nm;
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
//                     cust_sn: this.cust_sn,
                    cust_nm: this.cust_nm,
//                     cust_eml_addr: this.cust_eml_addr,
//                     cust_home_telno: this.cust_home_telno,
//                     cust_mbl_telno: this.cust_mbl_telno,
                    cust_pridtf_no: this.cust_pridtf_no,
//                     cust_road_nm_addr: this.cust_road_nm_addr
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
        }
    });
    </script>
</body>
</html>