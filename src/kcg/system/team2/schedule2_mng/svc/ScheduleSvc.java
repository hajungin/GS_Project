package kcg.system.team2.schedule2_mng.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import common.utils.common.CmmnMap;
import kcg.common.svc.CommonSvc;
import kcg.login.vo.UserInfoVO;

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
	
//	저장하기
	public CmmnMap insert(CmmnMap params) {
		System.out.println("================sch 서비스=================");
	    cmmnDao.insert("system.team2_schedule_mng.insertSch", params);
	    System.out.println("나와라 좀!!!!!!!!!!!!!!!!!! 서비스임"+params);
	    
	    return new CmmnMap().put("status", "OK"); 
	}
	
	public CmmnMap delete(CmmnMap params) {
		System.out.println("================sch 서비스 중 삭제중!!=================");
	    cmmnDao.delete("system.team2_schedule_mng.deleteSch", params);
	    System.out.println("나와라 좀!!!!!!!!!!!!!!!!!! 서비스 삭제임!!!"+params);
	    
	    return new CmmnMap().put("status", "OK"); 
	}
	
	
	public CmmnMap update(CmmnMap params) {
		System.out.println("================sch 서비스 중 업뎃중!!=================");
	    cmmnDao.update("system.team2_schedule_mng.updateSch", params);
	    System.out.println("나와라 좀!!!!!!!!!!!!!!!!!! 서비스 업뎃임!!!"+params);
	    
	    return new CmmnMap().put("status", "OK"); 
	}

	
	
	

}
