package com.company;

class Nullable {
    public static String hello() {
        return "Hello!";
    }
}

class Test {
    public static void main(String[] args) {
        Nullable nullable = null;
        System.out.println(nullable.hello());
    }
}