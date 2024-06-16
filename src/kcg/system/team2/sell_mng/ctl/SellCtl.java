package kcg.system.team2.sell_mng.ctl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import common.utils.common.CmmnMap;
import kcg.common.svc.CommonSvc;
import kcg.system.team2.sell_mng.svc.SellSvc;


@Controller
@RequestMapping("/sell")
public class SellCtl {
	
	@Autowired
	SellSvc sellsvc;
	
	@Autowired
	CommonSvc commonSvc;

    @RequestMapping("/list")
    public String openPage(Model model,CmmnMap params) {
    	List<CmmnMap> cmmList = sellsvc.getAll(params);
    	model.addAttribute("data", cmmList);
    	System.out.println(cmmList);
        return "kcg/system/team2/team2_sell_mng/sell";
    }
}
