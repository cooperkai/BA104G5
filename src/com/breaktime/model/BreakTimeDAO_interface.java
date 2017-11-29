package com.breaktime.model;

import java.sql.Date;
import java.util.List;


public interface BreakTimeDAO_interface {
	void insert(BreakTimeVO breakTimeVO);

	void update(BreakTimeVO breakTimeVO);

	void delete(String rtr_no , Date brk_date , String brk_period );

	BreakTimeVO findByPrimaryKey(String rtr_no , Date brk_date , String brk_period);
	
	List<BreakTimeVO> getRtr_bt_kuei(String rtr_no);

	List<BreakTimeVO> getAll();
}
