package com.fp.eb.jwt;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.web.util.WebUtils;

import io.jsonwebtoken.JwtException;

//security filter 중 BasicAuthenticationFilter 가 있음
//권한이나 인증이 필요한 특정 주소를 요청 했을 때 위 필터를 무조건 타게 됨
//권한이나 인증이 필요하지 않은 주소라면 필터를 타지 않음
public class JwtAuthorizationFilter extends BasicAuthenticationFilter{

	private static final String AUTHORIZATION = "Authorization";
	private JwtProvider jwt;
	
	
	
	public JwtAuthorizationFilter(AuthenticationManager authenticationManager, JwtProvider jwtProvider) {
		super(authenticationManager);
		this.jwt = jwtProvider;
	}

	// 인증이나 권한이 필요한 주소요청이 있을 때 해당 필터를 탐
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("★☆★☆★☆★☆★☆★☆★☆★☆★☆ JwtAuthorizationFilter 시작 ★☆★☆★☆★☆★☆★☆★☆★☆★☆");
		Cookie accessTokenCookie = WebUtils.getCookie(request, "AccessToKen_CookieName");
		
		System.out.println("쿠키");
		System.out.println(accessTokenCookie.getValue());
		String jwtCookie = accessTokenCookie.getValue(); 
		
		if (request.getMethod().equalsIgnoreCase("OPTIONS")) {
			response.setStatus(HttpStatus.OK.value());
			return;
		}
		
		Optional.ofNullable(jwtCookie).orElseThrow(() -> new JwtException("Authorization header is null"));
		
		
		// jwt 토큰 서명을 통해 서명이 정상이면 Authentication 객체를 강제로 시큐리티 저장소에 접근하여 Authentication 객체를 저장
		System.out.println(" ????????????" + jwt.getAuthentication(jwtCookie));
		SecurityContextHolder.getContext().setAuthentication(jwt.getAuthentication(jwtCookie));
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		System.out.println(auth);
		System.out.println(auth.getName());
		System.out.println("★☆★☆★☆★☆★☆★☆★☆★☆★☆ JwtAuthorizationFilter 완료 ★☆★☆★☆★☆★☆★☆★☆★☆★☆");
		// 현재 사용자의 Authentication 객체 가져오기
		chain.doFilter(request, response);
		
	}
	
	/*
	private void handleAccessToken(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Cookie accessTokenCookie = WebUtils.getCookie(request, "AccessToKen_CookieName");
		
		if (accessTokenCookie == null) {
			System.out.println("JwtAutorizationFilter : AccessToken이 유효하지 않습니다");
		}

		String accessToken = accessTokenCookie.getValue();
		String userId = jwt.getSubject(accessToken);
		
		String generatedToken = jwt.generateAccessToken(userId);
		System.out.println("generatedToken : " + generatedToken);
		
		SecurityContextHolder.getContext().setAuthentication(jwt.getAuthentication(generatedToken));
		
		
	}
	*/
	
}
