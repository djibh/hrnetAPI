package com.jiera.klepiosAPI.dtomapper;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import com.jiera.klepiosAPI.domain.Patient;
import com.jiera.klepiosAPI.dto.PatientDTO;

@Component
public class PatientDTOMapper {
    public static PatientDTO fromPatient(Patient Patient) {
        PatientDTO PatientDTO = new PatientDTO();
        BeanUtils.copyProperties(Patient, PatientDTO);
        return PatientDTO;
    }

    public static Patient toPatient(PatientDTO PatientDTO) {
        Patient Patient = new Patient();
        BeanUtils.copyProperties(PatientDTO, Patient);
        return Patient;
    }
}
