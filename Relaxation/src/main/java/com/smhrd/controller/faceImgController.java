package com.smhrd.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.entity.R_Faceimg;
import com.smhrd.entity.R_Member;
import com.smhrd.repository.R_FaceimgRepository;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
				maxFileSize = 1024 * 1024 * 20, // 20메가
				maxRequestSize = 1024 * 1024 * 20 * 1 // 20메가 1개만
)
@Controller
public class faceImgController {

	@Autowired
	private R_FaceimgRepository repo;

	@RequestMapping("/imgUplode")
	public String ImgUpload(HttpSession session, @RequestParam("rfImg") MultipartFile file) {

		R_Faceimg Faceimg = new R_Faceimg();

		// 1. uuid 생성 (랜덤 16글자 문자열)
		String uuid = UUID.randomUUID().toString();
		// 2. 파일 이름

		String imgname = uuid + "_" + file.getOriginalFilename();
		// 3. 어디에
		String savePath = System.getProperty("user.dir") + "/src/main/resources/static/image/";

		// 4. 위에서 만든 내용을 기반으로 Path 객체 만들기

		File f = new File(savePath + imgname);

		// 5. 파일 저장하기 (try catch)
		try {
			file.transferTo(f);
							
			// 6. 수집완료된 r_faceimg에다가 img 경로 넣기
			Faceimg.setRfImg("image" + imgname);
			
			System.out.println("이미지 저장 성공 ^_^" + file.getOriginalFilename());
			

		} catch (Exception e) {
			System.out.println("@@이미지 저장 실패@@");
			e.printStackTrace();
		}

		// 2. 기능 구현
		// 저장할 이메일
		R_Member user = (R_Member) session.getAttribute("user");
		String rmEmail = user.getRmEmail();
		Faceimg.setRmEmail(rmEmail);

		repo.save(Faceimg);
		// 여기까지 하면 이미지 저장
		// 플라스크로 이미지 전송 --> 결과 받오고 
		
//		RestTemplate restTemplate = new RestTemplate();
//		MultiValueMap<String, Object> bodyMap = new LinkedMultiValueMap<>();
//		bodyMap.add("image", new FileSystemResource(new File(savePath + imgname)));
//
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.MULTIPART_FORM_DATA);
//		
//
//		HttpEntity<MultiValueMap<String, Object>> requestEntity 
// 		= new HttpEntity<>(bodyMap, headers);
//		
//		try {
//		    ResponseEntity<String> response = restTemplate.exchange(
//		            "http://172.30.1.23:5000",
//		            HttpMethod.POST,
//		            requestEntity,
//		            String.class
//		    );
//		    System.out.println("response status: " + response.getStatusCode());
//		    System.out.println("response body: " + response.getBody());
//		} catch (HttpClientErrorException e) {
//		    System.out.println(e.getStatusCode());
//		    System.out.println(e.getResponseBodyAsString());
//		}
//		
//		
		
		
		
		// 분석결과 보여줘야함 지금은 예시로 메인으로 가게함
		return "redirect:/goMain";
	}

	
	@RequestMapping("/flask") 
	 public String flask() {
		
		return"flask";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
