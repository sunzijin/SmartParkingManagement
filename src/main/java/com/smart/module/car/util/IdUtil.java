package com.smart.module.car.util;

public class IdUtil {

    private static SnowFlake snowFlake;

    public static Long nextId(){
       if(snowFlake == null){
           snowFlake= new SnowFlake(1,1);
       }
       return snowFlake.nextId();
    }
}
