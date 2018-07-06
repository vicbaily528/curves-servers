package com.curves.server.oauth.services.service;

import com.curves.server.oauth.services.pojo.UserInfo;

/**
 * @author vic
 */
public interface IUserInfoService {

    UserInfo findByUsername(String userName);
}
