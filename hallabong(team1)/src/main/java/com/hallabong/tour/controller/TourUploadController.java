package com.hallabong.tour.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hallabong.tour.vo.TourAttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class TourUploadController {
	
	// 파일을 저장하는 폴더 위치 -> 서버와 상관이 없는 위치 - 업로드된 파일은 URL로 직접 연결이 안된다.
	String uploadFolder = "C:\\upload\\tour";
	
	// 업로드 폼
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	// 업로드 처리
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) throws Exception {
		
		// 파일을 저장하는 폴더 위치 -> 서버와 상관이 없는 위치 - 업로드된 파일은 URL로 직접 연결이 안된다.
		String uploadFolder = "C:\\upload\\tour";
		
		// 폴더가 없으면 오류 -> 처리해 주자.
		File forder = new File(uploadFolder); 
		if(!forder.exists()) forder.mkdirs();
		
		// 올라온 파일 정보 출력하고 저장. 배열이므로 반복문 처리 - 향상된 for문 사용
		for(MultipartFile multipartFile : uploadFile) {
			log.info("--------------------------------------------------------");
			// 클라이언트의 파일명 출력
			String fileName = multipartFile.getOriginalFilename();
			log.info("File Name : " + fileName);
			// 작업하고 있는 파일의 용량
			log.info("File Size : " + multipartFile.getSize());
			
			// 서버에 저장 처리
			
			// 저장되는 파일명
			File saveFile = new File(uploadFolder, fileName);
			
			// 저장 처리
			multipartFile.transferTo(saveFile);
		
		}
		
	} // 파일 업로드 처리 메서드의 끝
	
	// ajax 업로드 폼 -> ajax로 파일 업로드를 위한 JSP로 이동하는 메서드
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload Ajax");
	}
	
	// ajax 업로드 처리
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<TourAttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) throws Exception {
		
		log.info("upload ajax post .......................................");
		
		// 파일 정보를 담는 객체
		List<TourAttachFileDTO> list = new ArrayList<TourAttachFileDTO>();
		
		// 파일을 저장하는 폴더 위치 -> 서버와 상관이 없는 위치 - 업로드된 파일은 URL로 직접 연결이 안된다.
		String uploadFolder = "C:\\upload\\tour";
		
		// 폴더가 없으면 오류 -> 처리해 주자.
		// 날짜 폴더 작성 - getFolder()
		String uploadForderPath = getFolder();
		
		File uploadPath = new File(uploadFolder, uploadForderPath); 
		if(!uploadPath.exists()) uploadPath.mkdirs();
		
		// 올라온 파일 정보 출력하고 저장. 배열이므로 반복문 처리 - 향상된 for문 사용
		for(MultipartFile multipartFile : uploadFile) {
			
			// 첨부파일 정보 저장 객체 생성
			TourAttachFileDTO attachDTO = new TourAttachFileDTO();
			
			log.info("--------------------------------------------------------");
			// 클라이언트의 파일명 출력
			String fileName = multipartFile.getOriginalFilename();
			
			// 중복이 되지 않는 데이터 생성
			UUID uuid = UUID.randomUUID();
			
			log.info("File Name : " + fileName);
			// 작업하고 있는 파일의 용량
			log.info("File Size : " + multipartFile.getSize());
			
			// 서버에 저장 처리
			
			// 서버에 올라가는 파일명
			String uploadFileName = uuid.toString() + "_" + fileName;
			
			// 저장되는 파일명
			File saveFile = new File(uploadPath, uploadFileName);
			
			// 저장 처리
			multipartFile.transferTo(saveFile);
			
			// 화면에 보여줄 파일 데이터의 정보를 수집한다.
			attachDTO.setFileName(fileName);
			attachDTO.setUploadPath(uploadForderPath); // 날짜 폴더 정보만 저장
			attachDTO.setUuid(uuid.toString());
			
			// 데이터 확인
			log.info(attachDTO);
			
			// 이미지 리스트를 위해 작은 이미지 처리가 필요하다. -> 썸네일 처리 필요
			if(checkImageType(saveFile)) {
				
				attachDTO.setImage(true);
				
				// 썸네일 저장 파일 객체 -> 바이트 단위 파일 저장을 위한 객체로 만들어 준다.
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				
				// 라이브러리를 사용해 원본 이미지 파일을 사용해서 썸네일 저장 파일로 넣는다.
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 500, 500);
			
				// 사용한 파일 객체를 닫자.
				thumbnail.close();
			} // if문의 끝
			
			list.add(attachDTO);
			
		} // for문의 끝
		
		// return URLEncoder.encode("파일 업로드를 성공하셨습니다.", "utf-8");
		return new ResponseEntity<List<TourAttachFileDTO>>(list, HttpStatus.OK);
		
	} // 파일 업로드 처리 메서드의 끝
	
	// 이미지 파일을 보여주는 메서드(썸네일)
	@GetMapping("/display")
	@ResponseBody
	// url/display?fileName=~~~~~~
	public ResponseEntity<byte[]> getFile(String fileName) throws Exception {
		ResponseEntity<byte[]> result = null;
		
		// 넘어오는 데이터 확인
		log.info("fileName : " + fileName);
		
		// 전달할 파일을 연결
		// uploadFolder = "C:\\upload\\image"
		// fileName = yy/MM/dd/ + s_ + uuid_ + fileName
		File file = new File(uploadFolder, fileName);
		
		HttpHeaders header = new HttpHeaders();
		
		header.add("Content-Type", Files.probeContentType(file.toPath()));
		
		result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		
		return result;
	} // 이미지 파일을 보여주는 메서드의 끝
	
	// 이미지가 아닌 파일의 다운로드 메서드
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> download(@RequestHeader("User-Agent") String userAgent, String fileName) throws Exception{
		ResponseEntity<Resource> entity = null;
		
		log.info("fileName : " + fileName);
		log.info("userAgent : " + userAgent);
		
		// 서버의 자원 - 파일 시스템과 연결 - 파일 자원
		Resource resource = new FileSystemResource(uploadFolder + "\\" + fileName);
		log.info("resource : " + resource);
		
		// 파일 이름을 resource에서 꺼낸다. - 별도로 작성해 줘도 된다.- header에 붙여서 사용하면 resourceName으로 다운로드 된다.
		String resourceName = resource.getFilename();
		log.info("resourceName(UUID 포함) : " + resourceName);
		// uuid는 _를 포함하지 않는다. 맨처음 _는 uuid 뒤에 붙어 있는 _의 위치를 찾아서 +1 한 글자를 찾으면 처음 올렸던 순수 파일명이 된다.
		resourceName = resourceName.substring(resourceName.indexOf("_") + 1);
		log.info("resourceName(UUID 제거) : " + resourceName);
		
		// 브라우저에 따른 한글 처리 - IE/Edge
		String downloadName = null;
		if(userAgent.contains("Trident")) {
			// IE 처리
			log.info("IE browser");
			downloadName = URLEncoder.encode(resourceName, "UTF-8").replaceAll("\\+", " ");
		} else if(userAgent.contains("Edg")) {
			// Edge 처리
			log.info("Edge browser");
			downloadName = URLEncoder.encode(resourceName, "UTF-8");			
		} else {
			// 그 외의 브라우저 - 크롬, 사파리, 파이어폭스 등
			log.info("Chrome browser");
			downloadName = new String(resourceName.getBytes("UTF-8"),"ISO-8859-1");
		}
		
		log.info("downloadName : " + downloadName);
		
		
		// response의 보내질 데이터의 헤더 세팅을 위한 객체 생성
		HttpHeaders headers  = new HttpHeaders();
		
		headers.add("Content-Disposition", "attachment; fileName=" + downloadName);
		log.info("headers : " + headers);
		
		entity = new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
		log.info("entity : " + entity);
		
		return entity;
	}
	
	
	// 파일 삭제 메서드
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) throws Exception {
		
		log.info("flieName : " + fileName + ", type : " + type);
		
		// 삭제하려면 파일 객체로 만든다.
		File file = new File(uploadFolder + "\\" + URLDecoder.decode(fileName, "utf-8"));
		log.info("존재 여부 : " + file.exists());
		
		// s_ 파일을 삭제한다.
		boolean result = file.delete();
		log.info(result);
		
		// 이미지인 경우 썸네일 파일인 s_ 파일도 삭제해야 한다.
		if(type.equals("image")) {
			// uuid_s_fileName
			// replace를 사용하는 경우 중간에 파일명 안에 있는 s_도 지워진다. -> 파일명이 안맞게 된다.
//			String largeFileName = file.getAbsolutePath().replace("s_", "");
			// 뒤에서 \\ 의 위치를 찾아서 그 위치 이후의 맨 처음 나오는 s_를 바꾼다.
			String largeFileName = file.getAbsolutePath(); // s_가 들어가 있다.
			log.info("s_가 들어 있는 파일명 : " + largeFileName);
			// 맨 마지막의 \ 위치를 찾는다.
			int pos = largeFileName.lastIndexOf("\\");
			// \ 위치의 앞은 폴더이므로 그냥 붙인다. \ 뒤에 있는 파일명 중에서는 맨 처음 나오는 s_를 지워서 붙인다.
			largeFileName = largeFileName.substring(0, pos) + largeFileName.substring(pos).replaceFirst("s_", "");
			log.info("s_가 제거된 파일명 : " + largeFileName);
			
			
			new File(largeFileName).delete();
			log.info(largeFileName);
		}
		
		return new ResponseEntity<String>("success deleted.", HttpStatus.OK);
	}
	
	
	// 날짜 폴더 작성을 위한 메서드 - 맵핑과는 상관이 없다.
	private String getFolder() {
		
		// jsp의 fmt와 동일하다. ("yyyy-MM-dd-hh-mm" 로 하면 분단위로 가능하다.)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		// 오늘 날짜 객체 생성
		Date date = new Date();
		
		String str = sdf.format(date); // yyyy-MM-dd
		
		return str.replace("-", File.separator);
		
	}
	
	// 이미지 파일에 대한 판단
	private boolean checkImageType(File file) throws Exception {
		
		String contentType = Files.probeContentType(file.toPath());
		
		log.info("checkImageType().contentType : " + contentType);
		
		return contentType.startsWith("image"); // contentType.indexOf("image") == 0
	}
	
} // class의 끝
