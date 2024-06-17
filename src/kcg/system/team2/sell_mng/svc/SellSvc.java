package kcg.system.team2.sell_mng.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.common.svc.CommonSvc;

@Service
public class SellSvc {
    
    @Autowired
    CommonSvc commonSvc;
    
    @Autowired
    CmmnDao cmmnDao;


	public PageList<CmmnMap> getList(CmmnMap params, PagingConfig pagingConfig) {
		PageList<CmmnMap> rslt = cmmnDao.selectListPage("system.team2.sell_mng.get", params,pagingConfig);
		return rslt;
	}


	public CmmnMap search(CmmnMap params) {
		CmmnMap rsltInfo = cmmnDao.selectOne("system.team2.sell_mng.get", params);
		List<CmmnMap> rsltHist = cmmnDao.selectList("system.team2.sell_mng.search", params);
		String strHist = "";
		for(CmmnMap map : rsltHist) {
			strHist = strHist + map.getString(strHist);
		}
		rsltInfo.put("prod_hist", strHist);
		return rsltInfo;
	}
}
