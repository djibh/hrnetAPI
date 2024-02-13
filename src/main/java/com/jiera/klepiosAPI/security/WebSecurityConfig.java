package com.jiera.klepiosAPI.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.jiera.klepiosAPI.service.Implementation.AppUserServiceImpl;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class WebSecurityConfig {

    @Autowired
    private AppUserServiceImpl userServiceImpl;

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        // http.authorizeHttpRequests(
        // (requests) -> requests.requestMatchers("/login",
        // "login").permitAll().anyRequest().authenticated())
        // .formLogin((form) ->
        // form.loginPage("/login").permitAll()).logout((logout)
        // ->
        // logout.permitAll());

        // http.authorizeHttpRequests((requests) ->
        // requests.requestMatchers("*").permitAll());

        return http.authorizeHttpRequests(auth -> {
            // auth.requestMatchers("/api/*").permitAll();
            auth.requestMatchers("/login").permitAll();
            auth.requestMatchers("/api/departments").hasRole("ADMIN");
            auth.requestMatchers("/api/patients").hasRole("USER");
            auth.anyRequest().authenticated();
        }).formLogin(Customizer.withDefaults()).build();
    }

    @Bean
    BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    AuthenticationManager authenticationManager(HttpSecurity http, BCryptPasswordEncoder passwordEncoder)
            throws Exception {
        AuthenticationManagerBuilder authenticationManagerBuilder = http
                .getSharedObject(AuthenticationManagerBuilder.class);
        authenticationManagerBuilder.userDetailsService(userServiceImpl).passwordEncoder(passwordEncoder);
        return authenticationManagerBuilder.build();
    }
}
