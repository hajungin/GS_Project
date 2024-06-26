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
            <link rel="stylesheet" href="/static_resources/system/js/datatables/promion.css">
            <link rel="stylesheet" href="/static_resources/system/js/datatables/promion.css">
			<link rel="stylesheet" href="/static_resources/system/js/datatables/billboard.css">
            <style type="text/css">
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
    #Button:hover {
        background-color: #2980B9; /* Hover 시 배경색 변경 */
    }
</style>
            
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

            <h2 class="header">판매달성률</h2>
            <br/>
            

            <div class="flex-column flex-gap-10 dataTables_wrapper" id="vueapp">
            <template>
            
            <div class="right flex-column flex-100">
			 	<div class="right-top">
                        <ul class="nav">
                            
							  <li class="nav-tab active"  @click="updateProdType('PT01')" style="background-color: #64A0FF;">적금</li>
							  <li class="nav-tab active"  @click="updateProdType('PT02')" style="background-color: #4DB6AC;">예금</li>
							  <li class="nav-tab active"  @click="updateProdType('PT03')" style="background-color: #81C784;">목돈마련</li>
							  <li class="nav-tab active"  @click="updateProdType('PT04')" style="background-color: #FFB74D;">대출</li>
							
                        </ul>
                 </div>
			</div>
			<div>
<!-- 		     선택된 상품 유형: {{ prod_type }} -->
		     <h3 v-if="prod_type == 'PT01'">적금</h3>
            <h3 v-if="prod_type == 'PT02'">예금</h3>
            <h3 v-if="prod_type == 'PT03'">목돈마련</h3>
            <h3 v-if="prod_type == 'PT04'">대출</h3>
		    </div>
		    
		    <div>
		    <li v-if="prod_type == 'PT01'">
		    적금 판매 달성 금액 : {{sa_target}}
		    </li>
		    <li v-if="prod_type == 'PT02'">
		    예금 판매 달성 금액 : {{ac_target}}
		    </li>
		    <li  v-if="prod_type == 'PT03'">
		    목돈마련 판매 달성 금액 : {{dp_target}}
		    </li>
		    <li v-if="prod_type == 'PT04'">
		    대출 판매 달성 금액 : {{lo_target}}
		    </li>	
		    </div>
		    
			
			
   
    	<div class="flex flex-100 flex-padding-10 flex-gap-10" 
						style="justify-content: flex-end; border: 2px solid #00CDFF;">
						<button type="button" id="Button" class="btn btn-blue btn-icon icon-right"
							@click="pop_price_max">
						 	목표금액 등록 <i class="entypo entypo-info"></i>
						
					</div>

    <table class="table table-bordered dataTable" style="border: 2px solid #00CDFF;" id="grid_app">
        <thead>
            <tr class="replace-inputs">
            	<th style="width: 5%; background-color: #B9FFFF;" class="center">순위</th>
                <th style="width: 10%; background-color: #B9FFFF;" class="center">담당자</th>
                <th style="width: 10%; background-color: #B9FFFF;" class="center">판매 건수</th>
                <th style="width: 10%; background-color: #B9FFFF;" class="center">판매금액</th>
                <th style="width: 10%; background-color: #B9FFFF;" class="center">달성률</th>         
            </tr>
        </thead>
        <tbody>
            <tr v-for="(item,index) in dataList"style="cursor: pointer;">
               	<td class="center">{{index+1}}</td>
                <td class="center">{{item.emp_nm}}</td>
                <td class="center">{{item.count}}</td>
                <td class="center">{{formatCurrency(item.total_price)}}</td>
                <td class="center"></td>
            </tr>
        </tbody>
    </table>
    
</div>


            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false" />
        </template>
        </div>
    </div>
    
    <!-- 팝업 -->
          <div class="modal fade" id="pop_price_max" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog" style="width: 1000px;">
		        <div class="modal-content">
		       	 <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" @click="close" aria-hidden="true" id="btn_popClose" >&times;</button>
						<h4 class="modal-title" id="modify_nm">판매금액설정</h4>
					</div> 
			            <div class="modal-body">
			                <div style="max-height: 700px;  overflow: auto;" class="dataTables_wrapper">
			                    <table class="table table-bordered datatable dataTable">
			                        <thead style="position: sticky; top: 0;">
			                            <tr>
			                                <th class="center" style="width: 10%;">적금</th>
			                                <th class="center" style="width: 10%;">예금</th>
			                                <th class="center" style="width: 10%;">목돈마련</th>
			                                <th class="center" style="width: 10%;">대출</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <tr  class="input-row">
			                                <td class="center"><input type="text" v-model="sa_target"></td>
			                                <td class="center"><input type="text" v-model="ac_target"></td>
			                                <td class="center"><input type="text" v-model="dp_target"></td>
			                                <td class="center"><input type="text" v-model="lo_target"></td>
			                        </tbody>
			                    </table>
			                    <div style="text-align: center; margin-bottom: 5px;">
			                		<button type="button" class="btn btn-green" style="margin-left: 5px;" @click="save">변경사항저장</button>
		                		</div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
           <!-- 팝업 -->
</body>

        <script>
        var vueapp = new Vue({
            el: "#vueapp",
            data: {
                dataList: [], 
                prod_type: "PT01",
                sa_target: "1000",
                ac_target: "",
                dp_target: "",
                lo_target: "",
            },
            mounted: function(){
                    this.getInfoList();
            },
            methods: {
                updateProdType(type) {
                    this.prod_type = type;
                    this.getInfoList();
                },
   
                getInfoList: function () {
                    var params = {
                        prod_type: this.prod_type
                    };

                    cf_ajax("/sell/achievement", params, this.getListCB);
                },
                getListCB: function (data) {
                    console.log(data);
                    this.dataList = data;
                },
                formatCurrency(value) {
                    if (!value) return '';
                    return parseFloat(value).toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' });
                },
                pop_price_max: function () {
                	$('#pop_price_max').modal('show');
                	pop_price_max.init(this.sa_target, this.ac_target, this.dp_target, this.lo_target);
                	
                },
                Saveinit : function(sa_target, ac_target, dp_target, lo_target) {
                	this.sa_target = sa_target;
                	this.ac_target = ac_target;
                	this.dp_target = dp_target;
                	this.lo_target = lo_target;
                   	 },
                

            },
        });
        var pop_price_max = new Vue({
            el: "#pop_price_max",
            data: {
            	sa_target: "",
                ac_target: "",
                dp_target: "",
                lo_target: "",
            },
            mounted: function(){
            	this.init();
                
            },
            methods: {
            	save() {
                    this.$emit('submit', {
                        sa_target: this.sa_target,
                        ac_target: this.ac_target,
                        dp_target: this.dp_target,
                        lo_target: this.lo_target
                    });
                    this.close();
                },
                
                init : function(sa_target, ac_target, dp_target, lo_target) {
                	this.sa_target = sa_target;
                	this.ac_target = ac_target;
                	this.dp_target = dp_target;
                	this.lo_target = lo_target;
                   	 },
                   	 
                vueapp: function () {
                   	vueapp.Saveinit(this.sa_target, this.ac_target, this.dp_target, this.lo_target);     	
                     },
            }
        });

        </script>

        </html>