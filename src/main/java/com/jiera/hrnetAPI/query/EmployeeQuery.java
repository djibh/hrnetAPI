package com.jiera.hrnetAPI.query;

public class EmployeeQuery {
    public static final String GET_ALL_EMPLOYEES_QUERY = "SELECT * FROM employees;";
    public static final String INSERT_EMPLOYEE_QUERY = "INSERT INTO employees (first_name, last_name, department, address, postal_code, city, state, start_date, birth_date) VALUES (:firstName, :lastName, :department, :address, :postalCode, :city, :state, :startDate, :birthDate)";
}
