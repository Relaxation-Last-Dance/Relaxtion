package com.smhrd.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
public class FlaskController {
	
	
	
	
	private String encodeFileToBase64Binary(File file){
		String encodedfile = null;
		try {
			FileInputStream fileInputStreamReader = new FileInputStream(file);
			byte[] bytes = new byte[(int)file.length()];
			fileInputStreamReader.read(bytes);
			encodedfile = Base64.getEncoder().encodeToString(bytes);
			fileInputStreamReader.close();
		} catch (FileNotFoundException e) {
			// handle exception
		} catch (IOException e) {
			// handle exception
		}
		
		return encodedfile;
	}

	
	
	public String sendImgToFlask(String imagePath, String imageName, String RmEmail) {

			RestTemplate restTemplate  = new RestTemplate();
		    HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.APPLICATION_JSON);

		    File imageFile = new File(imagePath + imageName);
		    
			String base64ImageString = encodeFileToBase64Binary(imageFile);

			Map<String, Object> map = new HashMap<>();
			map.put("image", base64ImageString);
			map.put("imageName", imageName);
			map.put("RmEmail", RmEmail);
			map.put("imagePath", imagePath );

			HttpEntity<Map<String,Object>> requestEntity 
			    = new HttpEntity<>(map, headers);

			String flaskUrl = "http://172.30.1.23:5000/upload"; 

			ResponseEntity<String> response 
			    = restTemplate.exchange(flaskUrl,
			                            HttpMethod.POST,
			                            requestEntity,
			                            String.class);

			System.out.println("★★★★★★★★★★★★★★★★★★★★★★★");
			System.out.println("응답 상태코드 : " + response.getStatusCode());
			System.out.println("응답 헤더 : " + response.getHeaders());
			System.out.println("응답 본문 : " + response.getBody());
		    System.out.println("★★★★★★★★★★★★★★★★★★★★★★★");
		
		    return response.getBody();

		    
	} 
 
	

}
