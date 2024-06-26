package kcg.system.team2.emp_mng.ctl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.system.team2.emp_mng.svc.EmpMngSvc;

@Controller
@RequestMapping("/empMng")
public class EmpMngCtl {
	
	@Autowired
	EmpMngSvc empMngSvc;
	
	@RequestMapping("/empMngList")
	public String getEmpMngList() {
		return "kcg/system/team2/team2_emp_mng/empMng";
	}
	
	@RequestMapping("/getEmpMngList")
	public PageList<CmmnMap> getEmpMngList(CmmnMap params, PagingConfig pagingConfig) {
		PageList<CmmnMap> pageList = empMngSvc.getEmpMngList(params, pagingConfig);
		return pageList;
	}
	
	@RequestMapping("/getEmpOne")
	public CmmnMap getEmpOne(CmmnMap params) {
		CmmnMap data = empMngSvc.getEmpOne(params);
		return data;
	}
	
	@RequestMapping("/empInsert")
	public CmmnMap empInsert(CmmnMap params) {
		return empMngSvc.empInsert(params); 
	}
	
	@RequestMapping("/empUpdate")
	public CmmnMap empUpdate(CmmnMap params) {
		return empMngSvc.empUpdate(params); 
	}
	
	@RequestMapping("/empDelete")
	public CmmnMap empDelete(CmmnMap params) {
		return empMngSvc.empDelete(params); 
	}
		
}




