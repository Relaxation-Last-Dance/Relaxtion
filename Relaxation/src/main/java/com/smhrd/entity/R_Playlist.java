package com.smhrd.entity;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class R_Playlist {

    @Id
    @Column(length = 50)
    private String rpUid = UUID.randomUUID().toString(); // 고유아이디

	@Column(length = 50, nullable = false)
	private String rmEmail; // 이메일

    @Column(length = 50, nullable = false)
    private String rpPlaytitle; // 플레이리스트제목

    private Long rmuSeq; // 노래 순번
}