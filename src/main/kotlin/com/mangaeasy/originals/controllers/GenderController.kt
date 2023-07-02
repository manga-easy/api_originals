package com.mangaeasy.originals.controllers

import com.mangaeasy.originals.controllers.dtos.GenderDto
import com.mangaeasy.originals.domain.Authorship
import com.mangaeasy.originals.domain.Gender
import com.mangaeasy.originals.repository.GenderRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import java.util.Date

@RestController
@RequestMapping("/genders")
class GenderController {

    @Autowired
    lateinit var genderRepository: GenderRepository

    @GetMapping("/{id}")
    fun getById(@PathVariable id: Int): ResponseEntity<Gender> {
        val gender = genderRepository.findById(id)
        return if (gender.isPresent) ResponseEntity.ok(gender.get())
        else ResponseEntity.notFound().build()
    }

    @PostMapping
    fun create(@RequestBody genderDto: GenderDto): ResponseEntity<Gender> {
        val gender = Gender( null, genderDto.title)
        val saved = genderRepository.save(gender)
        return ResponseEntity(saved, HttpStatus.CREATED)
    }

    @PutMapping("/{id}")
    fun update(@PathVariable id: Int, @RequestBody genderDto: GenderDto): ResponseEntity<Gender> {
        val gender = genderRepository.findById(id)
        return if (gender.isPresent) {
            val updated = gender.get().copy(
                title = genderDto.title,
                updatedAt = Date()
            )
            genderRepository.save(updated)
            ResponseEntity(updated, HttpStatus.OK)
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @DeleteMapping("/{id}")
    fun delete(@PathVariable id: Int): ResponseEntity<Unit> {
        val genderDelete = genderRepository.findById(id)
        return if (genderDelete.isPresent) {
            genderRepository.delete(genderDelete.get())
            ResponseEntity.noContent().build()
        } else {
            ResponseEntity.notFound().build()
        }
    }

    @GetMapping
    fun getAll(): ResponseEntity<List<Gender>> {
        val genders = genderRepository.findAll()
        return ResponseEntity(genders, HttpStatus.OK)
    }
}
