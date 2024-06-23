package kcg.system.team2.communi_mng.svc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.common.svc.CommonSvc;

@Service
public class CommuniSvc {
	
	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	CommonSvc commonSvc;
	
	@Autowired
	CmmnDao cmmnDao;
	
	public PageList<CmmnMap> getCommuniList(CmmnMap params, PagingConfig pagingConfig) {
		  System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + params.get("cnslt_dt"));
	      return cmmnDao.selectListPage("system.team2_communi_mng.communiList", params, pagingConfig);
	   }

   public CmmnMap cnsltDelete(CmmnMap params) {
      List<CmmnMap> dataCopyList = params.getCmmnMapList("dataCopyList");
      for (CmmnMap map : dataCopyList) {
         int cnslt_no = map.getInt("cnslt_no");
         System.out.println(cnslt_no);
         log.debug(String.valueOf(cnslt_no));
         map.put("cnslt_no", cnslt_no);
         cmmnDao.delete("system.team2_communi_mng.cnsltDelete", map);
      }
      return new CmmnMap().put("status", "OK");
   }


	public CmmnMap cnsltInsert(CmmnMap params) {
		String pridtfNo = params.getString("cust_pridtf_no");
		int pridtfNo1 = Integer.parseInt(pridtfNo.substring(0, 6));
		int pridtfNo2 = Integer.parseInt(pridtfNo.substring(7));
		cmmnDao.insert("system.team2_communi_mng.cnsltInsert", params);
		return new CmmnMap().put("status", "OK");
	}

	public CmmnMap getCnsltDtl(CmmnMap params) {
		return cmmnDao.selectOne("system.team2_communi_mng.getCnsltDtl", params);
	}

	public List<CmmnMap> getCnsltList(CmmnMap params) {
		return cmmnDao.selectList("system.team2_communi_mng.getCnsltList", params);
	}

}
