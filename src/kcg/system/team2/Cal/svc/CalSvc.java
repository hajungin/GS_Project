package kcg.system.team2.Cal.svc;

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
public class CalSvc {
	@SuppressWarnings("unused")
	private final Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	CommonSvc commonSvc;

	@Autowired
	CmmnDao cmmnDao;
	
	public List<CmmnMap> getProdList(CmmnMap params) {
		List<CmmnMap> rslt = cmmnDao.selectList("system.team2.Cal.getProdList", params);
		return rslt;
	}

	public PageList<CmmnMap> getListPaging(CmmnMap params, PagingConfig pagingConfig) {
		PageList<CmmnMap> rslt = cmmnDao.selectListPage("system.team2.Cal.getList", params, pagingConfig);
		return rslt;
	}
	
	public CmmnMap getDsgInfo(CmmnMap params) {
		CmmnMap rsltMap = new CmmnMap();
		if("PT01".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.Cal.getDsgnSavgpl", params);
		}else if("PT02".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.Cal.getDsgnAcmlpl", params);
		}else if("PT03".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.Cal.getDsgnDpstpl", params);
		}else if("PT04".equals(params.getString("prod_type"))) {
			rsltMap = cmmnDao.selectOne("system.team2.Cal.getDsgnLoanpl", params);
		}
		return rsltMap;
	}
	
	public CmmnMap getProdInfo(CmmnMap params) {
		return cmmnDao.selectOne("system.team2.Cal.getProdInfo", params);
	}

	public void save(CmmnMap params) {
		UserInfoVO userInfoVO = commonSvc.getLoginInfo();
		params.put("user_id", userInfoVO.getUserId());
		
		if(StringUtil.isEmpty(params.getString("prod_ds_sn"))) {
			if("PT01".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.Cal.insertDsgnSavgpl", params);
			}else if("PT02".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.Cal.insertDsgnAcmlpl", params);
			}else if("PT03".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.Cal.insertDsgnDpstpl", params);
			}else if("PT04".equals(params.getString("prod_type"))) {
				cmmnDao.insert("system.team2.Cal.insertDsgnLoanpl", params);
			}
		} else {
			if("PT01".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.Cal.updateDsgnSavgpl", params);
			}else if("PT02".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.Cal.updateDsgnAcmlpl", params);
			}else if("PT03".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.Cal.updateDsgnDpstpl", params);
			}else if("PT04".equals(params.getString("prod_type"))) {
				cmmnDao.update("system.team2.Cal.updateDsgnLoanpl", params);
			}
		}
	}
	
}