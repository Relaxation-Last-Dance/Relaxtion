package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.entity.R_Member;
import com.smhrd.repository.R_MemberRepository;

@Controller
public class R_MemberController {
	
	@Autowired
	private R_MemberRepository repo;
	
	// 메인 이동
	@RequestMapping("/goMain")
	public String goMain() {
		return "main";
	}
	
	// 회원가입 페이지로 이동
	@RequestMapping("/goJoin")
	public String goJoin() {
		return "Join";
	}
	
	// 회원가입 완료시 요청받는 컨트롤러
	@RequestMapping("/join")
	public String Join(R_Member member) {

		String Email = member.getRmEmail();

		Email.replace(",,", "@");
		Email.replace(",", "");
		if (Email.contains(",,")) {
			Email = Email.replace(",,", "@");
		} else {
			Email = Email.replace(",", "");
		}

		member.setRmEmail(Email);

		System.out.println(member.getRmEmail());

		repo.save(member);

		return "redirect:/goMain";
	}

	// 로그인 컨트롤러
	@RequestMapping("/goLogin")
	public ResponseEntity<?> Login(HttpSession session, String rmEmail, String rmPw) {

		R_Member member = repo.findByRmEmailAndRmPw(rmEmail, rmPw);

		if (member != null) {
			session.setAttribute("user", member);
			System.out.println("로그인 유저 정보 : " + session.getAttribute("user"));
			return new ResponseEntity<>("OK", HttpStatus.OK); // 로그인 성공
		} else {
			System.out.println("회원조회 실패!");
			return new ResponseEntity<>("Unauthorized", HttpStatus.UNAUTHORIZED); // 로그인 실패
		}
	}
	
	// 로그아웃컨트롤러 
		@RequestMapping("/logout")
		public ModelAndView Logout(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			ApiController kakaoApi = new ApiController();
			kakaoApi.kakaoLogout((String) session.getAttribute("accessToken"));

			System.out.println("카카오엑세스토큰(기본유저는 null) : " + session.getAttribute("accessToken"));

			if (session.getAttribute("accessToken") != null) {

				session.removeAttribute("accessToken");
				session.removeAttribute("user");
				mav.setViewName(
						"redirect:https://kauth.kakao.com/oauth/logout?client_id=5f4adf5f781d4507aaf15fdd092cf73b&logout_redirect_uri=http://localhost:8087/relax/goMain");
				return mav;
			} else {

				mav.setViewName("redirect:/goMain");
				session.removeAttribute("user");
				return mav;
			}

		}
	
		// 마이페이지로 이동
		@RequestMapping("/goMypage")
		public String goMypage() {
			return "Mypage";
		}

		// 메인으로
		@RequestMapping("/goMainFromMP")
		public String goMainFromMP() {
			return "redirect:/goMain";
		}

		// 정보수정으로 이동
		@RequestMapping("/goChangeInfo")
		public String goChangeInfo() {
			return "ChangeInfo";
		}

		// 정보수정 뒤로가기버튼
		@RequestMapping("/gotoMypage")
		public String goBackBtn() {
			return "redirect:/goMypage";
		}

		// 정보업데이트 메소드
		@RequestMapping("/Update")
		public String UpdateUserInfo(R_Member member, HttpSession session) {

			R_Member user = (R_Member) session.getAttribute("user");

			// 카카오톡 유저는 선호하는 닉네임,장르만 변경 가능
			if (session.getAttribute("accessToken") != null) {
				String rmEmail = user.getRmEmail();
				String rmGender = user.getRmGender();
				String rmPhone = user.getRmPhone();
				member.setRmEmail(rmEmail);
				member.setRmGender(rmGender);
				member.setRmPhone(rmPhone);
				repo.save(member);
				return "redirect:/logout";

			} else {
				// 일반 유저는 비밀번호 변경 O

				String rmEmail = user.getRmEmail();
				String rmName = user.getRmName();
				String rmGender = user.getRmGender();

				member.setRmEmail(rmEmail);
				member.setRmName(rmName);
				member.setRmGender(rmGender);

				repo.save(member);

				System.out.println("일반유저 정보 수정 성공");

				session.removeAttribute("user");

				return "redirect:/goMain";

			}

		}

		// 사진업로드 페이지로 가는 컨트롤러
		@RequestMapping("/goFaceMusic")
		public String goFaceMusic() {
			return"FaceMusic";
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
