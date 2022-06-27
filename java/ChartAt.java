package com.company;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String w1 = sc.next(), w2 = sc.next(), w3 = sc.next(), w = "";
        char l1 = w1.charAt(0), l2 = w2.charAt(0), l3 = w3.charAt(0);

        if (l1 < l2) {
            w = w1;
            w1 = w2;
            w2 = w;
        }
        System.out.printf("%s\n%s\n%s\n", w1, w2, w3);
        if (l2 < l3) {
            w = w2;
            w2 = w3;
            w3 = w;
        }
        System.out.printf("%s\n%s\n%s\n", w1, w2, w3);
        if (l1 < l2) {
            w = w1;
            w1 = w2;
            w2 = w;
        }

        System.out.printf("%s\n%s\n%s\n", w1, w2, w3);

    }
}

