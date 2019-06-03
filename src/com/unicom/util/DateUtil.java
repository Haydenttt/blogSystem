package com.unicom.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Author: lp
 * @Date: 2019/5/28 14:31
 * @Version 1.0
 */
public class DateUtil {
    public static final String PATTERN_1 = "MM-dd HH:mm";

    public static final String PATTERN_2 = "yyyy-MM-dd HH:mm";

    public static final String PATTERN_3 = "yyyy-MM-dd";

    /**
     * 得到一定模式的提示时间
     *
     * @param time
     * @param pattern
     * @return
     */
    public static String getPatternTime(long time, String pattern) {
        SimpleDateFormat format = new SimpleDateFormat(pattern);

        return format.format(new Date(time));
    }

    /**
     * 得到比较之后的时间差值
     *
     * @param date
     * @return
     */
    public static String getCompareTime(long date) {
        StringBuffer sb = new StringBuffer();

        long minMill = 60 * 1000;//1min
        long hourMill = 60 * minMill;//1hour
        long dayMill = 24 * hourMill;//1day

        //当前时间
        long now = Calendar.getInstance().getTimeInMillis();
        //相减之后时间差
        long deltime = now - date;

        long day = deltime / dayMill;
        if (day > 0) {//大于1天
            if (day <= 3)
                sb.append(day + "天前");
            else
                sb.append(getPatternTime(date, PATTERN_3));
        } else {//小于1天

            long hour = deltime / hourMill;
            if (hour > 0) {//大于1小时
                sb.append(hour + "小时前");
            } else {//小于1小时

                long minute = deltime / minMill;
                if (minute > 0) {//大于1分钟
                    sb.append(minute + "分钟前");
                } else {//小于1分钟
                    sb.append("刚刚");
                }
            }
        }

        return sb.toString();
    }

    /**
     * 获取一个相对于当前日期的日期
     * @param dayOffset 相对于当前日期的偏移天数，可为负
     * @return
     */
    public static String dateCalcByDay(int dayOffset) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar theCa = Calendar.getInstance();
        theCa.setTime(new Date());
        theCa.add(theCa.DATE, dayOffset);//最后一个数字30可改，30天的意思
        Date start = theCa.getTime();
        String startDate = sdf.format(start);//
        return startDate;
    }
}
