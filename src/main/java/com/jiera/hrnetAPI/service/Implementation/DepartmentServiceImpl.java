package com.jiera.hrnetAPI.service.Implementation;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jiera.hrnetAPI.domain.Department;
import com.jiera.hrnetAPI.dto.DepartmentDTO;
import com.jiera.hrnetAPI.dtomapper.DepartmentDTOMapper;
import com.jiera.hrnetAPI.repository.DepartmentRepository;
import com.jiera.hrnetAPI.service.DepartmentService;

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
