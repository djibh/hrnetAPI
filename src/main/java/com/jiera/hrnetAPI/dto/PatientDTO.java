package com.jiera.hrnetAPI.dto;

import lombok.Data;

@Data
public class PatientDTO {
    private Long id;
    private String firstName;
    private String lastName;
    private String address;
    private String postalCode;
    private String city;
    private String department;
    private String admissionDate;
    private String birthDate;
}