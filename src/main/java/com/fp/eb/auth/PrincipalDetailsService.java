package com.fp.eb.auth;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.fp.eb.model.UserDTO;
import com.fp.eb.service.UserDAO;

import lombok.RequiredArgsConstructor;

	//Security session(내부 Authentication(내부 UserDetails)

		//시큐리티 설정에서 loginProcessingUrl("/login");
		//'/login' 요청이 오면 자동으로 UserDetailsService 타입으로 IoC 되어 있는 loadUserByname 함수가 실행

@Service
@RequiredArgsConstructor
public class PrincipalDetailsService implements UserDetailsService{

	private final UserDAO userService;
	
	// post 요청 시 parameter를 꼭 "username" 이라고 보내야함
	// 예) HttpSecurity => .usernameParameter("testuser")

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("★★★★★★★★★★★UserDetailsService★★★★★★★★★★");
		UserDTO dto = userService.getUserByID(username);
		
		System.out.println(">>>>>>>>" + dto);
		PrincipalDetails pd = new PrincipalDetails(dto);
		
		// 현재 사용자의 SecurityContext 가져오기
	
		System.out.println(pd.getUserEmail());
		
		return pd;
	}
	
}
