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
    <style>
    .input-row td {
	   padding: 0;
	   margin: 0;
	   height: 30px;
	   }

	.input-row input[type="text"] {
    	border: 1px solid #ccc;
        width: 100%;
        height: 100%; 
        box-sizing: border-box;
        padding: 0; 
        margin: 0;
        text-align: center;
        border-radius: 4px;
       }
    .input-row input[type="text"]::placeholder {
    	color: #999;
    	text-align: center;
    	font-style: italic;
		}
    </style>
</head>

<body class="page-body">

    <div class="page-container">

        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu-team2.jsp" flush="false" />

        <div class="main-content">

            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false" />

            <ol class="breadcrumb bc-3">
                <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
                <li class="active"><strong>공통옵션관리</strong></li>
            </ol>

            <h2>공통옵션관리</h2>
            <br />

            <div class="flex-column flex-gap-10 dataTables_wrapper" id="vueapp">
                <template>
                    <div class="flex flex-100">
                        <div class="flex-wrap flex-100 flex flex-gap-10 flex-padding-10">
                            <div class="form-group flex-100">
                             	<label class="fix-width-50" style="margin-left: 200px;">항목구분</label>
                                <select id ="group_comm" class="form-control" v-model="gr_comm_no" @change="getCommonList()">
                                	<option value="">0.전체</option>
                                	<option v-for="(item, index) in gr_comm_list" :key="index" :value="item.gr_comm_no">{{ index+1 }}. {{ item.gr_comm_nm }}</option>
                                </select>
                                <label class="fix-width-50" style="text-align: center; margin-left: 200px;">항목명 </label>
                                <input class="form-control" v-model="search_val" value="" style="margin-right: 100px; ">
                                 <button type="button" class="btn btn-primary btn-icon" 
                                    @click="getCommonList()">
                                    검색
                                    <i class="entypo-search"></i>
                                </button>
                            </div>
                        </div>
					</div>

                    <div class="flex flex-100 flex-padding-10 flex-gap-10"
                        style="justify-content:flex-end;border: 1px solid #999999;">
                        <button v-if="!showButton" type="button" class="btn btn-gold btn-icon" style="margin-left: 5px;"
                            @click="popGrComm">
                            항목구분관리
                            <i class="entypo-archive"></i>
                        </button>
                        <button v-if="!showButton" type="button" class="btn btn-blue btn-icon" style="margin-left: 5px;"
                            @click="showInputRow">
                            항목코드추가
                            <i class="entypo-archive"></i>
                        </button>
                         <button v-if="!showButton" type="button" class="btn btn-blue btn-icon" style="margin-left: 5px;"
                            @click="showUpdateColumn">
                            항목코드수정
                            <i class="entypo-archive"></i>
                        </button>
                        <button v-if="showButton" type="button" class="btn btn-success btn-icon" style="margin-left: 5px;"
                            @click="save">
                             저  장 
                            <i class="entypo-archive"></i>
                        </button>
                         <button v-if="showButton" type="button" class="btn btn-blue btn-icon" style="margin-left: 5px;"
                            @click="cancle">
                             취  소 
                            <i class="entypo-archive"></i>
                        </button>
                        <button v-if="!showButton" type="button" class="btn btn-danger btn-icon " style="margin-left: 5px;"
                            @click="commDelete">
                            항목코드삭제
                            <i class="entypo-archive"></i>
                        </button>
                    </div>
                    <table class="table table-bordered datatable dataTable" id="grid_app"
                        style="border: 1px solid #999999;">
                        <thead>
                       		<tr>
                       			<th style="width: 4%;" class="center hidden-xs nosort"><input
								type="checkbox" id="allCheck" @click="all_check(event.target)"></th>
                                <th style="width: 10%;" class="center">항목코드</th>
                                <th style="width: 15%;" class="center">항목명</th>
                                <th style="width: 15%;" class="center">항목구분</th>
                                <th style="width: 15%;" class="center">비고</th>
                                <th style="width: 10%;" class="center">등록(수정)일</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <tr class="input-row" v-if="insert">
                          		<td class="center" style="color: blue;">추가</td>
                           		<td><input type="text" v-model="comm_no" placeholder="항목코드 입력" /></td>
                           		<td><input type="text" v-model="comm_nm" placeholder="항목명 입력" /></td>
                           		<td>
                            		<select id ="group_comm_sel" class="form-control" v-model="sel_gr_comm_no">
                                		<option v-for="item in gr_comm_list" :value="item.gr_comm_no">{{ item.gr_comm_nm }}</option>
                                	</select>
                               	</td>
                           		<td><input type="text" v-model="note" placeholder="비고 입력" /></td>
                           		<td></td>
                            <tr>
                            <tr v-for="(item, index) in dataList"  class="input-row">
                            	<td class="center"><input type="checkbox"
									:data-idx="item.comm_no" name="is_check" @click="onCheck" v-model="item.selected">
								</td>
                                <td class="center">{{ item.comm_no }}</td>
                                <td class="center" v-if="item.update"><input type="text"  v-model="item.comm_nm"/></td>
                                <td class="center" v-else>{{ item.comm_nm }}</td>
                                <td class="center">{{ item.gr_comm_nm }}</td>
                                <td class="center" v-if="item.update"><input type="text" v-model="item.note"/></td>
                                <td class="center" v-else>{{ item.note }}</td>
                                <td class="center">{{ item.reg_dt }}</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="dataTables_paginate paging_simple_numbers" id="div_paginate"></div>
                </template>
            </div>
            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false" />
		</div>
	</div>
	          <!-- 팝업 -->
          <div class="modal fade" id="pop_gr_comm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog" style="width: 400px;">
		        <div class="modal-content">
		       	 <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" @click="close" aria-hidden="true" id="btn_popClose" >&times;</button>
						<h4 class="modal-title" id="modify_nm">항목구분설정</h4>
					</div> 
			            <div class="modal-body">
			                <div style="max-height: 700px; overflow: auto;" class="dataTables_wrapper">
			                    <table class="table table-bordered datatable dataTable">
			                        <thead style="position: sticky; top: 0;">
			                            <tr>
			                                <th class="center" style="width: 10%;">코드</th>
			                                <th class="center" style="width: 30%;">구분명</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <tr v-for="(item, index) in dataList" class="input-row">
			                                <td class="center">{{ item.gr_comm_no }}</td>
			                                <td class="center"><input type="text" v-model="item.gr_comm_nm" /></td>
			                        </tbody>
			                    </table>
			                    <div style="text-align: center; margin-bottom: 5px;">
			                		<button type="button" class="btn btn-green" style="margin-left: 5px;" @click="grCommUpdate">변경사항저장</button>
		                		</div>
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
            gr_comm_list: [],
            comm_no: "",
            comm_nm: "",
    		note: "",
    		gr_comm_no: "",
    		gr_comm_nm: "",
    		sel_gr_comm_no: "",
    		search_val: "",
    		insert: false,
    		update: false,
    		selected: false
        },
        mounted: function () {
                this.getCommonList();
                this.getGrCommList();
        },
        computed: {
        	showButton() {
     	      	return this.insert || this.update;
       	    },
         },
        methods: {
        	getGrCommList: function () {
        		cf_ajax("/common/getGrCommList", null, (data) => {
        		this.gr_comm_list = data;
        		});
        	},
            getCommonList: function () {
            	
            	var params = {
            	gr_comm_no: this.gr_comm_no,
            	gr_comm_nm: this.gr_comm_nm,
            	comm_nm: this.search_val,
            	note: this.note,
            	}
            	
        		cf_ajax("/common/getCommonList", params, this.getListCB);
            },
            getListCB: function (data) {
                this.dataList = data;
//                 this.dataList.push("selected", false);
//                 this.dataList.push("update", false);
            },
            all_check: function (obj) {
                $('[name=is_check]').prop('checked', obj.checked);
            },
            onCheck: function () {
                $("#allCheck").prop('checked',
                    $("[name=is_check]:checked").length === $("[name=is_check]").length
                );
            },
            
            showInputRow() {
                this.insert = true; 
            },
            showUpdateColumn() {
             var checkedList = $("[name=is_check]:checked");
             if (checkedList.length == 0) {
                 alert("수정 대상을 선택하여 주십시오.");
                 return;
             } 
//              else if (checkedList.length > 1) {
//             	 alert("하나만 선택하세요!!");
//                  return;
//              }
             	checkedList.each((index, element) => {
             	var item = this.dataList[index];
           		if (item.selected) {
                     item.originalData = {
                     	comm_nm: item.comm_nm,
                     	note: item.note
                  }
                     console.log(item.originalData)
                     Vue.set(item, 'update', true);
                 }
           		});
             	this.update = true;
            },
            commInsert: function () {
            	var gr_comm_no = this.sel_gr_comm_no;
            	var sel_gr_comm = this.gr_comm_list.find(item => item.gr_comm_no === this.sel_gr_comm_no);
            	var gr_comm_nm = sel_gr_comm.gr_comm_nm;
            	var comm_no = this.comm_no;
				var comm_nm = this.comm_nm;
				var note = this.note;
				var params = { 
					gr_comm_no: gr_comm_no,
					gr_comm_nm: gr_comm_nm,
					comm_no: comm_no,
					comm_nm: comm_nm,
					note: note
				}
				cf_ajax("/common/commInsert", params, this.insertStsCB);
				
			},
			insertStsCB: function (data) {
				if (data.status == "OK") {
					alert("등록 완료");
					if (this.insert) {
						this.insert = false;
						this.comm_no = "";
						this.comm_nm = "";
						this.note = "";
						}
					this.getCommonList();
				}
				
			},
			commUpdate: function () {
				var updateData = this.dataList.filter(item => item.update);
                var params = {
                	updateData: updateData,
                }
                console.log(updateData);
                cf_ajax("/common/commUpdate", params, this.updateStsCB);
            },
			updateStsCB: function (data) {
				if (data.status == "OK") {
					alert("수정 완료");
					this.update = false;
		            this.dataList.forEach(item => item.update = false);
					}
			},
			commDelete: function () {
				var checkedList = $("[name=is_check]:checked");
	            if (checkedList.length == 0) {
	                alert("삭제항목을 선택하세요.");
	                return;
	            }
	            var deleteList = [];
	            var idx;
	            checkedList.each(function (i) {
	                idx = $(this).attr("data-idx");
	                var map = {
	                   comm_no: idx
	                };
	                deleteList.push(map);
	            });
	            console.log(deleteList);
	            var params = {
            		deleteList: deleteList
	            }
		       cf_ajax("/common/commDelete", params, this.deleteStsCB);
		   },
	       deleteStsCB : function(data){
	           if (data.status == "OK") {
	                alert("삭제가 완료되었습니다.");
	            } else {
	            	alert("사용중인 코드는 삭제할 수 없습니다.")
	            }
	           this.getCommonList();
	    	},
			save: function () {
				if (this.insert) {
					this.commInsert()
				} else {
					this.commUpdate()
				}
			},
			cancle: function () {
				if (this.insert) {
					this.insert = false;
					this.comm_no = "";
					this.comm_nm = "";
					this.note = "";
				} else {
					this.dataList.forEach(item => {
		            item.comm_nm = item.originalData.comm_nm;
		            item.note = item.originalData.note;
		            this.update = false;
		            this.dataList.forEach(item => item.update = false);
		            delete item.originalData;
		            });
				}
			},
			popGrComm: function () {
            	$('#pop_gr_comm').modal('show');
            },
        }
});
   	var pop_gr_comm = new Vue({
       el: "#pop_gr_comm",
       data: {
           dataList: [],
       },
       methods: {
       		getGrCommList: function () {
               vueapp.getGrCommList();
           },
           grCommUpdate: function() {
               var params = {
               	dataList: this.dataList,
               }
               cf_ajax("/common/grCommUpdate", params, this.updateStsCB);
           },
           updateStsCB: function (data) {
			if (data.status == "OK") {
				alert("수정 완료이 완료되었습니다.");
			}
			vueapp.getGrCommList();
           },
		close: function () {
			vueapp.getGrCommList();
		}
       },
       mounted() {
           this.getGrCommList();
           var self = this;
           vueapp.$watch('gr_comm_list', function(newVal) {
               self.dataList = newVal;
           });
          
       }
   });
    
    </script>
</body>
</html>