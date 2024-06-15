package kcg.system.team2.sell_mng.ctl;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/sell")
public class SellCtl {

    @RequestMapping("/list")
    public String openPage() {
        return "kcg/system/team2/team2_sell_mng/sell";
    }
}
