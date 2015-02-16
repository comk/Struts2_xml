package com.comk.project.first.utils;

/**
 * Created by daihai on 2015/2/16.
 */
public class TextUtils {
    public static boolean isEmpty(String str){
        if(str == null)
            return true;
        if(str.trim().length() == 0)
            return true;
        return false;
    }
}
