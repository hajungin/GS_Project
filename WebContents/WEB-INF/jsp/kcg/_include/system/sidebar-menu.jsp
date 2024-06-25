<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="sidebar-menu">

		<div class="sidebar-menu-inner">
			
			<header class="logo-env">

				<!-- logo -->
				<div class="logo">
					<a href="#gm" onclick="cf_movePage('/system')">
						<img src="/static_resources/system/images/gsitm.jpg" width="120" alt="" />
					</a>
				</div>

				<!-- logo collapse icon -->
<!-- 				<div class="sidebar-collapse"> -->
<!-- 					<a href="#" class="sidebar-collapse-icon"> -->
<!-- 						<i class="entypo-menu"></i> -->
<!-- 					</a> -->
<!-- 				</div> -->

								
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
						<span class="title">EZEN 고객관리</span>
					</a>
					<ul data-lnb="10" data-snb="0">
						<li data-lnb="10" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/customer/custMng')">
								<span class="title">고객 정보 관리</span>
							</a>
						</li>
					</ul>
					<ul data-lnb="10" data-snb="0">
						<li data-lnb="10" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/customer/custList')">
								<span class="title">고객정보 목록 조회</span>
							</a>
						</li>
					</ul>
					<ul data-lnb="10" data-snb="0">
						<li data-lnb="10" data-snb="2">
							<a href="#gm" onclick="cf_movePage('/communi/communiList')">
								<span class="title">상담내역 조회</span>
							</a>
						</li>
					</ul>
				</li>

				<li data-lnb="10" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">EZEN 담당자 관리</span>
					</a>
					<ul data-lnb="10" data-snb="0">
						<li data-lnb="10" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/empMng/empMngList')">
								<span class="title">담당자정보 조회</span>
							</a>
						</li>
					</ul>
				</li>

			
			
				<li data-lnb="10" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">GSITM 고객관리</span>
					</a>
					<ul data-lnb="10" data-snb="0">
						<li data-lnb="10" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/custMng/custEventList')">
								<span class="title">고객 이벤트 조회</span>
							</a>
						</li>
						<li data-lnb="10" data-snb="2">
							<a href="#gm" onclick="cf_movePage('/custMng/custInfoMng')">
								<span class="title">고객정보 관리</span>
							</a> 
						</li>
						<li data-lnb="10" data-snb="3">
							<a href="#gm" onclick="cf_movePage('/custMng/custInfoList')">
								<span class="title">고객정보 목록 조회</span>
							</a>
						</li>						
					</ul>
				</li> 
				<li data-lnb="11" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">GSITM 상품관리</span>
					</a>
					<ul data-lnb="11" data-snb="0">
						<li data-lnb="11" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/prod_mng/list')">
								<span class="title">상품목록 조회</span>
							</a>
						</li>
					</ul>
				</li>
				
				<li data-lnb="11" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">EZEN 판매관리(사용자)</span>
					</a>
					<ul data-lnb="11" data-snb="0">
						<li data-lnb="11" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/sell/list')">
								<span class="title">상품정보 조회</span>
							</a>
							
							<a href="#gm" onclick="cf_movePage('/sell/init')">
								<span class="title">가입현황</span>
							</a>
							
						</li>
					</ul>
				</li>
				<li data-lnb="11" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">EZEN 상품관리(관리자)</span>
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
				
				<li data-lnb="12" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">GSITM 활동관리</span>
					</a>
					<ul data-lnb="12" data-snb="0">
						<li data-lnb="12" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/scheduleMng/scheduleList')">
								<span class="title">스케쥴관리</span>
							</a>
						</li>						
					</ul>
				</li>
				<li data-lnb="13" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">GSITM 프로모션</span>
					</a>
					<ul data-lnb="13" data-snb="0">
						<li data-lnb="13" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/promion_mng/list')">
								<span class="title">설계이력조회</span>
							</a>
						</li>
						<li data-lnb="13" data-snb="2">
							<a href="#gm" onclick="cf_movePage('/promion_mng/dtl')">
								<span class="title">금융계산기</span>
							</a>
						</li>					
					</ul>
				</li>
				
				
				
				<li data-lnb="1" data-snb="0">
					<a href="#gm" onclick="cf_movePage('/system/user_mng/list')">
						<i class="entypo-newspaper"></i>
						<span class="title">사용자 관리</span>
					</a>
				</li>
				<li data-lnb="8" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">그룹 관리</span>
					</a>
					<ul data-lnb="8" data-snb="0">
						<li data-lnb="8" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/system/portal_auth_mng/list')">
								<span class="title">그룹 관리</span>
							</a>
						</li>
						<li data-lnb="8" data-snb="2">
							<a href="#gm" onclick="cf_movePage('/system/admin_auth_mng/list')">
								<span class="title">관리 그룹 관리</span>
							</a>
						</li>
					</ul>
				</li>
				<li data-lnb="2" data-snb="0">
					<a href="#gm" onclick="cf_movePage('/system/menu_mng/list')">
						<i class="entypo-newspaper"></i>
						<span class="title">메뉴 관리</span>
					</a>
				</li>
				
	
				
				<li data-lnb="4" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">공유관리</span>
					</a>
					<ul data-lnb="4" data-snb="0">
						<li data-lnb="4" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/system/share_mng/dataVisualization/list')">
								<span class="title">시각화 갤러리</span>
							</a>
						</li>
						<li data-lnb="4" data-snb="2">
							<a href="#gm" onclick="cf_movePage('/system/share_mng/analIdea/list')">
								<span class="title">데이터 소통방</span>
							</a>
						</li>
						<li data-lnb="4" data-snb="3">
							<a href="#gm" onclick="cf_movePage('/system/reg_mng/shareDoc/list')">
								<span class="title">공유문서 등록관리</span>
							</a>
						</li>
					</ul>
				</li>
				
				<li data-lnb="5" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">소통/참여관리</span>
					</a>
					<ul data-lnb="5" data-snb="0">
						<li data-lnb="5" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/system/communi_mng/news/list')">
								<span class="title">새 소식</span>
							</a>
						</li>
						<li data-lnb="5" data-snb="2">
							<a href="#gm" onclick="cf_movePage('/system/communi_mng/library/list')">
								<span class="title">자료실</span>
							</a>
						</li>
						<li data-lnb="5" data-snb="3">
							<a href="#gm" onclick="cf_movePage('/system/communi_mng/inquire/list')">
								<span class="title">문의하기</span>
							</a>
						</li>
						
					</ul>
				</li>
				<li data-lnb="6" data-snb="0">
					<a href="#gm">
						<i class="entypo-newspaper"></i>
						<span class="title">기타 관리</span>
					</a>
					<ul data-lnb="6" data-snb="0">
						<li data-lnb="6" data-snb="1">
							<a href="#gm" onclick="cf_movePage('/system/etc_mng/popup/list')">
								<span class="title">팝업 관리</span>
							</a>
						</li>
						<li data-lnb="6" data-snb="2">
							<a href="#gm" onclick="cf_movePage('/system/etc_mng/help/list')">
								<span class="title">도움말 관리</span>
							</a>
						</li>
						<li data-lnb="6" data-snb="3">
							<a href="#gm" onclick="cf_movePage('/system/etc_mng/errCd/list')">
								<span class="title">에러코드 관리</span>
							</a>
						</li>
						<li data-lnb="6" data-snb="4">
							<a href="#gm" onclick="cf_movePage('/system/etc_mng/externalSystemUrl/list')">
								<span class="title">외부시스템URL 관리</span>
							</a>
						</li>
					</ul>
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