package com.curves.server.oauth.services.service;

import com.curves.server.oauth.services.pojo.UserInfo;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl implements IUserInfoService {
    @Override
    public UserInfo findByUsername(String userName) {
        return null;
    }
}
