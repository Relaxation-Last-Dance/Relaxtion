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
            .antMatchers("/spoLogin","/spoCallback","/goSpoMain","/refresh_token").permitAll() // permit all for login page
            .anyRequest().authenticated() // any other request needs authentication.
            .and()
            .oauth2Login()
            .defaultSuccessUrl("/goMain", true);
    }
}