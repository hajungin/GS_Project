package kcg.system.team2.prod_mng.svc;

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
public class ProdSvc {
	@SuppressWarnings("unused")
	private final Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	CommonSvc commonSvc;

	@Autowired
	CmmnDao cmmnDao;

	public PageList<CmmnMap> getListPaging(CmmnMap params, PagingConfig pagingConfig) {
		PageList<CmmnMap> rslt = cmmnDao.selectListPage("system.team2.prod_mng.getList", params, pagingConfig);
		return rslt;
	}
	
	public CmmnMap getDsgInfo(CmmnMap params) {
		CmmnMap rsltMap = new CmmnMap();
		if("PT01".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.prod_mng.getDsgnSavgpl", params);
		}else if("PT02".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.prod_mng.getDsgnAcmlpl", params);
		}else if("PT03".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.prod_mng.getDsgnDpstpl", params);
		}else if("PT04".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.prod_mng.getDsgnLoanpl", params);
		}
		return rsltMap;
	}
	
	public CmmnMap getProdInfo(CmmnMap params) {
		return cmmnDao.selectOne("system.prod_mng.getProdInfo", params);
	}

	public void save(CmmnMap params) {
		UserInfoVO userInfoVO = commonSvc.getLoginInfo();
		params.put("user_id", userInfoVO.getUserId());
		
		if(StringUtil.isEmpty(params.getString("plan_no"))) {
			if("1".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.prod_mng.insertDsgnSavgpl", params);
			}else if("2".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.prod_mng.insertDsgnAcmlpl", params);
			}else if("3".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.prod_mng.insertDsgnDpstpl", params);
			}else if("4".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.prod_mng.insertDsgnLoanpl", params);
			}
		} else {
			if("1".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.prod_mng.updateDsgnSavgpl", params);
			}else if("2".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.prod_mng.updateDsgnAcmlpl", params);
			}else if("3".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.prod_mng.updateDsgnDpstpl", params);
			}else if("4".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.prod_mng.updateDsgnLoanpl", params);
			}
		}
	}

	public List<CmmnMap> getList(CmmnMap params) {
		List<CmmnMap> rslt = cmmnDao.selectList("system.2team.prod_mng.getList", params);
		return rslt;
	}
}
