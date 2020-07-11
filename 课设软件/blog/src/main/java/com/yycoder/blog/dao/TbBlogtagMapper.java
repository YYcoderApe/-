package com.yycoder.blog.dao;

import com.yycoder.blog.entity.TbBlogtag;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface TbBlogtagMapper extends BaseMapper<TbBlogtag>{
    Integer deleteBlogtagByBolgId(Integer blogId);

//
//    List<TbBlogtag> queryAllTagByBlogId(int blogId);
}