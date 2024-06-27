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
public class CustSvc {
	
	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	CommonSvc commonSvc;
	
	@Autowired
	CmmnDao cmmnDao;

	public PageList<CmmnMap> getCustInfoList(CmmnMap params, PagingConfig pagingConfig) {
		 PageList<CmmnMap> custInfoList = cmmnDao.selectListPage("system.team2_cust_mng.getAll", params, pagingConfig);
		 return custInfoList; 
	}
		
		
	
	public PageList<CmmnMap> getCustEventList(CmmnMap params, PagingConfig pagingConfig) {
		return cmmnDao.selectListPage("system.team2_cust_mng.getEvent", params, pagingConfig);
	}
	
	public List<CmmnMap> getCustList(CmmnMap params) {
		List<CmmnMap> dataList = cmmnDao.selectList("system.team2_cust_mng.getCustList", params);
		log.debug(dataList.toString());
		return dataList;
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
		String pridtfNo = params.getString("cust_pridtf_no");
		String year = pridtfNo.substring(0, 2);
		String month = pridtfNo.substring(2, 4);
		String day = pridtfNo.substring(4, 6);
		String pridtfNo2 = pridtfNo.substring(7, 8);
		String birth = null;
		if(pridtfNo2.equals("1") || pridtfNo2.equals("2") || pridtfNo2.equals("5") || pridtfNo2.equals("6")){
			birth = "19"+ year + "-" + month + "-" + day;
		} else if(pridtfNo2.equals("3") || pridtfNo2.equals("4") || pridtfNo2.equals("7") || pridtfNo2.equals("8")){
			birth = "20"+ year + "-" + month + "-" + day;
		}
		params.put("birth", birth);
		cmmnDao.insert("system.team2_cust_mng.custInsert", params);
		return new CmmnMap().put("status", "OK");
	}

	public CmmnMap custChangeSts(CmmnMap params) {
		cmmnDao.update("system.team2_cust_mng.custChangeSts", params);
		return new CmmnMap().put("status", "OK");
	}




}
