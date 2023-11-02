package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
public class R_Faceimg {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long rfSeq; // 이미지 순번

    @ManyToOne
    @JoinColumn(name = "rmEmail")
    @ToString.Exclude
    private R_Member rmEmail;

    @Column(length = 600, nullable = false)
    private String rfImg; // 얼굴 이미지

    @Column(length = 30)
    private String rfImgEmo; // 분석 감정

    @Column(columnDefinition = "TEXT")
    private String rmContent; // 분석 내용
}