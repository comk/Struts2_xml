package com.comk.project.first.action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by daihai on 2015/2/16.
 */
public class UserInfoAction extends ActionSupport {
    private String userid;

    public String getUserInfo(){
        return SUCCESS;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }
}
