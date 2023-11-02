package com.smhrd.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.entity.R_Faceimg;
import com.smhrd.entity.R_Member;
import com.smhrd.repository.R_FaceimgRepository;
import com.smhrd.repository.R_MemberRepository;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
				maxFileSize = 1024 * 1024 * 20, // 20메가
				maxRequestSize = 1024 * 1024 * 20 * 1 // 20메가 1개만
)
@Controller
public class faceImgController {

	@Autowired
	private R_FaceimgRepository repo;
	@Autowired
	private R_MemberRepository memberRepository;
	
	

	@RequestMapping(value="/imgUpload", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> ImgUpload(HttpSession session, @RequestParam("rfImg") MultipartFile file) {

		R_Faceimg Faceimg = new R_Faceimg();

		// 1. uuid 생성 (랜덤 16글자 문자열)
		String uuid = UUID.randomUUID().toString();
		// 2. 파일 이름
		
		// 회원의 아이디만 불러오기
		R_Member member = (R_Member)session.getAttribute("user");

		String email = member.getRmEmail();
		String userEmail = "";
		
		int idx = email.indexOf("@");
		
		if(idx != -1) {
			userEmail = email.substring(0,idx);
		}
		// 여기까지 
		
		// 파일이름에서 확장자만 가져오기  =============================
		String imgFullName = file.getOriginalFilename();
		String extension = "";
		// 마지막 점(.) 찾기
		int lastJum = imgFullName.lastIndexOf('.');
		
		if (lastJum > 0) {
			extension = imgFullName.substring(lastJum);
			System.out.println("Extension: " + extension); // 출력: Extension: jpg
		}
		//====================================================

		System.out.println("회원의 아이디 값만 : " + userEmail);
		
		String imgname = uuid + "_" +  userEmail + extension ;
		// 3. 어디에
		String savePath = System.getProperty("user.dir") + "/src/main/resources/static/image/";
		
		 
		 
		// 4. 위에서 만든 내용을 기반으로 Path 객체 만들기

		File f = new File(savePath + imgname);

		// 5. 파일 저장하기 (try catch)
		try {
			file.transferTo(f);
							
			// 6. 수집완료된 r_faceimg에다가 img 경로 넣기
			Faceimg.setRfImg("image" + imgname);
			
			System.out.println("이미지 저장 성공 ^_^ --> " + imgFullName);
			

		} catch (Exception e) {
			System.out.println("@@ 이미지 저장 실패 ㅠㅠ @@");
			e.printStackTrace();
		}

		// 2. 기능 구현
		
		// 저장할 이메일
		String rmEmail = email;
		R_Member user = memberRepository.findByRmEmail(rmEmail);
		
		Faceimg.setRmEmail(user);
		
		repo.save(Faceimg);
		// 여기까지 이미지 저장=========================================
		
		
		// 플라스크로 이미지 전송 --> 결과 받오고 
		FlaskController flask = new FlaskController();
		
		flask.sendImgToFlask(savePath, imgname, email);

		// 분석결과 보여줘야함 지금은 예시로 메인으로 가게함
		
		Map<String, String> result = new HashMap<>();
		result.put("message", "※※※※※※성공입니다!※※※※※");
		result.put("imageName", imgname);
		
		
		return new ResponseEntity<>("Success Message", HttpStatus.OK);
	}

	
}
