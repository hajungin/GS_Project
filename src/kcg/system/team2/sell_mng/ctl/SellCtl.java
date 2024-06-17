package kcg.system.team2.sell_mng.ctl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.common.svc.CommonSvc;
import kcg.system.team2.sell_mng.svc.SellSvc;


@Controller
@RequestMapping("/sell")
public class SellCtl {
	
	@Autowired
	SellSvc sellsvc;
	
	@Autowired
	CommonSvc commonSvc;

	 @RequestMapping("/list")
	    public String openPage(ModelMap model) {
	        return "kcg/system/team2/team2_sell_mng/sell";
	 }
	 
	 @RequestMapping("/getList")
		public PageList<CmmnMap> getList(CmmnMap params , PagingConfig pagingConfig){
			return sellsvc.getList(params, pagingConfig); 
	 }
	 
	 @RequestMapping("/dtl")
		public String openPageDtl(Model model, CmmnMap params) {
			model.addAttribute("prod_cd", params.getString("prod_no", ""));
			return "kcg/system/team2/team2_sell_mng/dtl";
		}
}
