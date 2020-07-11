package com.yycoder.blog.service;

import com.yycoder.blog.entity.TbBlogtag;
import org.springframework.stereotype.Service;

@Service
public interface TbBlogtagService {
    Integer addBlogTag(TbBlogtag tbBlogtag);

    //删除指定blogID的关联
    Integer deleteBlogTag(Integer blogId);
}
