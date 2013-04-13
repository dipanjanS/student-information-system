package com.studentzone.util;

import java.util.Random;

public class GeneratePassword {
 
    private static final String charset = "!@#$%^&*()" +
        "0123456789" +
        "abcdefghijklmnopqrstuvwxyz" +
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
 
    public static String getNewPassword() {
        Random rand = new Random(System.currentTimeMillis());
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i <= 10; i++ ) {
            int pos = rand.nextInt(charset.length());
            sb.append(charset.charAt(pos));
        }
        return sb.toString();
    }
  
}