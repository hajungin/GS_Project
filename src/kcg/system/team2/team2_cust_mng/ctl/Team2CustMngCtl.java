package kcg.system.team2.team2_cust_mng.ctl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utils.common.CmmnMap;
import common.utils.common.ConfigExcelDn;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.common.svc.CommonSvc;
import kcg.system.team2.team2_cust_mng.svc.Team2CustMngSvc;


@Controller
@RequestMapping("/customer")
public class Team2CustMngCtl {

	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	Team2CustMngSvc custMngSvc;
	
	@Autowired
	CommonSvc commonSvc;
	
	// 고객 관리 메인페이지
	@RequestMapping("/custMng")
	public String CustInfoMngPage() {
		return "kcg/system/team2/team2_cust_mng/custList";
	}
	
	// 고객 목록 조회 (List)
	@RequestMapping("/getCustInfoList2")
	public List<CmmnMap> getCustInfoList(CmmnMap params, PagingConfig pagingConfig ) {
		System.out.println(params);
		return custMngSvc.getAll(params, pagingConfig);
	}
	
	@RequestMapping("/getPicInfo")
	public List<CmmnMap> getPicInfo(CmmnMap params){
		return custMngSvc.getPicInfo(params); 
	}
	
}
