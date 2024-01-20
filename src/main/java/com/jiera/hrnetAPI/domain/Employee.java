package com.jiera.hrnetAPI.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "employees")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "postal_code")
    private String postalCode;

    @Column(name = "start_date")
    private String startDate;

    @Column(name = "birth_date")
    private String birthDate;

    private String department;
    private String address;
    private String city;
    private String state;

}