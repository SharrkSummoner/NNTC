package com.company;

public class Main {

    public static void main(String[] args) {
    	int string = 1;
    	String s = "0";
    	for (int i = 0; i < 5; i++) {
    		for (int j = 0; j < string; j++) {
    			System.out.printf("%s", s);
			}
    		System.out.println();
    		string++;
		}
	}
}
