package kcg.system.team2.team2_cust_mng.ctl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.common.svc.CommonSvc;
import kcg.login.vo.UserInfoVO;
import kcg.system.team2.team2_cust_mng.svc.CustSvc;


@Controller
@RequestMapping("/customer")
public class CustCtl {

	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CustSvc custSvc;

	// 고객 목록 페이지
	@RequestMapping("/custMng")
	public String CustMngPage() {
		return "kcg/system/team2/team2_cust_mng/custMng";
	}

	
	// 고객 목록 페이지
	@RequestMapping("/custList")
	public String CustListPage(Model model, HttpSession session) {
		UserInfoVO userInfoVO = (UserInfoVO) session.getAttribute("userInfoVO");
		model.addAttribute("emp_no", userInfoVO.getEmpNo());
		return "kcg/system/team2/team2_cust_mng/custList";
	}
	
	// 고객 목록 조회 (List)
	@RequestMapping("/getCustInfoList")
	public PageList<CmmnMap> getCustInfoList(CmmnMap params, PagingConfig pagingConfig) {
		PageList<CmmnMap> PageList = custSvc.getCustInfoList(params, pagingConfig);
		return PageList;
	}
	
	@RequestMapping("/getCustList")
	public List<CmmnMap> getCustList(CmmnMap params){
		log.debug(params.toString());
		List<CmmnMap> dataList = custSvc.getCustList(params); 
		return dataList;
	}
	
	@RequestMapping("/getEmpInfo")
	public List<CmmnMap> getEmpInfo(CmmnMap params){
		List<CmmnMap> dataList = custSvc.getEmpInfo(params); 
//		log.debug(dataList.toString());
		return dataList;
	}
	
	@RequestMapping("/getCustOne")
	public CmmnMap getCustOne(CmmnMap params){
		CmmnMap data = custSvc.getCustOne(params); 
//		log.debug(data.toString());
		return data;
	}
	
	@RequestMapping("/getEmpSelInfo")
	public CmmnMap getEmpSelInfo(CmmnMap params){
		CmmnMap data = custSvc.getEmpSelInfo(params); 
//		log.debug(data.toString());
		return data;
	}
	
	@RequestMapping("/custUpdate")
	public CmmnMap custUpdate(CmmnMap params){
		return custSvc.custUpdate(params); 
	}
	
	@RequestMapping("/custInsert")
	public CmmnMap custInsert(CmmnMap params){
		return custSvc.custInsert(params); 
	}
	
	@RequestMapping("/custChangeSts")
	public CmmnMap custChangeSts(CmmnMap params){
		return custSvc.custChangeSts(params); 
	}
	
}
