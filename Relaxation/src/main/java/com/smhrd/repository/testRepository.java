package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.R_Music;

@Repository
public interface testRepository extends JpaRepository<R_Music, String>{

	
	
}
