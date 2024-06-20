<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp"
	flush="false" />
<!-- Imported styles on this page -->
	<link rel="stylesheet" href="/static_resources/system/js/datatables/datatables.css">
	<link rel="stylesheet" href="/static_resources/system/js/datatables/proddtl.css">
	<link rel="stylesheet" href="/static_resources/system/js/select2/select2-bootstrap.css">
	<link rel="stylesheet" href="/static_resources/system/js/select2/select2.css">
	

<title>상품정보조회</title>
</head>
<body class="page-body">

	<div class="page-container">

		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp"
			flush="false" />

		<div class="main-content">

			<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp"
				flush="false" />

			<ol class="breadcrumb bc-3">
				<li><a href="#none" onclick="cf_movePage('/system')"><i
						class="fa fa-home"></i>Home</a></li>
				<li class="active"><strong>상품정보조회</strong></li>
			</ol>

			<h2>상품관리 > 상품정보조회 > 일반상품</h2>
			<br />

			<div class="flex-column flex-gap-10" id="vueapp">
				<template>
					
        
        <div class="flex flex-100">
            <div class="flex-wrap flex-60 flex flex-gap-10 flex-padding-10">
                <div class="form-group flex-20">
                    <label for="productName" class="form-control">상품명 :</label>
                    <input type="text" class="form-control" v-model="prod_nm" value=""/>
                </div>
                <div class="form-group flex-40">
				    <label for="productType" class="form-control">상품 유형 :</label>
				    <select v-model="prod_type" class="form-control">
				        <option value="">전체</option>
				        <option value="PT02">예금</option>
				        <option value="PT03">대출</option>
				        <option value="PT01">적금</option>
				    </select>
				</div>


                <div class="form-group flex-40">
                    <label for="from_date" class="form-control">판매 기간 :</label>
                    <input type="text" class="form-control" v-model="from_date" data-format="yyyy-mm-dd" placeholder="yyyy-mm-dd"/>
<!--                     <input type="text" v-model="sale_end_dt" data-format="yyyy-mm-dd"/> -->
                </div>
                <div class="form-group flex-40">
                    <label for="subTarget" class="form-control">가입대상 :</label>
                    <select v-model="sub_tg" class="form-control" value="">
                        <option value="">전체</option>
                        <option value="ST01">일반개인</option>
                        <option value="ST02">청년</option>
                        <option value="ST03">소상공인</option>
                    </select>
                </div>
            </div>
		    <div class="flex-wrap flex-20 flex flex-center flex-gap-10 flex-padding-110">
			    <div class="form-group" style="width: 45%;">
			        <button type="button" class="btn-icon" @click="getListCond(true)">
			            검색 <i class="entypo-search"></i>
			        </button>
			    </div>
			</div>

        </div>
       <div class="flex flex-100 flex-padding-10 flex-gap-10"
						style="justify-content: flex-end; border: 1px solid #999999;">
						<button type="button" class="btn btn-blue btn-icon icon-left"
							@click="cf_movePage('/2team/prod/insert')">
						 	상품등록 <i class="entypo entypo-info"></i>
						</button><button type="button" class="btn btn-blue btn-icon icon-left"
							@click="popupPrint()">
							상세내역 <i class="entypo entypo-info"></i>
						</button>
					</div>
        
    
    
		
					<table class="table table-bordered datatable dataTable"
						id="grid_app" style="border: 1px solid #999999;">
						<thead>
							<tr class="replace-inputs">
								<th style="width: 4%;" class="center hidden-xs nosort"><input
									type="checkbox" id="allCheck" @click="all_check(event.target)"></th>
								<th style="width: 15%;" class="center sorting"
									@click="sortList(event.target)" sort_target="prod_nm">상품명</th>
									<th style="width: 10%;" class="center sorting"
									@click="sortList(event.target)" sort_target="prod_type">상품유형</th>
								<th style="width: 10%;" class="center sorting"
									@click="sortList(event.target)" sort_target="sub_tg">가입대상</th>
								<th style="width: 11%;" class="center sorting"
									@click="sortList(event.target)" sort_target="price_min">최소가입금액</th>
								<th style="width: 11%;" class="center sorting"
									@click="sortList(event.target)" sort_target="price_max">최대가입금액</th>
								<th style="width: 9%;" class="center sorting"
									@click="sortList(event.target)" sort_target="pay_cycle">납입주기</th>
								<th style="width: 9%;" class="center sorting"
									@click="sortList(event.target)" sort_target="pay_period">납입기간</th>
