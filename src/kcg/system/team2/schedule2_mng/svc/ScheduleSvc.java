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

	
	
	
	
	/*
	 * public CmmnMap insertTaskInfo(CmmnMap params) {
	 * 
	 * String tsk_sj = params.getString("TSK_SJ"); String tsk_ty_cd =
	 * params.getString("TSK_TY_CD"); String tsk_bgng_dt_year =
	 * params.getString("TSK_BGNG_DT_YEAR"); String tsk_bang_dt_mon =
	 * params.getString("TSK_BGNG_DT_MON"); String tsk_bgng_dt_dd =
	 * params.getString("TSK_BGNG_DT_DD"); String tsk_bgng_dt_hh =
	 * params.getString("TSK_BGNG_DT_HH"); String tsk_bgng_dt_mm =
	 * params.getString("TSK_BGNG_DT_MM"); String tsk_end_dt_mon =
	 * params.getString("TSK_END_DT_MON"); String tsk_end_dt_dd =
	 * params.getString("TSK_END_DT_DD"); String tsk_end_dt_hh =
	 * params.getString("TSK_END_DT_HH"); String tsk_end_dt_mm =
	 * params.getString("TSK_END_DT_MM"); String tsk_dtl_cn =
	 * params.getString("TSK_DTL_CN"); String tsk_cust_nm =
	 * params.getString("TSK_CUST_NM");
	 * 
	 * UserInfoVO userInfoVO = commonSvc.getLoginInfo(); params.put("user_id",
	 * userInfoVO.getUserId());
	 * 
	 * params.put("tsk_sj", tsk_sj); params.put("tsk_ty_cd", tsk_ty_cd);
	 * params.put("tsk_bgng_dt_year", tsk_bgng_dt_year);
	 * params.put("tsk_bang_dt_mon", tsk_bang_dt_mon); params.put("tsk_bgng_dt_dd",
	 * tsk_bgng_dt_dd); params.put("tsk_bgng_dt_hh", tsk_bgng_dt_hh);
	 * params.put("tsk_bgng_dt_mm", tsk_bgng_dt_mm); params.put("tsk_end_dt_mon",
	 * tsk_end_dt_mon); params.put("tsk_end_dt_dd", tsk_end_dt_dd);
	 * params.put("tsk_end_dt_hh", tsk_end_dt_hh); params.put("tsk_end_dt_mm",
	 * tsk_end_dt_mm); params.put("tsk_dtl_cn", tsk_dtl_cn);
	 * params.put("tsk_cust_nm", tsk_cust_nm);
	 * 
	 * cmmnDao.insert("system.schedule_mng.insertTaskInfo", params);
	 * 
	 * return new CmmnMap().put("status", "OK"); }
	 */
}
