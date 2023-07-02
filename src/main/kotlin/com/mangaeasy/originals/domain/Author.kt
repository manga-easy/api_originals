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
    val id: Int? = null,

    @Column(name = "name", nullable = false)
    val name: String? = null,

    @Column(name = "userId", nullable = false, unique = true)
    val userId: String? = null,

    @OneToMany(mappedBy = "author", cascade = [CascadeType.ALL], orphanRemoval = true)
    var authorships: MutableList<Authorship> = mutableListOf(),

    var updatedAt: Date? = Date(),
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