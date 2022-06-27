package com.company;
import java.io.*;
import java.util.Scanner;


public class Main {

    public static void main(String[] args) throws Exception {
	    FileReader fr = new FileReader("ex1.csv");
        Scanner sc_fr = new Scanner(fr);

        while (sc_fr.hasNextLine()) {
            System.out.println(sc_fr.nextLine());
        }

        fr.close();
        sc_fr.close();
    }
}
