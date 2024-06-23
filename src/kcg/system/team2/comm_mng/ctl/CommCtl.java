package kcg.system.team2.comm_mng.ctl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import kcg.system.team2.comm_mng.svc.CommSvc;

@Controller
@RequestMapping("common")
public class CommCtl {
	
	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CommSvc commSvc;
	
	

	// 공통 옵션 관리 페이지
	@RequestMapping("/commMng")
	public String commMngPage() {
		return "kcg/system/team2/team2_comm_mng/commMng";
	}
	
	// 공통 옵션 목록 조회 (List)
	@RequestMapping("/getCommonList")
	public List<CmmnMap> getCommonList(CmmnMap params) {
		List<CmmnMap> dataList = commSvc.getAll(params);
		log.debug(dataList.toString());	
		return dataList;
	}
	
	@RequestMapping("/getGrCommList")
	public List<CmmnMap> getGrCommList(CmmnMap params) {
		List<CmmnMap> dataList = commSvc.getGrCommList(params);
		log.debug(dataList.toString());	
		return dataList;
	}
	
	@RequestMapping("/getCommList")
	public List<CmmnMap> getCommList(CmmnMap params) {
		List<CmmnMap> dataList = commSvc.getCommList(params);
		log.debug(dataList.toString());	
		return dataList;
	}
	
	@RequestMapping("/commInsert")
	public CmmnMap commInsert(CmmnMap params){
		return commSvc.commInsert(params); 
	}
	
	@RequestMapping("/commUpdate")
	public CmmnMap commUpdateRoof(CmmnMap params){
		return commSvc.commUpdateRoof(params); 
	}
	
	@RequestMapping("/commDelete")
	   public CmmnMap commDeleteRoof(CmmnMap params) {
	      return commSvc.commDeleteRoof(params);
    }
	
	@RequestMapping("/grCommUpdate")
	public CmmnMap grCommUpdateRoof(CmmnMap params){
		return commSvc.grCommUpdateRoof(params); 
	}
	
	
}
