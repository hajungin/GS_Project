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
	<title>설계이력조회</title>
	
<style>
.header {
    background-color: #A7EEFF;
    color: #333;
    padding: 12px 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    font-size: 1.5em;
    text-transform: uppercase;
    letter-spacing: 2px;
    margin: 20px 0;
    transition: background-color 0.3s ease;
    cursor: pointer;
}

.header:hover {
   	background-color: #66CCFF;
}
</style>
</head>
<body class="page-body">

<div class="page-container">

	 <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false" />

	<div class="main-content">

		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
		
		<ol class="breadcrumb bc-3">
			<li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
			<li class="active"><strong>판매관리</strong></li>
			<li class="active"><strong>설계이력조회</strong></li>
		</ol>
	
		<h2 class="header" onclick="location.reload();">설계이력조회</h2>
		<br/>
		
		<div class="dataTables_wrapper" id="vueapp">
		<template>
			<div class="dataTables_filter" style="float: none;">
				
				<table style="width: 100%;">
					<tr>
						<td class="left">
							<label class="sys_label_01 control-label">고객명:</label>
							<div class="sys_col_02" style="width: 246px;">
								<input class="form-control" v-model="cust_nm" value="" />
							</div>
							
							<label class="sys_label_01 control-label">관리담당자:</label>
							<div class="sys_col_02" style="width: 246px;">
								<input class="form-control" v-model="emp_nm" value="" />
							</div>
						</td>
						<td class="right" style="width: 200px;">
							<button type="button" class="btn btn-primary btn-icon" @click="getListCond(true)">
								조건검색
								<i class="entypo-search"></i>
							</button>
						</td>
					</tr>
					<tr>
						<td class="left">
							
							<label class="sys_label_01 control-label">제안일자</label>
							<div class="sys_col_02" style="width: 210px;">
								<div class="input-group">
									<input type="text" class="form-control datepicker2" v-model="wrt_dt" data-format="yyyy-mm-dd" style="width: 180px;">
								</div>
							</div>
							<button type="button" class="btn btn-primary btn-sm datepicker2" id="wrdtbtn" style="float: left;">
								<i class="fa fa-calendar"></i>
							</button>
							<label class="sys_label_01 control-label">상품명:</label>
							<div class="sys_col_02" style="width: 246px;">
								<input class="form-control" v-model="prod_nm" value="" />
							</div>
						</td>
						<td class="right" style="width: 200px;">
							<button type="button" class="btn btn-primary btn-icon" @click="getListAll(true)">
								전체검색
								<i class="entypo-search"></i>
							</button>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="dataTables_filter" style="float: none;">
			<div class="sub flex flex-90">
                <span class="sub-button flex-center flex-10 flex-wrap">
<!--                     <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" @click="popupPrint()"> -->
<!-- 						인쇄 -->
<!-- 						<i class="entypo-print"></i> -->
<!-- 					</button> -->
					<button type="button" class="btn btn-success btn-icon icon-right btn-small" @click="cf_movePage('/cal/dtlCom')">
						등록
						<i class="entypo-plus"></i>
					</button>
                </span>
            </div>
            </div>
            
            
			<table class="table table-bordered datatable dataTable" id="grid_app">
				<thead>
					<tr class="replace-inputs">
						<th style="width: 5%;" class="center hidden-xs nosort"><input type="checkbox" id="allCheck" @click="all_check(event.target)"></th>
						<th style="width: 10%;" class="center sorting" @click="sortList(event.target)" sort_target="cust_nm">성명</th>
						<th style="width: 10%;" class="center sorting" @click="sortList(event.target)" sort_target="wrt_dt">제안일자</th>
						<th style="width: 15%;" class="center sorting" @click="sortList(event.target)" sort_target="cust_eml_addr">이메일ID</th>
						<th style="width: 10%;" class="center sorting" @click="sortList(event.target)" sort_target="prod_type">상품유형</th>						
						<th style="width: 25%;" class="center sorting" @click="sortList(event.target)" sort_target="prod_nm">상품명</th>			
						<th style="width: 15%;" class="center sorting" @click="sortList(event.target)" sort_target="suggest_amt">제안금액</th>	
						<th style="width: 10%;" class="center" @click="sortList(event.target)" sort_target="emp_nm">관리담당자</th>							
					</tr>
				</thead>
				<tbody>
					<tr v-for="item in dataList" style="cursor: pointer;">
						<td class="center">
							<input type="checkbox" :data-idx="item.prod_no" name="is_check" @click="onCheck">
						</td>
						<td class="left" @click="gotoDtl(item)">{{item.cust_nm}}</td>
						<td class="center" @click="gotoDtl(item)">{{item.wrt_dt}}</td>
						<td class="left" @click="gotoDtl(item)">{{item.cust_eml_addr}}</td>
						<td class="center" @click="gotoDtl(item)">{{item.prod_type}}</td>
						<td class="left" @click="gotoDtl(item)">{{getProdNm(item)}}</td>
						<td class="right" @click="gotoDtl(item)" style="text-align: right;">{{item.suggest_amt}}</td>
						<td class="left" @click="gotoDtl(item)">{{item.emp_nm}}</td>
					</tr>
				</tbody>
			</table>
			<div class="dataTables_paginate paging_simple_numbers" id="div_paginate">
			</div>
		</template>
		</div>
		
		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false"/>
		
	</div>