<!-- 								<th style="width: 20%;" class="center sorting" -->
<!-- 									@click="sortList(event.target)" sort_target="promtn_yn">프로모션</th> -->
							</tr>
						</thead>
						<tbody>
							<tr v-for="item in dataList" style="cursor: pointer;">
								<td class="center"><input type="checkbox"
									:data-idx="item.prod_cd" name="is_check" @click="onCheck">
								</td>
								<td class="left" @click="gotoDtl(item.prod_no)">{{item.prod_nm}}</td>
								<td class="center" @click="gotoDtl(item.prod_no)">{{item.prod_type}}</td>
								<td class="right" @click="gotoDtl(item.prod_no)"
									style="text-align: right;">{{item.sub_tg}}</td>
								<td class="right" @click="gotoDtl(item.prod_no)" style="text-align: right;">
								    {{ formatCurrency(item.price_min) }}</td>
								<td class="right" @click="gotoDtl(item.prod_no)" style="text-align: right;">
								    {{ formatCurrency(item.price_max) }}</td>
								<td class="right" @click="gotoDtl(item.prod_no)"
									style="text-align: right;">{{item.pay_cycle}}</td>
								<td class="right" @click="gotoDtl(item.prod_no)"
									style="text-align: right;">{{item.pay_period}}개월</td>

							</tr>
						</tbody>
					</table>

					<div class="dataTables_paginate paging_simple_numbers"
						id="div_paginate"></div>
						
				</template>
			</div>
			

			<jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp"
				flush="false" />

		</div>
	</div>
	<!-- 고객기본정보조회 팝업 -->
