package com.yycoder.blog.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class TbBlogtag {
    private Integer id;

    private Integer blogId;

    private Integer tagId;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date blogTagTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public Integer getTagId() {
        return tagId;
    }

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }

    public Date getBlogTagTime() {
        return blogTagTime;
    }

    public void setBlogTagTime(Date blogTagTime) {
        this.blogTagTime = blogTagTime;
    }

    @Override
    public String toString() {
        return "TbBlogtag{" +
                "id=" + id +
                ", blogId=" + blogId +
                ", tagId=" + tagId +
                ", blogTagTime=" + blogTagTime +
                '}';
    }
}