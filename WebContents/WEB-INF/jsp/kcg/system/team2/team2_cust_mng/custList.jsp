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
    <title>관리자시스템</title>
</head>

<body class="page-body">

    <div class="page-container">

        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false" />

        <div class="main-content">

            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false" />

            <ol class="breadcrumb bc-3">
                <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
                <li class="active"><strong>고객정보 목록 조회</strong></li>
            </ol>

            <h2>고객정보 목록</h2>
            <br />

            <div class="flex-column flex-gap-10" id="vueapp">
                <template>
                    <div class="flex flex-100">
                        <div class="flex-wrap flex-90 flex flex-gap-10 flex-padding-10">
                            <div class="form-group flex-40">
                                <label style="text-align: center;">고객명 :</label>
                                <input class="form-control" v-model="cust_nm" value="">
                                <label class="fix-width-15">생년월일 :</label>
                                <input type="text" class="form-control" v-model="birth" placeholder="yy-mm-dd">
                                <label class="fix-width-15">관리담당자 :</label>
                                <input class="form-control" v-model="emp_nm" value="">
                                <label class="fix-width-15">이벤트구분 :</label>
                                <select id ="event" class="form-control">
                                	<option value="">전체</option>
                                	<option value="">생일</option>
                                	<option value="">만기도래</option>
                                	<option value="">기타</option>
                                </select>
                            </div>
                        </div>

                        <div class="flex-wrap flex-10 flex flex-center flex-gap-10 flex-padding-10">
                            <div class="form-group" style="width:40%; margin-right: 5%;">
                                <button type="button" class="btn btn-primary btn-icon" 
                                    v-model="search_val" @click="getCustInfoList(true)">
                                    검색
                                    <i class="entypo-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
			</div>
                    <div class="flex flex-100 flex-padding-10 flex-gap-10"
                        style="justify-content:flex-end;border: 1px solid #999999;">
                        <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;"
                            >
                            신규회원등록
                            <i class="entypo-archive"></i>
                        </button>
<!--                         <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" -->
<!--                             > -->
<!--                             관리대장출력 -->
<!--                             <i class="entypo-vcard"></i> -->
<!--                         </button> -->
                        <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;"
                            >
                            상담내역
                            <i class="entypo-user"></i>
                        </button>
                        <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;" 
                        	@click="popupEmpInfo">
                            담당자설정
                            <i class="entypo-clipboard"></i>
                        </button>
                    </div>
                    <table class="table table-bordered datatable dataTable" id="grid_app"
                        style="border: 1px solid #999999;">
                        <thead>
                            <tr class="replace-inputs">
                                <th style="width: 5%;" class="center"><input type="checkbox" id="allCheck"
                                        @click="all_check(event.target)" style="cursor: pointer;"></th>
                                <th style="width: 10%;" class="center">성명</th>
                                <th style="width: 15%;" class="center">생년월일</th>
                                <th style="width: 15%;" class="center">이메일주소</th>
                                <th style="width: 15%;" class="center">핸드폰번호</th>
                                <th style="width: 25%;" class="center">주소</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="item in dataList" @dblclick="gotoDtl(item.cust_mbl_telno)"
                                style="cursor: pointer;">
                                <td class="center" @dblclick.stop="return false;"><input type="checkbox"
                                        :data-idx="item.cust_nm" name="is_check" @click.stop="onCheck"
                                        style="cursor: pointer;">
                                </td>
                                <td class="center">{{item.cust_nm}}</td>
                                <td class="center">{{item.cust_pridtf_no.substring(0,6)}}</td>
                                <td class="center">{{item.cust_eml_addr}}</td>
                                <td class="center">{{item.cust_mbl_telno}}</td>
                                <td class="center">{{item.cust_road_addr}}</td>
                            </tr>
                        </tbody>
                    </table>
               	<div class="dataTables_paginate paging_simple_numbers" id="div_paginate">
				</div>
                </template>
            </div>
            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false" />
		</div>
	</div>
	   
	   
	   
