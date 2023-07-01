package com.mangaeasy.originals.controllers

import com.mangaeasy.originals.controllers.dtos.AuthorshipDto
import com.mangaeasy.originals.domain.Authorship
import com.mangaeasy.originals.repository.AuthorRepository
import com.mangaeasy.originals.repository.AuthorshipRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/authorships")
class AuthorshipController {

    @Autowired
    lateinit var authorshipRepository: AuthorshipRepository
    @Autowired
    lateinit var authorRepository: AuthorRepository

    @GetMapping("/{id}")
    fun getAuthorshipById(@PathVariable id: Int): ResponseEntity<Authorship> {
        val authorship = authorshipRepository.findById(id)
        return if (authorship.isPresent) ResponseEntity.ok(authorship.get())
        else ResponseEntity.notFound().build()
    }

    @PostMapping
    fun createAuthorship(@RequestBody authorshipDto: AuthorshipDto): ResponseEntity<Authorship> {
        val author = authorRepository.getById(authorshipDto.author)
        val authorship = Authorship(
            author = author,
            title = authorshipDto.title,
            status = authorshipDto.status,
            synopsis = authorshipDto.synopsis
            )
        val savedAuthorship = authorshipRepository.save(authorship)
        return ResponseEntity(savedAuthorship, HttpStatus.CREATED)
    }

    @PutMapping("/{id}")
    fun updateAuthorship(@PathVariable id: Int, @RequestBody authorshipDto: AuthorshipDto): ResponseEntity<Authorship> {
        val authorship = authorshipRepository.findById(id)
        return if (authorship.isPresent) {
            val updatedAuthorship = authorship.get().copy(
                title = authorshipDto.title,
                synopsis = authorshipDto.synopsis,
                genre = authorshipDto.genre,
                status = authorshipDto.status
            )
            authorshipRepository.save(updatedAuthorship)
            ResponseEntity(updatedAuthorship, HttpStatus.OK)
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @DeleteMapping("/{id}")
    fun deleteAuthorship(@PathVariable id: Int): ResponseEntity<Unit> {
        val authorshipToDelete = authorshipRepository.findById(id)
        return if (authorshipToDelete.isPresent) {
            authorshipRepository.delete(authorshipToDelete.get())
            ResponseEntity.noContent().build()
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @GetMapping
    fun getAllAuthorships(): ResponseEntity<List<Authorship>> {
        val authorships = authorshipRepository.findAll()
        return ResponseEntity(authorships, HttpStatus.OK)
    }
}
