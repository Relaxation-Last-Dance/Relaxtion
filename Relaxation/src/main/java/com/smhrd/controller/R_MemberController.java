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

	// 메인 이동
	@RequestMapping("/goSpoMain")
	public String goSpoMain() {
		return "adminMain";
	}
}
