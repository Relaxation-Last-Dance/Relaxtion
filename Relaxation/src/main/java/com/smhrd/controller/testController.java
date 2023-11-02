package com.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.smhrd.repository.testRepository;

@Controller
public class testController {
	
	@Autowired
	private testRepository terepo;
}
