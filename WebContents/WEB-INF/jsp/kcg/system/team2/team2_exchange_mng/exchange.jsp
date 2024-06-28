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
    <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false"/>
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

		            <div>
		            	<select v-model="selectedType" id="selectType">
		                    <option value="ttb">송금 받을 때</option>
		                    <option value="tts">송금 보낼 때</option>
		                    <option value="deal_bas_r">매매 기준율</option>
		                </select>
		            </div>
						<div>
							<select v-model="selectedCurrency1" >
								<option v-for="item in dataList" :key="item.cur_unit" :value="item.cur_unit">{{ item.cur_nm }}</option>
							</select>
							<input type="text" v-model="amount1" @input="calculateExchange">
						</div>
						<div> = </div>
	                <div>
		                <select v-model="selectedCurrency2">
		                    <option v-for="item in dataList" :key="item.cur_unit" :value="item.cur_unit">{{ item.cur_nm }}</option>
		                </select>
		                <input type="text" v-model="amount2" @input="calculateExchange2">
	                </div>

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



<script src="https://cdn.jsdelivr.net/npm/vue@2.6.16/dist/vue.js"></script>
<script>
var vueapp = new Vue({
    el: "#vueapp",
    data: {
        dataList: [],       // 서버에서 받아오는 데이터를 저장할 배열
        amount1: 1,         // 입력된 금액을 저장할 변수 (초기금액 1로 설정)
        amount2: '',
        selectedType : '',
        selectedCurrency1: 'USD', // 선택된 환율 정보의 통화 단위를 저장할 변수 (초기설정 달러로)
        selectedCurrency2: 'KRW',
        deal_bas_r : '',
        ttb : '',
        tts : '',
        result: ''          // 계산된 결과를 저장할 변수
    },
    computed: {
        // cur_nm 값에서 통화국을 추출하는 메서드
        getCountry() {
        	
            return (cur_nm) => {
                if (!cur_nm) return '';
                if(cur_nm == "위안화"){
            		cur_nm = "중국 위안화"
            	}else if(cur_nm =="유로"){
            		cur_nm ="EU 유로"
            	}
                const parts = cur_nm.split(' ');
                return parts.slice(0, -1).join(' '); // 맨 마지막 단어를 제외한 나머지는 통화국
            };
        },
        // cur_nm 값에서 통화단위를 추출하는 메서드
        getCurrency() {
            return (cur_nm) => {
                if (!cur_nm) return '';
                if(cur_nm == "위안화"){
            		cur_nm = "중국 위안화"
            	}else if(cur_nm =="유로"){
            		cur_nm ="EU 유로"
            	}
                const parts = cur_nm.split(' ');
                return parts.slice(-1).join(' '); // 맨 마지막 단어는 통화단위
            };
        },
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
        	
        	// selectedCurrency1에는 선택된 통화의 cur_unit 값이 들어 있음
            const selectedCurrency = this.dataList.find(item => item.cur_unit === this.selectedCurrency1);
            const selectedCurrencyAfter = this.dataList.find(item => item.cur_unit === this.selectedCurrency2);
            console.dir(selectedCurrency);
            console.dir(selectedCurrencyAfter)
        	let amount1 = Number(this.amount1);
            if(selectedCurrency.cur_unit == "KRW"){
            	selectedCurrency.ttb = "1";
            	selectedCurrency.tts = "1";
            }else if(selectedCurrencyAfter.cur_unit =="KRW"){
            	selectedCurrencyAfter.ttb = "1";
            	selectedCurrencyAfter.tts = "1";
            }
        	 
        	 const ttb1 = parseFloat(selectedCurrency.ttb.replace(/,/g, ''));
        	const ttb2 = parseFloat(selectedCurrencyAfter.ttb.replace(/,/g, ''));
        	 const tts1 = parseFloat(selectedCurrency.tts.replace(/,/g, ''));
        	 const tts2 = parseFloat(selectedCurrencyAfter.tts.replace(/,/g, ''));
        	 const deal_bas_r1 = parseFloat(selectedCurrency.deal_bas_r.replace(/,/g, ''));
        	 const deal_bas_r2 = parseFloat(selectedCurrencyAfter.deal_bas_r.replace(/,/g, ''));
        	 
        	var formatAmount = this.amount1;
        	var formatAmount2 = this.amount2;
            if (!selectedCurrency) {
                console.error("Selected currency not found in dataList:", this.selectedCurrency1);
                return;
            }
           console.log(this.selectedType)
            // ttb 값을 이용하여 계산
            if (this.selectedType === "ttb") {
                formatAmount2 = ttb1/ttb2*amount1;
            }else if(this.selectedType === "tts"){
            	formatAmount2 = tts1/tts2*amount1;
            } else if(this.selectedType === "deal_bas_r"){
            	formatAmount2 = deal_bas_r1/deal_bas_r2*amount1;
            }
            var currencyFormat = formatAmount2.toLocaleString('en-US');
            this.amount2 = currencyFormat;
            cf_ajax("/system/exchange_mng", this.data);
        },
		calculateExchange2: function() {
        	
        	// selectedCurrency1에는 선택된 통화의 cur_unit 값이 들어 있음
            const selectedCurrency = this.dataList.find(item => item.cur_unit === this.selectedCurrency1);
            const selectedCurrencyAfter = this.dataList.find(item => item.cur_unit === this.selectedCurrency2);
            console.dir(selectedCurrency);
            console.dir(selectedCurrencyAfter)
        	let amount2 = Number(this.amount2);
            if(selectedCurrency.cur_unit == "KRW"){
            	selectedCurrency.ttb = "1";
            	selectedCurrency.tts = "1";
            }else if(selectedCurrencyAfter.cur_unit =="KRW"){
            	selectedCurrencyAfter.ttb = "1";
            	selectedCurrencyAfter.tts = "1";
            }
        	 
        	 const ttb1 = parseFloat(selectedCurrency.ttb.replace(/,/g, ''));
        	const ttb2 = parseFloat(selectedCurrencyAfter.ttb.replace(/,/g, ''));
        	 const tts1 = parseFloat(selectedCurrency.tts.replace(/,/g, ''));
        	 const tts2 = parseFloat(selectedCurrencyAfter.tts.replace(/,/g, ''));
        	 const deal_bas_r1 = parseFloat(selectedCurrency.deal_bas_r.replace(/,/g, ''));
        	 const deal_bas_r2 = parseFloat(selectedCurrencyAfter.deal_bas_r.replace(/,/g, ''));
        	 
        	var formatAmount = this.amount1;
        	var formatAmount2 = this.amount2;
            if (!selectedCurrency) {
                console.error("Selected currency not found in dataList:", this.selectedCurrency1);
                return;
            }
           console.log(this.selectedType)
            // ttb 값을 이용하여 계산
            if (this.selectedType === "ttb") {
                formatAmount = ttb2/ttb1*amount2;
            }else if(this.selectedType === "tts"){
            	formatAmount = tts2/tts1*amount2;
            } else if(this.selectedType === "deal_bas_r"){
            	formatAmount = deal_bas_r2/deal_bas_r1*amount2;
            }
            var currencyFormat = formatAmount.toLocaleString('en-US');
            this.amount1 = currencyFormat;
            cf_ajax("/system/exchange_mng", this.data);
        },
        formatCurrency: function(value) {
            if (!value) return '';
            return value.toLocaleString('en-US');
        },
        gotoDtl: function(cust_mbl_telno) {
            pop_cust_info.init(cust_mbl_telno);
            $('#pop_cust_info').modal('show');
        },
    },
});


</script>
</html>
