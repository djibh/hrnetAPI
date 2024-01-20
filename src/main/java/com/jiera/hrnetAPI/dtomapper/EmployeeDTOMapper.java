package com.jiera.hrnetAPI.dtomapper;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import com.jiera.hrnetAPI.domain.Employee;
import com.jiera.hrnetAPI.dto.EmployeeDTO;

@Component
public class EmployeeDTOMapper {
    public static EmployeeDTO fromEmployee(Employee employee) {
        EmployeeDTO employeeDTO = new EmployeeDTO();
        BeanUtils.copyProperties(employee, employeeDTO);
        return employeeDTO;
    }

    public static Employee toEmployee(EmployeeDTO employeeDTO) {
        Employee employee = new Employee();
        BeanUtils.copyProperties(employeeDTO, employee);
        return employee;
    }
}
