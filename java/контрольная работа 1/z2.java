package com.company;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
    	
	    Scanner sc = new Scanner(System.in);
	    int[] array = new int[10];
		int sum = 0, not = 0;
	    for (int i = 0; i < array.length; i++) {
	        array[i] = ((int)(Math.random() * 200) - 100);
	        System.out.printf("%d   ", array[i]);
        }

	    for (int i : array) {
	    	if (i % 2 != 0) {
	    		sum += i;
	    		not++;
			} else {
	    		break;
			}
		}

	    if (not == array.length) {
	    	sum = 0;
	    	for (int i = 1; i < (array.length - 1); i++) {
	    		sum += array[i];
			}
		}
		System.out.printf("summa = %d\n", sum);
	}
}
