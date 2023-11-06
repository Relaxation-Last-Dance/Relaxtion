package com.smhrd.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.ArrayList;
import java.util.Collections;

import org.springframework.data.domain.PageImpl;

import com.smhrd.entity.R_Member;
import com.smhrd.entity.R_Music;
import com.smhrd.entity.R_Nowlist;
import com.smhrd.repository.R_MusicRepository;
import com.smhrd.repository.R_NowlistRepository;
@RestController
public class musicController {
	
	@Autowired
	private R_MusicRepository Music_repo;
	@Autowired
	private R_NowlistRepository Nowlist_repo;
	
	// userAlbums에서 검색버튼으로 데이터조회
	@RequestMapping("/searchAlbums")
	public Page<R_Music> searchMusicTable(String Text, Pageable pageable) {

	    System.out.println("검색한 키워드 : "+ Text );

	    Page<R_Music> searchMusicPage = Music_repo.findByRmuSingerContainingOrRmuTitleContaining(Text, Text, pageable);

	    Map<String, R_Music> map = new LinkedHashMap<>();

	    for (R_Music r_music : searchMusicPage) {
	        map.put(r_music.getRmuTitle(), r_music);
	    }

	    List<R_Music> uniqueMusicList = new ArrayList<>(map.values());

	    Page<R_Music> searchMusic = new PageImpl<>(uniqueMusicList, pageable, uniqueMusicList.size());

	    System.out.println("검색 결과수 : " + searchMusic.getTotalElements());

	    return searchMusic;
	}
	
	// MusicPlayer에서 삭제버튼 클릭시 재생목록에 노래 삭제
	@RequestMapping("/deleteSong")
	public ResponseEntity<List<R_Music>> deleteSong(Long rmuSeq, HttpSession session) {
	    System.out.println(rmuSeq + "재생목록에서 삭제 완료");

	    R_Member member = (R_Member)session.getAttribute("user");
	    String rmEmail = member.getRmEmail();

	    //삭제버튼 클릭한 노래 지움
	    Nowlist_repo.delete(rmuSeq, rmEmail);

	    // 다시 노래 조회
	    List<R_Nowlist> nowlist = Nowlist_repo.findByRmEmail(rmEmail);
	    // 빈 리스트
	    List<R_Music> musicInfo = new ArrayList<R_Music>();

	    for(R_Nowlist n : nowlist) {
	        R_Music music = Music_repo.findByRmuSeqOrderByRmuSeqDesc(n.getRmuSeq());
	        if (music != null) {
	            musicInfo.add(music);
	        }
	    }

	    // 리스트 역순
	    
	    Collections.reverse(musicInfo);
	    
	    
	    return new ResponseEntity<>(musicInfo, HttpStatus.OK);
	}
	
	
	
	
	
}
