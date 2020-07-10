package com.yycoder.blog.vo;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
public class CommentsVo {
    private Integer commentId;

    private Integer blogId;

    private String blogTitle;

    private String userName;

    private Integer userId;

    private String userEmail;

    private String commentContent;

    private Date commentTime;

    @Override
    public String toString() {
        return "CommentsVo{" +
                "commentId=" + commentId +
                ", blogId=" + blogId +
                ", blogTitle='" + blogTitle + '\'' +
                ", userName='" + userName + '\'' +
                ", userId=" + userId +
                ", userEmail='" + userEmail + '\'' +
                ", commentContent='" + commentContent + '\'' +
                ", commentTime=" + commentTime +
                '}';
    }
}
