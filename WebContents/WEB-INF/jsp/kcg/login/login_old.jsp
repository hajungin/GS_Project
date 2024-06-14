<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/jsp/kcg/_include/portal/header_meta.jsp" flush="false" />
	<title>관리자 로그인</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<!--===============================================================================================-->	
<!-- 	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static_resources/lib/bootstrap/4.3.1/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static_resources/lib/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static_resources/lib/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static_resources/login/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/static_resources/login/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static_resources/login/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static_resources/login/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/static_resources/login/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static_resources/login/util.css?rscVer=${properties.rscVer}">
	<link rel="stylesheet" type="text/css" href="/static_resources/login/main.css?rscVer=${properties.rscVer}">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-105">
				<form class="login100-form validate-form flex-sb flex-w fade-in" method="post" action="/login/proc">
    <input type="hidden" name="loginmode" value="admin" />
    <div class="login-form-title fade-in">
        GS-ITM 금융PROJECT
    </div>
    <div class="wrap-input100 validate-input m-b-36 fade-in" data-validate="Username is required">
        <input class="input100" type="text" id="usr_id" name="usr_id" style="background: transparent;" placeholder="아이디를 입력하세요">
        <span class="focus-input100"></span>
    </div>
    <div class="wrap-input100 validate-input m-b-12 fade-in" data-validate="Password is required">
        <span class="btn-show-pass">
            <i class="fa fa-eye"></i>
        </span>
        <input class="input100" type="password" id="usr_pw" name="usr_pw" style="background: transparent;" placeholder="비밀번호를 입력하세요" onkeyup="if(window.event.keyCode==13){login();}">
        <span class="focus-input100"></span>
    </div>
    <div class="flex-sb-m w-full p-b-48 fade-in">
    </div>
    <div class="container-login100-form-btn fade-in">
        <input type="button" class="login100-form-btn" onclick="login()" value="로그인"/>
    </div>
    <br>
    <div class="account-box fade-in">
        <input type="button" class="account-box-findid" onClick="location.href = '/login/findUserId'" value="아이디 찾기"/>
        <input type="button" class="account-box-findpw" onClick="location.href = '/login/findUserPw'" value="비밀번호 찾기"/>
        <input type="button" class="account-box-regist" onClick="location.href = '/login/getRegistUserForm'" value="회원 등록"/>
    </div>
</form>

			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/static_resources/lib/jquery/3.4.1/jquery.min.js"></script>
<!--===============================================================================================-->
	<script src="/static_resources/login/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/static_resources/login/animsition/js/popper.js"></script>
	<script src="/static_resources/lib/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/static_resources/login/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/static_resources/login/daterangepicker/moment.min.js"></script>
	<script src="/static_resources/login/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->



<!-- 	<script type="text/javascript" src="/static_resources/portal/js/lib/jquery/jquery.cookies.js"></script> -->
<script type="text/javascript" src="/static_resources/portal/js/swiper.min.js?rscVer=${properties.rscVer}"></script>
<script type="text/javascript" src="/static_resources/portal/js/jquery.mCustomScrollbar.js?rscVer=${properties.rscVer}"></script>
<script type="text/javascript" src="/static_resources/portal/js/TweenMax.js?rscVer=${properties.rscVer}"></script>
<script type="text/javascript" src="/static_resources/portal/js/script.js?rscVer=${properties.rscVer}"></script>

<script>

function login(){
    
    var params = {
			usr_id : $("#usr_id").val(),
			usr_pw : $("#usr_pw").val(),
			ubi : "",
    	}
    
    cf_ajax("/login/proc", params, function(data){
    	var rslt = data.rslt;
    	if("SUCC_ADMIN" === rslt){
    		auth_menulist = data.auth_menulist;
    		cf_movePage('/system')
    	} else if("SUCC_CLIENT" === rslt){
    		auth_menulist = data.auth_menulist;
    		cf_movePage('/')
    	} else if("NO_USER" === rslt){
    		alert("입력하신 아이디는 존재하지 않습니다.");
    	} else if("FAIL_PW_ERR" === rslt){
    		alert("비밀번호 오류입니다.");
    	}
    });
}

$(document).ready(function(){

    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
        var check = true;
        
        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }

        return false;
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    
    /*==================================================================
    [ Show pass ]*/
    var showPass = 0;
    $('.btn-show-pass').on('click', function(){
        if(showPass == 0) {
            $(this).next('input').attr('type','text');
            $(this).find('i').removeClass('fa-eye');
            $(this).find('i').addClass('fa-eye-slash');
            showPass = 1;
        }
        else {
            $(this).next('input').attr('type','password');
            $(this).find('i').removeClass('fa-eye-slash');
            $(this).find('i').addClass('fa-eye');
            showPass = 0;
        }
        
    });
});

window.onload = function(){
	if("${errMsg}" === "FAIL_ID_ERR"){
		alert("입력하신 아이디가 존재하지 않습니다.");
	} else if("${errMsg}" === "FAIL_PW_ERR"){
		alert("비밀번호 오류입니다.");
	}
}

</script>
</body>
</html>