package com.smhrd.controller;

import org.springframework.data.domain.Pageable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.ArrayList;
import org.springframework.data.domain.PageImpl;

import com.smhrd.entity.R_Music;
import com.smhrd.repository.R_MusicRepository;
@RestController
public class musicController {
	
	@Autowired
	private R_MusicRepository repo;
	
	// userAlbums에서 검색버튼으로 데이터조회
	@RequestMapping("/searchAlbums")
	public Page<R_Music> searchMusicTable(String Text, Pageable pageable) {

	    System.out.println("검색한 키워드 : "+ Text );

	    Page<R_Music> searchMusicPage = repo.findByRmuSingerContainingOrRmuTitleContaining(Text, Text, pageable);

	    Map<String, R_Music> map = new LinkedHashMap<>();

	    for (R_Music r_music : searchMusicPage) {
	        map.put(r_music.getRmuTitle(), r_music);
	    }

	    List<R_Music> uniqueMusicList = new ArrayList<>(map.values());

	    Page<R_Music> searchMusic = new PageImpl<>(uniqueMusicList, pageable, uniqueMusicList.size());

	    System.out.println("검색 결과수 : " + searchMusic.getTotalElements());

	    return searchMusic;
	}
	
	
}
