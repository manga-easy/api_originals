package com.mangaeasy.originals.repository

import com.mangaeasy.originals.domain.Authorship
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface AuthorshipRepository: JpaRepository<Authorship, Long>