package com.hallabong.business.mapper;

import java.util.List;

import com.hallabong.business.vo.BusinessVO;

public interface BusinessAttachMapper {
	
	// 사업장 보기 시 파일 목록을 받아 와서 처리한다.
	public List<BusinessVO> findByBno(Long bno); // list()
	
	// 사업장 등록 시 첨부파일의 정보를 넣는다.
	public int insert(BusinessVO vo); // write()
	
	// 이미지를 수정하면 원래 것은 지운다.
	public int delete(String uuid); // delete()
	
	public List<BusinessVO> getOldFiles();

}
