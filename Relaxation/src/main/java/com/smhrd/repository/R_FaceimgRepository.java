package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.R_Faceimg;
import com.smhrd.entity.R_Member;


@Repository
public interface R_FaceimgRepository extends JpaRepository<R_Faceimg, Long> {
	
	public R_Faceimg findByRfImg(String rfImg);
	
	
}
