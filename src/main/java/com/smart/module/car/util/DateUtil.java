package com.smart.module.car.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil {
    private static String defaultDatePattern = "yyyy-MM-dd";

    /**
     * 获得默认的 date pattern
     */
    public static String getDatePattern() {
        return defaultDatePattern;
    }

    /**
     * 返回预设Format的当前日期字符串
     */
    public static String getToday() {
        Date today = new Date();
        return format(today);
    }

    /**
     * 使用预设Format格式化Date成字符串
     */
    public static String format(Date date) {
        return date == null ? " " : format(date, getDatePattern());
    }

    /**
     * 使用参数Format格式化Date成字符串
     */
    public static String format(Date date, String pattern) {
        return date == null ? " " : new SimpleDateFormat(pattern).format(date);
    }

    /**
     * 使用预设格式将字符串转为Date
     */
    public static Date getDate(String dateStr) throws ParseException {
        if(dateStr != null){
            return getDate(dateStr,getDatePattern());
        }else{
            return new Date();
        }
    }

    /**
     * 获得下一个日期
     * @param dateStr
     * @return
     */
    public static Date getNextDate(String dateStr) throws ParseException {
        if(dateStr != null){
            Date date = getDate(dateStr,getDatePattern());
            Calendar   calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(calendar.DATE,1);
            return calendar.getTime();
        }else{
            return null;
        }
    }
    /**
     * 获得下一个日期
     * @param dateStr
     * @return
     */
    public static Date getPreDate(String dateStr) throws ParseException {
        if(dateStr != null){
            Date date = getDate(dateStr,getDatePattern());
            Calendar   calendar = new GregorianCalendar();
            calendar.setTime(date);
            calendar.add(calendar.DATE,-1);
            return date;
        }else{
            return null;
        }
    }

    /**
     * 使用参数Format将字符串转为Date
     */
    public static Date getDate(String dateStr, String pattern)
            throws ParseException {
        if(dateStr != null){
            return new SimpleDateFormat(pattern).parse(dateStr);
        }else{
            return new Date();
        }
    }

    /**
     * 在日期上增加数个整月
     */
    public static Date addMonth(Date date, int n) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, n);
        return cal.getTime();
    }

    public static Date getDate(String year, String month, String day)
            throws ParseException {
        String result = year + "- "
                + (month.length() == 1 ? ("0 " + month) : month) + "- "
                + (day.length() == 1 ? ("0 " + day) : day);
        return getDate(result);
    }

    /**
     * 获得该月第一天
     * @return
     */
    public static Date getFirstDayOfMonth(String date) throws ParseException {
        Date temp = getDate(date,"yyyy-MM-dd");;
        Calendar cal = Calendar.getInstance();
        cal.setTime(temp);
        //获取某月最小天数
        int firstDay = cal.getActualMinimum(Calendar.DAY_OF_MONTH);
        //设置日历中月份的最小天数
        cal.set(Calendar.DAY_OF_MONTH, firstDay);
        return cal.getTime();
    }

    /**
     * 获得该月最后一天
     * @return
     */
    public static Date getLastDayOfMonth(String date) throws ParseException {
        Date temp = getDate(date,"yyyy-MM-dd");;
        Calendar cal = Calendar.getInstance();
        cal.setTime(temp);
        //获取某月最大天数
        int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        //设置日历中月份的最大天数
        cal.set(Calendar.DAY_OF_MONTH, lastDay);
        return cal.getTime();
    }

    public static void main(String[] args) {
        try {
            System.out.println(getFirstDayOfMonth("2020-02-01"));

            System.out.println(getLastDayOfMonth("2020-02-29"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}
