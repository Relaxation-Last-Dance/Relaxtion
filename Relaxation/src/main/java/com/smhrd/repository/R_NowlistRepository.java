package com.smhrd.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.smhrd.entity.R_Nowlist;

@Repository
public interface R_NowlistRepository extends JpaRepository<R_Nowlist, Long>{

		 List<R_Nowlist> findByRmEmail(String rmEmail);

		static void save(String rmEmail, Long rmuSeq) {
			
		}
		 

		@Transactional
		@Modifying
		@Query("DELETE FROM R_Nowlist n WHERE n.rmuSeq = :rmuSeq AND n.rmEmail = :rmEmail")
		void delete(@Param("rmuSeq") Long rmuSeq, @Param("rmEmail") String rmEmail);
		 
		 
		 
		 
}
		
		
		
	

