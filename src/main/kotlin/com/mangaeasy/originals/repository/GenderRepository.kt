package com.mangaeasy.originals.repository

import com.mangaeasy.originals.domain.Gender
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface GenderRepository: JpaRepository<Gender, Int>