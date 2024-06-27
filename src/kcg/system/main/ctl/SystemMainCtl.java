package kcg.system.main.ctl;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.externalApi.HnpWeather;
import common.utils.common.CmmnMap;
import kcg.common.svc.CommonSvc;
import kcg.system.main.svc.SystemMainSvc;


@RequestMapping("/system")
@Controller
public class SystemMainCtl {

	private final Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	SystemMainSvc systemMainSvc;

	@Autowired
	CommonSvc commonSvc;

	@Autowired
	HnpWeather hnpWeather;

	@RequestMapping("")
	public String openPage(ModelMap model) {



		CmmnMap statData = systemMainSvc.getStatData();
		model.addAttribute("statData", statData);

		/* 페이지 온로드시 ajax로 호출할 예정
		int x = latitude;
		int y = longitude;


		log.info("현재 위도는 : " + x);
		log.info("현재 경도는 : " + y);


		String[] v = new String[5];
		v = hnpWeather.get(x, y, v); // TODO 현재 위치를 받아와야함
		model.addAttribute("date", v[0]);
		model.addAttribute("time", v[1]);
		model.addAttribute("weather", v[2]);
		model.addAttribute("Temperatures", v[3]);
		model.addAttribute("humidity", v[4]);
		 */

		return "kcg/system/main/SystemMain";
	}

	@RequestMapping("/getReqStat")
	public CmmnMap getReqStat(CmmnMap params) {
		return systemMainSvc.getReqStat(params);
	}

	@RequestMapping(value = "/batchResult/cntcMthd")
	public String openPopupCntcMthd(ModelMap model) {
		return "kcg/batchResult/cntcMthd";
	}

	@RequestMapping(value = "/batchResult/system")
	public String openPopupSystem(ModelMap model) {
		return "kcg/batchResult/system";
	}

	@RequestMapping(value = "/batchResult/table")
	public String openPopupTable(ModelMap model) {
		return "kcg/batchResult/table";
	}
}
