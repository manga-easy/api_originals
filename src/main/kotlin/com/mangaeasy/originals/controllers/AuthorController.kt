package com.mangaeasy.originals.controllers

import com.mangaeasy.originals.domain.Author
import com.mangaeasy.originals.repository.AuthorRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/authors")
class AuthorController {

    @Autowired
    lateinit var authorRepository: AuthorRepository

    @GetMapping("/{id}")
    fun getAuthorById(@PathVariable id: Long): ResponseEntity<Author> {
        val author = authorRepository.findById(id)
        return if (author.isPresent) ResponseEntity.ok(author.get())
        else ResponseEntity.notFound().build()
    }

    @PostMapping
    fun createAuthor(@RequestBody author: Author): ResponseEntity<Author> {
        val savedAuthor = authorRepository.save(author)
        return ResponseEntity(savedAuthor, HttpStatus.CREATED)
    }

    @PutMapping("/{id}")
    fun updateAuthor(@PathVariable id: Long, @RequestBody author: Author): ResponseEntity<Author> {
        val authorToUpdate = authorRepository.findById(id)
        return if (authorToUpdate.isPresent) {
            val updatedAuthor = author.copy(id = id)
            authorRepository.save(updatedAuthor)
            ResponseEntity(updatedAuthor, HttpStatus.OK)
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @DeleteMapping("/{id}")
    fun deleteAuthor(@PathVariable id: Long): ResponseEntity<Unit> {
        val authorToDelete = authorRepository.findById(id)
        return if (authorToDelete.isPresent) {
            authorRepository.delete(authorToDelete.get())
            ResponseEntity.noContent().build()
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @GetMapping
    fun getAllAuthors(): ResponseEntity<List<Author>> {
        val authors = authorRepository.findAll()
        return ResponseEntity(authors, HttpStatus.OK)
    }
}
