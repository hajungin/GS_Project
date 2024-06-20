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
	   height: 40px;
	   }

	.input-row input[type="text"] {
    	border: 1px solid #ccc;
        width: 100%;
        height: 100%; 
        box-sizing: border-box;
        padding: 0; 
        margin: 0;
        border-radius: 4px;
       }
    .input-row input[type="text"]::placeholder {
    	color: #999;
    	text-align: center;
		}
    </style>
</head>

<body class="page-body">

    <div class="page-container">

        <jsp:include page="/WEB-INF/jsp/kcg/_include/system/sidebar-menu.jsp" flush="false" />

        <div class="main-content">

            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/header.jsp" flush="false" />

            <ol class="breadcrumb bc-3">
                <li><a href="#none" onclick="cf_movePage('/system')"><i class="fa fa-home"></i>Home</a></li>
                <li class="active"><strong>공통옵션관리</strong></li>
            </ol>

            <h2>공통옵션관리</h2>
            <br />

            <div class="flex-column flex-gap-10" id="vueapp">
                <template>
                    <div class="flex flex-100">
                        <div class="flex-wrap flex-100 flex flex-gap-10 flex-padding-10">
                            <div class="form-group flex-100">
                             	<label class="fix-width-50" style="margin-left: 200px;">항목구분</label>
                                <select id ="group_comm" class="form-control" @change="getCommonList()">
                                	<option value="">0.전체</option>
                                	<option v-for="(item, index) in gr_comm_list" :key="index" :value="item.gr_comm_no">{{ index+1 }}.{{ item.gr_comm_nm }}</option>
                                </select>
                                <label class="fix-width-50" style="text-align: center; margin-left: 200px;">항목코드 </label>
                                <input class="form-control" v-model="comm_nm" value="" style="margin-right: 100px; ">
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
                        <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;"
                            @click="showInputRow">
                            항목코드추가
                            <i class="entypo-archive"></i>
                        </button>
                         <button type="button" class="btn btn-blue btn-icon icon-left" style="margin-left: 5px;"
                            >
                            항목코드수정
                            <i class="entypo-archive"></i>
                        </button>
                        <button type="button" class="btn btn-danger btn-icon icon-left" style="margin-left: 5px;"
                            >
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
                           		<th style="width: 5%;" class="center">No</th>
                                <th style="width: 10%;" class="center">항목코드</th>
                                <th style="width: 15%;" class="center">항목명</th>
                                <th style="width: 15%;" class="center">등록일</th>
                                <th style="width: 15%;" class="center">비고</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <tr class="input-row" v-if="insert">
                            	<td></td>
                           		<td><input type="text" v-model="comm_no" placeholder="Enter value" /></td>
                           		<td><input type="text" v-model="comm_nm" placeholder="Enter value" /></td>
                           		<td></td>
                           		<td></td>
                           		<td><input type="text" v-model="note" placeholder="Enter value" /></td>
                            <tr>
                            <tr v-for="(item, index) in dataList">
                            	<td class="center"><input type="checkbox"
									:data-idx="item.comm_no" name="is_check" @click="onCheck">
								</td>
                                <td class="center">{{ index + 1 }}</td>
                                <td class="center">{{ item.comm_no }}</td>
                                <td class="center">{{ item.comm_nm }}</td>
                                <td class="center">{{ item.reg_dt }}</td>
                                <td class="center">{{ item.note }}</td>
                            </tr>

                        </tbody>
                    </table>
                </template>
            </div>
            <jsp:include page="/WEB-INF/jsp/kcg/_include/system/footer.jsp" flush="false" />
		</div>
	</div>
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
    		insert: false
        },
        mounted: function () {
        	this.getGrCommList();
            this.getCommonList();

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
            	comm_nm: this.comm_nm,
            	note: this.note
            	}
        		cf_ajax("/common/getCommonList", params, this.getListCB);
            },
            getListCB: function (data) {
                this.dataList = data;
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
        }
    });
    </script>
</body>
</html>