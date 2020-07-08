package com.yycoder.blog.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class TbBlog {
    private Integer blogId;

    private String blogTitle;

    private Integer blogCount;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date blogTime;

    private Integer blogTypeid;

    private String blogContent;

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle == null ? null : blogTitle.trim();
    }

    public Integer getBlogCount() {
        return blogCount;
    }

    public void setBlogCount(Integer blogCount) {
        this.blogCount = blogCount;
    }

    public Date getBlogTime() {
        return blogTime;
    }

    public void setBlogTime(Date blogTime) {
        this.blogTime = blogTime;
    }

    public Integer getBlogTypeid() {
        return blogTypeid;
    }

    public void setBlogTypeid(Integer blogTypeid) {
        this.blogTypeid = blogTypeid;
    }

    public String getBlogContent() {
        return blogContent;
    }

    public void setBlogContent(String blogContent) {
        this.blogContent = blogContent == null ? null : blogContent.trim();
    }
}