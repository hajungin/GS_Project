package kcg.system.team2.promion_mng.ctl;

import java.util.List;

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
import kcg.system.team2.promion_mng.svc.PromionSvc;



@Controller
@RequestMapping("/cal")
public class PromionCtl {
	@SuppressWarnings("unused")
	private final Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	PromionSvc promionSvc;
	
	@Autowired
	CommonSvc commonSvc;
	

	@RequestMapping("/listPlan")
	public String openPageCalc(Model model, CmmnMap params) {
		return "kcg/system/team2/team2_cal/PlanList";
	}
	@RequestMapping("/getListPaging")
	public PageList<CmmnMap> getListPaging(CmmnMap params, PagingConfig pagingConfig) {
		return promionSvc.getListPaging(params, pagingConfig);
	}
	@RequestMapping("/dtlCom")
	public String openDtl(Model model, CmmnMap params) {
		System.out.println("=====================dtlCom" + params);
		String prodType = params.getString("prod_type", "PT01");
		model.addAttribute("plan_no", params.getString("plan_no", ""));			// 설계설계번호
		model.addAttribute("cust_sn", params.getString("cust_sn", ""));	// 고객KEY
		model.addAttribute("prod_type", prodType);										// 설계타입코드 : 1.적금설계, 2.목돈마련설계, 3.예금설계, 4.대출설계
		
		String sRsltUrl = "";
		if("PT01".equals(prodType)) {
			sRsltUrl = "kcg/system/team2/team2_cal/CalcDpst";
		}else if("PT02".equals(prodType)) {
			sRsltUrl = "kcg/system/team2/team2_cal/CalcDpstplDtl";
		}else if("PT03".equals(prodType)) {
			sRsltUrl = "kcg/system/team2/team2_cal/CalcLoanDtl";
		}else if("PT04".equals(prodType)) {
			sRsltUrl = "kcg/system/team2/team2_cal/CalcAcmlplDtl";
		}
		
		return sRsltUrl;
	}
	
	@RequestMapping("/getDsgInfos")
	public CmmnMap getDsgInfos(CmmnMap params) {
		return promionSvc.getDsgInfo(params);
	}
	
	@RequestMapping("/getProdInfo")
	public CmmnMap getProdInfo(CmmnMap params) {
		System.out.println("==========================" + params);
		CmmnMap rsltMap = new CmmnMap();
		rsltMap = promionSvc.getProdInfo(params);
		rsltMap.put("simpl_ty_cd", params.getString("simpl_ty_cd", "0"));
		
		return rsltMap;
	}
	
	@RequestMapping("/savePlan")
	public void save(CmmnMap params) {
		System.out.println("==============================save" + params);
		promionSvc.save(params);
	}
	
	@RequestMapping("/saveSell")
	public void saveSell(CmmnMap params) {
		System.out.println("==============================saveSellCtl" + params);
		promionSvc.saveSell(params);
	}
	
	@RequestMapping("/getCust")
	public List<CmmnMap> getCust(CmmnMap params){
		return promionSvc.getCust(params);
	}
	
	@RequestMapping("/getCustCard")
	public CmmnMap getCustCard(CmmnMap params) {
		return promionSvc.getCustCard(params);
	}
	
	@RequestMapping("/getProdLists")
	public List<CmmnMap> getProdList(CmmnMap params) {
		System.out.println("================================" + params);
		return promionSvc.getProdList(params);
	}
}