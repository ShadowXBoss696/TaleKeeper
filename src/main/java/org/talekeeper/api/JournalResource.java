package org.talekeeper.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.talekeeper.model.Journal;
import org.talekeeper.service.JournalService;

@RestController
@RequestMapping("journal")
public class JournalResource {

    private final JournalService journalService;

    public JournalResource(JournalService journalService) {
        this.journalService = journalService;
    }

    @GetMapping
    public Page<Journal> listAllJournals(
            @RequestParam(name = "page", defaultValue = "1") Integer pageNumber,
            @RequestParam(name = "limit", defaultValue = "10") Integer pageSize
    ) {
        return journalService.listAllEntries(pageNumber, pageSize);
    }


}
