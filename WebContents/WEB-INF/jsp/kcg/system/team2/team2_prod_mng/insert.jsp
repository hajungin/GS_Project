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
	<link rel="stylesheet" href="/static_resources/system/js/datatables/proddtl.css">
	
	<title>상품등록</title>
	<style>
    #vueapp {
        display: flex;
        justify-content: center;
    }
</style>
</head>
<body class="page-body">

<div class="page-container">

	<jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false"/>

	<div class="main-content">

		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false"/>
		
		<ol class="breadcrumb bc-3">
			<li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
			<li class="active"><strong>상품등록관리</strong></li>
		</ol>
	
		<h2>상품관리 > 상품등록관리</h2>
		<br/>
		
		<div class="row">
			<div id="vueapp" style="display: flex;justify-items: center;" >
			<template>
			<div class="card" style="width: 1000px;">
				<div class="panel-body flex-100" >			
					<div class="left-panel flex-66">
						<div class="form-group">
							<label for="prod_nm" class="fix-width-33">상품명:</label>
							<input type="text" class="form-control" id="prod_nm" v-model="info.prod_nm">
						</div>
						<div class="form-group">
							<label for="prod_no" class="fix-width-33">상품코드:</label>
							<input type="text" class="form-control" id="prod_no" v-model="info.prod_no" disabled="disabled" >
						</div>
						
						<div class="form-group">
							<label for="prod_type" class="fix-width-33">상품유형:</label>
						        <select class="form-control" id="prod_type" v-model="info.prod_type" @change="generateProductCode">
						            <option value="" disabled selected>상품유형을 선택하세요</option>
						            <option value="PT01">적금설계</option>
						            <option value="PT04">목돈마련</option>
						            <option value="PT02">예금설계</option>
						            <option value="PT03">대출설계</option>
						        </select>
						</div>
			
						<div class="form-group">
							<label for="sub_tg" class="fix-width-33">가입대상:</label>
							<select class="form-control" id="sub_tg" v-model="info.sub_tg">
								<option value="" disabled selected>가입대상을 선택하세요</option>
								<option value="ST01">일반개인</option>
								<option value="ST02">청년생활</option>
								<option value="ST03">소상공인</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="ntsl_amt_min" class="fix-width-33">가입금액:</label>
							<div class="form-control">
								<label>(최소)</label>
								<input type="text"  id="price_min" v-model="info.price_min">
								<label>원 ~ </label>
								<br>
								<label>(최대)</label>
								<input type="text"  id="price_max" v-model="info.price_max">
								<label>원</label>
							</div>
						</div>
						
						<div class="form-group">
							<label for="pay_period" class="fix-width-33">납입기간:</label>
							<input type="text" class="form-control" id="pay_period" v-model="info.pay_period" placeholder="개월">
						</div>
						
						<div class="form-group">
							<label for="pay_cycle" class="fix-width-33">납입주기:</label>
							<select class="form-control" id="pay_cycle" v-model="info.pay_cycle">
								<option value="" disabled selected>납입주기를 선택하세요</option>
								<option value="PC01">월납</option>
								<option value="PC02">년납</option>
								<option value="PC03">일시납</option>
							</select>
						</div>		
			
									
		
						<div class="form-group">
							<label for="prod_air_max" class="fix-width-33">적용이율:</label>
							<div class="form-control">
								<label>(최소)</label>
								<input type="text" id="air_min" v-model="info.air_min">
								<label>%  ~ </label>
								<br>
								<label>(최대)</label>
								<input type="text"  id="air_max" v-model="info.air_max">
								<label>%</label>
							</div>
						</div>
		
						<div class="form-group">
							<label for="prod_air_bgng_ymd" class="fix-width-33">이율 적용기간:</label>
							<div class="form-control">
								<input type="date"  id="air_beg_dt" v-model="info.air_beg_dt">
								<label>To</label>
								<input type="date"  id="air_end_dt" v-model="info.air_end_dt">
								<label>End</label>
							</div>
						</div>
		
						<div class="form-group">
							<label for="interest_ta" class="fix-width-33">이자과세구분:</label>
							<select class="form-control" id="interest_ta" v-model="info.interest_ta">
								<option value="" disabled selected>이자과세구분을 선택하세요</option>
								<option value="IT01">일반과세</option>
								<option value="IT02">세금우대</option>
								<option value="IT03">비과세</option>
							</select>
						</div>						
						
						<div class="form-group">
							<label for="sale_stat" class="fix-width-33">판매상태:</label>
							<select class="form-control" id="sale_stat" v-model="info.sale_stat">
								<option value="" disabled selected>판매상태를 선택하세요</option>
								<option value="SS02">판매진행</option>
								<option value="SS01">판매예정</option>
							</select>
						</div>		
						
						<div class="form-group">
							<label for="promtn_yn" class="fix-width-33">프로모션:</label>
							<select class="form-control" id="promtn_yn" v-model="info.promtn_yn">
								<option value="" disabled selected>프로모션 여부를 선택하세요</option>
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</div>				
		
						<div class="form-group">
							<label for="ntsl_bgng_ymd" class="fix-width-33">판매기간:</label>
							<div class="form-control">
								<input type="date"  id="sale_beg_dt" v-model="info.sale_beg_dt">
								<label>To</label>
								<input type="date"  id="sale_end_dt" v-model="info.sale_end_dt">
								<label>End</label>
							</div>
						</div>
							
						<div class="form-group">
							<div class="">
								<button type="button" class="btn btn-green btn-icon btn-small" @click="save">
									등록
									<i class="entypo-check"></i>
								</button>
								
								<button type="button" class="btn btn-blue btn-icon btn-small" @click="cf_movePage('/2team/prod/list')">
									목록
									<i class="entypo-list"></i>
								</button>
							</div>
						</div>
					</div>
					</div>
			</div>						
			</template>		

			</div>
		</div>
		
		<br />
		
		<jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false"/>
		
	</div>
