package com.jiera.hrnetAPI.controller;

import java.net.URI;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.jiera.hrnetAPI.domain.Employee;
import com.jiera.hrnetAPI.domain.HttpResponse;
import com.jiera.hrnetAPI.dto.EmployeeDTO;
import com.jiera.hrnetAPI.service.EmployeeService;

import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RestControllerAdvice
@RequestMapping("/api")
@RequiredArgsConstructor
public class EmployeeController {
    private final EmployeeService employeeService;

    @PostMapping("/employee")
    public ResponseEntity<HttpResponse> saveEmployee(@RequestBody Employee employee) {
        EmployeeDTO employeeDTO = employeeService.createEmployee(employee);
        return ResponseEntity.created(getUri()).body(
                HttpResponse.builder()
                        .timeStamp(LocalDateTime.now().toString())
                        .data(Map.of("user", employeeDTO))
                        .message("Employee created")
                        .status(HttpStatus.CREATED)
                        .statusCode(HttpStatus.CREATED.value())
                        .build());
    }

    private URI getUri() {
        return URI
                .create(ServletUriComponentsBuilder.fromCurrentContextPath().path("/user/get/<userId>").toUriString());
    }

    @GetMapping("/employees")
    public ResponseEntity<List<Employee>> getEmployees() {
        return ResponseEntity.ok().body(employeeService.getEmployees());
    }

}
