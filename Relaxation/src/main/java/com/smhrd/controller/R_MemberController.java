 package com.smhrd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.smhrd.entity.R_Member;
import com.smhrd.entity.R_Music;
import com.smhrd.entity.R_Nowlist;
import com.smhrd.repository.R_MemberRepository;
import com.smhrd.repository.R_MusicRepository;
import com.smhrd.repository.R_NowlistRepository;

@Controller
public class R_MemberController {

	@Autowired
	private R_MemberRepository Member_repo;
	@Autowired
	private R_MusicRepository Music_repo;
	@Autowired
	private R_NowlistRepository Nowlist_repo;

	// 메인 이동
	@RequestMapping("/goIndex")
	public String goMain(Model model) {
		
	// main페이지 top7 아티스트 불러오기	
	List<String> top7Artist = Music_repo.findTop7();	
	// main페이지 top relaxation 음악추천
	List<R_Music> findRandom7 = Music_repo.findRandom7();
	// main페이지 특정 가수의 노래 7곡 랜덤으로 불러오기
	List<R_Music> findRandom7BySinger = Music_repo.findRandom7BySinger();
	
	
	// model에 담아서 메인에 보내주기
	model.addAttribute("top7Artist",top7Artist);	
	model.addAttribute("findRandom7",findRandom7);	
	model.addAttribute("findRandom7BySinger",findRandom7BySinger);
	
	return "index";
	}
	
	@RequestMapping("/goSpoMain")
	public String goSpoMain() {
		return "adminMain";

	}

	// 회원가입 페이지로 이동
	@RequestMapping("/goUserJoin")
	public String goJoin() {
		return "userJoin";
	}

	// 회원가입 완료시 요청받는 컨트롤러
	@RequestMapping("/userJoin")
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

		Member_repo.save(member);

