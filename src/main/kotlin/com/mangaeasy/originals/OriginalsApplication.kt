package com.mangaeasy.originals

import com.mangaeasy.originals.configs.Configs
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Import

@SpringBootApplication
@Import(Configs::class)
class OriginalsApplication

fun main(args: Array<String>) {
	runApplication<OriginalsApplication>(*args)
}