package com.yycoder.blog.dao;


import org.springframework.stereotype.Component;

@Component
public interface BaseMapper<T> {
    int deleteByPrimaryKey(Integer id);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(Integer Id);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);
}
