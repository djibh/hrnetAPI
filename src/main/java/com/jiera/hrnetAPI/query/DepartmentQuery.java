package com.jiera.hrnetAPI.query;

public class DepartmentQuery {
    public static final String GET_ALL_DEPARTMENTS_QUERY = "SELECT * FROM Departments ORDER BY title;";
    public static final String INSERT_DEPARTMENT_QUERY = "INSERT INTO Departments (title, manager, phone) VALUES (:title, :manager, :phone)";
}
