package com.hallabong.room.service;

import java.util.List;


import com.hallabong.room.vo.RoomVO;
import com.webjjang.util.PageObject;

public interface RoomService {
	// 객실 리스트
		public List<RoomVO> list(PageObject pageObject, Long no) throws Exception;
		// view
		public RoomVO view(long ro_no) throws Exception;
		
		// imageChange 처리
		public int imageChange(RoomVO vo) throws Exception;
		// write처리
		public int write(RoomVO vo) throws Exception;
		// update처리
		public int update(RoomVO vo) throws Exception;
		// delete 처리
		public int delete(long ro_no) throws Exception;

}
