package com.jiera.hrnetAPI.repository.Implementation;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.jiera.hrnetAPI.domain.Employee;
import com.jiera.hrnetAPI.query.EmployeeQuery;
import com.jiera.hrnetAPI.repository.EmployeeRepository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class EmployeeRepositoryImpl implements EmployeeRepository<Employee> {
    private final NamedParameterJdbcTemplate jdbc;

    @Override
    public Employee create(Employee employee) {
        try {
            // Insert user in database
            KeyHolder holder = new GeneratedKeyHolder();
            SqlParameterSource parameters = getSqlParameterSource(employee);
            jdbc.update(EmployeeQuery.INSERT_EMPLOYEE_QUERY, parameters, holder);
            employee.setId(holder.getKey().longValue());
            return employee;
        } catch (Exception exception) {
            throw exception;
        }
    }

    @Override
    public List<Employee> getAllEmployees() {
        return jdbc.query(EmployeeQuery.GET_ALL_EMPLOYEES_QUERY, new BeanPropertyRowMapper<>(Employee.class));
    }

    private SqlParameterSource getSqlParameterSource(Employee employee) {
        return new MapSqlParameterSource()
                .addValue("firstName", employee.getFirstName())
                .addValue("lastName", employee.getLastName())
                .addValue("department", employee.getDepartment())
                .addValue("address", employee.getAddress())
                .addValue("postalCode", employee.getPostalCode())
                .addValue("city", employee.getCity())
                .addValue("startDate", employee.getStartDate())
                .addValue("birthDate", employee.getBirthDate());
    }
}
