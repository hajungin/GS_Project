package kcg.system.team2.mypage.ctl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utils.common.CmmnMap;
import kcg.login.vo.UserInfoVO;
import kcg.system.team2.emp_mng.svc.EmpMngSvc;

@Controller
@RequestMapping("/myPage")
public class MyPageCtl {
	
	@Autowired
	EmpMngSvc empMngSvc;
	
	@RequestMapping("/getMyPage")
	public String getMyPage(Model model, CmmnMap params, HttpSession session) {
		UserInfoVO userInfoVO = (UserInfoVO) session.getAttribute("userInfoVO");
	
		model.addAttribute("emp_no", userInfoVO.getEmpNo());
		return "kcg/system/team2/team2_mypage/myPage";
	}

}
