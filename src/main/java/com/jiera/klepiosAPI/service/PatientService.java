package com.jiera.klepiosAPI.service;

import java.util.List;

import com.jiera.klepiosAPI.domain.Patient;
import com.jiera.klepiosAPI.dto.PatientDTO;

public interface PatientService {

    PatientDTO createPatient(Patient Patient);

    List<Patient> getPatients();
}
