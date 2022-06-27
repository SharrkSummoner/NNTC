package com.company;

import java.awt.image.Kernel;

public class Main {

    public static void main(String[] args) {
        Students tancev = new Students(180, 85);
        tancev.jump(0, 2);

        Students bikova = new Students(175, 70);
        bikova.jump(0, 3);

        kurs dollar = new kurs("Доллар");
        dollar.jump(86, 83);
    }
}

interface MyJump {
    default void jump(int a, int b) {
        int c = b - a;
        System.out.printf("%d\n", c);
    }
}

abstract class figure {
    public double x;
    public double y;

    figure(double x, double y, double ... coord) {
        for (double i : coord) {
            i = x;
            i = y;
        }
    }
}

abstract class MyKurs {
    public String name;

    MyKurs(String name) {
        this.name = name;
    }
}

class Students extends MyPeople implements MyJump{
    Students(int rost, int ves) {
        super(rost, ves);
    }
}

class kurs extends MyKurs implements MyJump {
    kurs(String name) {
        super(name);
    }
}