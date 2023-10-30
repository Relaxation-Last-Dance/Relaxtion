package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity // 이 DTO를 Table이라 지정하겠다.
@Data
public class R_Member {
	// JPA : NO SQL
	// ORM(Object Relational Mapping)
	// JAVA객체 <--> DB Table
	// DTO 생성 == DB에 Table 생성
	// DTO 필드 --> 컬럼

	// 이메일
	// primary key를 지정하는 어노테이션

	@Id
	@Column(length = 50, nullable = false)
	private String rmEmail; // 이메일

	@Column(length = 40, nullable = false)
	private String rmPw; // 비밀번호

	@Column(length = 20, nullable = false)
	private String rmNick; // 닉네임

	@Column(length = 20, nullable = false)
	private String rmName; // 이름

	@Column(length = 10, nullable = false)
	private String rmGender; // 성별

	@Column(length = 20, nullable = false)
	private String rmPhone; // 전화번호

	@Column(length = 60)
	private String rmGenre; // 선호 장르
}
