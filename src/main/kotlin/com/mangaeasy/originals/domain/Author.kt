package com.mangaeasy.originals.domain

import jakarta.persistence.*
import java.io.Serializable

@Table(name = "author")
@Entity
class Author(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    var id: Long? = null,
    var name: String
    var createdAt: String
    var updatedAt: String
) : Serializable