<div class="modal fade" id="pop_cust_info">
<template>
	<div class="modal-dialog" style="width: 80%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="btn_popClose">&times;</button>
				<h4 class="modal-title" id="modify_nm">상품기본정보</h4>
			</div>
			<div class="modal-body">
                <div class="panel-body" style="display: flex;border: 1px solid #FF0000;width: 100%;">			
                    <div class="left-panel" style="width: 70%;">
                        <div class="form-group">
                            <label for="err_eng_nm" class="fix-width-33">상품코드 :</label>
                            <input type="text" class="form-control" id="prod_no" v-model="info.prod_no" disabled="disabled">
                         </div>
                        <div class="form-group">
                           <label for="err_eng_nm" class="fix-width-33">상품명 :</label>
                            <input type="text" class="form-control" id="prod_nm " v-model="info.prod_nm">
                        </div>
    
                        <div class="form-group">
                            <label for="err_eng_nm" class="fix-width-33">상품유형 :</label>
                            <input type="text"  class="form-control" id="prod_type" v-model="info.prod_type">
                            <label for="err_eng_nm" class="fix-width-33">가입대상 :</label>
                            <input type="text" class="form-control" id="sub_tg" v-model="info.sub_tg">
                        </div>
      
                        <div class="form-group">
                            <label for="err_eng_nm" class="fix-width-33">납입 기간 :</label>
                            <input type="text" class="form-control" id="pay_period" v-model="info.pay_period">
                            <label for="err_eng_nm" class="fix-width-33">납입 주기 :</label>
                            <input type="text" class="form-control" id="pay_cycle" v-model="info.pay_cycle">
                        </div>
      
                        <div class="form-group">
                            <label for="err_eng_nm" class="fix-width-33">가입 금액 MAX :</label>
                            <input type="text" class="form-control" id="price_max" v-model="info.price_max">
                            <label for="err_eng_nm" class="fix-width-33">가입 금액 MIN  :</label>
                            <input type="text" class="form-control" id="price_min" v-model="info.price_min">
                        </div>
                        
                        <div class="form-group">
                       		<label for="err_eng_nm" class="fix-width-33">이자과세 :</label>
                            <input type="text" class="form-control" id="interest_ta" v-model="info.interest_ta">
                            <label for="err_eng_nm" class="fix-width-33">판매상태  :</label>
                            <input type="text" class="form-control" id="sale_stat" v-model="info.sale_stat">
                        </div>
                        
                        <div class="form-group">
                            <label for="err_eng_nm" class="fix-width-33">판매시작일  :</label>
                            <input type="text" class="form-control" id="sale_beg_dt" v-model="info.sale_beg_dt">
                            <label for="err_eng_nm" class="fix-width-33">판매종료일  :</label>
                            <input type="text" class="form-control" id="sale_end_dt" v-model="info.sale_end_dt">
                        </div> 
                        
                        <div class="form-group">
                            <label for="err_eng_nm" class="fix-width-33">적용이율 최대 :</label>
                            <input type="text" class="form-control" id="air_max" v-model="info.air_max">
                            <label for="err_eng_nm" class="fix-width-33">적용이율 최소 :</label>
                            <input type="text" class="form-control" id="air_min" v-model="info.air_min">
                        </div>
                        
                        <div class="form-group">
                            <label for="err_eng_nm" class="fix-width-33">적용기간 시작일 :</label>
                            <input type="text" class="form-control" id="air_beg_dt" v-model="info.air_beg_dt">
                            <label for="err_eng_nm" class="fix-width-33">적용기간 종료일 :</label>
                            <input type="text" class="form-control" id="air_end_dt" v-model="info.air_end_dt">
                        </div>  
      
                    </div>
                    <div class="right-panel"  style="width: 30%;">
                        <div class="form-group">
                            <label for="err_eng_nm">변동 이율내역 :</label>
                        </div>	
                    <div>
                        <textarea  id="tsk_dtl_cn" v-model="info.tsk_dtl_cn"style="width:100%;" ></textarea>               
                    </div>
                    </div>
                </div>          
    
			</div>
			<div class="modal-footer">
				
				<!-- 녹색 버튼, 왼쪽에 저장 아이콘 -->
				<button type="button" class="btn btn-success btn-icon icon-left" data-dismiss="modal">
				    <i class="fa fa-save"></i> <!-- save 아이콘 -->
				    상품정보수정
				</button>
				
				<!-- 빨간색 버튼, 왼쪽에 쓰레기통 아이콘 -->
				<button type="button" class="btn btn-danger btn-icon icon-left" data-dismiss="modal">
				    <i class="fa fa-trash"></i> <!-- delete 아이콘 -->
				    상품판매중지
				</button>
				
				<!-- 회색 버튼, 왼쪽에 X 아이콘 -->
				<button type="button" class="btn btn-secondary btn-icon icon-left" data-dismiss="modal">
				    Close
				</button>


		</div>
	</div>
