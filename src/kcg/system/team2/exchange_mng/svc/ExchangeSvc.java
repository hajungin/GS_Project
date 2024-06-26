package kcg.system.team2.exchange_mng.svc;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import common.dao.CmmnDao;
import common.utils.common.CmmnMap;
import common.utils.mybatis_paginator.domain.PageList;

@Service
public class ExchangeSvc {
	
	// 환율 정보 가져오기 API
    public String getExchange() {
        try {
            String authkey = "qvFUy6k0mZjjFslSh3x9coD3cvgCxtjI";
            String data = "AP01"; // 환율정보 (시간 조정 안하여서 실시간 환율)

            String apiURL = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=" + authkey + "&data=" + data;
            URL url = new URL(apiURL);
            URLConnection urlConn = url.openConnection();
            
            // 데이터 받아오기
            InputStreamReader ir = new InputStreamReader(urlConn.getInputStream());
            BufferedReader br = new BufferedReader(ir);
            
            StringBuilder responseBody = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                responseBody.append(line);
            }
            
            br.close();
            ir.close();
            
            return responseBody.toString();
        } catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
