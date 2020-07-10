package com.yycoder.blog.dao;

import com.yycoder.blog.entity.TbBlog;
import com.yycoder.blog.vo.BlogDetailVo;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface TbBlogMapper extends BaseMapper<TbBlog> {

//    int updateByPrimaryKeyWithBLOBs(TbBlog record);
//
//    BlogDetailVo queryBlogById(Integer id);
//
    List<BlogDetailVo> queryAllBlog();

    List<BlogDetailVo> queryAllBlogByTitle(String keyWord);
//
//    List<BlogDetailVo> queryAllBlogByTypeId(int blogTypeid);
}