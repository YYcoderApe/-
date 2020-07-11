package com.yycoder.blog.service.impl;

import com.yycoder.blog.dao.TbUserMapper;
import com.yycoder.blog.entity.TbUser;
import com.yycoder.blog.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TbUserServiceImpl implements TbUserService {
    @Autowired
    private TbUserMapper tbUserMapper;

    @Override
    public TbUser login(String userName, String userPassword) {
        TbUser tbUser = tbUserMapper.userLogin(userName);
        if(tbUser!=null &&(tbUser.getUserPwd().equals(userPassword))){
            return tbUser;
        }
        return null;

    }

    @Override
    public Integer regist(TbUser tbUser) {
        return tbUserMapper.insert(tbUser);
    }
}
