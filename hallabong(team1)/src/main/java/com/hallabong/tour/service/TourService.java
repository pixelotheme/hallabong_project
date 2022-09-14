package com.hallabong.tour.service;

import java.util.List;

import com.hallabong.tour.vo.TourAttachVO;
import com.hallabong.tour.vo.TourVO;
import com.hallabong.util.pageobject.TourPageObject;

public interface TourService {
	
	// 리스트
	public List<TourVO> list(TourPageObject pageObject) throws Exception;
	
	// 글보기
	public TourVO view(long no) throws Exception;
	
	// 글보기에서 첨부파일 확인
	public List<TourAttachVO> agetAttachList(Long no) throws Exception;
	
	// 이미지 변경
	public int imageChange(TourVO vo) throws Exception;
	
	// 글작성
	public int write(TourVO vo) throws Exception;
	
	// 글수정
	public int update(TourVO vo) throws Exception;
	
	// 글삭제
	public int delete(long no) throws Exception;
	
	// 좋아요
	public int like(TourVO vo) throws Exception;
	
	// 좋아요 취소
	public int unlike(TourVO vo)throws Exception;

}
