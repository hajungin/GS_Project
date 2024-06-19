package kcg.system.team2.notice_mng.ctl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kcg.common.svc.CommonSvc;
import kcg.system.team2.notice_mng.svc.NoticeSvc;

@Controller
@RequestMapping("/system/notice_mng")
public class NoticeCtl {
	
	@Autowired
	NoticeSvc noticeSvc;
	
	@Autowired
	CommonSvc commonSvc;
	
	@RequestMapping("/list")
	public String noticeList() {
		return "kcg/system/team2/team2_notice_mng/notice";
	}

}
