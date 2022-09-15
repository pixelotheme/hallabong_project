package com.hallabong.business.service;

import java.util.List;

import com.hallabong.business.vo.BusinessVO;
import com.hallabong.util.businesspageobject.BusinessPageObject;

public interface BusinessService {
	// list
		public List<BusinessVO> list(BusinessPageObject pageObject) throws Exception;
		// view
		public BusinessVO view(long no) throws Exception;
		
		// imageChange 처리
		public int imageChange(BusinessVO vo) throws Exception;
		// write처리
		public int write(BusinessVO vo) throws Exception;
		// update처리
		public int update(BusinessVO vo) throws Exception;
		// delete 처리
		public int delete(long no) throws Exception;
		

}
