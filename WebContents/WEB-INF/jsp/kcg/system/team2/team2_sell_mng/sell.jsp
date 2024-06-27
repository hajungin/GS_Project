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
	<link rel="stylesheet" href="/static_resources/system/js/datatables/prodlist.css">
	<link rel="stylesheet" href="/static_resources/system/js/select2/select2.css">
	<link rel="stylesheet" href="/static_resources/system/js/select2/select2-bootstrap.css">
	<link rel="stylesheet" href="/static_resources/system/js/datatables/proddtl.css">
	<link rel="stylesheet" href="/static_resources/system/js/datatables/promion.css">
	<link rel="stylesheet" href="/static_resources/system/js/datatables/billboard.css">

	<style type="text/css">    .header {
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
    #Button:hover {
        background-color: #2980B9; /* Hover 시 배경색 변경 */
    }
</style>

<title>상품정보조회</title>
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
				<li class="active"><strong>상품정보조회</strong></li>
			</ol>

			<h2 class="header">판매관리 > 상품정보조회 > 판매중 상품</h2>
			<br />

			<div class="flex-column flex-gap-10 dataTables_wrapper" id="vueapp">
				<template>
					
        
        <div class="flex flex-100" style="border: 2px solid #00CDFF;">
            <div class="flex-wrap flex-100 flex flex-gap-10 flex-padding-10">
                <div class="form-group flex-20">
                    <label for="productName" class="form-control">상품명 :</label>
                    <input type="text" style="height:30px;" class="form-control" v-model="prod_nm" value=""/>
                </div>
                <div class="form-group flex-20">
				    <label for="productType" class="form-control">상품 유형 :</label>
				    <select v-model="prod_type" style="height:30px;" class="form-control">
				        <option value="">전체</option>
				        <option value="PT02">예금</option>
				        <option value="PT03">대출</option>
				        <option value="PT01">적금</option>
				    </select>
				</div>


                <div class="form-group flex-40">
                    <label for="from_date" class="form-control">판매기간 :</label>
                    <span>시작 : </span>
                    <input type="text" style="height:30px;" class="form-control" v-model="sale_beg_dt" data-format="yyyy-mm-dd" placeholder="yyyy-mm-dd"/>
                    <span style="margin-left: 22px;">종료 : </span>
                    <input type="text" style="height:30px;" class="form-control" v-model="sale_end_dt" data-format="yyyy-mm-dd" placeholder="yyyy-mm-dd"/>
                </div>
                
                <div class="form-group flex-20">
                    <label for="promtn_yn"  class="form-control">프로모션 :</label>
                    <select v-model="promtn_yn" style="height:30px;" class="form-control" value="">
                        <option value="">전체</option>
                        <option value="Y">Y</option>
                        <option value="N">N</option>
                    </select>
                </div>
                <div class="form-group flex-20">
                    <label for="subTarget"  class="form-control">가입대상 :</label>
                    <select v-model="sub_tg" style="height:30px;" class="form-control" value="">
                        <option value="">전체</option>
                        <option value="ST01">일반개인</option>
                        <option value="ST02">청년</option>
                        <option value="ST03">소상공인</option>
                    </select>
                </div>
                <div class="form-group flex-40">
                 	<label for="price_max"  class="form-control">가입금액 :</label>
                 	<span>최대 : </span>
                 	<input type="text" style="height:30px;" class="form-control" v-model="price_max" value=""/>
                 	<span style="margin-left: 10px;">~ 최소 : </span>
                 	<input type="text" style="height:30px;" class="form-control" v-model="price_min" value=""/>
                 </div>
              </div>
             <div class="flex-wrap flex-10 flex flex-gap-10 flex-padding-10">
            	<div class="form-group flex-10" style="width: 30%;">
			        <button type="button" id="Button" class="btn btn-blue btn-icon icon-right" @click="getListCond(true)">
					    검색 <i class="entypo entypo-search"></i>
					</button>
				</div>
			</div>
            
        </div>
        <div class="flex flex-100 flex-padding-10 flex-gap-10"

						style="justify-content: flex-end; border: 1px solid #999999;">
						
					
						<button type="button"  id="Customer" class="btn btn-blue btn-icon icon-right"
							@click="popupCustomer()">
							고객조회 <i class="entypo entypo-info"></i>
						</button>
						<button type="button" id="Button" class="btn btn-blue btn-icon icon-right"
							@click="popupPrint()">
							상세내역 <i class="entypo entypo-info"></i>
						</button>
					</div>
        
    
    
		
					<table class="table table-bordered datatable dataTable"
						id="grid_app" style="border: 2px solid #00CDFF; background-color: #B9FFFF;">
						<thead>
							<tr class="replace-inputs">
								<th style="width: 4%; background-color: #B9FFFF;" class="center hidden-xs nosort"><input
									type="checkbox" id="allCheck" @click="all_check(event.target)"></th>
								<th style="width: 15%; background-color: #B9FFFF;" class="center sorting"
									@click="sortList(event.target)" sort_target="prod_nm">상품명</th>
									<th style="width: 8%; background-color: #B9FFFF;" class="center sorting"
									@click="sortList(event.target)" sort_target="prod_type">상품유형</th>
								<th style="width: 11%; background-color: #B9FFFF;" class="center sorting"
									@click="sortList(event.target)" sort_target="price_min">최소가입금액</th>
								<th style="width: 11%; background-color: #B9FFFF;" class="center sorting"
									@click="sortList(event.target)" sort_target="price_max">최대가입금액</th>
								<th style="width: 8%; background-color: #B9FFFF;" class="center sorting"
									@click="sortList(event.target)" sort_target="pay_period">납입주기</th>
								<th style="width: 8%; background-color: #B9FFFF;" class="center sorting"
									@click="sortList(event.target)" sort_target="prod_air_max">최소이율</th>
								<th style="width: 8%; background-color: #B9FFFF;" class="center sorting"
									@click="sortList(event.target)" sort_target="sub_tg">최대이율</th>
								<th style="width: 8%; background-color: #B9FFFF;" class="center sorting"
									@click="sortList(event.target)" sort_target="promtn_yn">프로모션</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="item in dataList" style="cursor: pointer;">
								<td class="center"><input type="checkbox"
									:data-idx="item.prod_no" name="is_check" @click="onCheck">
								</td>
								<td class="center">{{item.prod_nm}}</td>
								<td class="center">{{item.prod_type}}</td>
								<td class="right" style="text-align: right;">
								    {{ formatCurrency(item.price_min) }}</td>
								<td class="right" style="text-align: right;">
								    {{ formatCurrency(item.price_max) }}</td>
								<td class="right"
									style="text-align: right;">{{item.pay_cycle}}</td>
								<td class="right"  style="text-align: right;">
								    {{item.air_min}}%</td>
								<td class="right" style="text-align: right;">
								    {{item.air_max}}%</td>
								<td class="center">{{item.promtn_yn}}</td>
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
	<!-- 출력팝업DIV -->
    <div class="modal fade" id="popup_print">
        <template>
            <div class="modal-dialog" style="width: 80%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true" id="btn_popClose">&times;</button>
                        <h4 class="modal-title" id="modify_nm">일반상품이율</h4>
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
                                            <th style="width: 20%;" class="center">상품명</th>
                                            <th style="width: 15%;" class="center">상품유형</th>
                                            <th style="width: 20%;" class="center">판매기간</th> 
                                            <th style="width: 20%;" class="center">이율적용기간</th>
                                            <th style="width: 15%;" class="center">이자과세</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="item in printInfo.prodList">
                                            <td class="center">{{item.prod_no}}</td>
                                            <td class="center">{{item.prod_nm}}</td>
                                            <td class="center">{{item.prod_type}}</td>
                                            <td class="center">{{item.sale_beg_dt}}~{{item.sale_end_dt}}</td>
                                            <td class="center">{{item.air_beg_dt}}~{{item.air_end_dt}}</td>
                                            <td class="center">{{item.interest_ta}}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
					    <button type="button" class="btn btn-primary btn-icon icon-left" @click="print">
					        <i class="fa fa-print"></i> 인쇄
					    </button>
					    <button type="button" class="btn btn-secondary btn-icon icon-left" data-dismiss="modal">
					        Close 
					    </button>
					</div>

                </div>
            </div>
        </template>
    </div>
    
    <!-- 출력팝업DIV -->
    <div class="modal fade" id="popup_Customer">
        <template>
            <div class="modal-dialog" style="width: 80%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true" id="btn_popClose">&times;</button>
                        <h4 class="modal-title" id="modify_nm">고객맞춤프로모션</h4>
                    </div>
                    <div class="panel-body" style="display: flex;border: 2px solid #00CDFF;width: 100%;">	
                    
                    <div class="left-panel" style="width: 40%; border-right: 2px solid #00CDFF;">

                            <div class="form-group">
                            	<label for="err_eng_nm">해당 선택 상품</label>
                        	</div>	

                            <div class="form-group" id="printArea">
                                <table class="table datatable dataTable">
                                    <thead>
                                        <tr class="replace-inputs">
                                            <th style="width: 15%;" class="center">상품코드</th>
                                            <th style="width: 20%;" class="center">상품명</th>
                                            <th style="width: 20%;" class="center">가입대상</th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="item in printInfo.prodList">
                                            <td class="center">{{item.prod_no}}</td>
                                            <td class="center">{{item.prod_nm}}</td>
                                            <td class="center">{{item.sub_tg}}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                    </div>
                    
                    
                    <div class="right-panel"  style="width: 60%;">
                        <div class="form-group">
                            <label for="err_eng_nm">해당 맞춤 고객</label>
                        </div>	
                        <div class="form-group" id="printArea">
                                <table class="table datatable dataTable">
                                    <thead>
                                        <tr class="replace-inputs">
                                            <th style="width: 15%;" class="center">고객명</th>
                                            <th style="width: 20%;" class="center">고객전화번호</th>
                                            <th style="width: 20%;" class="center">고객생년월일</th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="item in cusList">
                                            <td class="center">{{item.cust_nm}}</td>
                                            <td class="center">{{item.cust_mbl_telno}}</td>
                                            <td class="center">{{item.cust_birth}}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                       
                    
                    </div>
                    <div class="modal-footer">
                    	<button type="button" class="btn btn-primary btn-icon icon-left" @click="print">
					        <i class="fa fa-print"></i> 인쇄
					    </button>
					    <button type="button" class="btn btn-secondary btn-icon icon-left" data-dismiss="modal">
					        Close 
					    </button>
					</div>

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
        price_max: "",
        price_min: "",
		promtn_yn: "",
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
            this.promtn_yn = params.promtn_yn;
            this.price_max = params.price_max;
            this.price_min = params.price_min;

            this.getList();
        } else {
            cv_sessionStorage
                .removeItem("pagingConfig")
                .removeItem("params");
            this.getList(true);
        }
        $('#Customer').hide();
    },
    methods: {
    	getListCond : function(isInit){
    		var regex = /^\d{4}-\d{2}-\d{2}$/;
            if (this.sale_beg_dt && !regex.test(this.sale_beg_dt)) {
                alert('날짜 형식이 올바르지 않습니다. yyyy-mm-dd 형식으로 입력해주세요.');
                // 형식에 맞지 않는 경우 입력을 초기화하거나 기타 작업을 수행할 수 있습니다.
                return;
            }
            else if(this.sale_end_dt && !regex.test(this.sale_end_dt)){
            	alert('날짜 형식이 올바르지 않습니다. yyyy-mm-dd 형식으로 입력해주세요.');
            	return;
            }
			this.all_srch = "N";
			this.getList(isInit);
			if(this.promtn_yn !== 'N' && this.promtn_yn !== ''){
				$('#Customer').show();
			} else{
				$('#Customer').hide();
			}
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
                        price_max: this.price_max,
                        price_min: this.price_min,
                        promtn_yn: this.promtn_yn,
            	}
            }
                
            
            
            cv_sessionStorage
                .setItem('pagingConfig', cv_pagingConfig)
                .setItem('params', params);

            cf_ajax("/sell/getList", params, this.getListCB);
        },
        
        getListCB: function(data){
            this.dataList = data.list;
            for (var i = 0; i < this.dataList.length; i++) {
                this.dataList[i].prod_no = this.dataList[i].prod_no;
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
		formatCurrency(value) {
            if (!value) return '';
            return parseFloat(value).toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' });
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
		
		popupCustomer : function(prod_no) {
			var chkedList = $("[name=is_check]:checked");
			if (chkedList.length == 0) {
				alert("출력할 대상을 선택하여 주십시오.");
				return;
			} else if(chkedList.length !== 1) {
				alert("출력할 대상을 하나만 선택하여 주십시오");
				return;
			}
			//check list 가져오기..
			var data = [];
			var idx;
			 // 선택된 각 체크박스를 순회
		    chkedList.each(function() {
		        idx = $(this).attr("data-idx");
		        // dataList에서 prod_no가 idx와 일치하는 항목을 찾기
		        var item = vueapp.dataList.find(function(item) {
		            return item.prod_no == idx;
		        });
		        if (item) {
		        	data.push(item);
		        } else {
		            console.error('유효하지 않은 데이터:', idx);
		        }
		    });
			console.log(data.sub_tg);
			
			//출력팝업 띄우기
			popup_Customer.init(data);
			$('#popup_Customer').modal('show');
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
var popup_Customer = new Vue(
		{
			el : "#popup_Customer",
			data : {
				printInfo : {
					prodList : [],
					
				},
				cusList : [],
				
			},
			methods : {
				init : function(data) {
					
					this.initInfo(data);
					this.getInfo(data);
					
				},
				initInfo : function(data) {
					this.getInfo(data);
					this.printInfo = {
						prodList : data,	
					};
					
				},
				
				getInfo : function(data){
					
					var params = {
							sub_tg : data
					}
					cf_ajax("/sell/custom", params, this.getInfoCB); 
		 
				},
				getInfoCB : function(data){
					console.log(data);
					this.cusList = data;	
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
</script>

</html>