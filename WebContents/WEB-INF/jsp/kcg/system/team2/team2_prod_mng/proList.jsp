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
	<link rel="stylesheet" href="/static_resources/system/js/datatables/datatables.css">
	<link rel="stylesheet" href="/static_resources/system/js/datatables/promion.css">
	<link rel="stylesheet" href="/static_resources/system/js/datatables/billboard.css">
	<link rel="stylesheet" href="/static_resources/system/team2/team2_css/team2.css">

<title>상품정보</title>
</head>
<body class="page-body">

	<div class="page-container">

		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp"
			flush="false" />

		<div class="main-content">

			<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp"
				flush="false" />

			<ol class="breadcrumb bc-3">
				<li><a href="#none" onclick="cf_movePage('/system')"><i
						class="fa fa-home"></i>Home</a></li>
				<li class="active"><strong>상품관리</strong></li>
				<li class="active"><strong>상품정보</strong></li>
			</ol>
			<h2 class="header" onclick="location.reload();">프로모션 상품</h2>
			<div class="right flex-column flex-100">
			 	<div class="right-top">
                        <ul class="nav">
                            <li class="nav-tab active" style="background-color: #64A0FF;" onclick="cf_movePage('/2team/prod/GLlist')">일반상품</li>
                            <li class="nav-tab active" style="background-color: #5F9EA0;" onclick="cf_movePage('/2team/prod/PRlist')">프로모션상품</li>
                        </ul>
                 </div>
			</div>
			

			<div class="flex-column flex-gap-10 dataTables_wrapper" id="vueapp">
				<template>
					
        
        <div class="flex flex-100" style="border: 2px solid #00CDFF;">
            <div class="flex-wrap flex-100 flex flex-gap-10 flex-padding-10" style="border: none;">
                <div class="form-group flex-20" style="position: relative;">
                    <label for="productName" class="form-control">상품명 :</label>
                    <input type="text" style="height:30px;" class="form-control" v-model="prod_nm" value=""/>
                </div>
                <div class="form-group flex-20" style="position: relative;">
				    <label for="productType" class="form-control">상품 유형 :</label>
				    <select v-model="prod_type" class="form-control" style="height:30px;">
				        <option value="">전체</option>
				        <option value="PT02">예금</option>
				        <option value="PT03">대출</option>
				        <option value="PT01">적금</option>
				        <option value="PT04">목돈마련</option>
				    </select>
				</div><br>


                <div class="form-group flex-20" style="position: relative;">
                    <label for="from_date" class="form-control">판매 기간 :</label>
                    <input type="text" style="height:30px;" class="form-control" v-model="from_date" data-format="yyyy-mm-dd" placeholder="yyyy-mm-dd"/>
                </div>
                <div class="form-group flex-20">
                    <label for="subTarget"  class="form-control">가입대상 :</label>
                    <select v-model="sub_tg" class="form-control" style="height:30px;">
                        <option value="">전체</option>
                        <option value="ST01">일반개인</option>
                        <option value="ST02">청년</option>
                        <option value="ST03">소상공인</option>
                    </select>
                </div>
                
                <div class="form-group flex-20" style="position: relative; top:10px; margin-left: 100px;">
                    <label for="saleStat"  class="form-control">판매상태 :</label>
                    <select v-model="sale_stat" class="form-control" style="height:30px; width:300px;">
                        <option value="">전체</option>
                        <option value="SS01">판매예정</option>
                        <option value="SS02">판매진행</option>
                        <option value="SS03">판매중지</option>
                        <option value="SS04">판매종료</option>
                    </select>
                </div>
                 <div class="form-group flex-40" style="position: relative; top:10px; margin-left: 235px;">
                 	<label for="price_max"  class="form-control" style="margin-left: 20px;">가입금액 :</label>
                 	최대 :<input type="text" style="height:30px;" class="form-control" v-model="price_max" value=""/>
                 	<span>~ </span>
                 	최소 :<input type="text" style="height:30px; margin-right: 50px;" class="form-control" v-model="price_min" value=""/>
                 </div>
                 
                 
                 
                
            </div>
         	<div class="flex-wrap flex-10 flex flex-gap-10 flex-padding-10" style="border: none;">
            	<div class="form-group flex-10" style="width: 30%;">
			        <button type="button" id="Button" class="btn btn-primary btn-icon" @click="getListCond(true)">
					    검색 <i class="entypo entypo-search"></i>
					</button>
				</div>
			</div>
        </div>
       <div class="flex flex-100 flex-padding-10 flex-gap-10" 
						style="justify-content: flex-end; border: 2px solid #00CDFF;">
						<button type="button" id="Button" class="btn btn-success btn-icon icon-right"
							@click="cf_movePage('/2team/prod/insert')">
						 	상품등록 <i class="entypo-book"></i>
						</button><button type="button" id="Button" class="btn btn-blue btn-icon icon-right"
							@click="popupPrint()">
							이율내역 <i class="entypo entypo-info"></i>
						</button>
					</div>
        
    
    
		
					<table class="table table-bordered datatable dataTable"
						id="grid_app" style="border: 2px solid #00CDFF; background-color: #7FFFD4;">
						<thead>
							<tr class="replace-inputs">
								<th style="width: 4%; background-color: #B9FFFF;" class="center hidden-xs nosort">
									<input type="checkbox" id="allCheck" @click="all_check(event.target)">
								</th>
								<th style="width: 15%; background-color: #B9FFFF;" class="center sorting" 
								@click="sortList(event.target)" sort_target="prod_nm">상품명</th>
								<th style="width: 8%; background-color: #B9FFFF;" class="center sorting"
								@click="sortList(event.target)" sort_target="prod_type">상품유형</th>
								<th style="width: 10%; background-color: #B9FFFF;" class="center sorting"
								@click="sortList(event.target)" sort_target="price_min">최소가입금액</th>
								<th style="width: 10%; background-color: #B9FFFF;" class="center sorting" 
								@click="sortList(event.target)" sort_target="price_max">최대가입금액</th>
								<th style="width: 6%; background-color: #B9FFFF;" class="center sorting" 
								@click="sortList(event.target)" sort_target="pay_period">납입기간</th>
								<th style="width: 8%; background-color: #B9FFFF;" class="center sorting" 
								@click="sortList(event.target)" sort_target="sub_tg">이자과세</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="item in dataList" style="cursor: pointer;">
								<td class="center"><input type="checkbox" :data-idx="item.prod_no" name="is_check" @click="onCheck"></td>
								<td class="center" @click="gotoDtl(item.prod_no)">{{item.prod_nm}}</td>
								<td class="center" @click="gotoDtl(item.prod_no)">{{item.prod_type}}</td>
								<td class="right" @click="gotoDtl(item.prod_no)" style="text-align: right;">{{ formatCurrency(item.price_min) }}</td>
								<td class="right" @click="gotoDtl(item.prod_no)" style="text-align: right;">{{ formatCurrency(item.price_max) }}</td>
								<td class="right" @click="gotoDtl(item.prod_no)" style="text-align: right;">{{item.pay_period}}개월</td>
								<td class="right" @click="gotoDtl(item.prod_no)" style="text-align: right;">{{item.interest_ta}}</td>
							</tr>
						</tbody>
					</table>

					<div style="position: relative; width: 1600px;">
					    <div class="dataTables_paginate paging_simple_numbers" id="div_paginate" style="position: absolute; right: 0; top: -90%;"></div>
					</div>
						
				</template>
			</div>
			

			<jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp"
				flush="false" />

		</div>
	</div>
	<!-- 고객기본정보조회 팝업 -->
