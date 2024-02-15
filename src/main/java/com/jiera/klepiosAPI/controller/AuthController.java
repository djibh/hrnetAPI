package com.jiera.klepiosAPI.controller;

import java.security.Principal;
import java.util.Map;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RestControllerAdvice
@RequiredArgsConstructor
public class AuthController {

    private OAuth2AuthorizedClientService authorizedClientService;

    @GetMapping("/*")
    public String getUserInfo(Principal user, @AuthenticationPrincipal OidcUser oidcUser) {
        StringBuffer userInfos = new StringBuffer();
        if (user instanceof UsernamePasswordAuthenticationToken) {
            userInfos.append(getUsernamePasswordLoginInfo(user));
        } else if (user instanceof OAuth2AuthenticationToken) {
            userInfos.append(getOAuth2LoginInfo(user, oidcUser));
        }
        return userInfos.toString();
    }

    private StringBuffer getUsernamePasswordLoginInfo(Principal user) {
        StringBuffer usernameInfo = new StringBuffer();
        UsernamePasswordAuthenticationToken token = ((UsernamePasswordAuthenticationToken) user);
        if (token.isAuthenticated()) {
            User usr = (User) token.getPrincipal();
            usernameInfo.append("Welcome, " + usr.getUsername());
        } else {
            usernameInfo.append("No username found");
        }
        return usernameInfo;
    }

    private StringBuffer getOAuth2LoginInfo(Principal user, OidcUser oidcUser) {
        StringBuffer protectedInfo = new StringBuffer();

        OAuth2AuthenticationToken authToken = ((OAuth2AuthenticationToken) user);
        OAuth2AuthorizedClient authClient = this.authorizedClientService
                .loadAuthorizedClient(authToken.getAuthorizedClientRegistrationId(), authToken.getName());
        if (authToken.isAuthenticated()) {
            Map<String, Object> userAttributes = ((DefaultOAuth2User) authToken.getPrincipal()).getAttributes();
            String userToken = authClient.getAccessToken().getTokenValue();
            protectedInfo.append("Welcome, " + userAttributes.get("name") + "<br><br>");
            protectedInfo.append("e-mail: " + userAttributes.get("email") + "<br><br>");
            protectedInfo.append("Access Token: " + userToken + "<br><br>");

            if (oidcUser != null) {
                OidcIdToken idToken = oidcUser.getIdToken();
                if (idToken != null) {
                    protectedInfo.append("idToken value: " + idToken.getTokenValue() + "<br><br>");
                    protectedInfo.append("Token mapped values <br><br>");
                    Map<String, Object> claims = idToken.getClaims();
                    for (String key : claims.keySet()) {
                        protectedInfo.append("  " + key + ": " + claims.get(key) + "<br>");
                    }
                }
            }
        } else {
            protectedInfo.append("No protected infos found.");
        }
        return protectedInfo;
    }

}
