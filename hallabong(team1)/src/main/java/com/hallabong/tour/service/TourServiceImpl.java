package com.hallabong.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.tour.mapper.TourMapper;
import com.hallabong.tour.vo.TourVO;
import com.hallabong.util.pageobject.TourPageObject;

import lombok.Setter;

@Service
@Qualifier("tourServiceImpl")
public class TourServiceImpl implements TourService {

	@Setter(onMethod_ = {@Autowired})
	private TourMapper mapper;
	
	@Override
	public List<TourVO> list(TourPageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	@Override
	public TourVO view(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}

	@Override
	public int imageChange(TourVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.imageChange(vo);
	}

	@Override
	public int write(TourVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int update(TourVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}

	
	@Override
	public int like(TourVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.like(vo);
	}

	@Override
	public int unlike(TourVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.unlike(vo);
	}

}
