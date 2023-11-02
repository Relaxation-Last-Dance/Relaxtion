package com.smhrd.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.CascadeType;
import java.util.List;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
public class R_Member {

	@Id
	@Column(length = 50, nullable = false)
	private String rmEmail; // 이메일

	@Column(length = 40, nullable = false)
	private String rmPw; // 비밀번호

	@Column(length = 20, nullable = false, unique = true)
	private String rmNick; // 닉네임

	@Column(length = 20, nullable = false)
	private String rmName; // 이름

	@Column(length = 10, nullable = false)
	private String rmGender; // 성별

	@Column(length = 20, nullable = false)
	private String rmPhone; // 전화번호

    @OneToMany(mappedBy = "rmEmail", cascade = CascadeType.REMOVE)
    @ToString.Exclude
    private List<R_Faceimg> rFaceimgs;
	
    @OneToMany(mappedBy = "rmEmail", cascade = CascadeType.REMOVE)
    private List<R_FavMusic> rFavMusics;
    
    @OneToMany(mappedBy = "rmEmail", cascade = CascadeType.REMOVE)
    private List<R_Nowlist> rNowlists;
	
    @OneToMany(mappedBy = "rmEmail", cascade = CascadeType.REMOVE)
    private List<R_Playlist> rPlaylists;
}
