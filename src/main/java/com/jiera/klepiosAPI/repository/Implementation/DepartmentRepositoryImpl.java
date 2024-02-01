package com.jiera.klepiosAPI.repository.Implementation;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.jiera.klepiosAPI.domain.Department;
import com.jiera.klepiosAPI.query.DepartmentQuery;
import com.jiera.klepiosAPI.repository.DepartmentRepository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DepartmentRepositoryImpl implements DepartmentRepository<Department> {
    private final NamedParameterJdbcTemplate jdbc;

    @Override
    public Department create(Department service) {
        try {
            KeyHolder holder = new GeneratedKeyHolder();
            SqlParameterSource parameters = getSqlParameterSource(service);
            jdbc.update(DepartmentQuery.INSERT_DEPARTMENT_QUERY, parameters, holder);
            service.setId(holder.getKey().longValue());
            return service;
        } catch (Exception exception) {
            throw exception;
        }
    }

    @Override
    public List<Department> getAllDepartments() {
        return jdbc.query(DepartmentQuery.GET_ALL_DEPARTMENTS_QUERY, new BeanPropertyRowMapper<>(Department.class));
    }

    private SqlParameterSource getSqlParameterSource(Department department) {
        return new MapSqlParameterSource()
                .addValue("title", department.getTitle())
                .addValue("manager", department.getManager())
                .addValue("phone", department.getPhone());
    }
}
