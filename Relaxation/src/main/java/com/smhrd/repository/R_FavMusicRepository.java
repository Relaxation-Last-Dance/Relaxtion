package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.R_FavMusic;

@Repository
public interface R_FavMusicRepository extends JpaRepository<R_FavMusic,Long>{

}
