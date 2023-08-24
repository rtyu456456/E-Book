package com.fp.eb.jwt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.filter.OncePerRequestFilter;

import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import lombok.Builder;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ExceptionHandletFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        try {
            filterChain.doFilter(request, response);
        } catch (Exception e) {
            log.warn("Exception 발생 : {}", e.getClass().toString());
            e.printStackTrace();
            setErrorResponse(response, getErrorCode(e), e.getMessage());
        }
    }

    private int getErrorCode(Exception e) {
        if (e instanceof ExpiredJwtException || e instanceof JwtException || e instanceof AccessDeniedException) {
            return HttpStatus.UNAUTHORIZED.value();
        } else if (e instanceof UsernameNotFoundException || e instanceof InternalAuthenticationServiceException) {
            return HttpStatus.UNAUTHORIZED.value();
        } else {
            return HttpStatus.BAD_REQUEST.value();
        }
    }

    private void setErrorResponse(HttpServletResponse response, int errCode, String errMessage) {
        ObjectMapper objectMapper = new ObjectMapper();
        ErrorResponse errorResponse = new ErrorResponse(errCode, errMessage);
      
        response.setStatus(errCode);
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        
        try(PrintWriter writer = response.getWriter()){
           writer.write(objectMapper.writeValueAsString(errorResponse));
        } catch (IOException e) {
           e.printStackTrace();
      }

    }

    @Data @Builder
    public static class ErrorResponse {
        private final Integer code;
        private final String message;
    }
}