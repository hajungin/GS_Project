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


	public PageList<CmmnMap> getcustomer(CmmnMap params, PagingConfig pagingConfig) {
		PageList<CmmnMap> rslt = cmmnDao.selectListPage("system.team2.sell_mng.getcustomer", params,pagingConfig);
		return rslt;
	}


	public PageList<CmmnMap> joinList(CmmnMap params, PagingConfig pagingConfig) {
		PageList<CmmnMap> rslt = cmmnDao.selectListPage("system.team2.sell_mng.joinList", params,pagingConfig);
		return rslt;
	}


	public List<CmmnMap>custom(CmmnMap params) {
		System.out.println(params.toString());
		
		List<CmmnMap> rslt = null; // 반환할 결과 변수 선언 및 초기화
		// 리스트를 맵으로 변환
		CmmnMap paramMap = new CmmnMap();
		List<CmmnMap> subList = params.getCmmnMapList("sub_tg");
        for (CmmnMap param : subList) {
            String sub_tg = param.getString("sub_tg"); // 원하는 키로 설정
            paramMap.put("sub_tg", sub_tg);
        }
		if ("소상공인".equals(paramMap.getString("sub_tg"))) {
			rslt = cmmnDao.selectList("system.team2.sell_mng.businessCustom", params);
        } else if ("청년".equals(paramMap.getString("sub_tg"))) {
        	rslt = cmmnDao.selectList("system.team2.sell_mng.youthCustom", params);
        } 
		System.out.println(rslt.toString());
		return rslt;	
	}


	public List<CmmnMap> achievement(CmmnMap params) {
		List<CmmnMap> rslt = cmmnDao.selectList("system.team2.sell_mng.achievement", params);
		return rslt;
	}
	
	public List<CmmnMap> topCustomer() {
		List<CmmnMap> topCustomer = cmmnDao.selectList("system.team2.sell_mng.topCustomer");
		return topCustomer;
	}


	public CmmnMap Notice( ) {
		CmmnMap Notice = cmmnDao.selectOne("system.team2.sell_mng.Notice");
		return Notice;
	}
}
