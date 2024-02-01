package com.jiera.klepiosAPI.dtomapper;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import com.jiera.klepiosAPI.domain.Department;
import com.jiera.klepiosAPI.dto.DepartmentDTO;

@Component
public class DepartmentDTOMapper {
    public static DepartmentDTO fromDepartment(Department department) {
        DepartmentDTO departmentDTO = new DepartmentDTO();
        BeanUtils.copyProperties(department, departmentDTO);
        return departmentDTO;
    }

    public static Department toDepartment(DepartmentDTO departmentDTO) {
        Department department = new Department();
        BeanUtils.copyProperties(departmentDTO, department);
        return department;
    }
}
