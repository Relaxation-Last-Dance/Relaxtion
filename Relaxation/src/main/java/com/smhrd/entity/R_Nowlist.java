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
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 시퀀스 자동으로 증가
    private Long rnSeq;     // 리스트순번

    @Column(length = 600, nullable = false)
    private String rnCnt;  // 리스트제목

    @Column(nullable = false)
    private Long rnSinger; // 노래순번
}