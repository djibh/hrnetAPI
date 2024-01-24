package com.jiera.hrnetAPI.service.Implementation;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jiera.hrnetAPI.domain.Patient;
import com.jiera.hrnetAPI.dto.PatientDTO;
import com.jiera.hrnetAPI.dtomapper.PatientDTOMapper;
import com.jiera.hrnetAPI.repository.PatientRepository;
import com.jiera.hrnetAPI.service.PatientService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PatientServiceImpl implements PatientService {

    private final PatientRepository<Patient> PatientRepository;

    @Override
    public PatientDTO createPatient(Patient Patient) {
        return PatientDTOMapper.fromPatient(PatientRepository.create(Patient));
    }

    @Override
    public List<Patient> getPatients() {
        return PatientRepository.getAllPatients();
    }
}
