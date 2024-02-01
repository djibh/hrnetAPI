package com.jiera.klepiosAPI.service;

import java.util.List;

import com.jiera.klepiosAPI.domain.Department;
import com.jiera.klepiosAPI.dto.DepartmentDTO;

public interface DepartmentService {

    DepartmentDTO createDepartment(Department department);

    List<Department> getDepartments();
}
