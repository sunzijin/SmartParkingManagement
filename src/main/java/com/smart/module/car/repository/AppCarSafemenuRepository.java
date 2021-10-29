package com.smart.module.car.repository;

import com.smart.module.car.entity.AppCarSafemenu;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AppCarSafemenuRepository extends JpaRepository<AppCarSafemenu, Long> {

}