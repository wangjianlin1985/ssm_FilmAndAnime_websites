package com.sheep.utils;

import java.io.File;
import java.util.UUID;

public class Test {
	
	public static void main(String[] args) {
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);
		File file = new File("C:\\Users\\Administrator\\Desktop/TEST/"+uuid.toString());
		System.out.println(file);
		if(!file.exists()) {
			file.mkdirs();
		}
	}
}
