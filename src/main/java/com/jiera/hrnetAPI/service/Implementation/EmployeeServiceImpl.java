package com.jiera.hrnetAPI.service.Implementation;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jiera.hrnetAPI.domain.Employee;
import com.jiera.hrnetAPI.dto.EmployeeDTO;
import com.jiera.hrnetAPI.dtomapper.EmployeeDTOMapper;
import com.jiera.hrnetAPI.repository.EmployeeRepository;
import com.jiera.hrnetAPI.service.EmployeeService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {

    private final EmployeeRepository<Employee> employeeRepository;

    @Override
    public EmployeeDTO createEmployee(Employee employee) {
        return EmployeeDTOMapper.fromEmployee(employeeRepository.create(employee));
    }

    @Override
    public List<Employee> getEmployees() {
        return employeeRepository.getAllEmployees();
    }
}
