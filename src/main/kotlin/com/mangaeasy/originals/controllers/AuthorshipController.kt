package com.mangaeasy.originals.controllers

import com.mangaeasy.originals.domain.Authorship
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
    fun getWorkById(@PathVariable id: Long): ResponseEntity<Authorship> {
        val work = authorshipRepository.findById(id)
        return if (work.isPresent) ResponseEntity.ok(work.get())
        else ResponseEntity.notFound().build()
    }

    @PostMapping
    fun createWork(@RequestBody authorship: Authorship): ResponseEntity<Authorship> {
        val savedWork = authorshipRepository.save(authorship)
        return ResponseEntity(savedWork, HttpStatus.CREATED)
    }

    @PutMapping("/{id}")
    fun updateWork(@PathVariable id: Long, @RequestBody authorship: Authorship): ResponseEntity<Authorship> {
        val workToUpdate = authorshipRepository.findById(id)
        return if (workToUpdate.isPresent) {
            val updatedWork = authorship.copy(id = id)
            authorshipRepository.save(updatedWork)
            ResponseEntity(updatedWork, HttpStatus.OK)
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @DeleteMapping("/{id}")
    fun deleteWork(@PathVariable id: Long): ResponseEntity<Unit> {
        val workToDelete = authorshipRepository.findById(id)
        return if (workToDelete.isPresent) {
            authorshipRepository.delete(workToDelete.get())
            ResponseEntity.noContent().build()
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @GetMapping
    fun getAllWorks(): ResponseEntity<List<Authorship>> {
        val works = authorshipRepository.findAll()
        return ResponseEntity(works, HttpStatus.OK)
    }
}
