package com.yycoder.blog.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class TbCategory {
    private Integer categoryId;

    private String categoryName;

    private Integer categoryState;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date categoryTime;

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public Integer getCategoryState() {
        return categoryState;
    }

    public void setCategoryState(Integer categoryState) {
        this.categoryState = categoryState;
    }

    public Date getCategoryTime() {
        return categoryTime;
    }

    public void setCategoryTime(Date categoryTime) {
        this.categoryTime = categoryTime;
    }
}