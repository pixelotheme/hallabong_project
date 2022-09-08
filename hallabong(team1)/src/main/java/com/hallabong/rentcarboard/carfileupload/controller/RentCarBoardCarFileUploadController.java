package com.hallabong.rentcarboard.carfileupload.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.hallabong.rentcarboard.carfileupload.domain.RentCarBoardCarFileUploadVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class RentCarBoardCarFileUploadController {

//	String uploadFolder = "c:\\upload\\image";
	String uploadFolder = "c:\\upload\\rentcarboard";
	
	public List<RentCarBoardCarFileUploadVO> uploadFormPost(MultipartFile[] uploadFile,
			long carInfoNo) throws Exception {

		List<RentCarBoardCarFileUploadVO> list = null;
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		log.info("upload path : " + uploadPath.toString());

		log.info("실제적인 저장 위치 : " + uploadPath);

		
		if (!uploadPath.exists())
			uploadPath.mkdirs();
		
		boolean imageCheck = false;
		
		for (MultipartFile mf : uploadFile) {
			log.info("-------------------------------------------");

			log.info("Upload file name : " + mf.getOriginalFilename());

			log.info("Upload file size : " + mf.getSize());

			String FileName = mf.getOriginalFilename();

			UUID uuid = UUID.randomUUID();
			String UploadFileName = uuid.toString() + "_" + FileName;

			File saveFile = new File(uploadPath, UploadFileName);

			if (saveFile.exists())
				log.info("저장할 파일이 존재합니다");
			// 저장
			mf.transferTo(saveFile);
			log.info("실제 저장 경로 : " + saveFile.toString());

			
			if(newCheckImageType(saveFile)) {
				imageCheck = true;
				
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath , "s_"+UploadFileName));
				
				Thumbnailator.createThumbnail(mf.getInputStream(), thumbnail,100,100);
				
				thumbnail.close();
				
			}
			log.info("실행확인");
			// null 이면 에러나서 생성해준다
			if (list == null)
				list = new ArrayList<RentCarBoardCarFileUploadVO>();
			RentCarBoardCarFileUploadVO vo = new RentCarBoardCarFileUploadVO();
			vo.setOrgFileName(FileName); //순수 제목
			vo.setFileName(UploadFileName);//uuid+ 제목
			vo.setFileSize(mf.getSize());
			
			String dbUploadPath = uploadFolderPath.toString(); //-날짜경로만
			dbUploadPath = dbUploadPath.replace("\\", "/");
			vo.setRealSavePath(dbUploadPath);//저장되는 경로 - \\ -> / 로 변경해야함, 날짜경로만
			vo.setCarInfoNo(carInfoNo);
			
			//이미지 확인 - 이미지 파일 이 아니면 F 로 입력
			if(!imageCheck) {
				vo.setFileType("F");
			}else {
				vo.setFileType("I");
			}
				
			list.add(vo);
			log.info("vo 에 저장된 fileName : " + vo.getFileName());

		}

		return list;
	}
	

	// 연 월 일 폴더 생성하기 위한 날짜 -> 2022-07-13 의 "-" 를 운영체제에 맞는 구분자로 바꿈
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		log.info("날짜 : " + sdf);
		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);

	}

	public void delete(RentCarBoardCarFileUploadVO fileNameList) throws Exception {

		log.info("delete 메서드" +fileNameList);
		String deletePath = uploadFolder+"/"+fileNameList.getRealSavePath();
		
		String fileType = fileNameList.getFileType();
		
		
			if (fileNameList.getRealSavePath() != null && !fileNameList.equals("")) {
				log.info("if문 ");
				File file = new File(deletePath, fileNameList.getFileName());
				//원본파일만 삭제됨 이미지일 경우 s_ 도 지워줘야함
				file.delete();
				log.info(file.toString());
				log.info(fileNameList.getFileType() == "I");
				log.info(fileNameList.getFileType());
				
				if(fileType == "I" || fileType.equals("I")) {
					log.info("썸네일 삭제");
					//s_ 타입도 같이 지워준다
					File sumbNailFile = new File(deletePath,"s_"+fileNameList.getFileName());
					sumbNailFile.delete();
					log.info(sumbNailFile.toString());
				}
				
		}
		return;

	}
	//다중파일 이면 쓴다
	public void deletemulti(List<RentCarBoardCarFileUploadVO> fileNameList) throws Exception {
		
		for (RentCarBoardCarFileUploadVO fileVO : fileNameList) {
			if (fileVO.getRealSavePath() != null && !fileVO.equals("")) {
				
				File file = new File(fileVO.getRealSavePath(), fileVO.getFileName());
				//원본파일만 삭제됨 이미지일 경우 s_ 도 지워줘야함
				file.delete();
				if(fileVO.getFileType() == "I") {
					//s_ 타입도 같이 지워준다
					File sumbNailFile = new File(fileVO.getRealSavePath(),"s+"+fileVO.getFileName());
					sumbNailFile.delete();
				}
				
			}
			
		}
		return;
		
	}
	
	//이미지 파일에 대한 판다
	private boolean checkImageType(File file) throws Exception {
		
		String contentType = Files.probeContentType(file.toPath());
		
		log.info("checkImageType().contentType"+contentType);
		
		return contentType.startsWith("image");
		
	}
	
	private boolean newCheckImageType(File file) throws Exception{
		MimetypesFileTypeMap mimeTypesMap = new MimetypesFileTypeMap();
		
		String contentType = mimeTypesMap.getContentType(file);
		
		if(contentType.contains("image")) {
			return true;
		}else {
			return false;
		}
		
	}
	
	
}
