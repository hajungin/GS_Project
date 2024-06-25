<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="sidebar-menu">

		<div class="sidebar-menu-inner">
			
			<header class="logo-env">

				<!-- logo -->
				<div class="logo">
					<a href="#gm" onclick="cf_movePage('/system')">
						<img src="/static_resources/system/images/gsitm.jpg" width="120" alt="" />
					</a>
				</div>

				<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
				<div class="sidebar-mobile-menu visible-xs">
					<a href="#" class="with-animation"><!-- add class "with-animation" to support animation -->
						<i class="entypo-menu"></i>
					</a>
				</div>

			</header>
	
	
			<ul id="main-menu" class="main-menu">
				<li data-lnb="10" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">TEAM2 고객관리</span>
					</a>
					<ul data-lnb="10" data-snb="0">
						<li data-lnb="10" data-snb="3">
							<a href="#gm" onclick="cf_movePage('/customer/custMng')">
								<span class="title">고객 정보 관리</span>
							</a>
						</li>	
					
						<li data-lnb="10" data-snb="3">
							<a href="#gm" onclick="cf_movePage('/customer/custList')">
								<span class="title">고객 목록 조회</span>
							</a>
						</li>						
					</ul>
					<ul data-lnb="10" data-snb="0">
						<li data-lnb="10" data-snb="3">
							<a href="#gm" onclick="cf_movePage('/communi/communiList')">
								<span class="title">상담 내역 조회</span>
							</a>
						</li>						
					</ul>
				</li> 
				<li data-lnb="10" data-snb="0">
					<a href="#gm" onclick="cf_movePage('/common/commMng')">
						<i class="entypo-newspaper"></i>
						<span class="title">TEAM2 공통옵션관리</span>
					</a>
				</li> 
				<li data-lnb="10" data-snb="0">
					<a href="#gm" onclick="cf_movePage('/common/commMng')">
						<i class="entypo-newspaper"></i>
						<span class="title">TEAM2 담당자관리</span>
					</a>
				</li> 

				<li data-lnb="10" data-snb="0">
					<a href="#gm" onclick="cf_movePage('/common/commMng')">
						<i class="entypo-newspaper"></i>
						<span class="title">TEAM2 공지사항</span>
					</a>
				</li> 
				<li data-lnb="10" data-snb="0">
					<a href="#gm" onclick="cf_movePage('/common/commMng')">
						<i class="entypo-newspaper"></i>
						<span class="title">TEAM2 스케줄관리</span>
					</a>
				</li> 
				<li data-lnb="10" data-snb="0">
					<a href="#gm" onclick="cf_movePage('/common/commMng')">
						<i class="entypo-newspaper"></i>
						<span class="title">TEAM2 환율정보</span>
					</a>
				</li> 
				
				<li data-lnb="11" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">TEAM2 판매관리(사용자)</span>
					</a>
					<ul data-lnb="11" data-snb="0">
						<li data-lnb="11" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/sell/list')">
								<span class="title">상품정보 조회</span>
							</a>
							<a href="#gm" onclick="cf_movePage('/sell/list')">
								<span class="title">금융계산기</span>
							</a>
							<a href="#gm" onclick="cf_movePage('/sell/join')">
								<span class="title">설계이력조회</span>
							</a>
							<a href="#gm" onclick="cf_movePage('/sell/membership')">
								<span class="title">가입현황</span>
							</a>
						</li>
					</ul>
				</li>
				<li data-lnb="11" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">TEAM2 상품관리(관리자)</span>
					</a>
					<ul data-lnb="11" data-snb="0">
						<li data-lnb="11" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/2team/prod/GLlist')">
								<span class="title">상품관리</span>
							</a>
							<a href="#gm" onclick="cf_movePage('/2team/prod/insert')">
								<span class="title">상품등록</span>
							</a>
						</li>
					</ul>
				</li>
				<li data-lnb="10" data-snb="0">
					<a href="#gm" onclick="cf_movePage('/common/commMng')">
						<i class="entypo-newspaper"></i>
						<span class="title">TEAM2 마이페이지</span>
					</a>
				</li> 
				 
			</ul>
		</div>

	</div>
<script>