<div class="modal fade" id="pop_cust_info">
<template>
	<div class="modal-dialog" style="width: 80%; height: 300%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" @click=cancel() id="btn_popClose">&times;</button>
				<h4 class="modal-title" id="modify_nm">상품기본정보</h4>
			</div>
			<span v-if="info.sale_stat === 'SS04'" style="display: inline-block; text-align: center; width: 100%; font-size: 24px;">해당상품은 판매종료입니다.</span>
			<div class="modal-body" style="font-size: 14px">
                <div class="panel-body" style="display: flex;border: 2px solid #00CDFF;width: 100%;">	
                    <div class="left-panel" style="width: 70%; height: 80%; border: 2px solid #6FCC98;">
                        <div class="form-group">
                            <label for="err_eng_nm" style="margin-left: 40px;" class="fix-width-50" style="margin-left: 40px;">상품코드 :</label>
                            <input type="text" style="width: 70px; margin-right: 170px;" class="fix-width-50" 
                            id="prod_no" v-model="info.prod_no" disabled="disabled">
                            <label for="err_eng_nm" class="fix-width-50">상품명 :</label>
                            <input type="text" style="width: 150px; margin-right: 30px;" class="fix-width-50" id="prod_nm " v-model="info.prod_nm" disabled="disabled">
                         </div>
    
                        <div class="form-group">
                            <label for="err_eng_nm" style="margin-left: 40px;" class="fix-width-50">상품유형 :</label>
                            <select type="text" class="fix-width-50" id="prod_type" v-model="info.prod_type" disabled="disabled">
						        <option value="PT01">적금</option>
						        <option value="PT02">예금</option>
						        <option value="PT03">대출</option>
						        <option value="PT04">목돈마련</option>
						    </select>
                            <label for="err_eng_nm" style="margin-left: 100px;" class="fix-width-50">가입대상 :</label>
                            <select class="fix-width-50" style="margin-right: 30px;" id="sub_tg" v-model="info.sub_tg" :disabled="!isEditing">
						        <option value="ST02">청년생활</option>
						        <option value="ST03">소상공인</option>
						    </select>
                        </div>
      
                        
                        <div class="form-group">
                       		<label for="err_eng_nm" style="margin-left: 40px;" class="fix-width-50">이자과세 :</label>
                            <select class="fix-width-50" id="interest_ta" v-model="info.interest_ta" :disabled="!isEditing">
						        <option value="IT01">일반과세</option>
						        <option value="IT02">세금우대</option>
						        <option value="IT03">비과세</option>
						    </select>
                            <label for="err_eng_nm" style="margin-left: 100px;" class="fix-width-50">판매상태 :</label>
                            <select class="fix-width-50" style="margin-right: 30px;" id="sale_stat" v-model="info.sale_stat" :disabled="!isEditing">
						        <option value="SS01">판매예정</option>
						        <option value="SS02">판매진행</option>
						        <option value="SS03">판매중지</option>
						    </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="err_eng_nm" style="margin-left: 40px;" class="fix-width-50">납입 기간 :</label>
                            <input type="text" style="width: 100px;"class="fix-width-50" id="pay_period" v-model="info.pay_period" :disabled="!isEditing" placeholder="개월">
                            <label for="err_eng_nm" style="margin-left: 140px;" class="fix-width-50">납입 주기 :</label>
                            <select class="fix-width-50" style="margin-right: 30px;" id="pay_cycle" v-model="info.pay_cycle" :disabled="!isEditing">
						        <option value="PC01">월납</option>
						        <option value="PC03">일시납</option>
						    </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="err_eng_nm" style="margin-left: 40px;" class="fix-width-50">판매기간 :</label>
                            <input type="date" class="fix-width-50" id="sale_beg_dt" v-model="info.sale_beg_dt" disabled="disabled">
                            <div>To  .</div>
                            <input type="date" style="margin-left: 100px;" class="fix-width-50" id="sale_end_dt" v-model="info.sale_end_dt" :disabled="!isEditing">
                            <div style="margin-right: 30px;">End .</div>
                        </div> 
                        
                        <div class="form-group">
                            <label for="err_eng_nm" style="margin-left: 40px;" class="fix-width-50">적용기간 :</label>
                            <input type="date" class="fix-width-50" id="air_beg_dt" v-model="info.air_beg_dt" disabled="disabled">
                            <div>To  .</div>
                            <input type="date" style="margin-left: 100px;" class="fix-width-50" id="air_end_dt" v-model="info.air_end_dt" :disabled="!isEditing">
                            <div style="margin-right: 30px;">End .</div>
                        </div>
                        
                        <div class="form-group">
                            <label for="err_eng_nm" style="margin-left: 40px;" class="fix-width-50">가입금액 MAX :</label>
                            	<input type="text" class="fix-width-50" id="price_max" v-model="info.price_max" :disabled="!isEditing">
                        </div>
                        
                        <div class="form-group">
                        	<label for="err_eng_nm" style="margin-left: 40px;" class="fix-width-50">가입금액 MIN :</label>
                            	<input type="text" class="fix-width-50" id="price_min" v-model="info.price_min" :disabled="!isEditing">
                        </div>
                        <div class="form-group">
                            <label for="err_eng_nm" style="margin-left: 40px;" class="fix-width-50">적용이율 최대 :</label>
                           	 	<input type="text" class="fix-width-50" id="air_max" v-model="info.air_max" :disabled="!isEditing">
                            
                        </div>
                        <div class="form-group">
                        	<label for="err_eng_nm" style="margin-left: 40px;" class="fix-width-50">적용이율 최소 :</label>
                            	<input type="text" class="fix-width-50" id="air_min" v-model="info.air_min" :disabled="!isEditing">
                        </div>
                        
                          
      
                    </div>
                    <div class="right-panel"  style="width: 30%; border: 2px solid #6FCC98;">
                        <div class="form-group">
                            <label for="err_eng_nm">변동 이율내역 :</label>
                        </div>	
                    <div>
                        <textarea  id="tsk_dtl_cn" v-model="info.prod_hist" style="width:100%; height: 400px; resize: none;" readonly="readonly" ></textarea>               
                    </div>
                    </div>
                </div>          
    
			</div>
			<div class="modal-footer">
				<button type="button" v-if="info.sale_stat !== 'SS04'" class="btn btn-info btn-icon icon-right" @click="toggleEdit()">
					<i class="fa fa-pencil"></i>
					상품정보수정
				</button>
				<button type="button"  v-if="isEditing && info.sale_stat !== 'SS04'" class="btn btn-success btn-icon icon-right" @click=update()>
				    <i class="fa fa-save"></i> 
				    상품정보저장
				</button>
				<button type="button" v-if="isEditing && info.sale_stat !== 'SS04'" class="btn btn-danger btn-icon icon-right" @click=deleteOne()>
				    <i class="fa fa-trash"></i> 
				    상품판매종료
				</button>

		</div>
	</div>
