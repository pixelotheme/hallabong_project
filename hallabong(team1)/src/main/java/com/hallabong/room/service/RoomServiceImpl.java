package com.hallabong.room.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.hallabong.room.mapper.RoomMapper;
import com.hallabong.room.vo.RoomVO;
import com.webjjang.util.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("roomServiceImpl")
@Log4j
@Primary
public class RoomServiceImpl implements RoomService {

	@Setter(onMethod_ = {@Autowired} )
	private RoomMapper mapper;
	
	@Override
	public List<RoomVO> list(PageObject pageObject, Long no)throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject, no));
		return mapper.list(pageObject, no);
	}

	@Override
	public RoomVO view(long ro_no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(ro_no);
	}

//	@Override
//	public int imageChange(RoomVO vo) throws Exception {
//		// TODO Auto-generated method stub
//		return mapper.imageChange(vo);
//	}

	@Override
	public int write(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int update(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(long ro_no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(ro_no);
	}

	@Override
	public int imageChange(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
