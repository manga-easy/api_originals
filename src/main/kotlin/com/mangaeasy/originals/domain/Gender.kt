package com.mangaeasy.originals.domain

import jakarta.persistence.*
import java.util.*
@Table(name = "gender")
@Entity
data class Gender (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int?,
    @Column(nullable = false)
    val title: String,
    val createdAt: Date = Date(),
    var updatedAt: Date = Date(),
)