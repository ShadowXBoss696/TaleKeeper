package org.talekeeper.dao.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import org.talekeeper.dao.entity.JournalEntity;

@Repository
public interface JournalRepository extends PagingAndSortingRepository<JournalEntity, Integer> {
}
