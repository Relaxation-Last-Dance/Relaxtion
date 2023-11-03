package com.smhrd.repository;

import org.springframework.data.domain.Pageable;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;

import com.smhrd.entity.R_Music;

@Repository
public interface R_MusicRepository extends JpaRepository<R_Music, Long>{

	
	Page<R_Music> findByRmuSingerContainingOrRmuTitleContaining(String rmuSinger, String rmuTitle, Pageable pageable);
	
	
	
	
	
	
	
	
	// 메인페이지 Top7가수 띄워주기위한 쿼리, 리스트에담기
	@Query(value = "SELECT rmu_singer " +
            "FROM r_music " +
            "GROUP BY rmu_singer " +
            "ORDER BY COUNT(*) DESC " +
            "LIMIT 7", nativeQuery = true)
	List<String> findTop7();
	
	// 랜덤으로 7개 음악가지고 오는 쿼리, 리스트에담기
	@Query(value = "SELECT * " +
	        "FROM r_music " +
	        "WHERE rmu_seq BETWEEN 1734 AND 5792 " +
	        "ORDER BY RAND() " +
	        "LIMIT 7", nativeQuery = true)
	List<R_Music> findRandom7();

	//albums페이지에 랜덤으로 48개 음악가지고 오는 쿼리, 리스트에담기
	@Query(value = "SELECT * " +
			"FROM r_music " +
			"WHERE rmu_seq BETWEEN 1734 AND 5792 " +
			"ORDER BY RAND() " +
			"LIMIT 48", nativeQuery = true)
	List<R_Music> findRandom48();
	
	// 특정 한 가수 노래 7개 랜덤으로 가지고오는 쿼리, 리스트에담기(가수 이름만 바꾸면 됨)
	@Query(value = "SELECT * " +
	        "FROM r_music " +
	        "WHERE rmu_singer = 'iu' " +
	        "ORDER BY RAND() " +
	        "LIMIT 7", nativeQuery = true)
	List<R_Music> findRandom7BySinger();
	
	
	
}
