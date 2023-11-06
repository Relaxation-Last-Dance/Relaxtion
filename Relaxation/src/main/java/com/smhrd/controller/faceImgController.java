package com.smhrd.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.entity.R_Faceimg;
import com.smhrd.entity.R_Member;
import com.smhrd.entity.R_Nowlist;
import com.smhrd.repository.R_FaceimgRepository;
import com.smhrd.repository.R_NowlistRepository;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
				maxFileSize = 1024 * 1024 * 20, // 20메가
				maxRequestSize = 1024 * 1024 * 20 * 1 // 20메가 1개만
)
@Controller
public class faceImgController {

	@Autowired
	private R_NowlistRepository nowList_repo;
	
	@Autowired
	private R_FaceimgRepository faceImg_repo;
	

	@RequestMapping(value="/imgUpload", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> ImgUpload(HttpSession session, @RequestParam("rfImg") MultipartFile file) {

		R_Faceimg Faceimg = new R_Faceimg();

		// 1. uuid 생성 (랜덤 16글자 문자열)
		// 실무 --> 이미지 이름을 날짜로 저장 받음 날짜 중요!!
		String uuid = UUID.randomUUID().toString();
		// 2. 파일 이름
		
		// 회원의 아이디만 불러오기
		R_Member member = (R_Member)session.getAttribute("user");

		String rmEmail = member.getRmEmail();
		String userEmail = "";
		
		int idx = rmEmail.indexOf("@");
		
		if(idx != -1) {
			userEmail = rmEmail.substring(0,idx);
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

		// 플라스크로 이미지 전송 --> 결과 받오고 
		FlaskController flask = new FlaskController();
		
		String emotionResult = flask.sendImgToFlask(savePath, imgname, rmEmail);

		// 4 저장한 뒤에 ajax로 다시 돌아가서 success로 돌아감
		// 5 페이지 이동을 플레이리스트로 가게 코드만들기 
		// 6 nowlist에 방금 저장했던 노래들이 출력됨
		//   (추천한 노래 다 저장되서 사용자한테 보여지면 성공)

		// 1 분석결과를 emotionResult에 JSON타입인데 딕셔너리로 받기
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> responseMap = null;
		
	    try {
	        responseMap = mapper.readValue(emotionResult, new TypeReference<Map<String, Object>>(){});
	    } catch (JsonProcessingException e) {
	        e.printStackTrace();
	    }
		String emo = "";
	    Map<String, Object> resultMap = (Map<String, Object>) responseMap.get("result");
	    if(resultMap != null) {
	    	// 2 받은결과 키값을 이용해서 리스트에 담기
	    	String rfImg = (String) resultMap.get("image_name");
	    	List<Integer> seq = (List<Integer>) resultMap.get("seq");
	        
	        System.out.println(rfImg);
	        System.out.println(seq);
	        System.out.println("================================================");
	        
	        R_Faceimg content = faceImg_repo.findByRfImg(rfImg);
	        System.out.println(content);
        	emo = content.getRmContent();
        	System.out.println(emo);	        	
	        
	        // 3 담은 리스트를 사용자의 nowlist 테이블에 저장
	        // seq는 배열이라 값을 하나씩 DB에 저장해야함
	        for (int i = 0 ; i <seq.size() ; i ++) {
	        	R_Nowlist nowList = new R_Nowlist();
	        	nowList.setRmEmail(rmEmail);
	            Long rmuSeq = Long.valueOf(seq.get(i));
	            nowList.setRmuSeq(rmuSeq);
	        	System.out.println("성공이라면 소리질러라!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	        	nowList_repo.save(nowList);
	        }
	        
	    } else {
	        System.out.println("result key does not exist in the response");
	    }
	    
	    
		Map<String, String> result = new HashMap<>();
		result.put("message", emo);
		result.put("imageName", imgname);
		
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	
}
