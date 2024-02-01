package com.jiera.klepiosAPI.service.Implementation;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jiera.klepiosAPI.domain.Department;
import com.jiera.klepiosAPI.dto.DepartmentDTO;
import com.jiera.klepiosAPI.dtomapper.DepartmentDTOMapper;
import com.jiera.klepiosAPI.repository.DepartmentRepository;
import com.jiera.klepiosAPI.service.DepartmentService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {

    private final DepartmentRepository<Department> departmentRepository;

    @Override
    public DepartmentDTO createDepartment(Department department) {
        return DepartmentDTOMapper.fromDepartment(departmentRepository.create(department));
    }

    @Override
    public List<Department> getDepartments() {
        return departmentRepository.getAllDepartments();
    }
}
