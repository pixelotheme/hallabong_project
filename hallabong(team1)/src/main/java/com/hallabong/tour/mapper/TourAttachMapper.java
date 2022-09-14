package com.hallabong.tour.mapper;

import java.util.List;

import com.hallabong.tour.vo.TourAttachVO;

public interface TourAttachMapper {
	
	// 글보기+첨부파일
	public List<TourAttachVO> findByNo(Long no);
	
	// 글작성시 첨부파일 등록
	public int insert(TourAttachVO vo);
	
	// 글 삭제시 이미지 파일을 같이 삭제
	public int delete(String uuid);
	
	// DB에 없는 파일들을 지우기
	public List<TourAttachVO> getOldFiles();

}
