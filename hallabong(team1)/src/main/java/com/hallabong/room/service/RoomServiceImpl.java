package com.hallabong.room.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.hallabong.room.mapper.RoomMapper;
import com.hallabong.room.vo.RoomVO;
import com.webjjang.util.PageObject;

@Service
public class RoomServiceImpl implements RoomService {

	@Inject
	private RoomMapper mapper;
	
	@Override
	public RoomVO list(Long ro_no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.list (ro_no);
	}

	@Override
	public RoomVO view(long ro_no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(ro_no);
	}

	@Override
	public int roomimageChange(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.roomimageChange(vo);
	}

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
	public int delete(long bus_no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(bus_no);
	}

	@Override
	public int groupDelete(RoomVO vo, HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