</template>
</div>
<!--// 고객기본정보조회 팝업  -->
</body>
<script>
var vueapp = new Vue({
    el: "#vueapp",
    data: {
        dataList: [],
        prod_nm: "",
        prod_type: "",
        sub_tg: "",
		from_date:"",
        sale_beg_dt:"",
        sale_end_dt:"",
        all_srch : "Y",
    },
    mounted: function(){
        var fromDtl = cf_getUrlParam("fromDtl");
        var pagingConfig = cv_sessionStorage.getItem("pagingConfig");       
        if ("Y" === fromDtl && !cf_isEmpty(pagingConfig)) {
            cv_pagingConfig.pageNo = pagingConfig.pageNo;
            cv_pagingConfig.orders = pagingConfig.orders;
            
            var params = cv_sessionStorage.getItem("params");
            this.prod_nm = params.prod_nm;
            this.prod_type = params.prod_type;
            this.sub_tg = params.sub_tg;
            this.sale_beg_dt = params.sale_beg_dt;
            this.sale_end_dt = params.sale_end_dt;
            this.from_date = params.from_date;
            this.getList();
        } else {
            cv_sessionStorage
                .removeItem("pagingConfig")
                .removeItem("params");
            this.getList(true);
        }
    },
    methods: {
    	getListCond : function(isInit){
    		var regex = /^\d{4}-\d{2}-\d{2}$/;
            if (this.from_date && !regex.test(this.from_date)) {
                alert('날짜 형식이 올바르지 않습니다. yyyy-mm-dd 형식으로 입력해주세요.');
                // 형식에 맞지 않는 경우 입력을 초기화하거나 기타 작업을 수행할 수 있습니다.
                return;
            }
			this.all_srch = "N";
			this.getList(isInit);
		},
        getList: function(isInit){
            cv_pagingConfig.func = this.getList;
            if (isInit === true) {
                cv_pagingConfig.pageNo = 1;
                cv_pagingConfig.orders = [{ target: "prod_nm", isAsc: false }];
            }
            
            var params = {}
            if(this.all_srch != "Y"){
            	params = {
            			prod_nm: this.prod_nm,
                        prod_type: this.prod_type,
                        sub_tg: this.sub_tg,
                        sale_beg_dt: this.sale_beg_dt,
                        sale_end_dt: this.sale_end_dt,
                        from_date: this.from_date,
            	}
            }
                
            
            
            cv_sessionStorage
                .setItem('pagingConfig', cv_pagingConfig)
                .setItem('params', params);

            cf_ajax("/2team/prod/getList", params, this.getListCB);
        },
        
        getListCB: function(data){
            this.dataList = data.list;
            for (var i = 0; i < this.dataList.length; i++) {
                this.dataList[i].prod_nm = this.dataList[i].prod_nm;
            }
            
            cv_pagingConfig.renderPagenation("system");
        },
        sortList: function(obj){
            cf_setSortConf(obj, "prod_nm");
            this.getList();
        },
        gotoDtl : function(prod_no) {
			var params = {
				prod_cd : cf_defaultIfEmpty(prod_no, ""),
			}
			cf_movePage("/sell/dtl", params);
		},
        all_check : function(obj) {
			$('[name=is_check]').prop('checked', obj.checked);
		},
		onCheck : function() {
			$("#allCheck")
					.prop(
							'checked',
							$("[name=is_check]:checked").length === $("[name=is_check]").length);
		},
		formatCurrency(value) {
            if (!value) return '';
            return parseFloat(value).toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' });
        },
        gotoDtl : function(prod_no){	
			pop_cust_info.init(prod_no);
			$('#pop_cust_info').modal('show');
		},
    }
});
var pop_cust_info = new Vue({
	el : "#pop_cust_info",
	data : {
		info : {
		prod_no : "${prod_no}",
		prod_nm : "",
		prod_type: "",
		sub_tg:"",
		pay_period:"",
		pay_cycle: "",
		price_max:"",
		price_min:"",
		sale_stat:"",
		sale_beg_dt:"",
		sale_end_dt:"",
		promtn_yn:"",
		interest_ta:"",
		air_min:"",
		air_max:"",
		air_beg_dt:"",
		air_end_dt:"",
		
		}
	},
	methods : {
		init : function(prod_no){
			this.initInfo();
			this.info.prod_no = prod_no;
			if(!cf_isEmpty(this.info.prod_no)){
				this.getInfo();
			}
		},
		initInfo : function(){
			this.info = {
				prod_no : "",
				prod_nm : "",
				prod_type: "",
				sub_tg:"",
				pay_period:"",
				pay_cycle: "",
				price_max:"",
				price_min:"",
				sale_stat:"",
				sale_beg_dt:"",
				sale_end_dt:"",
				promtn_yn:"",
				interest_ta:"",
				air_min:"",
				air_max:"",
				air_beg_dt:"",
				air_end_dt:"",
			}
		},
		getInfo : function(){
			var params = {
					prod_no : this.info.prod_no,
					prod_nm : this.info.prod_nm,
					prod_type : this.info.prod_type,
					sub_tg : this.info.sub_tg,
					pay_period : this.info.pay_period,
					pay_cycle : this.info.pay_cycle,
					price_max : this.info.price_max,
					price_min : this.info.price_min,
					sale_stat : this.info.sale_stat,
					sale_beg_dt : this.info.sale_beg_dt,
					sale_end_dt : this.info.sale_end_dt,
					promtn_yn : this.info.promtn_yn,
					interest_ta : this.info.interest_ta,
					air_min : this.info.air_min,
					air_max : this.info.air_max,
					air_beg_dt : this.info.air_beg_dt,
					air_end_dt : this.info.air_end_dt,
				}
			cf_ajax("/2team/prod/getInfo", params, this.getInfoCB);
		},
		getInfoCB : function(data){
			this.info = data;
		},
	},
});
</script>

</html>