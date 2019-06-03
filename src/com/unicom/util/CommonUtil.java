package com.unicom.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import java.util.List;

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


    public static JSONArray listToJson(List list) {
        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(list));
        return jsonArray;
    }
}
