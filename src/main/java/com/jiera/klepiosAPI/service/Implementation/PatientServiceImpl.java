package com.jiera.klepiosAPI.service.Implementation;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jiera.klepiosAPI.domain.Patient;
import com.jiera.klepiosAPI.dto.PatientDTO;
import com.jiera.klepiosAPI.dtomapper.PatientDTOMapper;
import com.jiera.klepiosAPI.repository.PatientRepository;
import com.jiera.klepiosAPI.service.PatientService;

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
