package com.fp.eb.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fp.eb.model.UserDTO;

import lombok.Data;
import lombok.ToString;


@Data @ToString
public class PrincipalDetails implements UserDetails{

	private UserDTO user;
	
	public PrincipalDetails(UserDTO user) {
		System.out.println("PrincipalDetails : " + user);
		this.user = user;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collect = new ArrayList<GrantedAuthority>();
		collect.add(new SimpleGrantedAuthority(user.getU_auth()));
		
		return collect;
	}

	@Override
	public String getPassword() {
		return user.getU_pw();
	}

	@Override
	public String getUsername() {
		return user.getU_id();
	}
	
	public String getUserEmail() {
		return user.getU_email();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}
