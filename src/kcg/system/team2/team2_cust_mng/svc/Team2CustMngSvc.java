package kcg.system.team2.team2_cust_mng.svc;

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
public class Team2CustMngSvc {
	
	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	CommonSvc commonSvc;
	
	@Autowired
	CmmnDao cmmnDao;

	public PageList<CmmnMap> getAll(CmmnMap params, PagingConfig pagingConfig) {
		return cmmnDao.selectListPage("system.team2_cust_mng.getAll", params, pagingConfig);
	}

	public List<CmmnMap> getEmpInfo(CmmnMap params) {
		List<CmmnMap> dataList = cmmnDao.selectList("system.team2_cust_mng.getEmpInfo");
		System.out.println(dataList.toString());
		return dataList;
	}

	public CmmnMap getCustOne(CmmnMap params) {
		CmmnMap data = cmmnDao.selectOne("system.team2_cust_mng.getCustOne", params);
		return data;
	}

	public CmmnMap getEmpSelInfo(CmmnMap params) {
		CmmnMap data = cmmnDao.selectOne("system.team2_cust_mng.getEmpSelInfo", params);
		return data;
	}

	public CmmnMap custUpdate(CmmnMap params) {
		cmmnDao.update("system.team2_cust_mng.custUpdate", params);
		return new CmmnMap().put("status", "OK");
	}

	public CmmnMap custInsert(CmmnMap params) {
		cmmnDao.update("system.team2_cust_mng.custInsert", params);
		return new CmmnMap().put("status", "OK");
	}

	public CmmnMap custChangeSts(CmmnMap params) {
		cmmnDao.update("system.team2_cust_mng.custChangeSts", params);
		return new CmmnMap().put("status", "OK");
	}


}
