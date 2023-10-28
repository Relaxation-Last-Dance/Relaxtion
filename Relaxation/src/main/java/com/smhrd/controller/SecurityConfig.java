package com.smhrd.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable() // CSRF protection disable if not needed.
            .authorizeRequests()
            .antMatchers(
            		//apiController
            		"/kakaocallback",
            		
            		//faceImgController
            		"/imgUplode",
            		"/flask",
            		
            		//R_MemberController
            		"/goMain",
            		"/goJoin",
            		"/join",
            		"/gologin",
            		"/logout",
            		"/goMypage",
            		"/goMainFromMP",
            		"/goChangeInfo",
            		"/gotoMypage",
            		"/Update",
            		"/goFaceMusic",
            		"/goLogin",
            		
            		//AuthorizController
            		"/login", 
            		"/callback",
            		"/refresh_token"
            		
            		).permitAll() // permit all for login page
            .anyRequest().authenticated() // any other request needs authentication.
            .and()
            .oauth2Login()
            .defaultSuccessUrl("/goMain", true);
    }
}