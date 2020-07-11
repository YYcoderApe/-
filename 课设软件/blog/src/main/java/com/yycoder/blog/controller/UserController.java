package com.yycoder.blog.controller;

import com.yycoder.blog.entity.TbUser;
import com.yycoder.blog.service.TbBlogService;
import com.yycoder.blog.service.TbCommentService;
import com.yycoder.blog.service.TbUserService;
import com.yycoder.blog.vo.BlogDetailVo;
import com.yycoder.blog.vo.CommentsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private TbBlogService tbBlogService;
    @Autowired
    private TbCommentService tbCommentService;
    @Autowired
    private TbUserService tbUserService;
    @RequestMapping("/toRegister")
    public String toRegister(Model model,@RequestParam Integer blogId) {
        model.addAttribute("blogId",blogId);
        return "userRegister";
    }
    @RequestMapping("/Register")
    public String Register(Model model,TbUser tbUser,@RequestParam Integer blogId) {
        tbUser.setUserId((int) (Math.random()*100));
        tbUserService.regist(tbUser);
        model.addAttribute("blogId",blogId);
        return "userLogin";
    }

    @RequestMapping("/toLogin")
    public String toLogin(Model model, @RequestParam Integer blogId) {
        System.out.println(blogId);
        model.addAttribute("blogId",blogId);
        return "userLogin";
    }

    @RequestMapping("/login")
    public String login(Model model,
                        @RequestParam String userName,
                        @RequestParam String userPassword,
                        @RequestParam Integer blogId) {
        TbUser tbUser = tbUserService.login(userName, userPassword);
        if (tbUser == null) {
            model.addAttribute("Msg","登录失败，账号密码错误");
            return "redirect:blogger/login";
        }
        model.addAttribute("Msg","登录成功");
        BlogDetailVo blog = tbBlogService.queryBlogById(blogId);
        model.addAttribute("blog",blog);
        List<CommentsVo> commentsList = tbCommentService.getCommentsList(blog.getBlogId());
        model.addAttribute("commentsList",commentsList);
        int count = tbCommentService.getCommentCount(blog.getBlogId());
        model.addAttribute("tbUser",tbUser);
        return "background";
    }

}
