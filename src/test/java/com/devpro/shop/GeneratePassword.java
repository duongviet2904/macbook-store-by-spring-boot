package com.devpro.shop;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GeneratePassword {
	public static void main(String[] args) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(8);
		String result = encoder.encode("Thu123");
		System.out.println(result);
	}
}
