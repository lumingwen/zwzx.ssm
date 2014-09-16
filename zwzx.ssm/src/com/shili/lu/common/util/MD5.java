/*
 * @(#)MD5.java Jun 16, 2009
 * All Rights Reserved,Copyright(C) 2006,3G新媒体
 * Jun 16, 2009 技术部 lijunwei
 */
package com.shili.lu.common.util;

//AVA实现MD5加密的例子，调用getMD5String方法，返回32位长的字符串。
//需要引入的包
import java.security.MessageDigest;

/**
 * @author <a href="mailto: helloahello@126.com">lijunwei</a>
 * 
 */
public class MD5 {
	/**
	 * 
	 * 方法名称:getMD5String
	 * 方法描述:双次MD5加密
	 *
	 * @创建人员:fhway  
	 * @创建时间:2011-8-2上午10:16:46
	 *
	 * @param str
	 *            :需要进行md5hash的字符串
	 * @return :经过md5hash后的字符串
	 */
	public static String getMD5String(String str) {
		try {
			byte[] res = str.getBytes();
			MessageDigest md = MessageDigest.getInstance("MD5".toUpperCase());
			byte[] result = md.digest(res);
			for (int i = 0; i < result.length; i++) {
				md.update(result[i]);
			}
			byte[] hash = md.digest();
			StringBuffer d = new StringBuffer("");
			for (int i = 0; i < hash.length; i++) {
				int v = hash[i] & 0xFF;
				if (v < 16){
					d.append("0");
				}
				d.append(Integer.toString(v, 16).toUpperCase() + "");
			}
			return d.toString();
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 
	 * 方法名称:getMD5String2
	 * 方法描述:单次MD5加密
	 *
	 * @创建人员:fhway  
	 * @创建时间:2011-8-2上午10:16:12
	 *
	 * @param str
	 * @return
	 */
	public static String getMD5String2(String str) {
		try {
			byte[] res = str.getBytes();
			MessageDigest md = MessageDigest.getInstance("MD5".toUpperCase());
			for (int i = 0; i < res.length; i++) {
				md.update(res[i]);
			}
			byte[] hash = md.digest();
			StringBuffer d = new StringBuffer("");
			for (int i = 0; i < hash.length; i++) {
				int v = hash[i] & 0xFF;
				if (v < 16){
					d.append("0");
				}
				d.append(Integer.toString(v, 16).toUpperCase() + "");
			}
			return d.toString();
		} catch (Exception e) {
			return null;
		}
	}
	
		/***
		 * MD5加码 生成32位md5码
		 */
		public static String string2MD5(String inStr){
			MessageDigest md5 = null;
			try{
				md5 = MessageDigest.getInstance("MD5");
			}catch (Exception e){
				System.out.println(e.toString());
				e.printStackTrace();
				return "";
			}
			char[] charArray = inStr.toCharArray();
			byte[] byteArray = new byte[charArray.length];

			for (int i = 0; i < charArray.length; i++)
				byteArray[i] = (byte) charArray[i];
			byte[] md5Bytes = md5.digest(byteArray);
			StringBuffer hexValue = new StringBuffer();
			for (int i = 0; i < md5Bytes.length; i++){
				int val = md5Bytes[i] & 0xff;
				if (val < 16)
					hexValue.append("0");
				hexValue.append(Integer.toHexString(val));
			}
			return hexValue.toString();

		}

		/**
		 * 加密解密算法 执行一次加密，两次解密
		 */ 
		public static String convertMD5(String inStr){

			char[] a = inStr.toCharArray();
			for (int i = 0; i < a.length; i++){
				a[i] = (char) (a[i] ^ 't');
			}
			String s = new String(a);
			return s;

		}
//
//		// 测试主函数
//		public static void main(String args[]) {
//			String s = new String("tangfuqiang");
//			System.out.println("原始：" + s);
//			System.out.println("MD5后：" + string2MD5(s));
//			System.out.println("加密的：" + convertMD5(s));
//			System.out.println("解密的：" + convertMD5(convertMD5(s)));
//
//		}
}
