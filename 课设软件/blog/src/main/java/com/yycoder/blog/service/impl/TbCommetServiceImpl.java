package com.yycoder.blog.service.impl;

import com.yycoder.blog.dao.TbCommentMapper;
import com.yycoder.blog.entity.TbComment;
import com.yycoder.blog.service.TbCommentService;
import com.yycoder.blog.vo.CommentsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbCommetServiceImpl implements TbCommentService {
    @Autowired
    private TbCommentMapper tbCommentMapper;
    @Override
    public Integer getCommentCount(Integer blogId) {
        return tbCommentMapper.getCommentCount(blogId);
    }

    @Override
    public List<CommentsVo> getCommentsList(Integer blogId) {
        return tbCommentMapper.getCommentsList(blogId);
    }

    @Override
    public Integer addComment(TbComment tbComment) {
        return tbCommentMapper.insert(tbComment);
    }
    @Override
    public List<CommentsVo> getCommentsVoList() {
        return tbCommentMapper.getCommentsVoList();

    }

    @Override
    public Integer deleteComment(Integer CommentId) {
        return tbCommentMapper.deleteByPrimaryKey(CommentId);
    }
}
