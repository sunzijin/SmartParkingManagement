package com.smart.module.car.util;

public class LoginValidate {
    /**
     * 判断原始密码与密码进行比较
     * @param orginal
     * @param secret
     * @return
     */
    public static final boolean validate(String orginal,String secret){
        if (secret == null) {
            return false;
        }

        try{
            return secret.equals(EncryptUtil.encryptSHA256((orginal)));
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
