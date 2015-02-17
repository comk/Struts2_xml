package com.comk.project.first.action;

import com.comk.project.first.utils.ErrorCode;
import com.comk.project.first.utils.ImageUtils;
import com.comk.project.first.utils.TextUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Random;

/**
 * Created by daihai on 2015/2/15.
 */
public class LoginAction extends ActionSupport{
    private InputStream message;
    private String username;
    private String userpwd;
    private int msg;
    private String verifyCode = "default";
    private String vcode;
    public void setVcode(String vcode){
        System.out.println("set vcode == ");
        this.vcode = vcode;
    }
    public String getVcode(){
        return vcode;
    }
    public String getVerifyCode()
    {
        System.out.println("get code ....  ------ ");
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

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

        try {
            message = new ByteArrayInputStream(String.valueOf(msg).getBytes("utf-8"));
        } catch (Exception ex) {

        }
        return "error";
    }


    public String getCode(){

        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String checkCode = ImageUtils.getInstance().getCheckCodeImage("ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789", 4, output);


        setVerifyCode(checkCode);

        this.message = new ByteArrayInputStream(output.toByteArray());
        try {
            output.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


        return SUCCESS;
    }



    public String doregister(){
        return SUCCESS;
    }

    public String dovalidateReg(){
        System.out.println("verifyCode ....  ------ " + verifyCode);
        System.out.println("getVcode ....  ------ " + getVcode());
        if(verifyCode.equals(getVcode())){
            if(TextUtils.isEmpty(getUsername())){
                msg = ErrorCode.ERROR_CODE_LOGIN_USERNAME_NOT_EXIST;
            }else if(TextUtils.isEmpty(getUserpwd())){
                msg = ErrorCode.ERROR_CODE_LOGIN_USERPWD_NOT_MATCH;
            }else{
                msg = -1;
            }
        }else{
            msg = ErrorCode.ERROR_CODE_REGISTER_VERIFY_CODE_ERROR;
        }
        try {
            this.message = new ByteArrayInputStream(String.valueOf(msg).getBytes("utf-8"));
        }catch (Exception ex){

        }

        return ERROR;
    }

}
