package com.yycoder.blog.vo;

import com.yycoder.blog.entity.TbTag;
import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Data
@ToString
public class BlogDetailVo {
    private Integer blogId;

    private String blogTitle;

    private Integer blogCount;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date blogTime;

    private String categoryName;

    private List<TbTag> tagList;

    private String blogContent;


    @Override
    public String toString() {
        return "BlogDetailVo{" +
                "blogId=" + blogId +
                ", blogTitle='" + blogTitle + '\'' +
                ", blogCount=" + blogCount +
                ", blogTime=" + blogTime +
                ", categoryName='" + categoryName + '\'' +
                ", tagList=" + tagList +
                ", blogContent='" + blogContent + '\'' +
                '}';
    }
}
