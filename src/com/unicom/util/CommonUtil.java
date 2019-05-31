package com.unicom.util;

import com.unicom.entity.Blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

/**
 * @program: BlogSystem
 * @description: 通用工具类
 * @author: Hayden TONG
 * @create: 2019-05-27 09:10
 **/
public class CommonUtil {
    /***
     * 验证字符串参数是否为空
     *
     * @param param
     * @return
     */
    public static boolean checkParam(String param) {
        return param != null && !"".equals(param) && !param.isEmpty();
    }

}
