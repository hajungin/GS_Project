package kcg.system.team2.exchange_mng.ctl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import aj.org.objectweb.asm.TypeReference;
import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;
import kcg.system.team2.exchange_mng.svc.ExchangeSvc;

@Controller
@RequestMapping("/system/exchange_mng")
public class ExchangeCtl {

	
	@Autowired
	ExchangeSvc exchangeSvc;
	
	@RequestMapping("")
	public String exchange(Model model) {
	    String responseBody = exchangeSvc.getExchange();
	    model.addAttribute("exchangeInfo", responseBody);
	    System.out.println(responseBody);
	    return "kcg/system/team2/team2_exchange_mng/exchange";
	}
	
	
	@RequestMapping("/getExchangeInfo")
	@ResponseBody
	public List<Map<String, Object>> getList() {
	    String responseBody = exchangeSvc.getExchange();
	    System.out.println("============================================================================resposebody :" + responseBody);

	    // JSON 배열을 List<Map<String, Object>>로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    List<Map<String, Object>> exchangeInfo = null;
	    try {
	        exchangeInfo = objectMapper.readValue(responseBody, new com.fasterxml.jackson.core.type.TypeReference<List<Map<String, Object>>>(){});
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return exchangeInfo;
	}
	
	
	
}
