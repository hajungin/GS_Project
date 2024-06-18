package kcg.system.team2.prod_mng.ctl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.common.svc.CommonSvc;
import kcg.system.promion_mng.svc.PromionMngSvc;
import kcg.system.team2.prod_mng.svc.ProdSvc;

@Controller
@RequestMapping("/sell")
public class ProdCtl {
	@SuppressWarnings("unused")
	private final Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	ProdSvc prodSvc;
	
	@Autowired
	CommonSvc commonSvc;
	
	@RequestMapping("/list")
	public String openPageCalc(Model model, CmmnMap params) {
		return "kcg/system/team2/team2_prod_mng/planlist";
	}
	
	@RequestMapping("/getlist")
	public List<CmmnMap> productList(CmmnMap params) {
		return prodSvc.getList(params);
	}
	
	@RequestMapping("/dtl")
	public String openPageDtl(Model model, CmmnMap params) {
		
		String sProdTyCd = params.getString("prod_type", "PT01");
		model.addAttribute("plan_no", params.getString("plan_no", ""));			// 설계설계번호
		model.addAttribute("cust_mbl_telno", params.getString("cust_mbl_telno", ""));	// 고객KEY
		model.addAttribute("prod_type", sProdTyCd);										// 설계타입코드 : 1.적금설계, 2.목돈마련설계, 3.예금설계, 4.대출설계
		
		String sRsltUrl = "";
		if("PT01".equals(sProdTyCd)) {
			sRsltUrl = "kcg/system/team2/team2_prod_mng/CalcDpst";
		}else if("PT02".equals(sProdTyCd)) {
			sRsltUrl = "kcg/system/promion_mng/PromionAcmlplDtl";
		}else if("PT03".equals(sProdTyCd)) {
			sRsltUrl = "kcg/system/promion_mng/PromionDpstplDtl";
		}else if("PT04".equals(sProdTyCd)) {
			sRsltUrl = "kcg/system/promion_mng/PromionLoanplDtl";
		}
		
		return sRsltUrl;
	}
	
	@RequestMapping("/getListPaging")
	public PageList<CmmnMap> getListPaging(CmmnMap params, PagingConfig pagingConfig) {
		return prodSvc.getListPaging(params, pagingConfig);
	}
	
	@RequestMapping("/getDsgInfo")
	public CmmnMap getDsgInfo(CmmnMap params) {
		return prodSvc.getDsgInfo(params);
	}
	
	@RequestMapping("/getProdInfo")
	public CmmnMap getProdInfo(CmmnMap params) {
		
		CmmnMap rsltMap = new CmmnMap();
		rsltMap = prodSvc.getProdInfo(params);
		rsltMap.put("simpl_ty_cd", params.getString("simpl_ty_cd", "0"));
		
		return rsltMap;
	}
	
	@RequestMapping("/save")
	public void save(CmmnMap params) {
		prodSvc.save(params);
	}
}
