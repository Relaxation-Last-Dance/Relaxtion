package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.List;

import lombok.Data;

@Entity
@Data
public class R_Music {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long rmuSeq; // 노래 순번

    @Column(length = 500, nullable = false, unique = true)
    private String rmuUri; // 노래 uri 곡의 고유번호

    @Column(length = 100, nullable = false)
    private String rmuSinger; // 가수

    @Column(length = 500, nullable = false)
    private String rmuTitle; // 노래제목

    @Column(length = 500, nullable = false)
    private String rmuAlbum; // 앨범
    
    @Column(length = 500, nullable = false)
    private String rmuAlbumImg; // 앨범 이미지
    
    @Column(length = 500, nullable = false)
    private String rmuArtistImg; // 아티스트 이미지

    @Column(nullable = false)
    private Double dance; // 리듬감 있는 노래
    
    @Column(nullable = false)
    private Double energy; // 활기찬 힘있는 노래
    
    @Column(nullable = false)
    private Double valence; // 긍정적, 부정적 

    @Column(nullable = false)
    private Double acoustic; // 악기가 얼마나 사용되었는지

    
    
    
    
    @OneToMany(mappedBy = "rmuSeq")
    private List<R_FavMusic> rFavMusics;
    
    @OneToMany(mappedBy = "rmuSeq")
    private List<R_Nowlist> rNowlists;

    @OneToMany(mappedBy = "rmuSeq")
    private List<R_Playlist> rPlaylists;
   
    
}