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
    <link rel="stylesheet" href="/static_resources/system/team2/team2_css/customer.css">
    <title>고객목록관리</title>
</head>

<body class="page-body">
    <div class="page-container">
      <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false" />
        <div class="main-content">
          <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false" />

         <ol class="breadcrumb bc-3">
         <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
         <li class="active"><strong>고객정보관리</strong></li>
        </ol>

        <h2 class="header" onclick="location.reload();">고객정보관리</h2>
        <br />
 		<div class="flex flex-100 flex-padding-10 flex-gap-10"
            style="justify-content:flex-end;">
            <button type="button" class="btn btn-blue btn-icon" style="margin-left: 5px;">
                신규회원등록
                <i class="entypo-archive"></i>
            </button>
            <button type="button" class="btn btn-blue btn-icon" style="margin-left: 5px;"
               >
                변경사항저장
                <i class="entypo-user"></i>
            </button>
            <button v-if="showButton" type="button" class="btn btn-success btn-icon" style="margin-left: 5px;"
              	>
                 저  장 
                <i class="entypo-archive"></i>
            </button>
             <button v-if="showButton" type="button" class="btn btn-blue btn-icon" style="margin-left: 5px;"
                >
                 취  소 
                <i class="entypo-archive"></i>
            </button>
        </div>
	        <div class="flex-column flex-gap-10 dataTables_wrapper" id="vueapp" >
	        <template>
  		        <div class="flex-container">
                    <div class="searchbar">
                        <h2>고객 검색</h2>
                        <input type="text" name="keyword" id="keyword" v-model="keyword">
                        <button type="button" value="condition" class="btn btn-outline-secondary btn-sm" @click="getCustList()">조건검색</button>
                        <button type="button" class="btn btn-outline-secondary btn-sm" @click="searchAll">전체검색</button>
                        <div class="table-container">
                            <table class="table table-bordered datatable dataTable">
                            <tbody>
				                <tr v-for="(item, index) in dataList" :key="item.cust_mbl_telno">
				                    <td style="vertical-align: top;">
				                        <input class="form-check-input" type="radio" name="flexRadioDefault" :value="item.cust_pridtf_no" :id="'custList' + index" />
				                        <label class="form-check-label" :for="'custList' + index">
				                            {{ item.cust_nm }}
				                        </label>
				                    </td>
				                </tr>
			                </tbody>
				            </table>
                        </div>
               		</div>
                
                    <div class="content">
                        <h2>회원정보</h2>
 							 <table class="table table-bordered">
			        <tbody>
			            <tr>
			                <td class="col-sm-4 control-label"><label for="cust_nm">성명</label></td>
			                <td class="col-sm-8"><input type="text" id="cust_nm" v-model="info.cust_nm" class="form-control" :readonly="isEmpty(info.cust_sn)"></td>
			            </tr>
			            <tr>
			                <td class="col-sm-4 control-label"><label for="cust_pridtf_no">실명번호</label></td>
			                <td class="col-sm-8"><input type="text" id="cust_pridtf_no" v-model="info.cust_pridtf_no" class="form-control" :readonly="isEmpty(info.cust_sn)"></td>
			            </tr>
			            <tr>
			                <td class="col-sm-4 control-label"><label for="cust_eml_addr">E-mail</label></td>
			                <td class="col-sm-8"><input type="text" id="cust_eml_addr" v-model="info.cust_eml_addr" class="form-control"></td>
			            </tr>
			            <tr>
			                <td class="col-sm-4 control-label"><label for="cust_home_telno">전화번호</label></td>
			                <td class="col-sm-8"><input type="text" id="cust_home_telno" v-model="info.cust_home_telno" class="form-control"></td>
			            </tr>
			            <tr>
			                <td class="col-sm-4 control-label"><label for="cust_mbl_telno">핸드폰번호</label></td>
			                <td class="col-sm-8"><input type="text" id="cust_mbl_telno" v-model="info.cust_mbl_telno" class="form-control"></td>
			            </tr>
			            <tr>
			                <td class="col-sm-4 control-label"><label for="cust_cr_no">직업</label></td>
			                <td class="col-sm-8">
			                    <select id="cust_cr_no" class="form-control" v-model="info.cust_cr_no">
			                        <option value="JB01">학생</option>
			                        <option value="JB02">공무원</option>
			                        <option value="JB03">회사원</option>
			                        <option value="JB04">자영업자</option>
			                        <option value="JB05">프리랜서</option>
			                        <option value="JB06">무직</option>
			                        <option value="JB07">기타</option>
			                    </select>
			                    <input v-if="showInput" type="text" v-model="info.other_cr" placeholder="직업명 입력">
			                </td>
			            </tr>
			            <tr>
			                <td class="col-sm-4 control-label"><label for="cust_road_addr">주소</label></td>
			                <td class="col-sm-8"><textarea id="cust_road_addr" v-model="info.cust_road_addr" class="form-control" style="resize: none;"></textarea></td>
			            </tr>
			            <tr>
			                <td class="col-sm-4 control-label"><label for="emp_nm">담당자명</label></td>
			                <td class="col-sm-8">
			                    <div class="input-group">
			                        <input type="text" id="emp_nm" v-model="info.emp_nm">
			                        <span class="input-group-btn">
			                            <button class="btn btn-default" type="button" ><i class="fa fa-search"></i></button>
			                        </span>
			                    </div>
			                </td>
			            </tr>
			            <tr>
			                <td class="col-sm-4 control-label"><label for="emp_dept">부서</label></td>
			                <td class="col-sm-8"><input type="text" id="emp_dept" v-model="info.emp_dept" class="form-control" readonly></td>
			            </tr>
			            <tr>
			                <td class="col-sm-4 control-label"><label for="emp_posit">직위</label></td>
			                <td class="col-sm-8"><input type="text" id="emp_posit" v-model="info.emp_posit" class="form-control" readonly></td>
			            </tr>
			            <tr>
			                <td class="col-sm-4 control-label"><label for="emp_mbl_telno">연락처</label></td>
			                <td class="col-sm-8"><input type="text" id="emp_mbl_telno" v-model="info.emp_mbl_telno" class="form-control" readonly></td>
			            </tr>
			        </tbody>
			    </table>
   			</div>
            <div class="consulting">
                <h2>상담내역</h2>
                <table>
                    <tr>
                        <td style="vertical-align: top;">
                            2024-06-10 오후 1시 퇴직 연금 가입 안내 미팅.<br>
                            2024-06-11 오전 10시 주식 투자 전략 논의.<br>
                            2024-06-16 오후 2시 세금 최적화 전략 논의.<br>
                            2024-06-19 오전 11시 재산 관리 방안 논의.<br>
                        </td>
                    </tr>
                </table>
                <br>
            </div>
            <div class="subjectItem">
                <h2>가입내역? 설계내역?</h2>
                <table>
                    <tr>
                        <td style="vertical-align: top;">
                            2024-06-10 오후 1시 퇴직 연금 가입 안내 미팅.<br>
                            2024-06-11 오전 10시 주식 투자 전략 논의.<br>
                            2024-06-16 오후 2시 세금 최적화 전략 논의.<br>
                            2024-06-19 오전 11시 재산 관리 방안 논의.<br>
                        </td>
                    </tr>
                </table>
                <br>
            </div>
        </div>
        </template>
    </div>

