package com.hallabong.room.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hallabong.room.vo.RoomVO;
import com.webjjang.util.PageObject;

public interface RoomMapper {
	
	// 객실 리스트
		// Mybatis의 DB 처리 메서드들은 파라메터를 한개만 받도록 작성되어 있다.
		// 그런데 2개 이상의 데이터를 넘길때 @Param을 이용하면 한개로 만들어서 넘겨준다. 주로 map을 사용한다.
		public RoomVO list(long ro_no) throws Exception;
		// view
		public RoomVO view(long ro_no ) throws Exception;
		
		// imageChange 처리
		public int roomimageChange(RoomVO vo) throws Exception;
		//이미지 번호에 맞는 전체 댓글 개수 가져오기
		public Long getTotalRow(Long ro_no);
		
		//객실 등록
		public int write(RoomVO vo);
		
		// 객실 수정
		public int update(RoomVO vo);
		
		// 객실 삭제
		public int delete(Long ro_no);
	
}
