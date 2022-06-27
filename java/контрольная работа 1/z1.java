package com.company;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
	    Scanner sc = new Scanner(System.in);
	    //Первый способ решения
		int x = sc.nextInt(), y = sc.nextInt(), z = sc.nextInt();
		x *= 2;
		y -= 3;
		z *= z;
		System.out.printf("%d\n", x + y + z);

		//Второй способ решения
	    int array[] = new int[3];

	    for (int i = 0; i < array.length; i++) {
            array[i] = ((int)(Math.random() * 200) - 100);
        }

	    array[0] *= 2;
	    array[1] -= 3;
	    array[2] *= array[2];

	    System.out.printf("%d\n", array[0] + array[1] + array[2]) ;
    }
}
