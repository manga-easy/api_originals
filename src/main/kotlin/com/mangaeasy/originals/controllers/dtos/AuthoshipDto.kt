package com.mangaeasy.originals.controllers.dtos
import com.mangaeasy.originals.domain.enums.WorkStatusEnum

data class AuthorshipDto (
    val title: String,
    val author: Long,
    var genre: List<String> = emptyList(),
    var synopsis: String,
    var status: WorkStatusEnum
)