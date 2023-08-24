package com.fp.eb.jwt;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.xml.bind.DatatypeConverter;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import com.fp.eb.auth.PrincipalDetails;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class JwtProvider {

	@Value("${jwt.secret}")
	private String secretKey;
	private Key signingKey;
	private final long EXP_TIME = 1000L * 60 * 60 * 200; 	// 1시간
	private final SignatureAlgorithm SIGNATURE_ALGORITHM = SignatureAlgorithm.HS256;
	private final UserDetailsService userDetailsService;
	
	@PostConstruct
	private void init() {
		System.out.println("jwtProvider 키생성 : " + secretKey);
		this.signingKey = Keys.hmacShaKeyFor(Decoders.BASE64.decode(secretKey));
	}
	
	public String generateAccessToken(PrincipalDetails userDetails) {
		Map<String, String> map = new HashMap<>();
		map.put("name", userDetails.getUsername());
		map.put("password", userDetails.getPassword());
		map.put("email", userDetails.getUserEmail());
		map.put("roles", userDetails.getAuthorities().toString());
		
		return Jwts.builder()
				.setClaims(map)
				.setSubject(userDetails.getUsername())
				.signWith(signingKey, SIGNATURE_ALGORITHM)
				.setIssuedAt(new Date(System.currentTimeMillis()))
				.setExpiration(new Date(System.currentTimeMillis() + EXP_TIME))
				.compact();
				
	}	// AccessToken을 쿠키로 보낼 거기 때문에 refreshToken 따로 생성하지 않음.
	
	public String generateAccessToken(String userId) {
		PrincipalDetails userDetails = (PrincipalDetails) userDetailsService.loadUserByUsername(userId);
		return generateAccessToken(userDetails);
	}
	
	public String getSubject(String token) {
		return Jwts.parserBuilder()
				.setSigningKey(signingKey)
				.build()
				.parseClaimsJws(token)
				.getBody()
				.getSubject();
	}
	
	
	public Claims getClaims(String token) {
		return Jwts.parserBuilder()
				.setSigningKey(signingKey)
				.build()
				.parseClaimsJws(token)
				.getBody();
	}
	
	
	public boolean validateToken(String token) {
	    if (token == null) {
	        return false;
	    }

	    try {
	        Jws<Claims> claims = Jwts.parserBuilder()
	            .setSigningKey(signingKey)
	            .build()
	            .parseClaimsJws(token);
	        return !claims.getBody().getExpiration().before(new Date());
	    } catch (JwtException e) {
	    	e.printStackTrace();
	        return false;
	    }
	}
	
	public Authentication getAuthentication(String jwtToken) {
		UserDetails userDetails = userDetailsService.loadUserByUsername(getSubject(jwtToken));
		return new UsernamePasswordAuthenticationToken(userDetails, userDetails.getPassword(), userDetails.getAuthorities());
	}
	
	
	
}