var menulvlconst = [
	{lnb : 1, snb : 0, url : "/system/user_mng/list"},
	{lnb : 1, snb : 0, url : "/system/user_mng/dtl"},
    
	{lnb : 2, snb : 1, url : "/system/menu_mng/list"},
	{lnb : 2, snb : 1, url : "/system/menu_mng/dtl"},
    
	{lnb : 3, snb : 1, url : "/system/req_mng/dnld/list"},
	{lnb : 3, snb : 1, url : "/system/req_mng/dnld/dtl"},
	{lnb : 3, snb : 2, url : "/system/req_mng/dataCollect/list"},
	{lnb : 3, snb : 2, url : "/system/req_mng/dataCollect/dtl"},
// 	{lnb : 3, snb : 3, url : "/system/req_mng/dataAnal/list"},
// 	{lnb : 3, snb : 3, url : "/system/req_mng/dataAnal/dtl"},
	{lnb : 3, snb : 4, url : "/system/req_mng/analTool/list"},
	{lnb : 3, snb : 4, url : "/system/req_mng/analTool/dtl"},
    
// 	{lnb : 4, snb : 1, url : "/system/share_mng/useExample/list"},
// 	{lnb : 4, snb : 1, url : "/system/share_mng/useExample/dtl"},
	{lnb : 4, snb : 1, url : "/system/share_mng/dataVisualization/list"},
	{lnb : 4, snb : 1, url : "/system/share_mng/dataVisualization/dtl"},
	{lnb : 4, snb : 2, url : "/system/share_mng/analIdea/list"},
	{lnb : 4, snb : 2, url : "/system/share_mng/analIdea/dtl"},
	{lnb : 4, snb : 3, url : "/system/reg_mng/shareDoc/list"},
	{lnb : 4, snb : 3, url : "/system/reg_mng/shareDoc/dtl"},
	
    
	{lnb : 5, snb : 1, url : "/system/communi_mng/news/list"},
	{lnb : 5, snb : 1, url : "/system/communi_mng/news/dtl"},
	{lnb : 5, snb : 2, url : "/system/communi_mng/library/list"},
	{lnb : 5, snb : 2, url : "/system/communi_mng/library/dtl"},
	{lnb : 5, snb : 3, url : "/system/communi_mng/inquire/list"},
	{lnb : 5, snb : 3, url : "/system/communi_mng/inquire/dtl"},
	{lnb : 5, snb : 4, url : "/system/communi_mng/bigdataTrend/list"},
	{lnb : 5, snb : 4, url : "/system/communi_mng/bigdataTrend/dtl"},
    
	{lnb : 6, snb : 1, url : "/system/etc_mng/popup/list"},
	{lnb : 6, snb : 1, url : "/system/etc_mng/popup/dtl"},
	{lnb : 6, snb : 2, url : "/system/etc_mng/help/list"},
	{lnb : 6, snb : 2, url : "/system/etc_mng/help/dtl"},
	{lnb : 6, snb : 3, url : "/system/etc_mng/errCd/list"},
	{lnb : 6, snb : 3, url : "/system/etc_mng/errCd/dtl"},
	{lnb : 6, snb : 4, url : "/system/etc_mng/externalSystemUrl/list"},
	{lnb : 6, snb : 4, url : "/system/etc_mng/externalSystemUrl/dtl"},
    
	{lnb : 7, snb : 1, url : "/system/stat_mng/dashboard"},
	{lnb : 7, snb : 2, url : "/system/stat_mng/visitReg"},
	{lnb : 7, snb : 3, url : "/system/stat_mng/req"},
	{lnb : 7, snb : 4, url : "/system/stat_mng/keyword"},
	
	{lnb : 8, snb : 1, url : "/system/portal_auth_mng/list"},
	{lnb : 8, snb : 1, url : "/system/portal_auth_mng/dtl"},
	{lnb : 8, snb : 2, url : "/system/admin_auth_mng/list"},
	{lnb : 8, snb : 2, url : "/system/admin_auth_mng/dtl"},
	
	{lnb : 9, snb : 1, url : "/system/poli_person_mng/code/list"},
	{lnb : 9, snb : 2, url : "/system/poli_person_mng/list"},
	
	{lnb : 10, snb : 1, url : "/custMng/custEventList"},
	{lnb : 10, snb : 2, url : "/custMng/custInfoMng"},
	{lnb : 10, snb : 3, url : "/custMng/custInfoList"},
	
	
	//{lnb : 10, snb : 1, url : "/scheduleMng/list"},
	//{lnb : 10, snb : 2, url : "/scheduleMng/list2"},
	
	//{lnb : 11, snb : 1, url : "/scheduleMng/list"},
	//{lnb : 11, snb : 2, url : "/scheduleMng/list2"},
	
	//{lnb : 12, snb : 1, url : "/scheduleMng/list"},
	//{lnb : 12, snb : 2, url : "/scheduleMng/list2"},
	
	//{lnb : 13, snb : 1, url : "/scheduleMng/list"},
	//{lnb : 13, snb : 2, url : "/scheduleMng/list2"},
	
]


$(function(){
	
	var mnulvlinfo = menulvlconst.getElementFirst("url", location.pathname);
	if(!cf_isEmpty(mnulvlinfo)){
		$("li[data-lnb=" + mnulvlinfo.lnb+ "][data-snb=0]").addClass("active");
		$("ul[data-lnb=" + mnulvlinfo.lnb+ "][data-snb=0]").addClass("visible");
		$("li[data-lnb=" + mnulvlinfo.lnb+ "][data-snb=" + mnulvlinfo.snb+ "]").addClass("active");
	}
})


</script>