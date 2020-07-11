package com.yycoder.blog.service;

import com.yycoder.blog.entity.TbTag;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TbTagService {
    List<TbTag> queryAllTag();

    List<TbTag> queryAllTagByBlogId(Integer blogId);

    Integer addTag(TbTag tag);

    TbTag queryById(Integer tag_id);

    Integer updateTag(TbTag tag);

    Integer deleteTagById(Integer id);
}
