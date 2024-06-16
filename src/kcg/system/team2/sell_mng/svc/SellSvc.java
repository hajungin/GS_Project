package kcg.system.team2.sell_mng.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import common.utils.common.CmmnMap;
import kcg.common.svc.CommonSvc;

@Service
public class SellSvc {
	
	@Autowired
	CommonSvc commonSvc;
	
	@Autowired
	CmmnDao cmmnDao;
	
	@Autowired
	

	public List<CmmnMap> getAll(CmmnMap params) {
		return cmmnDao.selectList("system.team2.sell.mng.getAll",params);
	}
	

}
