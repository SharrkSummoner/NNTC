package com.company;

public class Main {

    public static void main(String[] args) {

    	int x = 237, x1;

		String str = Integer.toString(x);
		char let_0 = str.charAt(0);
		x1 = Integer.parseInt(String.valueOf(let_0));

		x %= 100;
		x *= 10;
		x += x1;

		System.out.printf("%d", x);
	}
}
