package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.R_Faceimg;


@Repository
public interface R_FaceimgRepository extends JpaRepository<R_Faceimg, String> {

}
