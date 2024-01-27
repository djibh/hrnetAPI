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

import com.jiera.hrnetAPI.domain.Department;
import com.jiera.hrnetAPI.domain.HttpResponse;
import com.jiera.hrnetAPI.dto.DepartmentDTO;
import com.jiera.hrnetAPI.service.DepartmentService;

import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RestControllerAdvice
@RequestMapping("/api")
@RequiredArgsConstructor
public class DepartmentController {
    private final DepartmentService departmentService;

    @PostMapping("/department")
    public ResponseEntity<HttpResponse> saveDepartment(@RequestBody Department department) {
        DepartmentDTO departmentDTO = departmentService.createDepartment(department);
        return ResponseEntity.created(getUri()).body(
                HttpResponse.builder()
                        .timeStamp(LocalDateTime.now().toString())
                        .data(Map.of("Department", departmentDTO))
                        .message("Department created")
                        .status(HttpStatus.CREATED)
                        .statusCode(HttpStatus.CREATED.value())
                        .build());
    }

    private URI getUri() {
        return URI
                .create(ServletUriComponentsBuilder.fromCurrentContextPath().path("/service/get/<serviceId>")
                        .toUriString());
    }

    @GetMapping("/departments")
    public ResponseEntity<List<Department>> getDepartments() {
        return ResponseEntity.ok().body(departmentService.getDepartments());
    }

}
