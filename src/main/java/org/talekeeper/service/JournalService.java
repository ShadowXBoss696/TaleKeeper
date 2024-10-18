package org.talekeeper.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.talekeeper.dao.entity.JournalEntity;
import org.talekeeper.dao.repository.JournalRepository;
import org.talekeeper.model.Journal;

@Service
public class JournalService {

    private final JournalRepository journalRepository;

    public JournalService(JournalRepository journalRepository) {
        this.journalRepository = journalRepository;
    }

    public Page<Journal> listAllEntries(Integer pageNumber, Integer pageSize) {
        PageRequest pageCriteria = PageRequest.of(pageNumber, pageSize);
        Page<JournalEntity> page = journalRepository.findAll(pageCriteria);
        return page.map(Journal::new);
    }
}
