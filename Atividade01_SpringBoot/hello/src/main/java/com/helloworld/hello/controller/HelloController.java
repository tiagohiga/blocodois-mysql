package com.helloworld.hello.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/exercicios")
public class HelloController {
	
	@GetMapping("/exUm")
	public String exercicioUm() {
		return "Durante essa atividade apliquei, principalmente, a "
				+ "mentalidade de Persistência e a habilidade de Atenção aos Detalhes";
	}
	
	@GetMapping("exDois")
	public String exercicioDois() {
		return "Durante essa semana pretendo aprender mais sobre o desenvolvimento utilizando spring boot";
	}
}
