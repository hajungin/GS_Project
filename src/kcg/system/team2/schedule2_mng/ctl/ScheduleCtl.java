package kcg.system.team2.schedule2_mng.ctl;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
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

    
    @RequestMapping("/calendars")
    public List<CmmnMap> getSch(CmmnMap params){
    	List<CmmnMap> sch = scheduleSvc.getSch(params);
    	return sch;
    }
    
    
	@RequestMapping("/insert")
	public CmmnMap insert(@RequestBody CmmnMap params){
		System.out.println("나와라 좀!!!!!!!!!!!!!!!!!! 컨트롤ㄹ어임"+params);
		
		// 클라이언트에서 전송한 ISO 8601 형식의 시작 및 종료 날짜-시간 값 가져오기
	    String startIsoDateTime = params.getString("start");
	    String endIsoDateTime = params.getString("end");
		
		// ISO 8601 형식을 PostgreSQL timestamp 형식으로 변환하는 함수 호출
	    String startPostgresTimestamp = isoToPostgresTimestamp(startIsoDateTime);
	    String endPostgresTimestamp = isoToPostgresTimestamp(endIsoDateTime);
	    
	    // 변환된 값을 params에 설정
	    params.put("start", startPostgresTimestamp);
	    params.put("end", endPostgresTimestamp);
		return scheduleSvc.insert(params); 
	}
    
	@RequestMapping("/delete")
	public CmmnMap delete(@RequestBody CmmnMap params){
		return scheduleSvc.delete(params); 
	}
	
	@RequestMapping("/update")
	public CmmnMap update(@RequestBody CmmnMap params){
		
		// 클라이언트에서 전송한 ISO 8601 형식의 시작 및 종료 날짜-시간 값 가져오기
	    String startIsoDateTime = params.getString("start");
	    String endIsoDateTime = params.getString("end");
		
		// ISO 8601 형식을 PostgreSQL timestamp 형식으로 변환하는 함수 호출
	    String startPostgresTimestamp = isoToPostgresTimestamp(startIsoDateTime);
	    String endPostgresTimestamp = isoToPostgresTimestamp(endIsoDateTime);
	    
	    // 변환된 값을 params에 설정
	    params.put("start", startPostgresTimestamp);
	    params.put("end", endPostgresTimestamp);
		
		return scheduleSvc.update(params); 
	}
	
	

	// ISO 8601 형식의 날짜-시간을 PostgreSQL timestamp 형식으로 변환하는 메서드
	private String isoToPostgresTimestamp(String isoDateTime) {
	    // ISO 8601 형식의 문자열을 Date 객체로 변환
	    Instant instant = Instant.parse(isoDateTime);
	    LocalDateTime ldt = LocalDateTime.ofInstant(instant, ZoneId.of("UTC"));

	    // PostgreSQL timestamp 형식으로 포맷팅
	    String formattedTimestamp = ldt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));

	    return formattedTimestamp;
	}
	
	

}
