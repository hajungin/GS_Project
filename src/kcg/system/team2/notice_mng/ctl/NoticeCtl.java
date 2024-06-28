package kcg.system.team2.notice_mng.ctl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utils.common.CmmnMap;
import common.utils.common.MultipartFileList;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.common.svc.CommonSvc;
import kcg.system.team2.notice_mng.svc.NoticeSvc;

@Controller
@RequestMapping("/system/notice_mng")
public class NoticeCtl {
	
	@Autowired
	NoticeSvc noticeSvc;
	
	@Autowired
	CommonSvc commonSvc;
	
//	기본 페이지 호출
	@RequestMapping("/list")
	public String noticeList(ModelMap model) {
		return "kcg/system/team2/team2_notice_mng/notice";
	}
	
	
//	공지사항 글 상세 페이지
	@RequestMapping("/notice")
	public String noticeDtl(ModelMap model, CmmnMap params) {
		model.addAttribute("notice_no", params.getString("notice_no", ""));
		return "kcg/system/team2/team2_notice_mng/notice_detail";
	}
	
	
//  수정 페이지 호출
	@RequestMapping("/update")
	public String updateNotice(ModelMap model, CmmnMap params) {
		model.addAttribute("notice_no", params.getString("notice_no", ""));
		return "kcg/system/team2/team2_notice_mng/update_notice";
	}
	
	
	
//  새로운 글 작성 페이지 호출
	@RequestMapping("/new_notice")
	public String newNotice(ModelMap model, CmmnMap params) {
		model.addAttribute("notice_no", params.getString("notice_no", ""));
		return "kcg/system/team2/team2_notice_mng/new_notice";
	}
	
	
	
//	페이징 처리
	@RequestMapping("/getList")
	public PageList<CmmnMap> getList(CmmnMap params , PagingConfig pagingConfig){
		return noticeSvc.getList(params, pagingConfig); 
	}
	
//	리스트 처리
	@RequestMapping("/getNotices")
	public List<CmmnMap> getNotices(CmmnMap params){
		System.out.println(params+ "뭐지?????????? 이건 컨트롤러임");
		return noticeSvc.getNotices(params); 
	}
	
	
//	게시글 디테일 정보 가져오기
	@RequestMapping("/getInfo")
	public CmmnMap getInfo(CmmnMap params){
		
		int noticeNo = Integer.parseInt(params.getString("notice_no", "0"));
        params.put("notice_no", noticeNo);
        
        System.out.println("notice_no: " + noticeNo);
        
		noticeSvc.incrementViewCount(params);
		
		return noticeSvc.getInfo(params); 
	}
	
	
//	게시글 수정
	@RequestMapping("/update_notice")
	public CmmnMap update(CmmnMap params){
		return noticeSvc.update(params); 
	}
	
	
// 	게시글 등록
	@RequestMapping("/insert")
	public CmmnMap insert(CmmnMap params){
		return noticeSvc.insert(params); 
	}
	
	
// 	게시글 삭제
	@RequestMapping("/delete")
	public CmmnMap delete(CmmnMap params){
		return noticeSvc.delete(params); 
	}
	

}







