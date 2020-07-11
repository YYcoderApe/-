package com.yycoder.blog.service;

import com.yycoder.blog.entity.TbBlog;
import com.yycoder.blog.vo.BlogDetailVo;

import java.util.List;

public interface TbBlogService {
    List<BlogDetailVo> queryAllBlogByTitle(String keyWord);

    List<BlogDetailVo> queryAllBlog();

    List<BlogDetailVo> queryAllBlogByTypeId(Integer typeId);

    TbBlog queryBlog(Integer id);

    BlogDetailVo queryBlogById(Integer blogId);

    Integer updateBlog(TbBlog tbBlog);

    Integer addBlog(TbBlog tbBlog);

    Integer deleteBlog(Integer id);
}



