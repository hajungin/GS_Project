package kcg.system.team2.main.ctl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import kcg.system.team2.main.svc.Team2MainSvc;

@RequestMapping("/system/main")
@Controller
public class Team2MainCtl {
	
	@Autowired
	Team2MainSvc mainSvc;
	
	
	@RequestMapping("")
    public String getNews(Model model) {
        String responseBody = mainSvc.searchNews();
        model.addAttribute("news", responseBody);
        return "kcg/system/team2/team2_main/main";
    }
	
}