		return "redirect:/goUserMain";
	}
	
	// 로그인
	@RequestMapping("/userLogin")
	public ResponseEntity<?> Login(HttpSession session, String rmEmail, String rmPw) {

		R_Member member = Member_repo.findByRmEmailAndRmPw(rmEmail, rmPw);
		
		if (member != null) {
			session.setAttribute("user", member);
			System.out.println("============================================================");
			System.out.println("로그인 유저 정보 : " + "\n" + session.getAttribute("user"));
			System.out.println("============================================================");
			return new ResponseEntity<>("OK", HttpStatus.OK); // 로그인 성공
		} else {
			System.out.println("============================================================");
			System.out.println("회원조회 실패! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			System.out.println("============================================================");
			return new ResponseEntity<>("Unauthorized", HttpStatus.UNAUTHORIZED); // 로그인 실패
		}
	}

	// 로그아웃
	@RequestMapping("/userLogout")
	public ModelAndView Logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ApiController kakaoApi = new ApiController();
		kakaoApi.kakaoLogout((String) session.getAttribute("k_accessToken"));
		System.out.println("===============================================================");
		System.out.println("카카오엑세스토큰(기본유저는 null) : " + session.getAttribute("k_accessToken"));
		System.out.println("===============================================================");

		if (session.getAttribute("k_accessToken") != null) {

			session.removeAttribute("k_accessToken");
			session.removeAttribute("user");
			mav.setViewName(
					"redirect:https://kauth.kakao.com/oauth/logout?client_id=5f4adf5f781d4507aaf15fdd092cf73b&logout_redirect_uri=http://localhost:8087/relax/goUserMain");
			return mav;
		} else {

			mav.setViewName("redirect:/goUserMain");
			session.removeAttribute("user");
			return mav;
		}

	}

	// 마이페이지로 이동
	@RequestMapping("/goUserMypage")
	public String goUserMypage() {
		return "userMypage";
	}

	// 메인으로
	@RequestMapping("/goUserMainFromMP")
	public String goMainFromMP() {
		return "redirect:/goUserMain";
	}

	// 정보수정으로 이동
	@RequestMapping("/goUserChangeInfo")
	public String goChangeInfo() {
		return "userChangeInfo";
	}

	// 정보수정 뒤로가기버튼
	@RequestMapping("/gotoUserMypage")
	public String goBackBtn() {
		return "redirect:/goUserMypage";
	}

	// 정보업데이트 메소드
	@RequestMapping("/userUpdate")
	public String UpdateUserInfo(R_Member member, HttpSession session) {

		R_Member user = (R_Member) session.getAttribute("user");

		// 카카오톡 유저는 선호하는 닉네임,장르만 변경 가능
		if (session.getAttribute("k_accessToken") != null) {
			String rmEmail = user.getRmEmail();
			String rmGender = user.getRmGender();
			String rmPhone = user.getRmPhone();
			member.setRmEmail(rmEmail);
			member.setRmGender(rmGender);
			member.setRmPhone(rmPhone);
			Member_repo.save(member);
			return "redirect:/userLogout";

		} else {
			// 일반 유저는 비밀번호 변경 O

			String rmEmail = user.getRmEmail();
			String rmName = user.getRmName();
			String rmGender = user.getRmGender();

			member.setRmEmail(rmEmail);
			member.setRmName(rmName);
			member.setRmGender(rmGender);

			Member_repo.save(member);
			System.out.println("=================");
			System.out.println("일반유저 정보 수정 성공");
			System.out.println("=================");

			session.removeAttribute("user");

			return "redirect:/goUserMain";

		}

	}

	// 페이스뮤직 페이지로 이동
	@RequestMapping("/goUserFaceMusic")
	public String goFaceMusic() {
		return"userFaceMusic";
	}
	
	

	// 회원가입시 이메일 사용여부 중복 확인
	@RequestMapping(value="/emailCheck" , method= RequestMethod.POST)
	public @ResponseBody String emailCheck(String email) {
		
		R_Member member = (R_Member)Member_repo.findByRmEmail(email);
		
		if(member != null) {
			return "false";
		} else {
			return "true";
		}
	}
	
	// 닉네임 중복확인
	@RequestMapping(value="/nickCheck" , method=RequestMethod.POST)
	public @ResponseBody String nickCheck(String nick) {
		
		R_Member member = (R_Member)Member_repo.findByRmNick(nick);
		
		if(member != null) { // member가 null이 아니면 이미 닉네임값이 존재함
			return "false";
		} else {
			return "true";  // member가 null이면 닉네임 값이 없음
		}
		
	}
	
	// 회원탈퇴 페이지로 이동
		@RequestMapping("/goUserDropInfo")
		public String goUserDrop() {
			return "userDrop";
		}
	
		// 회원탈퇴페이지 뒤로가기 버튼
		@RequestMapping("/userDropBackBtn")
		public String goUserDropBackBtn() {
			return "redirect:/goUserMypage";
		}
	
		// 회원 탈퇴 기능
		@Transactional
		@RequestMapping("/dropUserInfo")
		public String dropUserInfo(String rmPw, HttpSession session) {

			// 정보 수집
			R_Member member = (R_Member) session.getAttribute("user");
			String rmEmail = member.getRmEmail();

			// 기능 실행
			// 뷰 선택
			R_Member userInfo = (R_Member) Member_repo.findByRmEmailAndRmPw(rmEmail, rmPw);

			if (userInfo != null) {
				// 회원정보가 존재 --> 탈퇴
				Member_repo.deleteByRmEmailAndRmPw(rmEmail, rmPw);
				session.removeAttribute("user");

				System.out.println("=================");
				System.out.println("회원 탈퇴기능 실행 성공");
				System.out.println("=================");

				return "redirect:/goUserMain";

			} else {
				// 회원 정보가 없음 --> 비밀번호를 잘못 입력함
				System.out.println("=================");
				System.out.println("  회원 탈퇴기능 실패  ");
				System.out.println("=================");
				return "redirect:/goUserDropInfo";
			}
		}
	
		// 카카오 회원탈퇴기능
		@Transactional
		@RequestMapping("/dropKakaoUser")
		public ModelAndView dropKakaoUser(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			ApiController kakaoApi = new ApiController();
			kakaoApi.kakaoUserDrop((String) session.getAttribute("k_accessToken"));
			
			R_Member user = (R_Member)session.getAttribute("user");
			
			String rmEmail = user.getRmEmail();
			String rmPw = user.getRmPw();
			
			//DB에 저장된 정보 삭제
			Member_repo.deleteByRmEmailAndRmPw(rmEmail, rmPw);
			
			//세션 정보 삭제
			session.removeAttribute("user");
			
			mav.setViewName("redirect:/goUserMain");

			return mav;
		}

		
		// MyMusicPlayer 현재재생목록페이지로 이동
		@RequestMapping("/goUserMusicPlayer")
		public String goMyMusicPlayer(HttpSession session, Model model) {
			
		//세션에 저장된 이메일값 가져오기
		R_Member member = (R_Member)session.getAttribute("user");
		String rmEmail = member.getRmEmail();
		
		if(rmEmail == null) {	
			//만약 rmNick이 null이라면 세션이 만료되었으니 그냥 메인으로 보내버림
			return "redirect:/goUserMain";
		}
		
		// 이메일을 이용해서 nowlist 테이블 조회
		// 그리고 테이블 정보 다 nowlist에 저장

		
		List<R_Nowlist> nowlist = Nowlist_repo.findByRmEmail(rmEmail);
		// nowlist에있는 음악 Seq 번호를 이용해서 Music테이블을 다시 조회 하고 음악 정보를 가지고 오기
		
		// 빈 배열 타입은 R_music테이블 정보를 담을 배열
		List<R_Music> musicInfo = new ArrayList<R_Music>();
		// nowlist에는 내 이메일로 조회한 정보만 있음
		for(R_Nowlist n : nowlist) {
		// 내 nowlist에있는 음악seq는 중복이 없음 그래서 이걸로 다시 music테이블을 조회한 후 그 seq와 같은 
		// 노래 정보들을 다 가지고 옴
			R_Music music = Music_repo.findByRmuSeq(n.getRmuSeq());

			
			if (music != null) {
		        musicInfo.add(music);
		    }
		}
		
		// 이제 musicInfo에는 내가 저장한 재생목록 노래들 정보가 다 저장되어 있음
		System.out.println(musicInfo + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		model.addAttribute("musicInfo",musicInfo);

			return"userMusicPlayer";
		}
		
		// userAlbums로 이동
		@RequestMapping("/goUserAlbums")
		public String goUserAlbums(Model model) {
			
			List<R_Music> findRandom48 = Music_repo.findRandom48();
			
			model.addAttribute("findRandom48",findRandom48);
			
			return"userAlbums";
		}
		
		
		
		
		// 이미지전송페이지 세션 종료시============================================
		@RequestMapping("/setUserFaceMusicSession")
		public String setsession1() {
			return "redirect:/goUserMain";
		}
		// 정보수정페이지 세션 종료시
		@RequestMapping("/setUserChangeInfoSession")
		public String setsession2() {
			return "redirect:/goUserMain";
		}
		// 회원탈퇴페이지 세션 종료시
		@RequestMapping("/setUserDropSession")
		public String setsession3() {
			return "redirect:/goUserMain";
		}

		// 마이페이지 세션 종료시
		@RequestMapping("/setUserMypageSession")
		public String setsession5() {
			return "redirect:/goUserMain";
		}
		// 앨범페이지 세션 종료시
		@RequestMapping("/setUserAlbumsSession")
		public String setsession6() {
			return "redirect:/goUserMain";
		}
		//===========================================================================
		
//		// 준연이 앨범페이지
//		@RequestMapping("/goAlbums")
//		public String goAlbums() {
//			return "albums";
//		}
//		// 준연이 facemusic페이지
//		@RequestMapping("/goFacemusic")
//		public String goFacemusic() {
//			return "facemusic";
//		}
//		// 준연이 index페이지
//		@RequestMapping("/goIndex")
//		public String goIndex() {
//			return "index";
//		}
		// 준연이 login페이지
		@RequestMapping("/goLogin")
		public String goLogin() {
			return "login";
		}
//		// 준연이 mypage페이지
//		@RequestMapping("/goMypage")
//		public String goMypage() {
//			return "mypage";
//		}
//		// 준연이 player페이지
//		@RequestMapping("/goPlayer")
//		public String goPlayer() {
//			return "player";
//		}
//		// 준연이 sign페이지
//		@RequestMapping("/goSign")
//		public String goSign() {
//			return "sign";
//		}
		

}
