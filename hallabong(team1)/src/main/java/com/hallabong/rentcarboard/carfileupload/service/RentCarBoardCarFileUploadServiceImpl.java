package com.hallabong.rentcarboard.carfileupload.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hallabong.rentcarboard.carfileupload.domain.RentCarBoardCarFileUploadVO;
import com.hallabong.rentcarboard.carfileupload.mapper.RentCarBoardCarFileUploadMapper;

@Service
@Qualifier("cfup")
public class RentCarBoardCarFileUploadServiceImpl implements RentCarBoardCarFileUploadService {

	@Autowired
	private RentCarBoardCarFileUploadMapper mapper;
	
	@Override
	public RentCarBoardCarFileUploadVO getCarFileUpload(long carInfoNo) {
		// TODO Auto-generated method stub
		return mapper.getCarFileUpload(carInfoNo);
	}

	@Override
	public int writeCarFileUpload(RentCarBoardCarFileUploadVO list) {
		// TODO Auto-generated method stub
		return mapper.writeCarFileUpload(list);
	}

	@Override
	public int deleteCarFileUpload(long carInfoNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCarFileUpload(carInfoNo);
	}

	@Override
	public int updateFileUploadForNull(long carInfoNo) {
		// TODO Auto-generated method stub
		return mapper.updateFileUploadForNull(carInfoNo);
	}

}
