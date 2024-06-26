<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header_meta.jsp" flush="false"/>
    <link rel="stylesheet" href="/static_resources/system/js/datatables/datatables.css">
    <link rel="stylesheet" href="/static_resources/system/js/datatables/proddtl.css">
    <link rel="stylesheet" href="/static_resources/system/js/select2/select2-bootstrap.css">
    <link rel="stylesheet" href="/static_resources/system/js/select2/select2.css">
    <title>관리자시스템</title>
</head>
<body class="page-body">
<div class="page-container">
    <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false"/>
    <div class="main-content">
        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
        <ol class="breadcrumb bc-3">
            <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
            <li class="active"><strong>환전</strong></li>
        </ol>
        <h2>환전하기</h2>
        
        
        <div class="flex-column flex-gap-10" id="vueapp">
        
	        <div class="calculator-container">
	            <h3>환율 계산기</h3>
	            <div class="calculator">
	            	<!-- <select v-model="exchageType">
	                    <option>송금 받을 때</option>
	                    <option>송금 보낼 때</option>
	                </select> -->
	            
	                <select v-model="selectedCurrency1">
	                    <option v-for="item in dataList" :value="item.cur_unit" :selected="item.cur_unit === 'USD'">{{ item.cur_nm }}</option>
	                </select>
	                <input type="number" v-model="amount1" value="item.result">
	                <br/>
	                
	                <select v-model="selectedCurrency2">
	                    <option v-for="item in dataList" :value="item.cur_unit" :selected="item.cur_unit === 'KRW'">{{ item.cur_nm }}</option>
	                </select>
	                <input type="number" v-model="amount2" value="item.result">
	            </div>
	        </div>
	        <br/>
        
        
        
        
        
        
        
        
            <template>
                <table class="table table-bordered datatable dataTable" style="border: 1px solid #999999;">
                    <thead>
                        <tr class="replace-inputs">
                        	<th style="width: 5%;" class="center">코드</th>
                            <th style="width: 10%;" class="center">통화국</th>
                            <th style="width: 20%;" class="center">통화단위</th>
                            <th style="width: 20%;" class="center">송금 받을 때</th>
                            <th style="width: 20%;" class="center">송금 보낼 때</th>
                            <th style="width: 20%;" class="center">매매 기준율</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="item in dataList" :key="item.cur_unit" style="cursor: pointer;">
                        	<td class="center">{{ item.cur_unit }}</td>
                            <td class="center">{{ getCountry(item.cur_nm) }}</td>
                            <td class="center">{{ getCurrency(item.cur_nm) }}</td>
                            <td class="center">{{ item.ttb }}</td>
                            <td class="center">{{ item.tts }}</td>
                            <td class="center">{{ item.deal_bas_r }}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="dataTables_paginate paging_simple_numbers" id="div_paginate"></div>
            </template>
        </div>
        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false"/>
    </div>
</div>

<!-- 환율 정보 그래프 팝업 -->
<div class="modal fade" id="pop_cust_info">
    <template>
        <div class="modal-dialog" style="width: 80%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="btn_popClose">&times;</button>
                    <h4 class="modal-title" id="modify_nm">고객기본정보</h4>
                </div>
                <div class="modal-body">
                    <div class="panel-body" style="display: flex; border: 1px solid #FF0000; width: 100%;">
                        <div class="left-panel" style="width: 50%;">
                            <div class="form-group">
                                <label for="wrt_dt" class="fix-width-33">작성일자:</label>
                                <input type="text" class="form-control" id="wrt_dt" v-model="info.wrt_dt">
                            </div>
                            <div class="form-group">
                                <label for="cust_nm" class="fix-width-33">성명:</label>
                                <input type="text" class="form-control" id="cust_nm" v-model="info.cust_nm">
                            </div>
                            <div class="form-group">
                                <label for="rrno" class="fix-width-33">실명번호:</label>
                                <input type="text" class="form-control" id="rrno" v-model="info.rrno">
                            </div>
                            <div class="form-group">
                                <label for="cust_eml_addr" class="fix-width-33">E-mail:</label>
                                <input type="text" class="form-control" id="cust_eml_addr" v-model="info.cust_eml_addr">
                            </div>
                            <div class="form-group">
                                <label for="co_telno" class="fix-width-33">전화번호:</label>
                                <input type="text" class="form-control" id="co_telno" v-model="info.co_telno">
                            </div>
                            <div class="form-group">
                                <label for="cust_mbl_telno" class="fix-width-33">핸드폰번호:</label>
                                <input type="text" class="form-control" id="cust_mbl_telno" v-model="info.cust_mbl_telno">
                            </div>
                            <div class="form-group">
                                <label for="occp_ty_cd_nm" class="fix-width-33">직업:</label>
                                <input type="text" class="form-control" id="occp_ty_cd_nm" v-model="info.occp_ty_cd_nm">
                            </div>
                            <div class="form-group">
                                <label for="cust_addr" class="fix-width-33">주소:</label>
                                <input type="text" class="form-control" id="cust_addr" v-model="info.cust_addr">
                            </div>
                        </div>
                        <div class="right-panel" style="width: 50%;">
                            <div class="form-group">
                                <label for="tsk_dtl_cn">상담내역:</label>
                            </div>
                            <div>
                                <textarea id="tsk_dtl_cn" v-model="info.tsk_dtl_cn" style="width: 100%;"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </template>
