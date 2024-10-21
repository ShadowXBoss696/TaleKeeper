package org.talekeeper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.talekeeper.dao.entity.JournalEntity;
import org.talekeeper.dao.repository.JournalRepository;

@SpringBootApplication
@EnableTransactionManagement
public class ServerApplication {

	@Autowired
	private JournalRepository journalRepository;

	public static void main(String[] args) {
		SpringApplication.run(ServerApplication.class, args);
	}

	@Bean
	public CommandLineRunner testScript() {
		return args -> {
			PageRequest pageCriteria = PageRequest.of(0, 100);
			Page<JournalEntity> page = journalRepository.findAll(pageCriteria);
			System.out.println(page.getTotalElements());
			System.out.println(page.getContent().size());
			System.exit(0);
		};
	}
}
