package com.jiera.hrnetAPI.service;

import java.util.List;

import com.jiera.hrnetAPI.domain.Employee;
import com.jiera.hrnetAPI.dto.EmployeeDTO;

public interface EmployeeService {

    EmployeeDTO createEmployee(Employee employee);

    List<Employee> getEmployees();
}
