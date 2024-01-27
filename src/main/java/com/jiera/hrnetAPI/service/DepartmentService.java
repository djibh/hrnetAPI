package com.jiera.hrnetAPI.service;

import java.util.List;

import com.jiera.hrnetAPI.domain.Department;
import com.jiera.hrnetAPI.dto.DepartmentDTO;

public interface DepartmentService {

    DepartmentDTO createDepartment(Department department);

    List<Department> getDepartments();
}
