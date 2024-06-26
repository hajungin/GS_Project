package kcg.system.team2.schedule2_mng.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import common.utils.common.CmmnMap;
import kcg.common.svc.CommonSvc;

@Service
public class ScheduleSvc {
	
	@Autowired
	CmmnDao cmmnDao;
	@Autowired
	CommonSvc commonSvc;
	public List<CmmnMap> getSch(CmmnMap params) {
		
		List<CmmnMap> sch = cmmnDao.selectList("system.team2_schedule_mng.getSch", params);
		System.out.println("===================================svc"+sch);
		
		return sch;
	}

	/*
	 * public List<CmmnMap> getSch(CmmnMap params) {
	 * System.out.println("============================ getschSvc" + params);
	 * List<CmmnMap> info =
	 * cmmnDao.selectList("system.team2.schedule_mng.getSchedule", params);
	 * System.out.println(info); return info; }
	 */
	

}
