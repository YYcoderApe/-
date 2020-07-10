package com.yycoder.blog.service;

import com.yycoder.blog.vo.BlogDetailVo;

import java.util.List;

public interface TbBlogService {
    List<BlogDetailVo> queryAllBlogByTitle(String keyWord);

    List<BlogDetailVo> queryAllBlog();
}


