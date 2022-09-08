package com.hallabong.rentcarboard.carfileupload.service;

import java.util.List;

import com.hallabong.rentcarboard.carfileupload.domain.RentCarBoardCarFileUploadVO;


public interface RentCarBoardCarFileUploadService {
	//파일업로드 정보 가져오기
	public RentCarBoardCarFileUploadVO getCarFileUpload(long carInfoNo);
	
	//파일업로드
	public int writeCarFileUpload(RentCarBoardCarFileUploadVO list);
	
	//파일 삭제 
	public int deleteCarFileUpload(long carInfoNo);
	//파일 업로드 
	public int updateFileUploadForNull(long carInfoNo);
}
