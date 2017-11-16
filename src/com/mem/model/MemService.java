package com.mem.model;

import java.util.List;

public class MemService {
	private MemDAO_interface dao;
	public MemService() {
		dao = new MemDAO();
	}
	
	public MemVO addMem(String mem_id, String mem_psw, String mem_name, String mem_addr,
			String search_state) {
		MemVO memVO = new MemVO();
		
		memVO.setMem_id(mem_id);
		memVO.setMem_psw(mem_psw);
		memVO.setMem_name(mem_name);
		memVO.setMem_addr(mem_addr);
		memVO.setSearch_state(search_state);
		dao.insert(memVO);
		return memVO;
	}
	
	public MemVO updateMem(String mem_name, String mem_addr, String search_state, String mem_no) {
		MemVO memVO = new MemVO();

		memVO.setMem_name(mem_name);
		memVO.setMem_addr(mem_addr);
		memVO.setSearch_state(search_state);
		memVO.setMem_no(mem_no);
		dao.update(memVO);
		return memVO;
	}
	
	public MemVO changeLockState(String lock_state, String mem_no) {
		MemVO memVO = new MemVO();

		memVO.setLock_state(lock_state);
		memVO.setMem_no(mem_no);
		dao.changeLockState(memVO);
		return memVO;
	}
	
	public MemVO changePassword(String mem_psw, String mem_no) {
		MemVO memVO = new MemVO();

		memVO.setMem_psw(mem_psw);
		memVO.setMem_no(mem_no);
		dao.changePassword(memVO);
		return memVO;
	}
	
	public MemVO getOneByNo(String mem_no) {
		return dao.findByPrimaryKey(mem_no);
	}
	
	public MemVO getOneById(String mem_id) {
		return dao.findById(mem_id);
	}
	
	public List<MemVO> getAllMem() {
		return dao.getAll();
	}
	
	public List<MemVO> getAllIdList() {
		return dao.getIdList();
	}
}