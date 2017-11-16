package com.mem.model;

import java.util.List;

public interface MemDAO_interface {
	public void insert(MemVO memVO);
    public void update(MemVO memVO);
    public void changeLockState(MemVO memVO);
    public void changePassword(MemVO memVO);
    public MemVO findByPrimaryKey(String mem_no);
    public MemVO findById(String mem_id);
    public List<MemVO> getAll();
    public List<MemVO> getIdList();
}
