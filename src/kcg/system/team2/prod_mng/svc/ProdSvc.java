package kcg.system.team2.prod_mng.svc;


import java.math.BigInteger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import common.utils.common.CmmnMap;
import common.utils.common.PagingConfig;
import common.utils.mybatis_paginator.domain.PageList;

@Service
public class ProdSvc {
	
	@Autowired
    CmmnDao cmmnDao;

	public PageList<CmmnMap> getList(CmmnMap params, PagingConfig pagingConfig) {
		PageList<CmmnMap> rslt = cmmnDao.selectListPage("system.team2.prod_mng.getList", params,pagingConfig);
		return rslt;
	}

	public CmmnMap save(CmmnMap params) {
		
	    CmmnMap resultMap = new CmmnMap();
	    params.put("pay_period", Integer.parseInt(params.getString("pay_period")));
	    params.put("price_max", Integer.parseInt(params.getString("price_max")));
	    params.put("price_min", Integer.parseInt(params.getString("price_min")));
	    params.put("air_max", Float.parseFloat(params.getString("air_max")));
	    params.put("air_min", Float.parseFloat(params.getString("air_min")));
	    
	    

	    try {
	        if ("PT01".equals(params.getString("prod_type"))) {
	            cmmnDao.insert("system.team2.prod_mng.PSsave", params);
	        } else if ("PT03".equals(params.getString("prod_type"))) {
	            cmmnDao.insert("system.team2.prod_mng.Losave", params);
	        } else if ("PT02".equals(params.getString("prod_type"))) {
	            cmmnDao.insert("system.team2.prod_mng.DPsave", params);
	        } else if ("PT04".equals(params.getString("prod_type"))) {
	            cmmnDao.insert("system.team2.prod_mng.ACsave", params);
	        }

	        cmmnDao.insert("system.team2.prod_mng.COsave", params);

	        // 여기서 필요한 데이터를 resultMap에 설정
	        resultMap.put("prod_no", params.getString("prod_no"));
	        

	        resultMap.put("status", "success");
	    } catch (Exception e) {
	        resultMap.put("status", "fail");
	        e.printStackTrace();
	    }

	    return resultMap;
	}


	public CmmnMap code(CmmnMap params) {
		CmmnMap rslt = cmmnDao.selectOne("system.team2.prod_mng.code",params);
		return rslt;
	}


	public CmmnMap getInfo(CmmnMap params) {
	    CmmnMap rslt = null; // 반환할 결과 변수 선언 및 초기화
	    
	    System.out.println(params.toString());
	    
	    String prodNo = params.getString("prod_no");
	    if (prodNo != null && prodNo.length() > 0) {
	        String firstChar = prodNo.substring(0, 1);
	        if ("1".equals(firstChar)) {
	            rslt = cmmnDao.selectOne("system.team2.prod_mng.getPSInfo", params);
	        } 
	        else if ("4".equals(firstChar)) {
	            rslt = cmmnDao.selectOne("system.team2.prod_mng.getLOInfo", params);
	        } 
	        else if ("2".equals(firstChar)) {
	            rslt = cmmnDao.selectOne("system.team2.prod_mng.getDPInfo", params);
	        } 
	        else if ("3".equals(firstChar)) {
	            rslt = cmmnDao.selectOne("system.team2.prod_mng.getACInfo", params);
	        }
	    }
	    List<CmmnMap> rsltHist = cmmnDao.selectList("system.team2.prod_mng.getIT", params);
		String strHist = "";
		int number = 0;
		for(CmmnMap map : rsltHist) {
			number+=1;
			strHist =  strHist + number + " : " + map.getString("air_beg_dt") + " ~ " + map.getString("air_end_dt") + "\n" + "(최저)" + map.get("air_min") + "%  ~  (최고)" + map.get("air_max") + "%\n";
		}
		rslt.put("prod_hist", strHist);
	    return rslt;
	}

	public CmmnMap update(CmmnMap params) {
		
		CmmnMap rslt = null; // 반환할 결과 변수 선언 및 초기화
		params.put("pay_period", Integer.parseInt(params.getString("pay_period")));
	    params.put("price_max", Integer.parseInt(params.getString("price_max")));
	    params.put("price_min", Integer.parseInt(params.getString("price_min")));
	    params.put("air_max", Double.parseDouble(String.valueOf(params.get("air_max"))));
	    params.put("air_min", Double.parseDouble(String.valueOf(params.get("air_min"))));
	    
	    String prodNo = params.getString("prod_no");
	    if (prodNo != null && prodNo.length() > 0) {
	        String firstChar = prodNo.substring(0, 1);
	        if ("1".equals(firstChar)) {
	            rslt = cmmnDao.selectOne("system.team2.prod_mng.PSupdate", params);
	        } 
	        else if ("4".equals(firstChar)) {
	            rslt = cmmnDao.selectOne("system.team2.prod_mng.LOupdate", params);
	        } 
	        else if ("2".equals(firstChar)) {
	            rslt = cmmnDao.selectOne("system.team2.prod_mng.DPupdate", params);
	        } 
	        else if ("3".equals(firstChar)) {
	            rslt = cmmnDao.selectOne("system.team2.prod_mng.ACupdate", params);
	        }
	    }
	    
	    cmmnDao.insert("system.team2.prod_mng.COsave", params);
		return rslt;
	}

	public CmmnMap delete(CmmnMap params) {
		CmmnMap rslt = null; // 반환할 결과 변수 선언 및 초기화
		 String prodNo = params.getString("prod_no");
		    if (prodNo != null && prodNo.length() > 0) {
		        String firstChar = prodNo.substring(0, 1);
		        if ("1".equals(firstChar)) {
		            rslt = cmmnDao.selectOne("system.team2.prod_mng.PSdelete", params);
		        } 
		        else if ("4".equals(firstChar)) {
		            rslt = cmmnDao.selectOne("system.team2.prod_mng.LOdelete", params);
		        } 
		        else if ("2".equals(firstChar)) {
		            rslt = cmmnDao.selectOne("system.team2.prod_mng.DPdelete", params);
		        } 
		        else if ("3".equals(firstChar)) {
		            rslt = cmmnDao.selectOne("system.team2.prod_mng.ACdelete", params);
		        }
		    }
			return rslt;
	}




	public List<CmmnMap> getProdList(CmmnMap params) {
		
		List<CmmnMap> rslt = cmmnDao.selectList("system.team2.prod_mng.getProdList", params);
		return rslt;
	}


}
