package com.hallabong.tour.mapper;

import java.util.List;

import com.hallabong.tour.vo.TourAttachVO;

public interface TourAttachMapper {
	
	// 게시판 글 보기 시 파일 목록을 받아 와서 처리한다.
	public List<TourAttachVO> findByBno(Long bno); // list()
	
	// 게시판 글 등록 시 첨부파일의 정보를 넣는다.
	public int insert(TourAttachVO vo); // write()
	
	// 게시판의 글 삭제가 될 때 글과 함께 첨부파일도 함께 삭제가 될 수 있도록 한다.
	// 이미지를 수정하면 원래 것은 지운다.
	public int delete(String uuid); // delete()
	
	// 스케쥴러에 의해서 DB에 없는 파일들을 지우기 위한 데이터 - 어제 Ajax로 추가된 파일 목록
	public List<TourAttachVO> getOldFiles();

}
