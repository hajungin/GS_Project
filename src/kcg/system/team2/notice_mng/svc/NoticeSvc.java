package kcg.system.team2.notice_mng.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import common.utils.common.CmmnMap;
import common.utils.common.CmmnUtil;
import common.utils.common.MultipartFileList;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import common.utils.string.StringUtil;
import common.utils.uuid.UuidUtil;
import kcg.common.svc.CommonSvc;
import kcg.login.vo.UserInfoVO;

@Service
public class NoticeSvc {
	
	@Autowired
	CmmnDao cmmnDao;
	
	@Autowired
	CommonSvc commonSvc;
	
//	페이징 처리
	public PageList<CmmnMap> getList(CmmnMap params, PagingConfig pagingConfig) {
		PageList<CmmnMap> rslt = cmmnDao.selectListPage("system.team2.notice_mng.getNoticeList", params, pagingConfig);
		return rslt;
	}
	
//	그냥 리스트로 가져오기 (메인화면용)
	public List<CmmnMap> getNotices(CmmnMap params){
		List<CmmnMap> rslt = cmmnDao.selectList("system.team2.notice_mng.getNoticeList", params);
		return rslt;
	}
	
	
//	상세 정보 가져오기
	public CmmnMap getInfo(CmmnMap params) {
		CmmnMap info = cmmnDao.selectOne("system.team2.notice_mng.getNoticeDetail", params);
		if(info != null) {
			info.put("ctnt", StringUtil.simpleDecodeXSS(info.getString("ctnt","")));
		}
		
		return info;
	}
	
//	업데이트
	public CmmnMap update(CmmnMap params) {
	    cmmnDao.update("system.team2.notice_mng.updateInfo", params); // params를 함께 전달하여 업데이트 쿼리를 실행
	    return new CmmnMap().put("notice_no", params.getString("notice_no")); // notice_no 키에 params에서 가져온 값을 넣음
	}
	
	
//	조회 수 증가
	public void incrementViewCount(CmmnMap params) {
        System.out.println("Incrementing view count for notice_no: " + params.get("notice_no"));
		cmmnDao.update("system.team2.notice_mng.incrementViewCount", params);
    }

	
//	저장하기
	public CmmnMap insert(CmmnMap params) {
	    cmmnDao.insert("system.team2.notice_mng.insertInfo", params);
	    return new CmmnMap().put("notice_no", params.getString("notice_no")); 
	}
	
	
//	삭제하기
	public CmmnMap delete(CmmnMap params) {
	    cmmnDao.update("system.team2.notice_mng.deleteInfo", params);
	    return new CmmnMap().put("notice_no", params.getString("notice_no")); 
	}

}
