package com.yycoder.blog.dao;

import com.yycoder.blog.entity.TbTag;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface TbTagMapper extends BaseMapper<TbTag>{

//    List<TbTag> queryAllTag();

    List<TbTag> queryAllTagByBlogId(@Param("blogId") int blogId);
}