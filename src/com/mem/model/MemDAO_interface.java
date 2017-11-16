package com.mem.model;

import java.util.List;
import java.util.Map;

public interface MemDAO_interface {
	public void insert(MemVO memVO);
    public void update(MemVO memVO);
    public void changeLockState(MemVO memVO);
    public void changePassword(MemVO memVO);
    public MemVO findByPrimaryKey(String mem_no);
    public MemVO findById(String mem_id);
    public List<MemVO> getAll();
    public List<MemVO> getIdList();
    
    //專門找開放找房狀態的會員BY阿蓋
    public List<MemVO> getOpenList();
    //專門找開放找房狀態的會員BY阿蓋Map
    public List<MemVO> getOpenMap(Map<String, String[]> map);
}
