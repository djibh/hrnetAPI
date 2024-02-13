package com.jiera.klepiosAPI.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jiera.klepiosAPI.domain.AppUser;

@Repository
public interface AppUserRepository extends JpaRepository<AppUser, Integer> {

    public AppUser findByUsername(String username);

}
