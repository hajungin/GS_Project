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
import kcg.system.team2.team2_cust_mng.svc.CustSvc;


@Controller
@RequestMapping("/customer")
public class CustCtl {

	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CustSvc custMngSvc;

	// 고객 목록 페이지
	@RequestMapping("/custMng")
	public String CustMngPage() {
		return "kcg/system/team2/team2_cust_mng/custMng";
	}

	
	// 고객 목록 페이지
	@RequestMapping("/custList")
	public String CustListPage() {
		return "kcg/system/team2/team2_cust_mng/custList";
	}
	
	// 고객 목록 조회 (List)
	@RequestMapping("/getCustInfoList")
	public List<CmmnMap> getCustInfoList(CmmnMap params, PagingConfig pagingConfig ) {
		List<CmmnMap> dataList = custMngSvc.getAll(params, pagingConfig);
//		log.debug(dataList.toString());	
		return dataList;
	}
	
	// 고객 목록 조회 (List)
	@RequestMapping("/getCustEventList")
	public List<CmmnMap> getCustEventList(CmmnMap params, PagingConfig pagingConfig ) {
		List<CmmnMap> dataList = custMngSvc.getEvent(params, pagingConfig);
//		log.debug(dataList.toString());	
		return dataList;
	}
	
	
	@RequestMapping("/getEmpInfo")
	public List<CmmnMap> getEmpInfo(CmmnMap params){
		List<CmmnMap> dataList = custMngSvc.getEmpInfo(params); 
//		log.debug(dataList.toString());
		return dataList;
	}
	
	@RequestMapping("/getCustOne")
	public CmmnMap getCustOne(CmmnMap params){
		CmmnMap data = custMngSvc.getCustOne(params); 
//		log.debug(data.toString());
		return data;
	}
	
	@RequestMapping("/getEmpSelInfo")
	public CmmnMap getEmpSelInfo(CmmnMap params){
		CmmnMap data = custMngSvc.getEmpSelInfo(params); 
//		log.debug(data.toString());
		return data;
	}
	
	@RequestMapping("/custUpdate")
	public CmmnMap custUpdate(CmmnMap params){
		return custMngSvc.custUpdate(params); 
	}
	
	@RequestMapping("/custInsert")
	public CmmnMap custInsert(CmmnMap params){
		return custMngSvc.custInsert(params); 
	}
	
	@RequestMapping("/custChangeSts")
	public CmmnMap custChangeSts(CmmnMap params){
		return custMngSvc.custChangeSts(params); 
	}
	
}
