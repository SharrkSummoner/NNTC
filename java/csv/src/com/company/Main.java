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

        String str;

        Scanner sc = new Scanner(System.in);
        while (!sc.nextLine().equals("stop")) {
            str = sc.nextLine();
            newFile(str);
        }
    }

    public static void newFile(String string) throws IOException {
        FileWriter fw = new FileWriter("ex2.csv");
        fw.write(string + "\n");

        fw.close();
    }
}