</template>
</div>
<!--// 고객기본정보조회 팝업  -->
<!-- 출력팝업DIV -->
    <div class="modal fade" id="popup_print">
        <template>
            <div class="modal-dialog" style="width: 80%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true" id="btn_popClose">&times;</button>
                        <h4 class="modal-title" id="modify_nm">프로모션상품이율</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal form-groups-bordered">
                            
                            <div class="form-group">
                                <div class="col-sm-10">출력건수 : {{printInfo.prodCount}}건</div>
                            </div>
                            <div class="form-group" id="printArea">
                                <table class="table datatable dataTable">
                                    <thead>
                                        <tr class="replace-inputs">
                                            <th style="width: 15%;" class="center">상품코드</th>
                                            <th style="width: 15%;" class="center">상품명</th>
                                            <th style="width: 15%;" class="center">상품유형</th>
                                            <th style="width: 10%;" class="center">현재이율최대</th>
                                            <th style="width: 10%;" class="center">현재이율최소</th>
                                            <th style="width: 20%;" class="center">이율적용기간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="item in printInfo.prodList">
                                            <td class="center">{{item.prod_no}}</td>
                                            <td class="center">{{item.prod_nm}}</td>
                                            <td class="center">{{item.prod_type}}</td>
                                            <td class="center">{{item.air_max}}%</td>
                                            <td class="center">{{item.air_min}}%</td>
                                            <td class="center">{{item.air_beg_dt}}~{{item.air_end_dt}}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
					    <button type="button" class="btn btn-primary btn-icon icon-right" @click="print">
					        <i class="fa fa-print"></i> 인쇄
					    </button>
					</div>

                </div>
            </div>
        </template>
    </div>
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
        sale_stat: "",
        price_max: "",
        price_min: "",
        promtn_yn: "",
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
            this.sale_stat = params.sale_stat;
            this.price_max = params.price_max;
            this.price_min = params.price_min;
            this.promtn_yn = params.promtn_yn;
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
                cv_pagingConfig.orders = [{ target: "prod_no", isAsc: false }];
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
                        price_max: this.price_max,
                        price_min: this.price_min,
                        sale_stat: this.sale_stat,
                        promtn_yn: this.promtn_yn,
            	}
            }
                
            
            
            cv_sessionStorage
                .setItem('pagingConfig', cv_pagingConfig)
                .setItem('params', params);
			params.promtn_yn='Y'
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
		popupPrint : function(prod_no) {
			var chkedList = $("[name=is_check]:checked");
			if (chkedList.length == 0) {
				alert("출력할 대상을 선택하여 주십시오.");
				return;
			}
			//check list 가져오기..
			var dateCopyList = [];
			var idx;
			 // 선택된 각 체크박스를 순회
		    chkedList.each(function() {
		        idx = $(this).attr("data-idx");
		        // dataList에서 prod_no가 idx와 일치하는 항목을 찾기
		        var item = vueapp.dataList.find(function(item) {
		            return item.prod_no == idx;
		        });
		        if (item) {
		            dateCopyList.push(item);
		        } else {
		            console.error('유효하지 않은 데이터:', idx);
		        }
		    });
			console.log(dateCopyList);

			//출력팝업 띄우기
			popup_print.init(dateCopyList);
			$('#popup_print').modal('show');
		},
    }
});
var popup_print = new Vue(
		{
			el : "#popup_print",
			data : {
				printInfo : {
					prodCount : 0,
					prodList : [],
				}
			},
			methods : {
				init : function(dateCopyList) {
					this.initInfo(dateCopyList);
				},
				initInfo : function(dateCopyList) {
					this.printInfo = {
						prodCount : dateCopyList.length,
						prodList : dateCopyList,
					};
				},
				print : function() {
					const printArea = document.getElementById('printArea').innerHTML;
					console.log(printArea);

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

					win.document
							.write('<link rel="stylesheet" href="/static_resources/system/js/datatables/datatables.css">');
					win.document
							.write('<link rel="stylesheet" href="/static_resources/system/js/select2/select2-bootstrap.css">');
					win.document
							.write('<link rel="stylesheet" href="/static_resources/system/js/select2/select2.css">');

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
var pop_cust_info = new Vue({
	el : "#pop_cust_info",
	data : {
		isEditing: false,
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
		prod_hist:"",
		
		}
	},
	methods : {
		toggleEdit() {
            this.isEditing = !this.isEditing;
        },
        cancel() {
        	this.isEditing = false;
        },
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
				prod_hist:"",
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
					prod_hist: this.info.prod_hist,
				}
			cf_ajax("/2team/prod/getInfo", params, this.getInfoCB);
		},
		getInfoCB : function(data){
			this.info = data;
		},
		update : function(data){
			// Date 객체로 변환
            const air_beg_date = new Date(this.info.air_beg_dt);
            const air_end_date = new Date(this.info.air_end_dt);
            const sale_beg_date = new Date(this.info.sale_beg_dt);
            const sale_end_date = new Date(this.info.sale_end_dt);
			
            if (cf_isEmpty(this.info.price_min) || cf_isEmpty(this.info.price_max)) {
                alert("가입금액을 입력하세요.");
                return;
            } else if (!Number.isInteger(parseFloat(this.info.price_min)) || !Number.isInteger(parseFloat(this.info.price_max))) {
                alert("가입금액은 정수만 입력할 수 있습니다.");
                return;
            } else if (parseInt(this.info.price_min) > parseInt(this.info.price_max)) {
                alert("가입금액 최소가 더 클 수 없습니다.");
                return;
            }
			else if (cf_isEmpty(this.info.pay_period)){
				alert("납입기간을 입력하세요.");
				return;
			}
			else if (cf_isEmpty(this.info.air_min && this.info.air_max)){
				alert("적용이율을 입력하세요.");
				return;
			}
			else if (parseFloat(this.info.air_min) > parseFloat(this.info.air_max)) {
			    alert("적용이율 최소가 더 클 수 없습니다.");
			    return;
			}
			else if(parseFloat(this.info.air_min) >= 10) {
			    alert("적용이율 최소가 10% 이상 일 수 없습니다.");
			    return;
			}
			else if(parseFloat(this.info.air_max) >= 10) {
			    alert("적용이율 최대가 10% 이상 일 수 없습니다.");
			    return;
			}
			else if (cf_isEmpty(this.info.air_beg_dt && this.info.air_end_dt)) {
			    alert("적용기간을 입력하세요.");
			    return;
			}
			else if (air_beg_date > air_end_date) {
                alert("적용기간의 시작일은 종료일보다 늦을 수 없습니다.");
                return;
            }
			else if (cf_isEmpty(this.info.sale_beg_dt && this.info.sale_end_dt)){
				alert("판매기간을 입력하세요.");
				return;
			}
			else if (sale_beg_date > sale_end_date) {
                alert("판매기간의 시작일은 종료일보다 늦을 수 없습니다.");
                return;
            }
			
			if(!confirm("수정하시겠습니까?")) return;
			
			cf_ajax("/2team/prod/update", this.info, this.updateCB);
		},
		updateCB : function(data){
			alert("저장되었습니다.");
			cf_movePage('/2team/prod/PRlist');
		},
		
		deleteOne : function(data) {
			if(!confirm("판매종료하시겠습니까?")){
				return;
			}
			if (!confirm("판매종료시 되돌릴 수 없습니다.")) {
			    return;
			}
			this.info.sale_stat='SS04'
			cf_ajax("/2team/prod/delete", this.info, this.deleteOneCB);
		},
		deleteOneCB : function(data){
			alert("종료되었습니다.");
			cf_movePage('/2team/prod/PRlist');
		}, 
	},
});
</script>

</html>