</div>

</body>
<script>

function setDatePicker() {
	setTimeout(
			function(){
				if($("#wrdtbtn").length == 1){
					var $this = $(".datepicker2"),
					opts = {
						format: attrDefault($this, 'format', 'mm/dd/yyyy'),
						daysOfWeekDisabled: attrDefault($this, 'disabledDays', ''),
						startView: attrDefault($this, 'startView', 0),
						rtl: rtl(),
						todayBtn: true,
						language : 'ko',
						autoclose : true,
						todayHighlight : true,
					},
					$n = $this.next(),
					$p = $this.prev();
					$this.datepicker(opts).on("changeDate",function(e){
						var objID = e.currentTarget.id;
						if(objID == 'wrdtbtn'){	//시작일시
							vueapp.wrt_dt = e.date.format('yyyy-MM-dd')
						}
					});
				} 
			},
			300
		);
}
setDatePicker();

var todaystr = "${today}";							
var today = todaystr.toDate();	

var vueapp = new Vue({
	el : "#vueapp",
	data : {
		dataList : [],
		prod_nm : "",
		loan_prod_nm : "",
		ac_prod_nm : "",
		dp_prod_nm : "",
		cust_nm  : "",
		emp_nm : "",
		wrt_dt : "",
		init_yn : "",
		all_srch : "N",
	},
	mounted : function(){
		var fromDtl = cf_getUrlParam("fromDtl");
		var pagingConfig = cv_sessionStorage.getItem("pagingConfig");		
		if("Y" === fromDtl && !cf_isEmpty(pagingConfig)){
			cv_pagingConfig.pageNo = pagingConfig.pageNo;
			cv_pagingConfig.orders = pagingConfig.orders;
	 		
			this.getList();
		} else {
			cv_sessionStorage
				.removeItem("pagingConfig")
				.removeItem("params");
			this.getList(true);
		}
	},
	methods : {
		getListAll : function(isInit){
			this.all_srch = "Y";
			this.getList(isInit);
		},
		getListCond : function(isInit){
			this.all_srch = "N";
			this.getList(isInit);
		},
		getList : function(isInit){

			cv_pagingConfig.func = this.getList;
			
			if(isInit === true){
				cv_pagingConfig.pageNo = 1;
			}
			
			var params = {};
			if(this.all_srch != "Y") {
				params = {
					cust_nm : this.cust_nm,
					emp_nm : this.emp_nm,
					wrt_dt : this.wrt_dt,
					prod_nm : this.prod_nm,
				}
			}
			
			cv_sessionStorage
				.setItem('pagingConfig', cv_pagingConfig)
				.setItem('params', params);

			cf_ajax("/cal/getListPaging", params, this.getListCB);
		},
		getListCB : function(data){
 			this.dataList = data.list;
			for(var i=0; i<this.dataList.length; i++){
				this.dataList[i].suggest_amt = this.dataList[i].suggest_amt.numformat();
			}
			
			cv_pagingConfig.renderPagenation("system");
		},
		 getProdNm(item) {
		      return item.prod_nm || item.loan_prod_nm || item.dp_prod_nm || item.ac_prod_nm;
		    },
		gotoDtl : function(item){
			var params = {
					plan_no : cf_defaultIfEmpty(item.plan_no, ""),
					cust_sn : cf_defaultIfEmpty(item.cust_sn, ""),
					prod_type : cf_defaultIfEmpty(item.prod_type, ""),
				}
			if(params.prod_type == "적금"){
				params.prod_type = "PT01"
			} else if(params.prod_type == "예금"){
				params.prod_type = "PT02"
			}else if(params.prod_type == "대출"){
				params.prod_type = "PT03"
			}else if(params.prod_type == "목돈마련"){
				params.prod_type = "PT04"
			}
			cf_movePage("/cal/dtlCom", params);
		},
		sortList : function(obj){
			cf_setSortConf(obj, "prod_nm");
			this.getList();
		},
		all_check : function(obj){
			$('[name=is_check]').prop('checked',obj.checked);
		},
		onCheck : function(){
			$("#allCheck").prop('checked',
					$("[name=is_check]:checked").length === $("[name=is_check]").length
			);
		},
		popupPrint : function(prod_no){
			var chkedList = $("[name=is_check]:checked");			 
			if(chkedList.length == 0){
				alert("출력할 대상을 선택하여 주십시오.");
				return;
			}
			//check list 가져오기..
			var dateCopyList = [];
			var idx;
			chkedList.each(function(i) {
				idx = $(this).attr("data-idx");
				dateCopyList.push(vueapp.dataList.getElementFirst("prod_no", idx));
			});			
			
			console.log(dateCopyList);		
			
			//출력팝업 띄우기
			popup_print.init(dateCopyList);
			$('#popup_print').modal('show');
		},
	},
})
</script>
</html>