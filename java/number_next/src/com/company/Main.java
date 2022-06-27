package com.company;

import java.util.Arrays;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
                Integer i = new Integer("10");
                if (i.toString() == i.toString()) {
                    System.out.println("Равный");
                } else {
                    System.out.println("Неравный");
                }
//        boolean flag;
//        Scanner sc = new Scanner(System.in);
//        String input;
//        do {
//            String pattern = "([0-9][1-9]|[1-9][0-9])[A-Z][A-Z]([0-9][1-9]|[1-9][0-9])";
//            input = sc.next();
//            flag = input.matches(pattern);
//            if (!flag) System.out.println("no");
//        } while (!flag);
//
//        String[] str = input.split("(?<=\\G.{2})");
//        System.out.println(Arrays.toString(str));
    }
}
