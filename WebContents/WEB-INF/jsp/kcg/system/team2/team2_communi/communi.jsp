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
            <title>상담 내역 조회</title>
        </head>

        <body class="page-body">

            <div class="page-container">

                <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false" />

                <div class="main-content">

                    <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false" />

                    <ol class="breadcrumb bc-3">
                        <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
                        <li class="active"><strong>고객관리</strong></li>
                        <li class="active"><strong>상담 내역 조회</strong></li>
                    </ol>

                    <h2 class="header" onclick="location.reload();">상담 내역</h2>
                    <br />

                    <div class="flex-column flex-gap-10 dataTables_wrapper" id="vueapp">
                        <template>
                            <div class="flex flex-100">
                                <div class="flex-wrap flex-100 flex flex-gap-10 flex-padding-10" style="border: 2px solid #00CDFF;">
                                    <div class="form-group flex-20">
                                        <label class="fix-width-33">상담일시:</label>
                                        <input type="date" class="form-control" v-model="cnslt_dt">
                                    </div>
                                    <div class="form-group flex-20">
                                        <label class="fix-width-33">고객명:</label>
                                        <input type="text" class="form-control" v-model="cust_nm">
                                    </div>
                                    <div class="form-group flex-20">
                                        <label class="fix-width-33">상담내용:</label>
                                        <input type="text" class="form-control" v-model="cnslt_cn">
                                    </div>
                                    <div class="form-group flex-20">
                                        <label class="fix-width-33">상담자:</label>
                                        <input type="text" class="form-control" v-model="emp_nm">
                                    </div>
                               		<button type="button" class="btn btn-primary btn-icon" style="height: 23px;"
                                        v-model="cust_nm" @click="getCommuniList">
                                        검색
                                        <i class="entypo-search"></i>
                                   	</button>
                                </div>
                            </div>
                            <div class="flex flex-100 flex-padding-10 flex-gap-10"
                                style="justify-content:flex-end; border: 2px solid #00CDFF;">
                                <button type="button" class="btn btn-danger btn-icon btn-small"
                                    style="margin-left: 5px;" @click="cnsltDelete">
                                    삭제
                                    <i class="entypo-trash"></i>
                                </button>
                            </div>
                            <table class="table table-bordered datatable dataTable" id="grid_app"
                                style="border: 2px solid #00CDFF;">
                                <thead>
                                    <tr class="replace-inputs">
                                        <th style="width: 5%; background-color: #B9FFFF;" class="center"><input type="checkbox" id="allCheck"
                                                @click="all_check(event.target)" style="cursor: pointer;"></th>
                                        <th style="width: 10%; background-color: #B9FFFF;" class="center">상담일자</th>
                                        <th style="width: 5%; background-color: #B9FFFF;" class="center">고객명</th>
                                        <th style="width: 30%; background-color: #B9FFFF;" class="center">상담내용</th>
                                        <th style="width: 5%; background-color: #B9FFFF;" class="center">상담자</th>
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
<!--                                         <input type="hidden" v-model="item.cnslt_no"> -->
                                    </tr>
                                </tbody>
                            </table>
                            <div style="position: relative; width: 100%">
					    		<div class="dataTables_paginate paging_simple_numbers" id="div_paginate" style="position: absolute; right: 0; top: -90%;"></div>
							</div>
                        </template>
                    </div>
<!-- 상담내역 detail 팝업                 -->
 <div class="modal fade" id="pop_cnslt_dtl">
    <template>
        <div class="modal-dialog modal-md"> 
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="btn_popClose">&times;</button>
                    <h4 class="modal-title" id="cnslt_nm">상담내역</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="row">
                                <div class="form-group">
                                    <label for="cust_nm" class="col-sm-4 control-label">상담일</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cnslt_dt" v-model="dtl.cnslt_dt" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_pridtf_no" class="col-sm-4 control-label">고객명</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cust_nm" v-model="dtl.cust_nm" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_pridtf_no" class="col-sm-4 control-label">상담자</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="emp_nm" v-model="dtl.emp_nm" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cnslt_cn" class="col-sm-4 control-label">상담내역</label>
                                    <div class="col-sm-8">
                                        <textarea id="cnslt_cn"  v-model="dtl.cnslt_cn" class="form-control" style="width: 100%; height: 300px; margin-left: 10px; resize: none;" readonly></textarea>
                                    </div>
                                </div>

                            </div>
<!--                             상담 내역 추가 기능 구현 전 -->
<!--                             <div class="col-sm-6"> -->
                                
<!--                                 <div class="form-group"> -->
<!--                                     <label for="cnslt_cn" class="col-sm-4 control-label">상담추가입력</label> -->
<!--                                     <div class="col-sm-8"> -->
<!--                                         <textarea id="cnslt_cn" class="form-control" v-model="dtl.cnslt_cn_add" style="width: 100%; height: 150px; resize: none;"></textarea> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

                    </form>
                </div>
<!--                 <div class="modal-footer"> -->
<!-- 					<button type="button" class="btn btn-blue btn-icon btn-small" @click=""> -->
<!-- 					상담내용저장 -->
<!-- 					<i class="entypo-check"></i> -->
<!-- 					</button> -->
<!-- <!--                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> --> -->
<!--                 </div> -->
            </div>
        </div>
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
           cnslt_no: "",
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
   
               this.getCommuniList();
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
                   cv_pagingConfig.orders = [{ target: "cnslt_dt", isAsc: false }];
               }
   
               var params = {
         		   cnslt_no: this.cnslt_no,
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
           gotoDtl: function (cnslt_cn) {
               console.log(cnslt_cn);
               pop_cnslt_dtl.getCnsltDtl(cnslt_cn);
               $('#pop_cnslt_dtl').modal('show');
           },
           all_check: function (obj) {
                $('[name=is_check]').prop('checked', obj.checked);
            },
            onCheck: function () {
                $("#allCheck").prop('checked',
                    $("[name=is_check]:checked").length === $("[name=is_check]").length
                );
            },
           cnsltDelete : function(){
              var checkedList = $("[name=is_check]:checked");
                if (checkedList.length == 0) {
                    alert("삭제항목을 선택하세요.");
                    return;
                }
                var dataCopyList = [];
                var idx;
                checkedList.each(function (i) {
                    idx = $(this).attr("data-idx");
                    var map = {
                       cnslt_no: idx
                    };
                    dataCopyList.push(map);
                });
                console.log(dataCopyList);
                var params = {
                   dataCopyList: dataCopyList
                }
            cf_ajax("/communi/cnsltDelete", params, this.cnsltDeleteCB);
            },
            cnsltDeleteCB : function(data){
	            if (data.status == "OK") {
	                    alert("삭제가 완료되었습니다.");
	              this.getCommuniList(true);
	             }
         	}
         }
    });
   
   var pop_cnslt_dtl = new Vue({
       el: "#pop_cnslt_dtl",
       data: {
           dtl: {
        	   dataList: [],
               cnslt_no: "",
               cnslt_cn: "",
               cnslt_cn_add: "",
           }
       },
       methods: {
    	   getCnsltDtl: function (cnslt_no) {
               var params = {
            		cnslt_no: cnslt_no
               }
               cf_ajax("/communi/getCnsltDtl", params, this.getDtlCB);
           },
           getDtlCB: function (data) {
               this.dtl = data;
           },
       }
   });
</script>
</html>