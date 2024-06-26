package kcg.system.team2.promion_mng.svc;

import java.util.ArrayList;
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
import common.utils.string.StringUtil;
import kcg.common.svc.CommonSvc;
import kcg.login.vo.UserInfoVO;

@Service
public class PromionSvc {
	@SuppressWarnings("unused")
	private final Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	CommonSvc commonSvc;

	@Autowired
	CmmnDao cmmnDao;
	
	
	public PageList<CmmnMap> getListPaging(CmmnMap params, PagingConfig pagingConfig) {
		System.out.println("==============================planlist" + params);
		PageList<CmmnMap> rslt = cmmnDao.selectListPage("system.team2.promion_mng.getList", params, pagingConfig);
		return rslt;
	}
	
	public CmmnMap getDsgInfo(CmmnMap params) {
		System.out.println("============================DsgInfo" + params);
		CmmnMap rsltMap = new CmmnMap();
		if("PT01".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.promion_mng.getDsgnSavgpl", params);
		}else if("PT02".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.promion_mng.getDsgnDpstpl", params);
		}else if("PT03".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.promion_mng.getDsgnLoanpl", params);
		}else if("PT04".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.promion_mng.getDsgnAcmlpl", params);
		}
		return rsltMap;
	}
	
	public CmmnMap getProdInfo(CmmnMap params) {
		System.out.println("====================svc" + params);
		CmmnMap result = new CmmnMap();
		if("PT01".equals(params.getString("prod_type"))) {
			result = cmmnDao.selectOne("system.team2.promion_mng.getProdInfo", params);
		}else if("PT02".equals(params.getString("prod_type"))) {
			result = cmmnDao.selectOne("system.team2.promion_mng.getProdDp", params);
		}else if("PT03".equals(params.getString("prod_type"))) {
			result = cmmnDao.selectOne("system.team2.promion_mng.getProdLoan", params);
		}else if("PT04".equals(params.getString("prod_type"))) {
			result = cmmnDao.selectOne("system.team2.promion_mng.getProdAc", params);
		}
		
		return result;
	}

	public void save(CmmnMap params) {
		UserInfoVO userInfoVO = commonSvc.getLoginInfo();
		params.put("user_id", userInfoVO.getUserId());
		System.out.println("================================================================save" + params);
		if(StringUtil.isEmpty(params.getString("plan_no"))) {
			if("PT01".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.promion_mng.insertDsgnSavgpl", params);
			}else if("PT02".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.promion_mng.insertDsgnDpstpl", params);
			}else if("PT03".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.promion_mng.insertDsgnLoanpl", params);
			}else if("PT04".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.promion_mng.insertDsgnAcmlpl", params);
			}
		} else {
			if("PT01".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.promion_mng.updateDsgnSavgpl", params);
			}else if("PT02".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.promion_mng.updateDsgnDpstpl", params);
			}else if("PT03".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.promion_mng.updateDsgnLoanpl", params);
			}else if("PT04".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.promion_mng.updateDsgnAcmlpl", params);
			}
		}
	}

	public List<CmmnMap> getCust(CmmnMap params) {
		
		return cmmnDao.selectList("system.team2.promion_mng.getCust", params);
	}

	public CmmnMap getCustCard(CmmnMap params) {
		return cmmnDao.selectOne("system.team2.promion_mng.getCustCard", params);
	}

	public List<CmmnMap> getProdList(CmmnMap params) {
		List<CmmnMap> result = new ArrayList<CmmnMap>();
		if("PT02".equals(params.getString("prod_type"))) {
			result = cmmnDao.selectList("system.team2.promion_mng.getDp", params);
		}else if("PT03".equals(params.getString("prod_type"))) {
			result = cmmnDao.selectList("system.team2.promion_mng.getLoan", params);
		}else if("PT04".equals(params.getString("prod_type"))) {
			result = cmmnDao.selectList("system.team2.promion_mng.getAc", params);
		}
		
		return result;
	}

	public void saveSell(CmmnMap params) {
		UserInfoVO userInfoVO = commonSvc.getLoginInfo();
		params.put("user_id", userInfoVO.getUserId());
		System.out.println("===========================================saveSellSvc" + params);
		if(StringUtil.isEmpty(params.getString("plan_no"))) {
			if("PT01".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.promion_mng.insertSavgplSell", params);
			}else if("PT02".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.promion_mng.insertDpstplSell", params);
			}else if("PT03".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.promion_mng.insertLoanplSell", params);
			}else if("PT04".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.promion_mng.insertAcmlplSell", params);
			}
		} else {
			if("PT01".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.promion_mng.updateInitYN", params);
			}else if("PT02".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.promion_mng.updateDpInitYN", params);
			}else if("PT03".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.promion_mng.updateLoanInitYN", params);
			}else if("PT04".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.promion_mng.updateAcInitYN", params);
			}
		}
	}
	
}