<!-- 	   고객 정보 팝업 		-->
	<div class="modal fade" id="pop_cust_info">
    <template>
        <div class="modal-dialog modal-lg"> <!-- modal-lg 클래스를 추가하여 모달의 크기를 조정 -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="btn_popClose">&times;</button>
                    <h4 class="modal-title" id="modify_nm">고객기본정보</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="cust_nm" class="col-sm-4 control-label">성명</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cust_nm" v-model="info.cust_nm" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_pridtf_no" class="col-sm-4 control-label">실명번호</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cust_pridtf_no" v-model="info.cust_pridtf_no" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_eml_addr" class="col-sm-4 control-label">E-mail</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cust_eml_addr" v-model="info.cust_eml_addr" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_home_telno" class="col-sm-4 control-label">전화번호</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cust_home_telno" v-model="info.cust_home_telno" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_mbl_telno" class="col-sm-4 control-label">핸드폰번호</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cust_mbl_telno" v-model="info.cust_mbl_telno" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_cr_no" class="col-sm-4 control-label">직업</label>
                                    <div class="col-sm-8" id="selectcr">
                                       <select id="cust_cr_no" class="form-control" v-model="info.cust_cr_no" style="margin-left: 10px;">
											<option value="JB01">학생</option>
											<option value="JB02">공무원</option>
											<option value="JB03">회사원</option>
											<option value="JB04">자영업자</option>
											<option value="JB05">프리랜서</option>
											<option value="JB06">무직</option>
											<option value="JB07">기타</option>
										</select>
										<input v-if="showInput" type="text" class="form-control" v-model="info.other_cr" placeholder="직업명 입력">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cust_road_addr" class="col-sm-4 control-label">주소</label>
                                    <div class="col-sm-8">
                                        <textarea id="cust_road_addr" v-model="info.cust_road_addr" class="form-control" style="width: 100%; resize: none; margin-left: 10px;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="emp_nm" class="col-sm-4 control-label">담당자명</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" id="emp_nm" v-model="info.emp_nm" class="form-control">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button" @click="popEmp"><i class="fa fa-search"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="emp_dept" class="col-sm-4 control-label">부서</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="emp_dept" v-model="info.emp_dept" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="emp_posit" class="col-sm-4 control-label">직위</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="emp_posit" v-model="info.emp_posit" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="emp_mbl_telno" class="col-sm-4 control-label">연락처</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="emp_mbl_telno" v-model="info.emp_mbl_telno" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="cnslt_cn" class="col-sm-4 control-label">상담내역</label>
                                    <div class="col-sm-8">
                                        <textarea id="cnslt_cn" class="form-control" style="width: 100%; height: 300px; resize: none;" readonly></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cnslt_cn" class="col-sm-4 control-label">상담추가입력</label>
                                    <div class="col-sm-8">
                                        <textarea id="cnslt_cn" class="form-control" v-model="info.cuslt_cn" style="width: 100%; height: 150px; resize: none;"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                	<button type="button" class="btn btn-secondary" @click="custUpdate">고객정보저장</button>
                	<button type="button" class="btn btn-secondary" @click="cusltInsert">상담내용저장</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </template>
</div>







<!--// 담당자설정 팝업  -->
            <!-- 팝업 -->
            <div class="modal fade" id="pop_emp_info" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    <div class="modal-dialog" style="width: 500px;">
			        <div class="modal-content">
			        <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="btn_popClose">&times;</button>
						<h4 class="modal-title" id="modify_nm">담당자 설정</h4>
					</div> 
			            <div class="modal-body">
			                <div style="height: 400px; overflow: auto;" class="dataTables_wrapper">
			                    <table class="table table-bordered datatable dataTable">
			                        <thead style="position: sticky; top: 0;">
			                            <tr>
			                                <th class="center" style="width: 30%;">담당자명</th>
			                                <th class="center" style="width: 20%;">부서명</th>
			                                <th class="center" style="width: 20%;">직위</th>
			                                <th class="center" style="width: 40%;">연락처</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <tr v-for="item in dataList" :key="item.emp_nm" @click="selItem(item.emp_mbl_telno)" style="cursor: pointer;">
			                                <td class="center">{{ item.emp_nm }}</td>
			                                <td class="center">{{ item.emp_dept }}</td>
			                                <td class="center">{{ item.emp_posit }}</td>
			                                <td class="center">{{ item.emp_mbl_telno }}</td>
			                            </tr>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
            <!-- 팝업 -->
	   
