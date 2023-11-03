package com.smhrd.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class spoSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable() // CSRF protection disable if not needed.
            .authorizeRequests()
            .antMatchers("/spoLogin","/spoCallback","/refresh_token",
            		
            		//apiController
            		"/kakaoCallback",
            		
            		//faceImgController
            		"/imgUpload",
            		
            		//R_MemberController
            		"/goUserMain",
            		"/goUserJoin",
            		"/userJoin",
            		"/userLogin",
            		"/userLogout",
            		"/goUserMypage",
            		"/goUserMainFromMP",
            		"/goUserChangeInfo",
            		"/gotoUserMypage",
            		"/userUpdate",
            		"/goUserFaceMusic",
            		"/emailCheck",
            		"/nickCheck",
            		"/goUserDropInfo",
            		"/userDropBackBtn",
            		"/dropUserInfo",
            		"/dropKakaoUser",
            		"/setUserFaceMusicSession",
            		"/setUserChangeInfoSession",
            		"/setUserDropSession",
            		"/setUserMypageSession",
            		"/setUserAlbumsSession",
            		"/goUserMusicPlayer",
            		"/goSpoMain",
            		"/goUserAlbums",
            		
            		//musicController
            		"/searchAlbums"
            		).permitAll() // permit all for login page
            .anyRequest().authenticated() // any other request needs authentication.
            .and()
            .oauth2Login()
            .defaultSuccessUrl("/goUserMain", true);
    }
}