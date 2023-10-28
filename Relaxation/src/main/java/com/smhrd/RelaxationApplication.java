package com.smhrd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class RelaxationApplication {

	public static void main(String[] args) {
		SpringApplication.run(RelaxationApplication.class, args);
	}

}
