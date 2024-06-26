package kcg.system.team2.schedule2_mng.ctl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utils.common.CmmnMap;
import kcg.system.team2.schedule2_mng.svc.ScheduleSvc;

@Controller
@RequestMapping("/system/schedule")
public class ScheduleCtl {

    @Autowired
    private ScheduleSvc scheduleSvc;
    
    @RequestMapping("")
	public String noticeList(ModelMap model) {
    
		return "kcg/system/team2/team2_schedule_mng/schedule";
	}

  
	/*
	 * @RequestMapping("/calendars") public List<CmmnMap> getCalendarEvents(CmmnMap
	 * params) { List<CmmnMap> scheduleList = scheduleSvc.getSch(params);
	 * System.out.println(scheduleList); return scheduleSvc.getSch(params); }
	 */
    
    @RequestMapping("/calendars")
    public List<CmmnMap> getSch(CmmnMap params){
    	List<CmmnMap> sch = scheduleSvc.getSch(params);

    	System.out.println("==============================ctl"+ params);
    	return sch;
    }
    
	

}
