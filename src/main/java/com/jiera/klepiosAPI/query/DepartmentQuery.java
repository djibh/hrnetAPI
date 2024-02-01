package com.jiera.klepiosAPI.query;

public class DepartmentQuery {
    // public static final String GET_ALL_DEPARTMENTS_QUERY = "SELECT * FROM
    // Departments ORDER BY title;";
    public static final String GET_ALL_DEPARTMENTS_QUERY = "SELECT id, title, phone, manager, COUNT(pd.patient_id) AS number_of_patients FROM Departments LEFT JOIN PatientsDepartments pd ON id = pd.department_id GROUP BY id, title, phone, manager ORDER BY title;";
    public static final String INSERT_DEPARTMENT_QUERY = "INSERT INTO Departments (title, manager, phone) VALUES (:title, :manager, :phone)";
}
