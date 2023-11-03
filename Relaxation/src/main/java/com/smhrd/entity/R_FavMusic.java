package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class R_FavMusic {
   
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private Long rfSeq; // 좋아하는곡 순번 (PK)

	@Column(length = 50, nullable = false)
	private String rmEmail; // 이메일

    private Long rmuSeq; // 노래 순번
}
