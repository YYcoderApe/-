package com.yycoder.blog.entity;

public class TbBlogger {
    private Integer bloggerId;

    private String bloggerName;

    private String bloggerPassword;

    private String bloggerIntrouductin;

    private String bloggerEmail;

    private String bloggerNickname;

    private String bloggerPhone;

    public Integer getBloggerId() {
        return bloggerId;
    }

    public void setBloggerId(Integer bloggerId) {
        this.bloggerId = bloggerId;
    }

    public String getBloggerName() {
        return bloggerName;
    }

    public void setBloggerName(String bloggerName) {
        this.bloggerName = bloggerName == null ? null : bloggerName.trim();
    }

    public String getBloggerPassword() {
        return bloggerPassword;
    }

    public void setBloggerPassword(String bloggerPassword) {
        this.bloggerPassword = bloggerPassword == null ? null : bloggerPassword.trim();
    }

    public String getBloggerIntrouductin() {
        return bloggerIntrouductin;
    }

    public void setBloggerIntrouductin(String bloggerIntrouductin) {
        this.bloggerIntrouductin = bloggerIntrouductin == null ? null : bloggerIntrouductin.trim();
    }

    public String getBloggerEmail() {
        return bloggerEmail;
    }

    public void setBloggerEmail(String bloggerEmail) {
        this.bloggerEmail = bloggerEmail == null ? null : bloggerEmail.trim();
    }

    public String getBloggerNickname() {
        return bloggerNickname;
    }

    public void setBloggerNickname(String bloggerNickname) {
        this.bloggerNickname = bloggerNickname == null ? null : bloggerNickname.trim();
    }

    public String getBloggerPhone() {
        return bloggerPhone;
    }

    public void setBloggerPhone(String bloggerPhone) {
        this.bloggerPhone = bloggerPhone == null ? null : bloggerPhone.trim();
    }

    @Override
    public String toString() {
        return "TbBlogger{" +
                "bloggerId=" + bloggerId +
                ", bloggerName='" + bloggerName + '\'' +
                ", bloggerPassword='" + bloggerPassword + '\'' +
                ", bloggerIntrouductin='" + bloggerIntrouductin + '\'' +
                ", bloggerEmail='" + bloggerEmail + '\'' +
                ", bloggerNickname='" + bloggerNickname + '\'' +
                ", bloggerPhone='" + bloggerPhone + '\'' +
                '}';
    }
}