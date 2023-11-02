package com.smhrd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;

import com.smhrd.entity.R_Music;

@Repository
public interface R_MusicRepository extends JpaRepository<R_Music, Long>{

	// 메인페이지 Top10가수 띄워주기위한 쿼리문, 배열에 담기
	@Query(value = "SELECT rmu_singer " +
            "FROM r_music " +
            "GROUP BY rmu_singer " +
            "ORDER BY COUNT(*) DESC " +
            "LIMIT 10", nativeQuery = true)
	List<String> findTop10();
	
}
