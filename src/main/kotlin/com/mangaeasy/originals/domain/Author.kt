package com.mangaeasy.originals.domain

import jakarta.persistence.Entity
import jakarta.persistence.GeneratedValue
import jakarta.persistence.GenerationType
import jakarta.persistence.Id
import java.io.Serializable

@Entity
data class Author(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int,
    var name: String? = null,
    var createdAt: String? = null,
    var updatedAt: String? = null
) : Serializable
