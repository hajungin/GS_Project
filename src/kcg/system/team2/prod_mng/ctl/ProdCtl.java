package kcg.system.team2.prod_mng.ctl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.system.team2.prod_mng.svc.ProdSvc;

@Controller
@RequestMapping("/2team/prod")
public class ProdCtl {
	
	@Autowired
	ProdSvc prodSvc;
	
	// 상품관리 조회 페이지(메인)
	@RequestMapping("/list")
    public String prodPage(ModelMap model) {
        return "kcg/system/team2/team2_prod_mng/list";
 }
	// 상품 프로모션 제외 리스트 가져오기
	@RequestMapping("/getList")
	public PageList<CmmnMap> getListProd(CmmnMap params , PagingConfig pagingConfig){
		return prodSvc.getList(params, pagingConfig); 
 }
	// 상품 등록 페이지 이동
	@RequestMapping("/insert")
	public String openPageDtl(Model model, CmmnMap params) {
		return "kcg/system/team2/team2_prod_mng/insert";
	}
	
	// 받아온 값들 데이터베이스에 저장
	@RequestMapping("/save")
	public CmmnMap save(CmmnMap params) {
		return prodSvc.save(params);
	}
	@RequestMapping("/code")
	public CmmnMap code(CmmnMap params) {
		return prodSvc.code(params);
	}
}
