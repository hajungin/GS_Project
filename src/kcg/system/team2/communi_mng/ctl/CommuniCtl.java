package kcg.system.team2.communi_mng.ctl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.system.team2.communi_mng.svc.CommuniSvc;

@Controller
@RequestMapping("/communi")
public class CommuniCtl {
	
	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CommuniSvc communiSvc;
	
   @RequestMapping("/communiList")
   public String communiList() {
      return "kcg/system/team2/team2_communi/communi";
   }
   
   @RequestMapping("/getCommuniList")
   public PageList<CmmnMap> getCommuniList(CmmnMap params, PagingConfig pagingConfig) {
      PageList<CmmnMap> pageList = communiSvc.getCommuniList(params, pagingConfig);
      log.debug(pageList.toString());
      return pageList;
   }
   
   @RequestMapping("/getCnsltDtl")
   public CmmnMap getCnsltDtl(CmmnMap params) {
      return communiSvc.getCnsltDtl(params);
    }
   
   
   @RequestMapping("/cnsltDelete")
   public CmmnMap cnsltDelete(CmmnMap params) {
      return communiSvc.cnsltDelete(params);
    }

	@RequestMapping("/cnsltInsert")
	public CmmnMap cnsltInsert(CmmnMap params){
		return communiSvc.cnsltInsert(params); 
	}
	
	@RequestMapping("/getCnsltList")
	   public List<CmmnMap> getCnsltList(CmmnMap params) {
	      List<CmmnMap> List = communiSvc.getCnsltList(params);
	      log.debug(List.toString());
	      return List;
	   }

	
}
