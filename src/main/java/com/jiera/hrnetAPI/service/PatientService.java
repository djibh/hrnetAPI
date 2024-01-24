package com.jiera.hrnetAPI.service;

import java.util.List;

import com.jiera.hrnetAPI.domain.Patient;
import com.jiera.hrnetAPI.dto.PatientDTO;

public interface PatientService {

    PatientDTO createPatient(Patient Patient);

    List<Patient> getPatients();
}
