package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.R_Member;

@Repository

public interface R_MemberRepository extends JpaRepository<R_Member, String>{

	
	// 카카오 회원가입할때 가입이 되어있는지 조회하는 sql문, 이메일 중복검사할때 사용
	public R_Member findByRmEmail(String rmEmail);
	
	// 메인페이지에서 로그인 하기위해 아이디, 비밀번호값 조회, 회원탈퇴하기위해 비밀번호 조회
	public R_Member findByRmEmailAndRmPw(String rmEmail, String rmPw);
	
	// 회원가입할때 닉네임 중복검사
	public R_Member findByRmNick(String rmNick);
	
	// 회원 탈퇴 기능
	public long deleteByRmEmailAndRmPw(String rmEmail, String rmPw);
	
	// 카카오 회원 탈퇴시 DB에 저장된 정보 삭제
	public long deleteByRmEmail(String rmEmail);
	
	
}
