package com.smhrd.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class R_Nowlist {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long rnSeq; // 리스트순번

    @ManyToOne
    @JoinColumn(name = "rmEmail")
    private R_Member rmEmail; // 이메일

    @ManyToOne
    @JoinColumn(name = "rmuSeq")
    private R_Music rmuSeq; // 노래순번
}