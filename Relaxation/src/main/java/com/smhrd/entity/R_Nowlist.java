package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class R_Nowlist {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long rnSeq; // 리스트순번

	@Column(length = 50, nullable = false)
	private String rmEmail; // 이메일

	private Long rmuSeq; // 노래순번
}