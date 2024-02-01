package com.jiera.klepiosAPI.dto;

import lombok.Data;

@Data
public class DepartmentDTO {
    private Long id;
    private String title;
    private String manager;
    private String phone;
    private String numberOfPatients;
}