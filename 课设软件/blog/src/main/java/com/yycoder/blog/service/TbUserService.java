package com.yycoder.blog.service;

import com.yycoder.blog.entity.TbUser;

public interface TbUserService {
    ////登录验证
    TbUser login(String name, String password);

    //注册
    Integer regist(TbUser tbUser);
}
