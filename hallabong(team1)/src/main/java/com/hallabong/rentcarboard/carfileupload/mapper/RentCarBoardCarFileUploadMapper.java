package com.hallabong.rentcarboard.carfileupload.mapper;

import java.util.List;

import com.hallabong.rentcarboard.carfileupload.domain.RentCarBoardCarFileUploadVO;

public interface RentCarBoardCarFileUploadMapper {
	//파일업로드 정보 가져오기 
	public RentCarBoardCarFileUploadVO getCarFileUpload(long carInfoNo);
	
	//차량 기본정보 등록할때 같이등록된다
	public int writeCarFileUpload(RentCarBoardCarFileUploadVO list);
	
	
	//파일 삭제 
	public int deleteCarFileUpload(long carInfoNo);
	//파일 업로드
	public int updateFileUploadForNull(long carInfoNo);
}
