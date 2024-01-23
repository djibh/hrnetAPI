package com.jiera.hrnetAPI.dto;

import lombok.Data;

@Data
public class EmployeeDTO {
    private Long id;
    private String firstName;
    private String lastName;
    private String address;
    private String postalCode;
    private String city;
    private String street;
    private String startDate;
    private String birthDate;
}