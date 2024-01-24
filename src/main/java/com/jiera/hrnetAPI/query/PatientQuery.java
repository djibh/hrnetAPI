package com.jiera.hrnetAPI.query;

public class PatientQuery {
    public static final String GET_ALL_PATIENTS_QUERY = "SELECT * FROM Patients;";
    public static final String INSERT_PATIENT_QUERY = "INSERT INTO Patients (first_name, last_name, department, address, postal_code, city, admission_date, birth_date) VALUES (:firstName, :lastName, :department, :address, :postalCode, :city, :admissionDate, :birthDate)";
}
