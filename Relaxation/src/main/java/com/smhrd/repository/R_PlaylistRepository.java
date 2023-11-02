package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.R_Playlist;

@Repository
public interface R_PlaylistRepository extends JpaRepository<R_Playlist,String> {

}
