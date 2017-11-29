package com.breaktime.model;

import java.sql.Date;
import java.util.List;


public class BreakTimeService {

	private BreakTimeDAO_interface dao;
	
	public BreakTimeService(){
		dao = new BreakTimeJDBCDAO();
	}
	
	public BreakTimeVO addBreakTime(String rtr_no , Date brk_date , String brk_period){
		
		BreakTimeVO breakTimeVO =new BreakTimeVO();
		
		breakTimeVO.setRtr_no(rtr_no);
		breakTimeVO.setBrk_date(brk_date);
		breakTimeVO.setBrk_period(brk_period);
		
		dao.insert(breakTimeVO);
		
		return breakTimeVO;
	}
	
	public void addBreakTime(BreakTimeVO breakTimeVO){
		dao.insert(breakTimeVO);
	}
	
	public BreakTimeVO updateBreakTime(String rtr_no , Date brk_date , String brk_period){
		
		BreakTimeVO breakTimeVO =new BreakTimeVO();
		
		breakTimeVO.setRtr_no(rtr_no);
		breakTimeVO.setBrk_date(brk_date);
		breakTimeVO.setBrk_period(brk_period);
		
		dao.update(breakTimeVO);
		
		return dao.findByPrimaryKey(rtr_no , brk_date , brk_period);
	}
	
	public void updateBreakTime(BreakTimeVO breakTimeVO){
		dao.update(breakTimeVO);
	}
	
	public void deletBreakTime(String rtr_no , Date brk_date , String brk_period){
		dao.delete(rtr_no , brk_date , brk_period);
	}
	
	public BreakTimeVO getOneResR(String rtr_no , Date brk_date , String brk_period){
		return dao.findByPrimaryKey(rtr_no , brk_date , brk_period);
	}
	
	public List<BreakTimeVO> getAll(){
		return dao.getAll();
	}
	
	public List<BreakTimeVO> getRtr_bt_kuei(String rtr_no){
		return dao.getRtr_bt_kuei(rtr_no);
	}
}
