package com.smhrd.entity;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class R_Playlist {

    @Id
    @Column(length = 50)
    private String rpUid = UUID.randomUUID().toString(); // 고유아이디

    @ManyToOne
    @JoinColumn(name = "rmEmail")
    private R_Member rmEmail; // 이메일

    @Column(length = 50, nullable = false)
    private String rpPlaytitle; // 플레이리스트제목

    @ManyToOne
    @JoinColumn(name = "rmuSeq")
    private R_Music rmuSeq; // 노래순번
}