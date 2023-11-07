package com.smhrd.controller;

import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.entity.KakaoProfile;
import com.smhrd.entity.OAuthToken;
import com.smhrd.entity.R_Member;
import com.smhrd.repository.R_MemberRepository;

@Controller
public class ApiController {

	@Autowired
	private R_MemberRepository repo;
	
	
	//카카오 api로그인 기능
		@GetMapping("/kakaoCallback")
		public String kakaoCallback(String code , HttpSession session) { //Data를 리턴해주는 컨트롤러 함수
			//Retrofit2 안드로이드에서 많이씀
			//OKHttp
			//RestTemplate
			
			// POST방식으로 key=value 데이터를 요청 (카카오쪽으로)
			RestTemplate rt = new RestTemplate();
			
			// HttpHeader 오브젝트 생성
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			
			// HttpBody 오브젝트 생성
			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
			// 안에 들어가는 값들은 변수에 담아서 쓰는게 더 좋지만 공부해야하니 날것 그대로 일단 사용함
			params.add("grant_type", "authorization_code");
			params.add("client_id", "5f4adf5f781d4507aaf15fdd092cf73b");
			params.add("redirect_uri", "http://localhost:8087/relax/kakaoCallback");
			params.add("code", code);
			
			
			// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
			HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
					new HttpEntity<>(params,headers);
			
			// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음
			ResponseEntity<String> response = rt.exchange(
					"https://kauth.kakao.com/oauth/token",
					HttpMethod.POST,
					kakaoTokenRequest,
					String.class
					);
			
			// Gson, Json Simple , ObjectMapper
			ObjectMapper objectMapper = new ObjectMapper();
			OAuthToken oauthToken = null;
			
			try {
				 oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			// 제이슨 데이터를 자바에서 처리하기위해서 자바 오브젝트로 바꿈
			System.out.println("카카오 엑세스 토큰 : " + oauthToken.getAccess_token());
			
			// 로그아웃할때 필요한 엑세스토큰 세션에 저장
			session.setAttribute("k_accessToken", oauthToken.getAccess_token());
			
			
			// rt2
			RestTemplate rt2 = new RestTemplate();
			
			// HttpHeader 오브젝트 생성
			HttpHeaders headers2 = new HttpHeaders();
			headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
			headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");	
			
			// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
			HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = 
					new HttpEntity<>(headers2);
			
			// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음
			ResponseEntity<String> response2 = rt2.exchange(
					"https://kapi.kakao.com/v2/user/me",
					HttpMethod.POST,
					kakaoProfileRequest2,
					String.class
					);
			
			// 지금까지 하나의 메소드에 한 : 코드받고 엑세스 토큰 요청받고 엑세스토큰으로 회원 정보까지 조회해서
			// 						   그 결과가 response2.getBody() 여기 담겨서 조회
			
			
			
			
			System.out.println(response2.getBody());
			
			ObjectMapper objectMapper2 = new ObjectMapper();
			KakaoProfile kakaoProfile  = null;
			
			try {
				kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			
			
			// User 오브젝트 : rmEmail rmPw rmNick rmName rmGender rmPhone
			System.out.println("아이디 고유번호 : " + kakaoProfile.getId());
			System.out.println("카카오 이메일 : " + kakaoProfile.getKakao_account().getEmail());
			System.out.println("카카오 성별 : " + kakaoProfile.getKakao_account().getGender());
			System.out.println("카카오 나이 : " + kakaoProfile.getKakao_account().getAge_range());
			System.out.println("카카오 닉네임 : " + kakaoProfile.getProperties().getNickname());

			
			
			// 변수명 지정해서 넣어버리자 
			String r_email = kakaoProfile.getKakao_account().getEmail();
			String r_nick = kakaoProfile.getProperties().getNickname();
			String r_name = kakaoProfile.getProperties().getNickname();
			String r_pw = kakaoProfile.getId().toString();
			String r_gender = kakaoProfile.getKakao_account().getGender();
			String r_phone = "카카오회원";
			
			if(r_email == null) {
				r_email = kakaoProfile.getId().toString();
			}
			if(r_gender == null) {
				r_gender = "카카오톡";
			}
			
			
			// 카카오톡 정보를 이용해서 회원테이블에 저장하기
			R_Member member = new R_Member();
			
			// 이메일
			member.setRmEmail(r_email);
			// 비밀번호
			member.setRmPw(r_pw);
			// 성별
			member.setRmGender(r_gender);
			// 이름   이름이랑 닉네임은 같은값으로 설정
			member.setRmName(r_name);
			// 닉네임
			member.setRmNick(r_nick);
			// 전화번호는 값을 못가져오니 그냥 고유id값으로 넣음
			member.setRmPhone(r_phone);
			// 카카오톡 정보를 저장 후 DB에 저장
			
			// 가입자 혹은 비가입자 체크해서 관리
			R_Member rm = repo.findByRmEmail(r_email);
			
			
			if(rm == null) {
				
				repo.save(member);
				session.setAttribute("user", member);
				System.out.println("==============================================================");
				System.out.println("신규 카카오회원 정보 세션 저장 성공!");
				System.out.println("★★★ 유저 세션 : " + session.getAttribute("user"));
				System.out.println("==============================================================");
				return"redirect:/goIndex";
			}else {
				// else라면 가입자이기 때문에 바로 로그인 처리를 해야함  여기 나중에 다시 수정해야함
				String rmEmail = rm.getRmEmail();
				String rmNick = rm.getRmNick();
				String rmName = rm.getRmName();
				member.setRmEmail(rmEmail);
				member.setRmNick(rmNick);
				member.setRmName(rmName);
				
				session.setAttribute("user", member);
				System.out.println("================================================================");
				System.out.println("★★★카카오 유저 세션" + session.getAttribute("user"));
				System.out.println("기존 카카오회원 로그인 성공!");
				System.out.println("================================================================");
				
				return"redirect:/goIndex";
			}
			// jason view라는 크롬 확장크로그램 설치하면 json타입이 크롬에서 보기 편하게 뜸

		}

		
		//카카오로그아웃
		public void kakaoLogout(String accessToken) {
            String reqURL = "https://kauth.kakao.com/oauth/logout?client_id=5f4adf5f781d4507aaf15fdd092cf73b&logout_redirect_uri=http://localhost:8087/relax/goUserMain";
		    //String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		     
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode = " + responseCode);
		       
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
		
		//카카오회원탈퇴
		public void kakaoUserDrop(String accessToken) {
		    String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		    
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode = " + responseCode);
		       
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
		
		
		

	
}
