package com.yycoder.blog.service;

import com.yycoder.blog.vo.CommentsVo;

import java.util.List;

public interface TbCommentService {
    Integer getCommentCount(Integer blogId);

    List<CommentsVo> getCommentsList(Integer blogId);
}
