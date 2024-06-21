package kcg.system.team2.comm_mng.svc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import common.utils.common.CmmnMap;
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
		return dataList;
	}

	public List<CmmnMap> getGrCommList(CmmnMap params) {
		List<CmmnMap> dataList = cmmnDao.selectList("system.team2_commmon_mng.getGrComm", params);
		return dataList;
	}
	

}
