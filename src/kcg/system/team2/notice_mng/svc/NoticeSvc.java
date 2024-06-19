package kcg.system.team2.notice_mng.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import kcg.common.svc.CommonSvc;

@Service
public class NoticeSvc {
	
	@Autowired
	CmmnDao cmmnDao;
	
	@Autowired
	CommonSvc commonSvc;

}
