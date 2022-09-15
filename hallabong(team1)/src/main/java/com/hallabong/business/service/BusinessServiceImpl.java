package com.hallabong.business.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.business.mapper.BusinessMapper;
import com.hallabong.business.vo.BusinessVO;
import com.hallabong.util.businesspageobject.BusinessPageObject;
import com.webjjang.util.PageObject;

import lombok.Setter;

@Service
@Qualifier("businessImpl")
public class BusinessServiceImpl implements BusinessService {

	@Setter(onMethod_ = {@Autowired})
	private BusinessMapper mapper; 
	
	@Override
	public List<BusinessVO> list(BusinessPageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	@Override
	public BusinessVO view(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}

	@Override
	public int imageChange(BusinessVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.imageChange(vo);
	}

	@Override
	public int write(BusinessVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int update(BusinessVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}

}
