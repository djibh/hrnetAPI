package com.jiera.hrnetAPI.repository.Implementation;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.jiera.hrnetAPI.domain.Patient;
import com.jiera.hrnetAPI.query.PatientQuery;
import com.jiera.hrnetAPI.repository.PatientRepository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PatientRepositoryImpl implements PatientRepository<Patient> {
    private final NamedParameterJdbcTemplate jdbc;

    @Override
    public Patient create(Patient Patient) {
        try {
            // Insert user in database
            KeyHolder holder = new GeneratedKeyHolder();
            SqlParameterSource parameters = getSqlParameterSource(Patient);
            jdbc.update(PatientQuery.INSERT_PATIENT_QUERY, parameters, holder);
            Patient.setId(holder.getKey().longValue());
            return Patient;
        } catch (Exception exception) {
            throw exception;
        }
    }

    @Override
    public List<Patient> getAllPatients() {
        return jdbc.query(PatientQuery.GET_ALL_PATIENTS_QUERY, new BeanPropertyRowMapper<>(Patient.class));
    }

    private SqlParameterSource getSqlParameterSource(Patient Patient) {
        return new MapSqlParameterSource()
                .addValue("firstName", Patient.getFirstName())
                .addValue("lastName", Patient.getLastName())
                .addValue("department", Patient.getDepartment())
                .addValue("address", Patient.getAddress())
                .addValue("postalCode", Patient.getPostalCode())
                .addValue("city", Patient.getCity())
                .addValue("admissionDate", Patient.getAdmissionDate())
                .addValue("birthDate", Patient.getBirthDate());
    }
}
