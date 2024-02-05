package com.jiera.klepiosAPI.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class WebSecurityConfig {

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
            auth.requestMatchers("/api/*").permitAll();
            // auth.requestMatchers("/api/services").hasRole("ADMIN");
            // auth.requestMatchers("/api/").hasRole("USER");
            // auth.anyRequest().authenticated();
        }).formLogin(Customizer.withDefaults()).build();
    }

    @Bean
    UserDetailsService users() {
        UserDetails user = User.builder().username("user").password(passwordEncoder().encode("user")).roles("USER")
                .build();
        UserDetails admin = User.builder().username("admin").password(passwordEncoder().encode("admin"))
                .roles("ADMIN", "USER")
                .build();
        return new InMemoryUserDetailsManager(user, admin);
    }

    @Bean
    BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
