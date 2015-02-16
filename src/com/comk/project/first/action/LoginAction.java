package com.comk.project.first.action;

import com.comk.project.first.utils.ErrorCode;
import com.comk.project.first.utils.TextUtils;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

/**
 * Created by daihai on 2015/2/15.
 */
public class LoginAction extends ActionSupport {
    private InputStream message;
    private String username;
    private String userpwd;
    private int msg;
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }

    public InputStream getMessage() {
        return message;
    }

    @Override
    public String execute() throws Exception {
        return super.execute();
    }

    /**
     * show login page
     * @return
     */
    public String dologin(){
        return SUCCESS;
    }

    /**
     * 验证用户名和密码
     * @return
     */
    public String dovalidate(){
        System.out.println(getUsername() + getUserpwd());

        if(TextUtils.isEmpty(getUsername())){
            msg = ErrorCode.ERROR_CODE_LOGIN_USERNAME_NOT_EXIST;
        }else if(TextUtils.isEmpty(getUserpwd())){
            msg = ErrorCode.ERROR_CODE_LOGIN_USERPWD_NOT_MATCH;
        }else{
            msg = -1;
        }

    if(msg >= 0) {
        try {
            message = new ByteArrayInputStream(String.valueOf(msg).getBytes("utf-8"));
        } catch (Exception ex) {

        }
        return "error";
    }else
        return SUCCESS;
    }


    public String doregister(){
        return null;
    }

    public String dovalidateReg(){
        return null;
    }

}
