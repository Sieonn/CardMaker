package com.ureca.card;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ureca.card.dao")
public class CardMakerApplication {

	public static void main(String[] args) {
		SpringApplication.run(CardMakerApplication.class, args);
	}

}
