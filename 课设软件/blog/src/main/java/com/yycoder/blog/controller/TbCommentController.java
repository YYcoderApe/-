package com.yycoder.blog.controller;

import com.yycoder.blog.service.TbCommentService;
import com.yycoder.blog.vo.CommentsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class TbCommentController {
    @Autowired
    private TbCommentService tbCommentService;

    @RequestMapping("/toCommentManger")
    public String toCommentManger(Model model){
        List<CommentsVo> commentsVoList = tbCommentService.getCommentsVoList();
        model.addAttribute("commentsVoList",commentsVoList);
        System.out.println(commentsVoList.get(0));
        System.out.println(commentsVoList.get(1));
        return "commentManger";
    }

    @RequestMapping("/delComment/{id}")
    public String delComment(@PathVariable("id") Integer id){
        tbCommentService.deleteComment(id);

        return "redirect:/toCommentManger";
    }

}

