package kcg.system.team2.emp_mng.svc;

import java.text.SimpleDateFormat;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import common.dao.IamDao;
import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.common.svc.CommonSvc;

@Service
public class EmpMngSvc {
	
	@Autowired
	CommonSvc commonSvc;
	
	@Autowired
	CmmnDao cmmnDao;
	
	@Autowired
	IamDao iamDao;

	public PageList<CmmnMap> getEmpMngList(CmmnMap params, PagingConfig pagingConfig) {
		return cmmnDao.selectListPage("system.team2_emp_mng.getEmpMngList", params, pagingConfig);
	}

	public CmmnMap getEmpOne(CmmnMap params) {
		CmmnMap data = cmmnDao.selectOne("system.team2_emp_mng.getEmpOne", params);
		return data;
	}

	public CmmnMap empInsert(CmmnMap params) {
		cmmnDao.update("system.team2_emp_mng.empInsert", params);
		return new CmmnMap().put("status", "OK");
	}
	
	public CmmnMap empUpdate(CmmnMap params) {
		cmmnDao.update("system.team2_emp_mng.empUpdate", params);
		return new CmmnMap().put("status", "OK");
	}
	
	public CmmnMap empDelete(CmmnMap params) {
		cmmnDao.update("system.team2_emp_mng.empDelete", params);
		return new CmmnMap().put("status", "OK");
	}
	
}