</div>
<!--// 고객기본정보조회 팝업 -->

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.16/dist/vue.js"></script>
<script>
var vueapp = new Vue({
    el: "#vueapp",
    data: {
        dataList: [],       // 서버에서 받아오는 데이터를 저장할 배열
        amount1: 1,         // 입력된 금액을 저장할 변수 (초기금액 1로 설정)
        amount2: '',         
        selectedCurrency1: 'USD', // 선택된 환율 정보의 통화 단위를 저장할 변수 (초기설정 달러로)
        selectedCurrency2: 'KRW',
        result: ''          // 계산된 결과를 저장할 변수
    },
    computed: {
        // cur_nm 값에서 통화국을 추출하는 메서드
        getCountry() {
            return (cur_nm) => {
                if (!cur_nm) return '';
                const parts = cur_nm.split(' ');
                return parts.slice(0, -1).join(' '); // 맨 마지막 단어를 제외한 나머지는 통화국
            };
        },
        // cur_nm 값에서 통화단위를 추출하는 메서드
        getCurrency() {
            return (cur_nm) => {
                if (!cur_nm) return '';
                const parts = cur_nm.split(' ');
                return parts.slice(-1).join(' '); // 맨 마지막 단어는 통화단위
            };
        }
    },
    mounted: function() {
        this.getList(true);
    },
    methods: {
        getList: function(isInit) {
            if (isInit === true) {
                this.getListFromServer();
            } else {
                this.getListFromServer();
            }
        },
        getListFromServer: function() {
            var self = this;
            var params = {};
            cf_ajax("/system/exchange_mng/getExchangeInfo", params, function(data) {
                self.dataList = data;
            });
        },
        calculateExchange: function() {
            if (!this.amount || isNaN(this.amount) || !this.selectedCurrency) {
                alert("올바른 금액과 통화를 선택하세요.");
                return;
            }
            var selectedItem = this.dataList.find(item => item.cur_unit === this.selectedCurrency);
            if (!selectedItem) {
                alert("선택된 환율 정보가 없습니다.");
                return;
            }
            var rate = parseFloat(selectedItem.deal_bas_r.replace(/,/g, ''));
            var result = this.amount * rate;
            this.result = result.toFixed(2); // 소수점 2자리까지 표시
        },
        gotoDtl: function(cust_mbl_telno) {
            pop_cust_info.init(cust_mbl_telno);
            $('#pop_cust_info').modal('show');
        },
    },
});

var pop_cust_info = new Vue({
    el: "#pop_cust_info",
    data: {
        info: {
            cust_mbl_telno: "",
            wrt_dt: "",
            cust_nm: "",
            rrno: "",
            cust_eml_addr: "",
            co_telno: "",
            cust_mbl_telno: "",
            occp_ty_cd_nm: "",
            cust_addr: "",
            tsk_dtl_cn: "",
        }
    },
    methods: {
        init: function(cust_mbl_telno) {
            this.initInfo();
            this.info.cust_mbl_telno = cust_mbl_telno;
            if (cust_mbl_telno) {
                this.getInfo();
            }
        },
        initInfo: function() {
            this.info = {
                cust_mbl_telno: "",
                wrt_dt: "",
                cust_nm: "",
                rrno: "",
                cust_eml_addr: "",
                co_telno: "",
                cust_mbl_telno: "",
                occp_ty_cd_nm: "",
                cust_addr: "",
                tsk_dtl_cn: "",
            };
        },
        getInfo: function() {
            var params = {
                cust_mbl_telno: this.info.cust_mbl_telno,
            };
            cf_ajax("/custMng/getInfo", params, this.getInfoCB);
        },
        getInfoCB: function(data) {
            this.info = data;
        },
    },
});

</script>
</html>
