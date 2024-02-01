package com.jiera.klepiosAPI.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jiera.klepiosAPI.domain.Patient;

@Repository
public interface PatientRepository<T extends Patient> {

    T create(T data);

    List<T> getAllPatients();

}
