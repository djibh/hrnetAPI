package com.jiera.hrnetAPI.query;

public class DepartmentQuery {
    public static final String GET_ALL_DEPARTMENTS_QUERY = "SELECT * FROM Departments;";
    public static final String INSERT_DEPARTMENT_QUERY = "INSERT INTO Departments (title) VALUES (:title)";
}
