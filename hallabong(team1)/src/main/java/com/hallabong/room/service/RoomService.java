package com.hallabong.room.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hallabong.room.vo.RoomVO;
import com.webjjang.util.PageObject;

public interface RoomService {
	// 객실 리스트
		public RoomVO list(Long ro_no) throws Exception;
		// view
		public RoomVO view(long ro_no ) throws Exception;
		
		// imageChange 처리
		public int roomimageChange(RoomVO vo) throws Exception;
		// write처리
		public int write(RoomVO vo) throws Exception;
		// update처리
		public int update(RoomVO vo) throws Exception;
		// delete 처리
		public int delete(long bus_no) throws Exception;
		// 단체 delete 처리 
		public int groupDelete(RoomVO vo, HttpServletRequest req) throws Exception;

}