<script type="text/javascript">
var vueapp = new Vue({
    el: "#vueapp",
    data: {
    	info: {
        	cust_pridtf_no: "${cust_pridtf_no}",
            cust_nm: "",
            cust_eml_addr: "",
            cust_home_telno: "",
            cust_mbl_telno: "",
            cust_cr_no: "",
            cust_road_addr: "",
            other_cr: "",
            emp_no: "",
            emp_nm: "",
            emp_dept: "",
            emp_posit: "",
            emp_mbl_telno: "",
        },
        dataList: [],
		cnslt_dt: "",
        cnslt_emp_nm: "",
        cnslt_cn: "",
        cnslt_cn_add: "",
        cnsltList: [],
        cnsltItems: "",
        comm_List: "",
        keyword: "",
            
    },
    computed: {
        showInput() {
          return this.info.cust_cr_no === 'JB07';
        }, 
     },
    mounted: function () {
            this.getCustList();
    },
    methods: {
    	getCustList: function () {
            var params = {
                keyword: this.keyword
            }
            console.log(params)
            cf_ajax("/customer/getCustList", params, this.getListCB);
        },
        getListCB: function (data) {
            console.log(data);
            this.dataList = data;
        },
        searchAll: function (){
        	this.keyword = null;
        	this.getCustList();
        },
        isEmpty(value) {
            return value !== '';
        },
		isNotEmpty(value){
			return value === '';
		},
    }
});
    </script>
</body>
</html>