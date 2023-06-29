package com.mangaeasy.originals.controllers

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

    @GetMapping("/{id}")
    fun getAuthorshipById(@PathVariable id: Long): ResponseEntity<Authorship> {
        val authorship = authorshipRepository.findById(id)
        return if (authorship.isPresent) ResponseEntity.ok(authorship.get())
        else ResponseEntity.notFound().build()
    }

    @PostMapping
    fun createAuthorship(@RequestBody authorship: Authorship): ResponseEntity<Authorship> {
        // Update the authorships collection in the associated Author
        authorship.author.authorships.add(authorship)

        val savedAuthorship = authorshipRepository.save(authorship)
        return ResponseEntity(savedAuthorship, HttpStatus.CREATED)
    }

    @PutMapping("/{id}")
    fun updateAuthorship(@PathVariable id: Long, @RequestBody authorship: Authorship): ResponseEntity<Authorship> {
        val authorshipToUpdate = authorshipRepository.findById(id)
        return if (authorshipToUpdate.isPresent) {
            val updatedAuthorship = authorship.copy(id = id)
            authorshipRepository.save(updatedAuthorship)
            ResponseEntity(updatedAuthorship, HttpStatus.OK)
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @DeleteMapping("/{id}")
    fun deleteAuthorship(@PathVariable id: Long): ResponseEntity<Unit> {
        val authorshipToDelete = authorshipRepository.findById(id)
        return if (authorshipToDelete.isPresent) {
            val authorship = authorshipToDelete.get()
            // Remove the authorship from the associated Author's collection
            authorship.author.authorships.remove(authorship)

            authorshipRepository.delete(authorship)
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
