package com.jiera.hrnetAPI.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jiera.hrnetAPI.domain.Employee;

@Repository
public interface EmployeeRepository<T extends Employee> {

    T create(T data);

    List<T> getAllEmployees();

}
