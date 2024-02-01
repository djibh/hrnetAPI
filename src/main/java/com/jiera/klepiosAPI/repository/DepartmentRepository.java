package com.jiera.klepiosAPI.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jiera.klepiosAPI.domain.Department;

@Repository
public interface DepartmentRepository<T extends Department> {

    T create(T data);

    List<T> getAllDepartments();
}
