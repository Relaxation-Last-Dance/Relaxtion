package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
public class testController {

    @GetMapping("/searchMusic")
    public String searchMusic(@RequestParam String q, HttpSession session) {
        RestTemplate restTemplate = new RestTemplate();
        
        String spotifyUrl = "https://api.spotify.com/v1/search?q=" + q + "%2520track%3ADoxy%2520artist%3AMiles%2520Davis&type=artist&include_external=audio";
        String spotifyToken = (String) session.getAttribute("accessToken");  // 실제 토큰으로 교체해야 함

        restTemplate.getInterceptors().add((request, body, execution) -> {
            request.getHeaders().add("Authorization", spotifyToken);
            return execution.execute(request, body);
        });

        ResponseEntity<String> response = restTemplate.getForEntity(spotifyUrl, String.class);

        return response.getBody();
    }
}
