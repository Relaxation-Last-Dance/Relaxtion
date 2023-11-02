package com.smhrd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.R_Nowlist;

@Repository
public interface R_NowlistRepository extends JpaRepository<R_Nowlist, Long>{

}
