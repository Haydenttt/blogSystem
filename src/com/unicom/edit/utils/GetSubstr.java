package com.unicom.edit.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GetSubstr {
    public static String getSubstr(String content,String substrA,String sbustrB) {

        String substr = "";
        int m,n;
        Matcher matcherA = Pattern.compile(substrA).matcher(content);

        Matcher matcherB = Pattern.compile(sbustrB).matcher(content);

        if (matcherA.find() && matcherB.find()) {
            m = matcherA.start();
            n = matcherB.start();
            substr = content.substring(m, n);
//            System.out.println(substr.toString());

        } else {
            substr=null;
            System.out.println("null");
        }
        return substr;
    }
}
