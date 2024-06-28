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
			<link rel="stylesheet" href="/static_resources/system/team2/team2_css/team2.css">            
            <title>관리자시스템</title>
        </head>

        <body class="page-body">
    <div class="page-container">
        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false" />

        <div class="main-content">
            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false" />

            <ol class="breadcrumb bc-3">
                <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
                <li class="active"><strong>가입관리</strong></li>
            </ol>

            <h2 class="header" onclick="location.reload();">판매관리 > 가입현황</h2>
            <br/>

            <div class="flex-column flex-gap-10 dataTables_wrapper" id="vueapp">
            <template>
    <div class="flex flex-100" style="border: 2px solid #00CDFF;">
    <div class="flex-wrap flex-100 flex flex-gap-10 flex-padding-10" style="border: none;">
    	<div class="form-group flex-20">
            <label class="fix-width-30">상품명 :</label>
            <input class="form-control" v-model="prod_nm" value="">
        </div>
        <div class="form-group flex-20">
            <label class="fix-width-30">고객명 :</label>
            <input class="form-control" v-model="cust_nm" value="">
        </div>
        <div class="form-group flex-20">
            <label class="fix-width-30">생년월일 :</label>
            <input type="date" class="form-control" v-model="cust_birth">
        </div>
        <div class="form-group flex-20">
            <label class="fix-width-30">전화번호 :</label>
            <input type="text" class="form-control" v-model="cust_mbl_telno">
        </div>
        </div>
        <div class="flex-wrap flex-10 flex flex-gap-10 flex-padding-10" style="border: none;">
        <div class="form-group flex-10" style="width: 30%;">
            <button type="button" id="Button" class="btn btn-primary btn-icon" @click="getCustInfoList(true)">
                검색
                <i class="entypo-search"></i>
            </button>
            </div>
        </div>
    </div>
    <div class="flex flex-100 flex-padding-10 flex-gap-10" 
						style="justify-content: flex-end; border: 2px solid #00CDFF;">
						<button type="button" id="Button"class="btn btn-success btn-icon icon-right btn-small"
							@click="moveCalc()">
						 	등록 <i class="entypo-book"></i>
						
					</div>

    <table class="table table-bordered dataTable" style="border: 2px solid #00CDFF;" id="grid_app">
        <thead>
            <tr class="replace-inputs">
                <th style="width: 10%; background-color: #B9FFFF;" class="center">상품명</th>
                <th style="width: 10%; background-color: #B9FFFF;" class="center">상품유형</th>
                <th style="width: 10%; background-color: #B9FFFF;" class="center">고객이름</th>
                <th style="width: 10%; background-color: #B9FFFF;" class="center">생년월일</th>
                <th style="width: 10%; background-color: #B9FFFF;" class="center">핸드폰번호</th>
                <th style="width: 10%; background-color: #B9FFFF;" class="center">담당자</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="item in dataList"style="cursor: pointer;">
               
                <td class="center">{{getProdNm(item)}}</td>
                <td class="center">{{getProdTp(item)}}</td>
                <td class="center">{{ item.cust_nm}}</td>
                <td class="center">{{ item.cust_birth}}</td>
                <td class="center">{{ item.cust_mbl_telno}}</td>
                <td class="center">{{ item.emp_nm}}</td>
            </tr>
        </tbody>
    </table>
    <div style="position: relative; width: 1600px;">
					    <div class="dataTables_paginate paging_simple_numbers" id="div_paginate" style="position: absolute; right: 0; top: -90%;"></div>
					</div>
</div>


            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false" />
        </template>
        </div>
    </div>
</body>

        <script>
            var vueapp = new Vue({
                el: "#vueapp",
                data: {
                    dataList: [],
                    cust_birth:"",
                    cust_nm: "",
                    cust_mbl_telno:"",
                    prod_nm: "",
                    simpl_ty_cd : "1"
                },
                mounted: function () {
                    var fromDtl = cf_getUrlParam("fromDtl");
                    var pagingConfig = cv_sessionStorage.getItem("pagingConfig");
                    if ("Y" === fromDtl && !cf_isEmpty(pagingConfig)) {
                        cv_pagingConfig.pageNo = pagingConfig.pageNo;
                        cv_pagingConfig.orders = pagingConfig.orders;

                        var params = cv_sessionStorage.getItem("params");
                        this.cust_birth = params.cust_birth;
                        this.cust_mbl_telno = params.cust_mbl_telno;
                        this.cust_nm = params.cust_nm;
                        this.prod_nm = params.prod_nm;
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
                        	cust_birth: this.cust_birth,
                            cust_mbl_telno: this.cust_mbl_telno,
                            cust_nm: this.cust_nm,
                            prod_nm: this.prod_nm,
                        }

                        cv_sessionStorage
                            .setItem('pagingConfig', cv_pagingConfig)
                            .setItem('params', params);

                        cf_ajax("/sell/joinList", params, this.getListCB);
                    },
                    getListCB: function (data) {
                        console.log(data);
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
                    getProdNm(item) {
                        return item.sa_prod_nm || item.loan_prod_nm || item.dp_prod_nm || item.ac_prod_nm;
                      },
                      getProdTp(item) {
                    	  if(item.sa_prod_type == "PT01"){
                    		  item.sa_prod_type = "적금";
                    	  }else if(item.dp_prod_type == "PT02"){
                    			  item.dp_prod_type = "예금";
                    	  }else if(item.loan_prod_type == "PT03"){
                    			  item.loan_prod_type = "대출";
                    	  }else if(item.ac_prod_type == "PT04"){
                			  item.ac_prod_type = "목돈마련";
                	  }
                          return item.sa_prod_type || item.loan_prod_type || item.dp_prod_type || item.ac_prod_type;
                       },
                       moveCalc : function(){
                    	  var params = {
                    			   simpl_ty_cd : this.simpl_ty_cd
                			}
                    	   cf_movePage("/cal/dtlCom", params);
                       },
                },
            });   
        </script>

        </html>