package com.mangaeasy.originals.domain

import com.mangaeasy.originals.domain.enums.WorkStatusEnum
import jakarta.persistence.*
import org.hibernate.Hibernate
import java.io.Serializable
import java.util.Date

@Table(name = "authorships")
@Entity
data class Authorship(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    val id: Long? = null,

    @Column(name = "title", nullable = false)
    val title: String? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    val author: Author,

    var genre: List<String> = emptyList(),
    var synopse: String? = "",

    var status: Enum<WorkStatusEnum> = WorkStatusEnum.ONGOING,
    val createdAt: Date = Date(),
    var updatedAt: Date? = null,
) : Serializable {

    @Override
    override fun toString(): String {
        return this::class.simpleName + "(id = $id , title = $title )"
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other == null || Hibernate.getClass(this) != Hibernate.getClass(other)) return false
        other as Authorship

        return id != null && id == other.id
    }

    override fun hashCode(): Int = javaClass.hashCode()
}