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
            <title>상담내역 페이지</title>
        </head>

        <body class="page-body">

            <div class="page-container">

                <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false" />

                <div class="main-content">

                    <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false" />

                    <ol class="breadcrumb bc-3">
                        <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
                        <li class="active"><strong>상담내역 조회</strong></li>
                    </ol>

                    <h2>상담내역</h2>
                    <br />

                    <div class="flex-column flex-gap-10" id="vueapp">
                        <template>
                            <div class="flex flex-100">
                                <div class="flex-wrap flex-66 flex flex-gap-10 flex-padding-10">
                                    <div class="form-group flex-40">
                                        <label class="fix-width-33">상담일시:</label>
                                        <input type="text" class="form-control" v-model="cnslt_dt">
                                    </div>
                                    <div class="form-group flex-40">
                                        <label class="fix-width-33">고객명:</label>
                                        <input type="text" class="form-control" v-model="cust_nm">
                                    </div>
                                    <div class="form-group flex-40">
                                        <label class="fix-width-33">상담내용:</label>
                                        <input type="text" class="form-control" v-model="cnslt_cn">
                                    </div>
                                    <div class="form-group flex-40">
                                        <label class="fix-width-33">상담자:</label>
                                        <input type="text" class="form-control" v-model="emp_nm">
                                    </div>
                                </div>

                                <div class="flex-wrap flex-33 flex flex-center flex-gap-10 flex-padding-10">
                                    <div class="form-group" style="width:45%;">
                                        <button type="button" class="btn btn-blue btn-icon icon-left form-control "
                                            v-model="cust_nm" @click="getCommuniList">
                                            검색
                                            <i class="entypo-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="flex flex-100 flex-padding-10 flex-gap-10"
                                style="justify-content:flex-end;border: 1px solid #999999;">
                                <button type="button" class="btn btn-orange btn-icon icon-left"
                                    style="margin-left: 5px;" @click="del">
                                    삭제
                                    <i class="entypo-users"></i>
                                </button>
                            </div>
                            <table class="table table-bordered datatable dataTable" id="grid_app"
                                style="border: 1px solid #999999;">
                                <thead>
                                    <tr class="replace-inputs">
                                        <th style="width: 5%;" class="center"><input type="checkbox" id="allCheck"
                                                @click="all_check(event.target)" style="cursor: pointer;"></th>
                                        <th style="width: 10%;" class="center">상담일자</th>
                                        <th style="width: 5%;" class="center">고객명</th>
                                        <th style="width: 30%;" class="center">상담내용</th>
                                        <th style="width: 5%;" class="center">작성자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="item in dataList" @dblclick="gotoDtl(item.cnslt_no)"
                                        style="cursor: pointer;">
                                        <td class="center" @dblclick.stop="return false;"><input type="checkbox"
                                                :data-idx="item.cnslt_no" name="is_check" @click.stop="onCheck"
                                                style="cursor: pointer;">
                                        </td>
                                        <td class="center">{{item.cnslt_dt}}</td>
                                        <td class="center">{{item.cust_nm}}</td>
                                        <td>{{item.cnslt_cn}}</td>
                                        <td class="center">{{item.emp_nm}}</td>
                                        <input type="hidden" v-model="item.cnslt_no">
                                    </tr>
                                </tbody>
                            </table>
                        </template>
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
	        cnslt_dt: "",
	        cust_nm: "",
	        cnslt_cn: "",
	        emp_nm: ""
	    },
	    mounted: function () {
	        var fromDtl = cf_getUrlParam("fromDtl");
	        var pagingConfig = cv_sessionStorage.getItem("pagingConfig");
	        if ("Y" === fromDtl && !cf_isEmpty(pagingConfig)) {
	            cv_pagingConfig.pageNo = pagingConfig.pageNo;
	            cv_pagingConfig.orders = pagingConfig.orders;
	
	            var params = cv_sessionStorage.getItem("params");
	            this.cnslt_dt = params.cnslt_dt;
	            this.cust_nm = params.cust_nm;
	            this.cnslt_cn = params.cnslt_cn;
	            this.emp_nm = params.emp_nm;
	
	            this.getCommuniList(true);
	        } else {
	            cv_sessionStorage
	                .removeItem("pagingConfig")
	                .removeItem("params");
	            this.getCommuniList(true);
	        }
	    },
	    methods: {
	    	getCommuniList: function (isInit) {
	
	            cv_pagingConfig.func = this.getCommuniList;
	            if (isInit === true) {
	                cv_pagingConfig.pageNo = 1;
	                cv_pagingConfig.orders = [{ target: "cust_nm", isAsc: false }];
	            }
	
	            var params = {
	                cnslt_dt: this.cnslt_dt,
	                cust_nm: this.cust_nm,
	                cnslt_cn: this.cnslt_cn,
	                emp_nm: this.emp_nm
	            }
	
	            cv_sessionStorage
	                .setItem('pagingConfig', cv_pagingConfig)
	                .setItem('params', params);
	
	            cf_ajax("/communi/getCommuniList", params, this.getListCB);
	        },
	        getListCB: function (data) {
	            //console.log(data);
	            this.dataList = data.list;
	            cv_pagingConfig.renderPagenation("system");
	        },
// 	        gotoDtl: function (cust_mbl_telno) {
// 	            console.log(cust_mbl_telno);
// 	            pop_cust_info.init(cust_mbl_telno);
// 	            $('#pop_cust_info').modal('show');
// 	        },
	        all_check: function (obj) {
                $('[name=is_check]').prop('checked', obj.checked);
            },
            onCheck: function () {
                $("#allCheck").prop('checked',
                    $("[name=is_check]:checked").length === $("[name=is_check]").length
                );
            },
	        del : function(){
	        	var chkedList = $("[name=is_check]:checked");
                if (chkedList.length == 0) {
                    alert("삭제항목을 선택하세요.");
                    return;
                }
                var dataCopyList = [];
                var idx;
                chkedList.each(function (i) {
                    idx = $(this).attr("data-idx");
                    dataCopyList.push(vueapp.dataList.getElementFirst("cnslt_no", idx));
                });
                var params = {
               		dataCopyList: this.dataCopyList
                }
				cf_ajax("/communi/cnsltDelete", params, this.delCB);
				},
			delCB : function(data){
				if (data.status == "OK") {
                    alert("삭제가 완료되었습니다.");
               	}
			}
   		}
    });
</script>
</html>                