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
	<link rel="stylesheet" href="/static_resources/system/js/datatables/promion.css">
	<!-- Bilboard Chart(https://naver.github.io/billboard.js) -->
	<script src="https://d3js.org/d3.v6.min.js"></script>
	<script src="/static_resources/system/js/datatables/billboard.js"></script>
	<link rel="stylesheet" href="/static_resources/system/js/datatables/billboard.css">
	<title>금융계산기</title>
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
			<li class="active"><strong>금융계산기</strong></li>
		</ol>
	
		<h2 class="header" onclick="location.reload();">금융계산기 (적금 설계)</h2>
		<br/>
		
		<div class="row">
			<div class="dataTables_wrapper flex" id="vueapp">
			<template>
			
				<div class="left flex-column flex-gap-10 flex-40" v-if="info.simpl_ty_cd == '1'">
                    <label>고객정보:</label>
                    <div class="form-group">
                        <label>작성일자:</label>
                        <input class="form-control" v-model="info.wrt_dt" disabled />
                    </div>
                    <div class="form-group">
                        <label>고객코드:</label>
                        <input class="form-control" v-model="custInfo.cust_sn" disabled />
                    </div>
                    <div class="form-group">
                        <label>성명:</label>
                        <input class="form-control" v-model="custInfo.cust_nm" disabled />
                        <button type="button" class="btn" @click="popupCust()">
                             <i class="fa fa-search"></i>
                         </button>
                    </div>
                    <div class="form-group">
                        <label>실명번호:</label>
                        <input class="form-control" v-model="custInfo.cust_pridtf_no" disabled />
                    </div>
                    <div class="form-group">
                        <label>E-mail:</label>
                        <input class="form-control" v-model="custInfo.cust_eml_addr" disabled />
                    </div>
                    <div class="form-group">
                        <label>전화번호:</label>
                        <input class="form-control" v-model="custInfo.cust_home_telno" disabled />
                    </div>
                    <div class="form-group">
                        <label>핸드폰번호:</label>
                        <input class="form-control" v-model="custInfo.cust_mbl_telno" disabled />
                    </div>
                    <div class="form-group">
                        <label>직업:</label>
                        <input class="form-control" v-model="custInfo.cust_cr_no" disabled />
                    </div>
                    <div class="form-group">
                        <label>주소:</label>
                        <input class="form-control" v-model="custInfo.cust_road_nm_addr" disabled />
                    </div>
                    <div class="form-group">
                        <label>관리담당자:</label>
                        <input class="form-control" v-model="custInfo.emp_nm" disabled />
                    </div>
                    <div class="form-group">
                        <label>부서:</label>
                        <input class="form-control" v-model="custInfo.emp_dept" disabled />
                    </div>
                    <div class="form-group">
                        <label>직위:</label>
                        <input class="form-control" v-model="custInfo.emp_posit" disabled />
                    </div>
                    <div class="form-group">
                        <label>연락처:</label>
                        <input class="form-control" v-model="custInfo.emp_mbl_telno" disabled />
                    </div>
                </div>
                
				<div class="right flex-column flex-100">
                    <div class="right-top">
                        <ul class="nav">
                            <li class="nav-tab active" @click="tabChange('PT01')">적금 설계</li>
                            <li class="nav-tab" @click="tabChange('PT02')">예금 설계</li>
                            <li class="nav-tab" @click="tabChange('PT03')">대출 설계</li>
                            <li class="nav-tab" @click="tabChange('PT04')">목돈마련적금 설계</li>
                        </ul>
                        <div class="nav-content flex-column flex-gap-10">
                        	<div class="form-group" style="justify-content: left">
                                <label>설계번호:</label>
                                <input class="form-control" id="plan_no" v-model="info.plan_no" disabled />
                            </div>
                            <div class="form-group" style="justify-content: left">
                                <label>상품선택:</label>
                                <input class="form-control" id="prod_no" v-model="info.prod_no" disabled />
                                <input class="form-control" id="prod_nm" v-model="info.prod_nm" />
                                <button type="button" class="btn" @click="popupProd()">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                            <div class="form-group" style="justify-content: left">
                                <label>납입주기:</label>
                                <select class="form-control" id="pay_cycle" v-model="info.pay_cycle" style="padding-top: 3px;" disabled>
									<option value="PC01">월납</option>
									<option value="PC02">년납</option>
									<option value="PC03">일시납</option>
								</select>
                            </div>
                            <div class="form-group" style="justify-content: left">
                                <label>불입금액 (원):</label>
                                <input class="form-control flex-50" type="text" id="circle_acml_amt" v-model="info.circle_acml_amt" style="width: 700px;"/>
                                <button type="button" class="btn btn-transparent flex-20" @click="setCircleAcmlAmt(10)">+10만원</button>
                                <button type="button" class="btn btn-transparent flex-20" @click="setCircleAcmlAmt(50)">+50만원</button>
                                <button type="button" class="btn btn-transparent flex-20" @click="setCircleAcmlAmt(100)">+100만원</button>
                                <button type="button" class="btn btn-navy flex-20" @click="setCircleAcmlAmt(0)">정정</button>
                            </div>
                            <div class="form-group" style="justify-content: left">
                                <label>목표기간 (개월):</label>
                                <input class="form-control flex-50" type="text" id="goal_prd" v-model="info.goal_prd" style="width: 700px;"/>
                                
                                <button type="button" class="btn btn-transparent flex-20" @click="setGoalPrd(3)">+3개월</button>
                                <button type="button" class="btn btn-transparent flex-20" @click="setGoalPrd(6)">+6개월</button>
                                <button type="button" class="btn btn-transparent flex-20" @click="setGoalPrd(12)">+12개월</button>
                                <button type="button" class="btn btn-navy flex-20" @click="setGoalPrd(0)">정정</button>
                            </div>
                            <div class="form-group" style="justify-content: left">
                                <label>적용금리 (%):</label>
                                <input class="form-control" type="text" id="aply_rate" v-model="info.aply_rate" />
                            </div>
                            <div class="form-group" style="justify-content: left">
                                <label>이자과세:</label>
								<select class="form-control" id="interest_ta" v-model="info.interest_ta" style="padding-top: 3px;" disabled>
									<option value="IT01">일반과세 (15.4%)</option>
									<option value="IT02">세금우대 (9.5%)</option>
									<option value="IT03">비과세</option>
								</select>
                            </div>
                            <div class="form-group" style="justify-content: left">
                                <label>작성일자:</label>
								<input class="form-control" v-model="info.wrt_dt" disabled />
                            </div>
                        </div>
                    </div>
                    
					<div class="dt-buttons" style="padding-top: 15px;">
						<input id="external" type="radio" v-model="info.simpl_ty_cd" value="1" :disabled="info.plan_no!=''&&info.plan_no!=undefined">
						<label class="tab_item" for="external">정상설계</label>
						<input id="internal" type="radio" v-model="info.simpl_ty_cd"  value="0" :disabled="info.plan_no!=''&&info.plan_no!=undefined">
						<label class="tab_item" for="internal">간편설계</label>
					</div>
					<div class="dataTables_filter">
						<button type="button" class="btn btn-red btn-small" @click="prcCalc()">
							이자계산
						</button>
						<button type="button" class="btn btn-orange btn-small" @click="save()">
							설계저장
						</button>
						<button type="button" class="btn btn-orange btn-small" @click="saveSell()">
							상품가입저장
						</button>
						<button type="button" class="btn btn-blue btn-icon btn-small" @click="gotoList()">
							목록 <i class="entypo-list"></i>
						</button>
					</div>
					
                    <ul class="nav">
                        <li class="nav-tab active">계산결과</li>
                    </ul>
                    <div class="right-bottom flex-100">
                        <form class="form flex-column" method="POST" action="#">
	                        <table>
	                        	<tr>
	                        		<td class="center" style="width: 40%; vertical-align: top;">
	                        			<div class="form-wrapper flex flex-wrap flex-gap-10">
			                                <div class="form-group">
			                                    <label>불입금액합계:</label>
			                                    <input class="form-control" id="tot_dpst_amt" v-model="info.tot_dpst_amt" disabled />
			                                </div>
			                                <div class="form-group">
			                                    <label>세전이자:</label>
			                                    <input class="form-control" id="tot_dpst_int" v-model="info.tot_dpst_int_fmt" disabled />
			                                </div>
			                                <div class="form-group">
			                                    <label>세전수령액:</label>
			                                    <input class="form-control" id="bfo_rcve_amt" v-model="info.bfo_rcve_amt_fmt" disabled />
			                                </div>
			                                <div class="form-group">
			                                    <label>이자과세금:</label>
			                                    <input class="form-control" id="int_tax_amt" v-model="info.int_tax_amt_fmt" disabled />
			                                </div>
			                                <div class="form-group">
			                                    <label>세후수령액:</label>
			                                    <input class="form-control" id="atx_rcve_amt" v-model="info.atx_rcve_amt_fmt" disabled />
			                                </div>
			                            </div>	
			                            
			                            <div class="panel-heading">
											<div class="panel-title">계산결과 CHART</div>
										</div>
										<div id="chart" class="bottom-right-bottom flex-100"></div>
	                        		</td>
	                        		<td class="center" style="width: 3%;">
	                        		</td>
	                        		<td class="center" style="width: 57%; vertical-align: top;">
			                            <table class="table table-bordered datatable dataTable" id="grid_app">
											<thead>
												<tr class="replace-inputs">
													<th style="width: 10%;" class="center">회차</th>
													<th style="width: 23%;" class="center">회차불입금액</th>
													<th style="width: 23%;" class="center">누적불입금액</th>
													<th style="width: 21%;" class="center">회차이자</th>
													<th style="width: 23%;" class="center">회차원리금</th>
												</tr>
											</thead>
											<tbody id="grid_tbody">
											</tbody>
										</table>
	                        		</td>
	                        	</tr>
	                        </table>
                        </form>
                    </div>
                </div>
                
                <!-- 프린트 Start -->
                <div border="1"  class="modal fade" id="printArea">
                    <span style="font-size: 30px; font-weight: bold">[ {{custInfo.cust_nm}} ]</span> <span style="font-size: 30px;">고객님!! </span>
                    <span style="color: red; font-size: 30px; font-weight: bold">[ {{info.prod_nm}} ]</span> <span style="font-size: 30px;">가입을 제안 드립니다. </span>
				    <table border="1" style="width: 1100px; height: 700px;">
				       <tr>
				       		<td class="center" style="width: 12%;">
				       			<label>상품설계기준</label>
				       		</td>
							<td class="left" style="width: 35%;">
								<label>상품명:</label>
								{{info.prod_nm}}<br>
								<label>납입주기:</label>
								{{info.pay_cycle}}<br>
								<label>불입금액:</label>
								{{info.circle_acml_amt_fmt}} 원<br>
								<label>불입기간:</label>
								{{info.goal_prd}} 개월<br>
								<label>적용금리:</label>
								{{info.aply_rate}} %<br>
								<label>이자과세:</label>
								{{info.interest_ta}}<br>
							</td>
							<td rowspan="2" style="width: 53%;">
								<div id="printArea_chart"></div>
							</td>
				       </tr>
				       <tr>
				       		<td class="center">
				       			<label>상품설계산출결과</label>
				       		</td>
							<td class="left">
								<label>원금:</label>
								{{info.tot_dpst_amt_fmt}} 원<br>
								<label>이자:</label>
								{{info.tot_dpst_int_fmt}} 원<br>
								<label>총금액:</label>
								{{info.bfo_rcve_amt_fmt}} 원<br>
								<label>세액공제금액:</label>
								{{info.int_tax_amt_fmt}} 원
							</td>
				       </tr>
				    </table>
				</div>
				<!-- 프린트 End -->
				
			</template>
			</div>
		</div>
		
		<br />
		
		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false"/>
		
	</div>
</div>

<!-- 상품팝업 -->
<div class="modal fade" id="pop_prod">
<template>
	<div class="modal-dialog" style="width: 500px;">
		<div class="modal-content">
			<div class="modal-body">
				<div class="dataTables_wrapper">					
					<div class="dt-buttons">
						<div>
							<label>코드:</label>
							<input type="search" id="pop_prod_no" style="width: 80px;" v-model="pop_prod_no">
							<label>코드명:</label>
							<input type="search" id="pop_prod_nm" style="width: 200px;" v-model="pop_prod_nm">
							<button type="button" class="btn btn-red" style="margin-left: 5px;" @click="getList">
								검색
							</button>
						</div>
					</div>
				</div>
				<div style="height: 400px;overflow: auto;" class="dataTables_wrapper">		
					<table class="table table-bordered datatable dataTable">
						<thead style="position: sticky;top: 0px;">
							<tr>
								<th class="center" style="width: 25%;">상품코드</th>
								<th class="center" style="width: 50%;">상품명</th>
								<th class="center" style="width: 25%;">가입대상</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="item in dataList" @click="selProd(item.prod_no)" style="cursor: pointer;">
								<td class="center">{{item.prod_no}}</td>
								<td class="left">{{item.prod_nm}}</td>
								<td class="left">{{item.sub_tg}}</td>
							</tr>
						</tbody>
					</table>	
				</div>				
			</div>
		</div>
	</div>
</template>
</div>
                            
<!-- 고객팝업 -->
<div class="modal fade" id="pop_cust">
<template>
	<div class="modal-dialog" style="width: 500px;">
		<div class="modal-content">
			<div class="modal-body">
				<div class="dataTables_wrapper">					
					<div class="dt-buttons">
						<div>
							<label>고객명:</label>
							<input type="search" id="pop_cust_nm" style="width: 250px;" v-model="pop_cust_nm">
							<button type="button" class="btn btn-red" style="margin-left: 5px;" @click="getList">
								검색
							</button>
						</div>
					</div>
				</div>
				<div style="height: 400px;overflow: auto;" class="dataTables_wrapper">		
					<table class="table table-bordered datatable dataTable">
						<thead style="position: sticky;top: 0px;">
							<tr>
								<th class="center" style="width: 25%;">고객명</th>
								<th class="center" style="width: 20%;">생년월일</th>
								<th class="center" style="width: 30%;">핸드폰번호</th>
								<th class="center" style="width: 25%;">담당자</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="item in dataList" @click="selCust(item)" style="cursor: pointer;">
								<td class="center">{{item.cust_nm}}</td>
								<td class="center">{{item.cust_pridtf_no}}</td>
								<td class="center">{{item.cust_mbl_telno}}</td>
								<td class="center">{{item.emp_nm}}</td>
							</tr>
						</tbody>
					</table>
					<div class="dataTables_paginate paging_simple_numbers" id="div_paginate">
					</div>  
				</div>				
			</div>
		</div>
	</div>
</template>
</div>

</body>
<script>
var vueapp = new Vue({
	el : "#vueapp",
	data : {
		info : {
			plan_no : "${plan_no}", //설계번호
			cust_sn : "${cust_sn}", //고객번호
			prod_type : "${prod_type}", //상품타입
			simpl_ty_cd : "0", //간편,정상설계 구분
			wrt_dt : "", //작성일자
			int_cty_cd : "", //
			cust_pridtf_no : "",
			prod_no : "", //상품코드
			prod_nm : "", //상품명
			goal_prd : "", //목표기간
			circle_acml_amt : "", //불입금액
			tot_dpst_amt : "", //불입금액 합계
			tot_dpst_int : "", //세전이자
			int_tax_amt : "", //이자과세금
			bfo_rcve_amt : "", //세전수령액
			atx_rcve_amt : "", //세후 수령액
			pay_period : 0,
			price_min : 0,
			price_max : 0,
			air_min : 0,
			air_max : 0,
			pay_cycle : "",
			emp_no : "",
			
			
			
			circle_acml_amt_fmt : "", //
			tot_dpst_amt_fmt : "", //
			tot_dpst_int_fmt : "", //
			int_tax_amt_fmt : "",
			bfo_rcve_amt_fmt : "",
			atx_rcve_amt_fmt : "",
			circle_acml_amt_fmt : "",
			circle_acml_amt_fmt : "",
		},
		custInfo : {
			cust_sn : "",
			cust_mbl_telno : "",
			cust_nm : "",
			cust_pridtf_no : "",
			cust_eml_addr : "",
			cust_home_telno : "",
			cust_cr_no : "",
			cust_road_nm_addr : "",
			emp_no : "",
			emp_nm : "",
			emp_dept : "",
			emp_posit : "",
			emp_mbl_telno : "",
			tsk_dtl_cn : "",
		},
	},
	mounted : function(){
		
		if(!cf_isEmpty(this.info.cust_sn)){
			this.getCustInfo();
		}
		if(!cf_isEmpty(this.info.plan_no)){
			this.getDsgInfo();
		}
	},
	methods : {
		tabChange : function(index) {
			
			if(this.info.plan_no != "" && this.info.plan_no != undefined) {
				alert("신규일 경우만 TAB 이동이 가능합니다.");
				return;
			}
			
			var params = {
				cust_sn : cf_defaultIfEmpty(this.info.cust_sn, ""),
				prod_type : index,
			}
			cf_movePage("/cal/dtlCom", params);
			
		},
		getDsgInfo : function(){
			cf_ajax("/cal/getDsgInfos", this.info, this.getDsgInfoCB);
		},
		getDsgInfoCB : function(data){
			this.info = data;
			this.info.simpl_ty_cd = "1";
			
			this.prcCalc();
		},
		save : function(){
			
			if(this.info.simpl_ty_cd != "1"){
				alert("정상설계만 저장할 수 있습니다.");
				return;
			}else if(cf_isEmpty(this.info.atx_rcve_amt) || this.info.atx_rcve_amt == 0){
				alert("이자계산 후 저장할 수 있습니다.");
				return;
			}else if(cf_isEmpty(this.custInfo.cust_nm)){
				alert("고객정보를 선택하세요.");
				return;
			}
			
			if(!confirm("저장하시겠습니까?")) return;
			
			this.info.cust_sn = this.custInfo.cust_sn;
			this.info.int_cty_cd = "1";
			
			cf_ajax("/cal/savePlan", this.info, this.saveCB);
		},
		saveCB : function(data){
			alert("저장되었습니다.");
			cf_movePage('/cal/listPlan');
		},
		saveSell : function(){
			if(this.info.simpl_ty_cd != "1"){
				alert("정상설계만 저장할 수 있습니다.");
				return;
			}else if(cf_isEmpty(this.info.atx_rcve_amt) || this.info.atx_rcve_amt == 0){
				alert("이자계산 후 저장할 수 있습니다.");
				return;
			}else if(cf_isEmpty(this.custInfo.cust_nm)){
				alert("고객정보를 선택하세요.");
				return;
			}
			
			if(!confirm("저장하시겠습니까?")) return;
			
			this.info.cust_sn = this.custInfo.cust_sn;
			this.info.emp_no = this.custInfo.emp_no;
			this.info.int_cty_cd = "1";
			
			cf_ajax("/cal/saveSell", this.info, this.saveSellCB);
		},
		saveSellCB : function(data){
			alert("저장되었습니다.");
			cf_movePage('/sell/init');
		},
		getProdInfo : function(){
			
			cf_ajax("/cal/getProdInfo", this.info, this.getProdInfoCB);
		},
		getProdInfoCB : function(data){
			this.info = data;
			this.info.wrt_dt = getToday();
		},
		getCustInfo : function(){
			var params = {
				cust_sn : this.info.cust_sn,
			}
			cf_ajax("/cal/getCustCard", params, this.getCustInfoCB);
		},
		getCustInfoCB : function(data){
			this.custInfo = data;
			this.info.simpl_ty_cd = "1";
		},
		setCircleAcmlAmt : function(nAmt){
			if(nAmt == 0) {
				this.info.circle_acml_amt = 0;
			}else {
				this.info.circle_acml_amt = Number(this.info.circle_acml_amt) + nAmt*10000;
			}
		},
		setGoalPrd : function(nPrd){
			if(nPrd == 0) {
				this.info.goal_prd = 0;
			}else {
				this.info.goal_prd = Number(this.info.goal_prd) + nPrd;
			}
		},
		popupProd : function(){
			pop_prod.getList();
			$("#pop_prod").modal("show");
		},
		popupCust : function(){
			pop_cust.getList();
			$("#pop_cust").modal("show");
		},
		prcCalc : function(){
			
			if(cf_isEmpty(this.info.prod_no)){
				alert("상품을 선택하세요.");
				return;
			}else if(cf_isEmpty(this.info.circle_acml_amt) || this.info.circle_acml_amt == 0){
				alert("불입금액을 입력하세요.");
				return;
			}else if(cf_isEmpty(this.info.goal_prd) || this.info.goal_prd == 0){
				alert("불입기간을 입력하세요.");
				return;
			}else if(cf_isEmpty(this.info.aply_rate) || this.info.aply_rate == 0){
				alert("적용금리를 입력하세요.");
				return;
			}else if(this.info.circle_acml_amt*this.info.pay_period > this.info.price_max || this.info.circle_acml_amt*this.info.pay_period < this.info.price_min){
				alert("불입금액이 상품기준금액보다 크거나 작습니다.\n"
					 + "상품기준금액 : " + Math.round(this.info.price_min/this.info.pay_period) + "원 ~ "
						+ Math.round(this.info.price_max/this.info.pay_period) + "원");
				return;
			}else if(this.info.pay_period<this.info.goal_prd){
				alert("목표기간이 상품기준기간보다 깁니다.\n" 
						+ "상품기준기간 : " + this.info.pay_period + "개월")
						return;
			}else if(this.info.aply_rate > this.info.air_max || this.info.aply_rate < this.info.air_min){
				alert("적용이율이 상품기준이율보다 크거가 작습니다.\n"
						+ "상품기준이율 : " + this.info.air_min + "% ~ " + this.info.air_max +"%")
						return;
			}
			
			
			if(this.info.pay_cycle == "PC01"){
				this.info.pay_cycle = 1;
			}else if(this.info.pay_cycle == "PC02"){
				this.info.pay_cycle = "12";
			}else if(this.info.pay_cycle == "PC03"){
				this.info.pay_cycle = this.info.goal_prd;
			}
			
			var nPymAmt		= Math.round(this.info.circle_acml_amt); // 불입금액
			var nRvcy		= Math.round(this.info.pay_cycle); // 납입주기
			var nPrd		= Math.round(this.info.goal_prd); // 불입기간
			var nApplItr	= Math.round(this.info.aply_rate); // 적용금리
				nApplItr	= nApplItr / 12 / 100;
			
			var nScPayAmt	= 0;	// 회차붙입금액
			var nAcmPayAmt	= 0;	// 누적불입금액
			var nScPniAmt	= 0;	// 회차원리금
			var nScInt		= 0;	// 회차이자
			var nAcmInt		= 0;	// 누적이자
			var nTax		= 0;	// 이자과세
			if(this.info.interest_ta == "IT01") {		// 일반과세
				nTax = 15.4 / 100;
			} else if(this.info.interest_ta == "IT02") {	// 세금우대
				nTax = 9.5 / 100;
			} else {									// 비과세
				nTax = 0;
			}
			
			var html = '';
			for(var i=1; i<=nPrd; i++) {
				
				if(nRvcy == 1) {
					nScPayAmt = nPymAmt;  //회차불입금액 = 불입금액
				} else if(i % nRvcy == 1) {
					nScPayAmt = nPymAmt * nRvcy; //회차불입액 = 불입금액*납입주기
				} else {
					nAmt = 0;
				}
				nAcmPayAmt += nScPayAmt;
				nScInt = nAcmPayAmt * nApplItr;
				nScPniAmt = nScPniAmt + nScPayAmt + nScInt;
				nAcmInt += nScInt;
				
				html += '<tr>';
				html += '<td class="right" style="text-align: right;">' + i + '</td>';
				html += '<td class="right" style="text-align: right;">' + numberFormat(Math.round(nScPayAmt)) + '</td>';
				html += '<td class="right" style="text-align: right;">' + numberFormat(Math.round(nAcmPayAmt)) + '</td>';
				html += '<td class="right" style="text-align: right;">' + numberFormat(Math.round(nScInt)) + '</td>';
				html += '<td class="right" style="text-align: right;">' + numberFormat(Math.round(nScPniAmt)) + '</td>';
				html += '</tr>';
			}
			
			this.info.tot_dpst_amt = (Math.round(nAcmPayAmt)); //누적불입액
			this.info.tot_dpst_int = (Math.round(nAcmInt)); //누적이자
			this.info.int_tax_amt = (Math.round(nAcmInt * nTax)); //이자과세금
			this.info.bfo_rcve_amt = (Math.round(nScPniAmt)); //세전수령액
			this.info.atx_rcve_amt = (Math.round(nScPniAmt - this.info.int_tax_amt)); //세후수령액
        	
			this.info.circle_acml_amt_fmt = this.info.circle_acml_amt.numformat();
			this.info.tot_dpst_amt_fmt = this.info.tot_dpst_amt.numformat();
			this.info.tot_dpst_int_fmt = this.info.tot_dpst_int.numformat();
			this.info.int_tax_amt_fmt = this.info.int_tax_amt.numformat();
			this.info.bfo_rcve_amt_fmt = this.info.bfo_rcve_amt.numformat();
			this.info.atx_rcve_amt_fmt = this.info.atx_rcve_amt.numformat();
			
			$("#grid_tbody").html(html);
			
			// 차트
			var chart = bb.generate({
                data: {
                    columns: [
                        ["불입금액합계"	, this.info.tot_dpst_amt],
                        ["세전이자"	, this.info.tot_dpst_int],
                        ["세전수령액"	, this.info.bfo_rcve_amt],
                        ["이자과세금"	, this.info.int_tax_amt],
                        ["세후수령액"	, this.info.atx_rcve_amt],
                    ],
                    type: "bar",
                    groups: [
                        []
                    ],
                    order: null
                },
                bindto: "#chart"
            });
		},
		gotoList : function(){
			cf_movePage('/cal/listPlan');
		},
		popupPrint : function(){
			
			if (!window.confirm("설계발행하시겠습니까?")) {
    			return;
            }
			
			$("#print_prod_nm").val("상품명");
			
			document.getElementById('printArea_chart').innerHTML = document.getElementById('chart').innerHTML;
			
			const printArea = document.getElementById('printArea').innerHTML;

			win = window.open();
			self.focus();
			win.document.open();

			/*
			1. div 안의 모든 태그들을 innerHTML을 사용하여 매개변수로 받는다.
			2. window.open() 을 사용하여 새 팝업창을 띄운다.
			3. 열린 새 팝업창에 기본 <html><head><body>를 추가한다.
			4. <body> 안에 매개변수로 받은 printArea를 추가한다.
			5. window.print() 로 인쇄
			6. 인쇄 확인이 되면 팝업창은 자동으로 window.close()를 호출하여 닫힘
			 */
			win.document.write('<html><head>');

			win.document.write('<link rel="stylesheet" href="/static_resources/system/js/datatables/datatables.css">');
			win.document.write('<link rel="stylesheet" href="/static_resources/system/js/select2/select2-bootstrap.css">');
			win.document.write('<link rel="stylesheet" href="/static_resources/system/js/select2/select2.css">');

			win.document.write('<title></title><style>');
			win.document.write('td.center {text-align: center;}');
			win.document.write('th.center {text-align: center;}');
			win.document.write('body {font-size: 14px;}');
			win.document.write('</style></head><body>');
			win.document.write(printArea);
			win.document.write('</body></html>');
			win.document.close();
			win.print();
			win.close();
		},
	}
});

var pop_prod = new Vue({
	el : "#pop_prod",
	data : {
		dataList : [],
		pop_prod_no : "",
		pop_prod_nm : "",
		pop_sub_tg : ""
	},
	mounted : function(){
		
	},
	methods : {
		getList : function(){
			
			this.dataList = [];
			var params = {
				prod_no : this.pop_prod_no,
				prod_nm : this.pop_prod_nm,
				prod_type : vueapp.info.prod_type,
			}
			
		
			cf_ajax("/2team/prod/getProdList", params, function(data){
				pop_prod.dataList = data;
			});
		},
		selProd : function(prod_no){
			
			vueapp.info.prod_no = prod_no;
			vueapp.getProdInfo();
			
			$("#pop_prod").modal("hide");
		},
	},
});

var pop_cust = new Vue({
	el : "#pop_cust",
	data : {
		dataList : [],
		pop_cust_nm  : "",
	},
	mounted : function(){
		//this.getList();
	},
	methods : {
		getList : function(isInit){
			var params = {
				cust_nm : this.pop_cust_nm,
				cust_evt_ty_cd : "",
				emp_dept : "",
				wrt_dt : "",
			}
			cf_ajax("/cal/getCust", params, function(data){
				pop_cust.dataList = data;
			});
		},
		selCust : function(item){
			vueapp.info.cust_sn = item.cust_sn;
			vueapp.getCustInfo();
			
			$("#pop_cust").modal("hide");
		},
	},
});

</script>

<script>
    function numberFormat(num) {
		num = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return num;
	}
    
    function getToday() {
    	const today = new Date(); 
    	const year = today.getFullYear(); 	// 년도
    	const month = (today.getMonth() + 1).toString().padStart(2, '0');  	// 월
    	const day = today.getDate().toString().padStart(2, '0'); 	// 일
    	
    	return year + "-" + month + "-" + day;
    }
    
</script>
</html>