package com.yycoder.blog.dao;

import com.yycoder.blog.entity.TbCategory;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface TbCategoryMapper extends BaseMapper<TbCategory>{
    List<TbCategory> selectAll();
}