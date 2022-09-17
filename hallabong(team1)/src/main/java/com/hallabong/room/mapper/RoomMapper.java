package com.hallabong.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.hallabong.room.vo.RoomVO;
import com.webjjang.util.PageObject;

public interface RoomMapper {
	
	// 객실 리스트
		public List<RoomVO> list(@Param("pageObject")PageObject pageObject, @Param("no")Long no) throws Exception;
		// 전체 데이터 개수
		public long getTotalRow(@Param("pageObject")PageObject pageObject, @Param("no")Long no) throws Exception;
		// view
		public RoomVO view(long ro_no ) throws Exception;
		
		// imageChange 처리
		public int imageChange(RoomVO vo) throws Exception;
//		//이미지 번호에 맞는 전체 댓글 개수 가져오기
//		public long getTotalRow(long no);
		
		//객실 등록
		public int write(RoomVO vo) throws Exception;
		
		// 객실 수정
		public int update(RoomVO vo) throws Exception;
		
		// 객실 삭제
		public int delete(long ro_no) throws Exception;
	
}
