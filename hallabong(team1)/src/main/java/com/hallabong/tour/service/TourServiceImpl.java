package com.hallabong.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.tour.mapper.TourAttachMapper;
import com.hallabong.tour.mapper.TourMapper;
import com.hallabong.tour.vo.TourAttachVO;
import com.hallabong.tour.vo.TourVO;
import com.hallabong.util.pageobject.TourPageObject;

import lombok.Setter;

@Service
@Qualifier("tourServiceImpl")
public class TourServiceImpl implements TourService {

	@Setter(onMethod_ = {@Autowired})
	private TourMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private TourAttachMapper attachMapper;
	
	// 리스트
	@Override
	public List<TourVO> list(TourPageObject pageObject) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	// 글보기
	@Override
	public TourVO view(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}
	
	// 글보기에서 첨부파일 확인
	@Override
	public List<TourAttachVO> agetAttachList(Long no) throws Exception {
		// TODO Auto-generated method stub
		return attachMapper.findByNo(no);
	}

	// 이미지 변경
	@Override
	public int imageChange(TourVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.imageChange(vo);
	}

	// 글작성
	@Override
	public int write(TourVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		int result = (int) mapper.writeSelectKey(vo);
		
		if(vo.getAttachList()!=null && vo.getAttachList().size() > 0)
			// 첨부파일이 있는 만큼 for문을 돌린다.
			vo.getAttachList().forEach(attach -> {
				attach.setNo(vo.getNo());
				attachMapper.insert(attach);
			});
		
		return result;
	}

	// 글수정
	@Override
	public int update(TourVO vo) throws Exception {
		// TODO Auto-generated method stub
		int result = (int) mapper.updateSelectKey(vo);
		
		if(vo.getAttachList()!=null && vo.getAttachList().size() > 0)
			// 첨부파일이 있는 만큼 for문을 돌린다.
			vo.getAttachList().forEach(attach -> {
				attach.setNo(vo.getNo());
				attachMapper.insert(attach);
			});
		
		return result;
	}

	// 글삭제
	@Override
	public int delete(long no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(no);
	}

	// 좋아요
	@Override
	public int like(TourVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.like(vo);
	}

	// 좋아요 삭제
	@Override
	public int unlike(TourVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.unlike(vo);
	}

}
