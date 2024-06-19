package kcg.system.team2.prod_mng.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;

@Service
public class ProdSvc {
	
	@Autowired
    CmmnDao cmmnDao;

	public PageList<CmmnMap> getList(CmmnMap params, PagingConfig pagingConfig) {
		PageList<CmmnMap> rslt = cmmnDao.selectListPage("system.team2.prod_mng.getList", params,pagingConfig);
		return rslt;
	}

	public CmmnMap save(CmmnMap params) {
	    CmmnMap resultMap = new CmmnMap();
	    params.put("pay_period", Integer.parseInt(params.getString("pay_period")));
	    params.put("price_max", Integer.parseInt(params.getString("price_max")));
	    params.put("price_min", Integer.parseInt(params.getString("price_min")));
	    

	    try {
	        if ("PT01".equals(params.getString("prod_type"))) {
	            cmmnDao.insert("system.team2.prod_mng.PSsave", params);
	        } else if ("PT03".equals(params.getString("prod_type"))) {
	            cmmnDao.insert("system.team2.prod_mng.Losave", params);
	        } else if ("PT02".equals(params.getString("prod_type"))) {
	            cmmnDao.insert("system.team2.prod_mng.DPsave", params);
	        } else if ("PT04".equals(params.getString("prod_type"))) {
	            cmmnDao.insert("system.team2.prod_mng.ACsave", params);
	        }

	        cmmnDao.insert("system.team2.prod_mng.COsave", params);

	        // 여기서 필요한 데이터를 resultMap에 설정
	        resultMap.put("prod_cd", params.getString("prod_cd"));
	        

	        resultMap.put("status", "success");
	    } catch (Exception e) {
	        resultMap.put("status", "fail");
	        e.printStackTrace();
	    }

	    return resultMap;
	}


	public CmmnMap code(CmmnMap params) {
		CmmnMap rslt = cmmnDao.selectOne("system.team2.prod_mng.code",params);
		return rslt;
	}

}
