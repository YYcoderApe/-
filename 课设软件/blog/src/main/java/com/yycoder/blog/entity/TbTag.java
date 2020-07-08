package com.yycoder.blog.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class TbTag {
    private Integer tagId;

    private String tagName;

    private Integer tagState;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date tagTime;

    public Integer getTagId() {
        return tagId;
    }

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName == null ? null : tagName.trim();
    }

    public Integer getTagState() {
        return tagState;
    }

    public void setTagState(Integer tagState) {
        this.tagState = tagState;
    }

    public Date getTagTime() {
        return tagTime;
    }

    public void setTagTime(Date tagTime) {
        this.tagTime = tagTime;
    }
}