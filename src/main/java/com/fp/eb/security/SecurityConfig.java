package com.fp.eb.security;

import java.util.Arrays;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import com.fp.eb.jwt.JwtAuthenticationFilter;
import com.fp.eb.jwt.JwtAuthorizationFilter;
import com.fp.eb.jwt.JwtProvider;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {
	
	private final AuthenticationConfiguration authConfiguration;
	private final JwtProvider jwtProvider;

	
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return web -> {
            web.ignoring()
                .antMatchers(
                   "/**"
                    );
        };
    }
    
    
	/*
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
    	return web -> {
    		web.ignoring()
    		.antMatchers(
    				"/**",
    				"/login.go",
    				"/login.do"
    				);
    	};
    }
	*/
   

//	@Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//    	http
//    	
//    		.cors().configurationSource(corsConfigurationSource()).and()
//    		.csrf().disable()
//    		.httpBasic().disable()
//    		.formLogin().disable()
//    		.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
//    		
//    	
//    
//    	return http
//    		.addFilter(new JwtAuthenticationFilter(authConfiguration.getAuthenticationManager(), jwtProvider))
//    		.addFilter(new JwtAuthorizationFilter(authConfiguration.getAuthenticationManager(), jwtProvider))
//    			.authorizeHttpRequests()
//    			.antMatchers("/**") // 모든 URL에 대해 접근 허용
//                .permitAll()
//                .antMatchers("/login.do").authenticated()
//    			.anyRequest().authenticated()
//    			.and()
//    			.build();
//    	
//    }
//    


	@Bean
	CorsConfigurationSource corsConfigurationSource() {
		CorsConfiguration configuration = new CorsConfiguration();
		configuration.setAllowedOriginPatterns(Arrays.asList("*"));
		configuration.setAllowedMethods(Arrays.asList("HEAD", "POST", "GET", "DELETE", "PUT"));
		configuration.setAllowedHeaders(Arrays.asList("*"));
		configuration.setAllowCredentials(true);
		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		source.registerCorsConfiguration("/**", configuration);
		return source;
	}


}