package com.smhrd.controller;

import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Base64;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.Map;
import org.springframework.http.HttpStatus;

@Controller
@EnableScheduling
public class AuthorizController {

	@Value("${spring.security.oauth2.client.registration.spotify.client-id}")
	private String clientId;

	@Value("${spring.security.oauth2.client.registration.spotify.client-secret}")
	private String clientSecret;

	@Value("${spring.security.oauth2.client.registration.spotify.redirect-uri}")
	private String redirectUri;

	@Value("${spring.security.oauth2.client.registration.spotify.scope}")
	private String scope;

	@GetMapping("/login")
	public RedirectView login(HttpSession session) {
		String state = generateRandomString(16);

		String authorizeUrl = "";

		try {
			authorizeUrl = "https://accounts.spotify.com/authorize?" + "response_type=code" + "&client_id=" + clientId
					+ "&scope=" + URLEncoder.encode(scope, StandardCharsets.UTF_8.name()) + "&redirect_uri="
					+ URLEncoder.encode(redirectUri, StandardCharsets.UTF_8.name()) + "&state=" + state;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new RedirectView(authorizeUrl);
	}

	private String generateRandomString(int length) {
		SecureRandom random = new SecureRandom();
		byte[] bytes = new byte[length];
		random.nextBytes(bytes);
		return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
	}

	@GetMapping("/callback")
	public String callback(HttpServletRequest request, HttpSession session) {
		String code = request.getParameter("code");
		String state = request.getParameter("state");

		if (state == null) {
			session.setAttribute("error", "State mismatch");
			return "error";
		} else {
			String creds = Base64.getEncoder()
					.encodeToString((clientId + ":" + clientSecret).getBytes(StandardCharsets.UTF_8));

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
			headers.set("Authorization", "Basic " + creds);

			MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
			map.add("code", code);
			map.add("redirect_uri", redirectUri);
			map.add("grant_type", "authorization_code");

			HttpEntity<MultiValueMap<String, String>> request2 = new HttpEntity<MultiValueMap<String, String>>(map,
					headers);

			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<String> response = restTemplate.postForEntity("https://accounts.spotify.com/api/token",
					request2, String.class);

			// Parse JSON response
			JsonParser parser = new JsonParser();
			JsonObject json = parser.parse(response.getBody()).getAsJsonObject();
			String accessToken = json.get("access_token").getAsString();
			String tokenType = json.get("token_type").getAsString();
			String scope = json.get("scope").getAsString();
			int expiresIn = json.get("expires_in").getAsInt();
			String refreshToken = json.get("refresh_token").getAsString();

			// Add to model
			session.setAttribute("accessToken", accessToken);
			session.setAttribute("tokenType", tokenType);
			session.setAttribute("scope", scope);
			session.setAttribute("expiresIn", expiresIn);
			session.setAttribute("refreshToken", refreshToken);

			long issuedAt = System.currentTimeMillis() / 1000L;
			long expiresAt = issuedAt + expiresIn;
			session.setAttribute("issuedAt", issuedAt);
			session.setAttribute("expiresAt", expiresAt);

			return "redirect:/goMain";
		}
	}
	
	@GetMapping("/refresh_token")
    public String refreshToken(@RequestParam("refreshToken") String refreshToken, HttpSession session) {
        String creds = Base64.getEncoder().encodeToString((clientId + ":" + clientSecret).getBytes(StandardCharsets.UTF_8));

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.set("Authorization", "Basic " + creds);

        MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
        map.add("grant_type", "refresh_token");
        map.add("refreshToken", refreshToken);

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.postForEntity("https://accounts.spotify.com/api/token", request, Map.class);

        if (response.getStatusCode() == HttpStatus.OK) {
            Map<String, Object> body = response.getBody();
            String accessToken = (String) body.get("accessToken");
            String refreshTokenResponse = (String) body.get("refreshToken");

            session.setAttribute("accessToken", accessToken);
            session.setAttribute("refreshToken", refreshTokenResponse);

            return "redirect:/goMain";
        } else {
            throw new RuntimeException("Failed to refresh token, status: " + response.getStatusCode());
        }
    }

}
