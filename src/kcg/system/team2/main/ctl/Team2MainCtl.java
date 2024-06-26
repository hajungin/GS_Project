package kcg.system.team2.main.ctl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.system.team2.main.svc.Team2MainSvc;
import kcg.system.team2.notice_mng.svc.NoticeSvc;

@RequestMapping("/system/main")
@Controller
public class Team2MainCtl {

    @Autowired
    Team2MainSvc mainSvc;

    @Autowired
    NoticeSvc noticeSvc;

    @RequestMapping("")
    public String main(Model model) {
        String responseBody = mainSvc.searchNews();
        model.addAttribute("news", responseBody);
        return "kcg/system/team2/team2_main/main";
    }

    @RequestMapping("/getList")
    public PageList<CmmnMap> getList(CmmnMap params, PagingConfig pagingConfig) {
        return noticeSvc.getList(params, pagingConfig);
    }
}
