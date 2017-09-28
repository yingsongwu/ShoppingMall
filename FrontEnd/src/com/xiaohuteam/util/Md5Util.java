package com.xiaohuteam.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5Util {
	/**
	 * MD5加密
	 * **/
	public static String md5(String sourceStr) {
		String result = "";
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(sourceStr.getBytes());
			byte b[] = md.digest();
			int i;
			StringBuffer buf = new StringBuffer("xiaohuteam");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			result = buf.toString();
		} catch (NoSuchAlgorithmException e) {
			System.out.println(e);
		}
		return result;
	}
	/*public static void main(String[] args) {
		System.out.println(Md5Util.md5(Md5Util.md5("qwerty")));
		//System.out.println(md5(md5("qwerty")));
		//System.out.println(md5(md5("tyuiop")));
	}*/
}
