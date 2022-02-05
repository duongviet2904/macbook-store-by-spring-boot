package com.devpro.shop;

import com.github.slugify.Slugify;

public class Utilities {
	public static void main(String[] args) {
		Slugify slg = new Slugify();
		String result = slg.slugify("Sản phẩm bán hàng" + "-" + System.currentTimeMillis());
		System.out.println(result);
	}
}