</body>

    <script type="text/javascript">
    var vueapp = new Vue({
        el: "#vueapp",
        data: {
            dataList: [],
            search_nm: "",
            cust_nm: "",
    		cust_pridtf_no: "",
    		birth: "",
    		emp_nm: "",
            search_val: "",
        },
        mounted: function () {
            var fromDtl = cf_getUrlParam("fromDtl");
            var pagingConfig = cv_sessionStorage.getItem("pagingConfig");
            if ("Y" === fromDtl && !cf_isEmpty(pagingConfig)) {
                cv_pagingConfig.pageNo = pagingConfig.pageNo;
                cv_pagingConfig.orders = pagingConfig.orders;
                var params = cv_sessionStorage.getItem("params");
                this.search_nm = params.search_nm;
                this.cust_nm = params.cust_nm;
                this.birth = params.birth;
                this.emp_nm = params.emp_nm;
                this.search_val = params.search_val;

                this.getCustInfoList();
            } else {
                cv_sessionStorage
                    .removeItem("pagingConfig")
                    .removeItem("params");
                this.getCustInfoList(true);
            }
        },
        methods: {
            getCustInfoList: function (isInit) {

                cv_pagingConfig.func = this.getCustInfoList;
                if (isInit === true) {
                    cv_pagingConfig.pageNo = 1;
                    cv_pagingConfig.orders = [{ target: "cust_nm", isAsc: false }];
                }

                var params = {
                    search_nm: this.search_nm,
                    search_val: this.search_val,
                    cust_nm: this.cust_nm,
                    emp_nm: this.emp_nm,
                    birth: this.birth,
                }

                cv_sessionStorage
                    .setItem('pagingConfig', cv_pagingConfig)
                    .setItem('params', params);

                cf_ajax("/customer/getCustInfoList", params, this.getListCB);
            },
            getListCB: function (data) {
                //console.log(data);
                this.dataList = data.list;
                cv_pagingConfig.renderPagenation("system");
            },
            gotoDtl: function (cust_pridtf_no) {
                console.log(cust_pridtf_no);
                pop_cust_info.init(cust_pridtf_no);
                $('#pop_cust_info').modal('show');
            },
            all_check: function (obj) {
                $('[name=is_check]').prop('checked', obj.checked);
            },
            onCheck: function () {
                $("#allCheck").prop('checked',
                    $("[name=is_check]:checked").length === $("[name=is_check]").length
                );
            },
            popupEmpInfo: function () {
                var checkedList = $("[name=is_check]:checked");
                if (checkedList.length == 0) {
                    alert("담당자 설정 대상을 선택하여 주십시오.");
                    return;
                }
                //check list 가져오기..
                var dateCopyList = [];
                var idx;
                checkedList.each(function (i) {
                    idx = $(this).attr("data-idx");
                    dateCopyList.push(vueapp.dataList.getElementFirst("cust_nm", idx));
                });

                console.log(dateCopyList);

                //설정팝업 띄우기
//                 pop_damdang_set.init(dateCopyList);
                $('#pop_emp_info').modal('show');
            },
            
        }
    });
    var pop_cust_info = new Vue({
        el: "#pop_cust_info",
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
                cuslt_dt: "",
                cuslt_emp_nm: "",
                cuslt_cn: "",
            }
        },
        computed: {
            showInput() {
              return this.info.cust_cr_no === 'JB07';
            }
          },
        methods: {
            init: function (cust_mbl_telno) {
                this.initInfo();
                this.info.cust_mbl_telno = cust_mbl_telno;
                if (!cf_isEmpty(this.info.cust_mbl_telno)) {
                    this.getInfo();
                }
            },
            initInfo: function () {
                this.info = {
                   cust_sn: "",
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
                   cuslt_dt: "",
                   cuslt_emp_nm: "",
                   cuslt_cn: "",
                }
            },
            getInfo: function () {
                var params = {
                    cust_mbl_telno: this.info.cust_mbl_telno,
                }
                cf_ajax("/customer/getCustOne", params, this.getInfoCB);
            },
            getInfoCB: function (data) {
                this.info = data;
            },
            popEmp: function () {
            	$('#pop_emp_info').modal('show');
            },
            getEmpCB: function(data) {
            	this.info.emp_no = data.emp_no;
            	this.info.emp_nm = data.emp_nm;
            	this.info.emp_dept = data.emp_dept;
				this.info.emp_posit = data.emp_posit;
				this.info.emp_mbl_telno = data.emp_mbl_telno;
                console.log(data);
            },
            getEmpSelInfo: function (emp_mbl_telno) {
            	var params = {
            		emp_mbl_telno: emp_mbl_telno,
				}
				cf_ajax("/customer/getEmpSelInfo", params, this.getEmpCB);
			},
			custUpdate: function () {
				var cust_nm = this.info.cust_nm;
				var cust_pridtf_no = this.info.cust_pridtf_no;
				var cust_eml_addr = this.info.cust_eml_addr;
				var cust_home_telno = this.info.cust_home_telno;
				var cust_mbl_telno = this.info.cust_mbl_telno;
				var cust_cr_no = this.info.cust_cr_no;
				var other_cr = this.info.other_cr;
				var cust_road_addr = this.info.cust_road_addr;
				var emp_no = this.info.emp_no;
				 
				var params = { 
					cust_nm: cust_nm,
					cust_pridtf_no: cust_pridtf_no,
					cust_eml_addr: cust_eml_addr,
					cust_home_telno: cust_home_telno,
					cust_mbl_telno: cust_mbl_telno,
					cust_cr_no: cust_cr_no,
					other_cr: other_cr,
					cust_mbl_telno: cust_mbl_telno,
					cust_road_addr: cust_road_addr,
					emp_no: emp_no,
				}
				cf_ajax("/customer/custUpdate", params, this.changeStsCB);
			},
			changeStsCB: function (data) {
				if (data.status == "OK") {
					alert("고객정보 변경 완료");
				}
				$('#pop_cust_info').modal('hide');
				window.location.reload();
			},
			
			cusltInsert: function () {
				var cust_sn = this.info.cust_sn;
				var cuslt_cn = this.info.cuslt_cn;
				 
				var params = { 
					cust_sn: cust_sn,
					cuslt_cn: cuslt_cn,
				}
				cf_ajax("/communi/cusltInsert", params, this.insertStsCB);
			},
			insertStsCB: function (data) {
				if (data.status == "OK") {
					alert("상담내역 입력 완료");
				}

			},
			
        }
    });
    
    var pop_emp_info = new Vue({
        el: "#pop_emp_info",
        data: {
            dataList: [],
            emp_nm: "",
        },
        methods: {
            init: function () {
                this.getEmpInfo();
            },
            getEmpInfo: function () {
                var self = this;
                self.dataList = [];

                cf_ajax("/customer/getEmpInfo", null, function (data) {
                    self.getEmpCB(data); 
                });
            },
            getEmpCB: function(data) {
                this.dataList = data;
                console.log(data);
            },
            selItem: function (emp_nm) {
            	var self = this;
            	$('#pop_emp_info').hide();
            	pop_cust_info.getEmpSelInfo(emp_nm);
            },
        },
        mounted() {
            var self = this;
            $('#pop_emp_info').on('shown.bs.modal', function () {
                self.init();
            });
        }
    });
    </script>
</body>
</html>