</div>
</body>
<script>

var vueapp = new Vue({
	el : "#vueapp",
	data : {
		info : {
			// 초기 선택값을 빈 문자열로 설정
			prod_type: "", 
			sale_stat: "",
			pay_cycle: "",
			sub_tg: "",
			promtn_yn: "",
			interest_ta: "",
			// 현재 날짜 적용하기 위해 초기화
			air_beg_dt: "",
            air_end_dt: "",
            sale_beg_dt: "",
            sale_end_dt: "",
            price_min: "",
            price_max: "",
			
            
			code: ""
		},
	},
	mounted() {
	    this.info.prod_type = "";
	    this.info.sale_stat = "";
	    this.info.pay_cycle = "";
	    this.info.sub_tg = "";
	    this.info.promtn_yn = "";
	    this.info.interest_ta = "";
	    this.info.prod_no="";
	    this.info.price_min="";
	    this.info.price_max="";
	    // 날짜 가져오기
	    const today = new Date();
        const nextMonth = new Date(today);
        nextMonth.setMonth(today.getMonth() + 1);

        const year = today.getFullYear();
        const month = String(today.getMonth() + 1); // getMonth()는 0부터 시작하므로 +1
        const day = String(today.getDate());

        const nextYear = nextMonth.getFullYear();
        const nextMonthFormatted = String(nextMonth.getMonth() + 1).padStart(2, '0'); // getMonth()는 0부터 시작하므로 +1
        const nextDay = String(nextMonth.getDate()).padStart(2, '0');

        
        // 현재 날짜를 'YYYY-MM-DD' 형식으로 설정
//         this.info.air_beg_dt = `${year}-${month}-${day}`;
//         this.info.air_end_dt = `${nextYear}-${nextMonthFormatted}-${nextDay}`;
//         this.info.sale_beg_dt = `${year}-${month}-${day}`;
//         this.info.sale_end_dt = `${nextYear}-${nextMonthFormatted}-${nextDay}`;
        console.log(this.info.air_beg_dt); // 콘솔에서 값 확인
        console.log(this.info.air_end_dt); // 콘솔에서 값 확인
        console.log(this.info.sale_beg_dt); // 콘솔에서 값 확인
        console.log(this.info.sale_end_dt); // 콘솔에서 값 확인
	  },
	methods : {
		generateProductCode() {
		    cf_ajax("/2team/prod/code", { prod_type: this.info.prod_type }, this.code.bind(this));
		},
		// 상품 유형 선택 시 자동으로 판매중으로 설정
		updateProductStat() {
		      if(this.info.prod_type != null){
		    	  this.info.sale_stat = "SS01";
		      }
		    },
		code(data) {
		    this.info.prod_no = data.prod_no + 1; // 상품코드 + 1 값으로 변경
		},

		 
		save : function(){
			// Date 객체로 변환
            const air_beg_date = new Date(this.info.air_beg_dt);
            const air_end_date = new Date(this.info.air_end_dt);
            const sale_beg_date = new Date(this.info.sale_beg_dt);
            const sale_end_date = new Date(this.info.sale_end_dt);
			
			if(cf_isEmpty(this.info.prod_nm)){
				alert("상품명을 입력하세요.");
				return;
			}
			else if(cf_isEmpty(this.info.prod_type)){
				alert("상품유형을 입력하세요.");
				return;
			}
			else if(cf_isEmpty(this.info.sub_tg)){
				alert("가입대상을 입력하세요.");
				return;
			}
			else if(cf_isEmpty(this.info.price_min && this.info.price_max)){
				alert("가입금액을 입력하세요.");
				return;
			}
			else if(parseInt(this.info.price_min) > parseInt(this.info.price_max)) {
			    alert("가입금액 최소가 더 클 수 없습니다.");
			    return;
			}
			else if(cf_isEmpty(this.info.pay_period)){
				alert("납입기간을 입력하세요.");
				return;
			}
			else if(cf_isEmpty(this.info.pay_cycle)){
				alert("납입주기를 입력하세요.");
				return;
			}
			else if(cf_isEmpty(this.info.air_min && this.info.air_max)){
				alert("적용이율을 입력하세요.");
				return;
			}
			else if(parseFloat(this.info.air_min) > parseFloat(this.info.air_max)) {
			    alert("적용이율 최소가 더 클 수 없습니다.");
			    return;
			}
			else if(cf_isEmpty(this.info.air_beg_dt && this.info.air_end_dt)) {
			    alert("적용기간을 입력하세요.");
			    return;
			}
			else if (air_beg_date > air_end_date) {
                alert("적용기간의 시작일은 종료일보다 늦을 수 없습니다.");
                return;
            }
			else if(cf_isEmpty(this.info.interest_ta)){
				alert("이자과세를 입력하세요.");
				return;
			}
			else if(cf_isEmpty(this.info.sale_stat)){
				alert("판매상태를 입력하세요.");
				return;
			}
			else if(cf_isEmpty(this.info.promtn_yn)){
				alert("프로모션 여부를 입력하세요.");
				return;
			}
			else if(cf_isEmpty(this.info.sale_beg_dt && this.info.sale_end_dt)){
				alert("판매기간을 입력하세요.");
				return;
			}
			else if (sale_beg_date > sale_end_date) {
                alert("판매기간의 시작일은 종료일보다 늦을 수 없습니다.");
                return;
            }
			
			if(!confirm("저장하시겠습니까?")) return;
			
			cf_ajax("/2team/prod/save", this.info, this.saveCB);
		},
		saveCB : function(data){
			alert("저장되었습니다.");
			this.info.prod_cd = data.prod_cd;
		},
		delInfoCB : function(data){
			this.gotoList();
		},
	}
});
</script>
</html>