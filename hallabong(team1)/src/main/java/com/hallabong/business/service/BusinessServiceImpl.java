package com.hallabong.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.hallabong.business.mapper.BusinessMapper;
import com.hallabong.business.vo.BusinessVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("businessServiceImpl")
@Log4j
@Primary
public class BusinessServiceImpl implements BusinessService {
	
	@Setter(onMethod_ = {@Autowired})
	private BusinessMapper mapper;

	@Override
	public List<BusinessVO> list(PageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		
		log.info(pageObject);
		
		return mapper.list(pageObject);
	}

	@Override
	public BusinessVO view(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(no);
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

	public int imageChange(BusinessVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.imageChange(vo); 
		
	}

}
