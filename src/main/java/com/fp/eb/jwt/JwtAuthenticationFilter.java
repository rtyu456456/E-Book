package com.fp.eb.jwt;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.token.TokenService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fp.eb.auth.PrincipalDetails;
import com.fp.eb.model.User;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class JwtAuthenticationFilter extends UsernamePasswordAuthenticationFilter{

	private final AuthenticationManager authenticationManager;
	private final JwtProvider jwt;
	
	// login 요청을 하면 로그인 시도를 위해서 실행되는 함수
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		
		try {
			System.out.println("★☆★☆★☆★☆★☆★☆★☆★☆★☆JwtAuthenticationFilter : 로그인 인증 프로세스 시작");

			// username, password 받음
			ObjectMapper om = new ObjectMapper();
			System.out.println(request.getParameter("username"));
			System.out.println(request.getParameter("password"));
			
			//User user = om.readValue(request.getInputStream(), User.class);
			//System.out.println(user);
			
			UsernamePasswordAuthenticationToken authenticationToken = 
					new UsernamePasswordAuthenticationToken(request.getParameter("username"), request.getParameter("password"));
			
			// PrincipalDetailsService의 loadUserByUsername(); 함수가 실행됨
			// loadUserByUsername() 이 정상적으로 실행되면 Authentication 리턴됨 (DB에 있는 id 와 pw가 일치 할 시)
			Authentication authentication = authenticationManager.authenticate(authenticationToken);
			// authentication 객체를 session 영역에 저장
			return authentication;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
		
	// attemptAuthentication 실행 후 인증이 정상적으로 되었으면 successfulAuthentication 실행됨
	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain,
			Authentication authResult) throws IOException, ServletException {
		
		System.out.println("★☆★☆★☆★☆★☆★☆★☆★☆★☆successfulAuthentication★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆");
		PrincipalDetails userDetails = (PrincipalDetails) authResult.getPrincipal();
		
		setResponse(userDetails,request, response);
	}	
	
	private void setResponse(PrincipalDetails userDetails,HttpServletRequest req,  HttpServletResponse response) throws JsonProcessingException, IOException {
		System.out.println("setResponse 시작");
		String accessToken = jwt.generateAccessToken(userDetails);
		
		ObjectMapper om = new ObjectMapper();
		
		Cookie cookie = new Cookie("AccessToKen_CookieName", accessToken);
		cookie.setHttpOnly(true);
		cookie.setSecure(true);
		cookie.setPath("/");
		
		// Payload(body)에 보여주고 싶은 내용을 userDetails에 넣음으로 전달. 
//		Map<String, String> map = new HashMap<>();
//		map.put("Id", userDetails.getUsername());
//		map.put("roles", userDetails.getAuthorities().toString());
		
		// access token 세팅 (Cookie)
		response.addCookie(cookie);
		System.out.println("쿠키심기" + cookie);
//		response.getWriter().write(om.writeValueAsString(map));
		   // HttpSession에 userDetails 저장
	    req.getSession().setAttribute("userDetails", userDetails);
		 try {
		        response.sendRedirect("/login.do");
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		    
		
	}
	
	
		
}
