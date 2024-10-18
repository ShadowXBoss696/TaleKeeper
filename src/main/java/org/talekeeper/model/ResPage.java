package org.talekeeper.model;

import org.springframework.data.domain.Page;

import java.util.List;

public class ResPage<T> {

    private List<T> data;
    private int currentPage;
    private int pageSize;
    private long totalCount;
    private int totalPages;

    public ResPage() {

    }

    public ResPage(List<T> data, int currentPage, int pageSize, long totalCount, int totalPages) {
        this.data = data;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.totalPages = totalPages;
    }

    public ResPage(Page<T> pagedResult) {
        this.data = pagedResult.getContent();
        this.currentPage = pagedResult.getPageable().getPageNumber();
        this.pageSize = pagedResult.getSize();
        this.totalCount = pagedResult.getTotalElements();
        this.totalPages = pagedResult.getTotalPages();
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }
}
