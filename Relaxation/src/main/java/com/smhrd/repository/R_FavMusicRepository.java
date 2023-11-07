package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.R_FavMusic;

@Repository
public interface R_FavMusicRepository extends JpaRepository<R_FavMusic,Long>{

		public R_FavMusic findByRmuSeqAndRmEmail(Long rmuSeq, String rmEmail);
	
		public long deleteByRfSeq(Long rfSeq);
		
		public List<R_FavMusic> findByRmEmail(String rmEmail);
		
		
	
}
