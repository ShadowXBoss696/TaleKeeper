package org.talekeeper.model;

import org.talekeeper.dao.entity.JournalEntity;

import java.time.LocalDateTime;

public class Journal {

    private Integer id;
    private LocalDateTime dateOfEntry;
    private String contentPreview;

    public Journal() {

    }

    public Journal(LocalDateTime dateOfEntry, String contentPreview) {
        this.dateOfEntry = dateOfEntry;
        this.contentPreview = contentPreview;
    }

    public Journal(JournalEntity entity) {
        this.id = entity.getId();
        this.dateOfEntry = entity.getDateOfEntry();
        this.contentPreview = entity.getContentPreview();
    }

    public static Journal convert(JournalEntity entity) {
        return new Journal(entity);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDateTime getDateOfEntry() {
        return dateOfEntry;
    }

    public void setDateOfEntry(LocalDateTime dateOfEntry) {
        this.dateOfEntry = dateOfEntry;
    }

    public String getContentPreview() {
        return contentPreview;
    }

    public void setContentPreview(String contentPreview) {
        this.contentPreview = contentPreview;
    }

    @Override
    public String toString() {
        return "Journal{" + "id=" + id + ", dateOfEntry=" + dateOfEntry + ", contentPreview='" + contentPreview + '\'' + '}';
    }
}
