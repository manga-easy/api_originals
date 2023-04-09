package com.mangaeasy.originals.domain

import jakarta.persistence.*
import org.hibernate.Hibernate
import java.io.Serializable
import java.util.Date

@Table(name = "author")
@Entity
data class Author(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    val id: Long? = null,

    @Column(name = "name", nullable = false)
    val name: String? = null,

    @Column(name = "authorships")
    @OneToMany(mappedBy = "author")
    var authorships: List<Authorship>? = emptyList(),

    var updatedAt: Date? = null,
    var createdAt: Date = Date()
) : Serializable {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || Hibernate.getClass(this) != Hibernate.getClass(other)) return false
        other as Author

        return id != null && id == other.id
    }

    override fun hashCode(): Int = javaClass.hashCode()

    @Override
    override fun toString(): String {
        return this::class.simpleName + "(id = $id , name = $name )"
    }
}