package com.yycoder.blog.dao;

import com.yycoder.blog.entity.TbComment;
import com.yycoder.blog.vo.CommentsVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface TbCommentMapper extends BaseMapper<TbComment>{

//    List<CommentsVo> getCommentsVoList();
//
  List<CommentsVo> getCommentsList(@Param("blogId") int blogId);

    Integer getCommentCount(@Param("blogId") Integer blogId);


}