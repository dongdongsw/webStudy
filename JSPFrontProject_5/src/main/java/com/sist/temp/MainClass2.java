package com.sist.temp;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.sist.controller.RequestMapping;

public class MainClass2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scan = new Scanner(System.in);
		System.out.println("URL 입력");
		String url = scan.next();
		List<String> list = new ArrayList<String>();
		list.add("com.sist.temp.Board");
		list.add("com.sist.temp.Member");
		for(String strName : list) {
			
			try {
				Class clsName = Class.forName(strName);
				Object obj = clsName.getDeclaredConstructor().newInstance();
						
				Method[] methods = clsName.getDeclaredMethods();
				for(Method m : methods) {
					RequestMapping rm = m.getAnnotation(RequestMapping.class);
					if(url.equals(rm.value())) {
						m.invoke(obj, null);
						
					}
				}
				
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}

}
