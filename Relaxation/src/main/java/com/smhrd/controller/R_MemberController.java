package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.R_Member;
import com.smhrd.repository.R_MemberRepository;

@Controller
public class R_MemberController {
	
	@Autowired
	private R_MemberRepository repo;
	
	@RequestMapping("/goLogin")
	public String goSpotify(String rmEmail, String rmPw , HttpSession session) {
		R_Member r_member = repo.findByRmEmailAndRmPw(rmEmail, rmPw);
		if(r_member !=null) {
			session.setAttribute("user", r_member);
		}
		System.out.println(r_member);
		return "redirect:/goMain";
	}
	
	@RequestMapping("/goMain")
	public String goMain() {
	    return "main";
	}
	
	
}
