package kcg.system.team2.comm_mng.svc;

import java.util.ArrayList;
import java.util.Iterator;
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
public class CommSvc {
	
	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	HttpServletRequest request;
	
	
	@Autowired
	CmmnDao cmmnDao;

	public List<CmmnMap> getAll(CmmnMap params) {
		List<CmmnMap> dataList = cmmnDao.selectList("system.team2_commmon_mng.getAll", params);
		List<CmmnMap> newList = new ArrayList<>(); 
		for(CmmnMap cmmnMap:dataList) {
			cmmnMap.put("selected", false);
			cmmnMap.put("update", false);
			newList.add(cmmnMap);
		}
		CmmnMap cmmnMap = new CmmnMap();
		return newList;
	}

	public List<CmmnMap> getGrCommList(CmmnMap params) {
		List<CmmnMap> dataList = cmmnDao.selectList("system.team2_commmon_mng.getGrComm", params);
		return dataList;
	}
	
	public List<CmmnMap> getCommList(CmmnMap params) {
		List<CmmnMap> dataList = cmmnDao.selectList("system.team2_commmon_mng.getComm", params);
		return dataList;
	}

	public CmmnMap commInsert(CmmnMap params) {
		int groupCommNo = Integer.parseInt(params.getString("gr_comm_no"));
	    params.put("group_comm_no", groupCommNo);
		cmmnDao.insert("system.team2_commmon_mng.commInsert", params);
		return new CmmnMap().put("status", "OK");
	}
	
	public CmmnMap commUpdateRoof(CmmnMap params) {
		List<CmmnMap> updateData = params.getCmmnMapList("updateData");
		for(CmmnMap cmmnMap:updateData) {
			cmmnDao.update("system.team2_commmon_mng.commUpdate", cmmnMap);
		}
		return new CmmnMap().put("status", "OK");
	}

	public CmmnMap commDeleteRoof(CmmnMap params) {
		List<CmmnMap> deleteList = params.getCmmnMapList("deleteList");
		CmmnMap cmmnMap= new CmmnMap();
	    try {
	    	for (CmmnMap map : deleteList) {
	    		cmmnDao.delete("system.team2_commmon_mng.commDelete", map);
	    		cmmnMap.put("status", "OK");
	    	}
    	} catch (Exception e) {
    		cmmnMap.put("status", "error");
    	}
	      return cmmnMap;
   }

	public CmmnMap grCommUpdateRoof(CmmnMap params) {
		List<CmmnMap> updateData = params.getCmmnMapList("dataList");
		for(CmmnMap cmmnMap:updateData) {
			cmmnDao.update("system.team2_commmon_mng.grCommUpdate", cmmnMap);
		}
		return new CmmnMap().put("status", "OK");
	}

}
	
	