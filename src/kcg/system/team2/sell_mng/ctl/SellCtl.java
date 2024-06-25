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
	 
	 // 상품관리 리스트 및 검색
	 @RequestMapping("/getList")
		public PageList<CmmnMap> getList(CmmnMap params , PagingConfig pagingConfig){
			return sellsvc.getList(params, pagingConfig); 
	 }
	 
	 // 가입관리 페이지
	 @RequestMapping("/join")
	 	public String joinPage() {
		 return "kcg/system/team2/team2_sell_mng/join";
	 }
	 
	 // 고객정보 리스트 및 검색
	 @RequestMapping("/getcustomer")
	 	public PageList<CmmnMap> getcustomer(CmmnMap params , PagingConfig pagingConfig){
			return sellsvc.getcustomer(params, pagingConfig); 
	 }
	 
	 // 가입내역 확인 페이지
	 @RequestMapping("/membership")
	 	public String membership() {
		  return "kcg/system/team2/team2_sell_mng/membership"; 
	 }
	 
	 //가입현황 리스트 및 검색
	 @RequestMapping("/joinList")
	 	public PageList<CmmnMap> joinList(CmmnMap params , PagingConfig pagingConfig){
			return sellsvc.joinList(params, pagingConfig); 
	 }
	 
	 @RequestMapping("/custom")
		public List<CmmnMap> custom(CmmnMap params) {
			return sellsvc.custom(params);
		}
	 
	 
	 
	 
	 
}
