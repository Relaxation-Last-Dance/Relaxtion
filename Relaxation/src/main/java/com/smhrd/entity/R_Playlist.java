package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class R_Playlist {

    @Id
    @Column(length = 50)
    private String rpUid;           // 고유아이디

    @Column(length = 50, nullable = false)
    private String rmEmail;         // 이메일

    @Column(length = 20, nullable = false)
    private String rpPlaytitle;     // 플레이리스트제목

    @Column(nullable = false)
    private int rfSeq;              // 이미지순번

    @Column(nullable = false)
    private int rmuSeq;             // 노래순번
}