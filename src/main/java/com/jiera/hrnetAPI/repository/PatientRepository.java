package com.jiera.hrnetAPI.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jiera.hrnetAPI.domain.Patient;

@Repository
public interface PatientRepository<T extends Patient> {

    T create(T data);

    List<T> getAllPatients();

}
