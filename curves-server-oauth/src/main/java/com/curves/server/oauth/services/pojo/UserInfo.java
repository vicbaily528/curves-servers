package com.curves.server.oauth.services.pojo;

import java.util.List;

public class UserInfo {
    List<SysRole> roleList;

    public List<SysRole> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<SysRole> roleList) {
        this.roleList = roleList;
    }
}
