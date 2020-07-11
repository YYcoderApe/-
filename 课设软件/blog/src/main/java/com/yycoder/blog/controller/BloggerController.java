package com.yycoder.blog.controller;

import com.yycoder.blog.entity.TbBlogger;
import com.yycoder.blog.service.TbBloggerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/blogger")
public class BloggerController {
    @Autowired(required = false)
    private TbBloggerService tbBloggerService;

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/login")
    public String login(HttpSession session,
                        @RequestParam String bloggerName,
                        @RequestParam String bloggerPassword) {
        System.out.println(bloggerName + " " + bloggerPassword);
        TbBlogger tbBlogger = tbBloggerService.login(bloggerName, bloggerPassword);
        if (tbBlogger == null) {
            return "redirect:blogger/login";

        }
        session.setAttribute("blogger", tbBlogger);
        return "background";
    }

    @RequestMapping("/quit")
    public String quit(HttpSession session){
        session.setAttribute("blogger",null);
        return "redirect:/blogger/toLogin";
    }
}
