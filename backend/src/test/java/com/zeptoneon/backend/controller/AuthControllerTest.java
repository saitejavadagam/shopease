package com.zeptoneon.backend.controller;


import com.zeptoneon.backend.dto.AuthResponse;
import com.zeptoneon.backend.dto.LoginRequest;
import com.zeptoneon.backend.dto.SignupRequest;
import com.zeptoneon.backend.service.AuthService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

public class AuthControllerTest {

    private AuthController authController;
    private AuthService authService;

    private SignupRequest signupRequest;
    private LoginRequest loginRequest;

    @BeforeEach
    void setup(){
        authService = Mockito.mock(AuthService.class);
        authController = new AuthController(authService);

        signupRequest = new SignupRequest(
                "John",
                "Doe",
                "test@example.com",
                "password123"
        );
        loginRequest = new LoginRequest("John","titor@123");
    }

    @Test
    void shouldReturnCreatedStatusOnSignup(){
        String successMessage = "User successfully registered";

        when(authService.signup(any(SignupRequest.class))).thenReturn(successMessage);

        ResponseEntity<String> response = authController.signup(signupRequest);

        assertNotNull(response);
        assertEquals(HttpStatus.CREATED,response.getStatusCode());
        assertEquals(successMessage,response.getBody());
    }

    @Test
    void shouldReturnOkStatusOnLogin(){
        String successMessage = "User successfully logged in";

        when(authService.login(any(LoginRequest.class))).thenReturn(successMessage);

        ResponseEntity<AuthResponse> response = authController.login(loginRequest);

        assertNotNull(response);
        assertEquals(HttpStatus.OK,response.getStatusCode());
        assertNotNull(response.getBody());
        assertEquals(successMessage,response.getBody().getToken());

    }


}
