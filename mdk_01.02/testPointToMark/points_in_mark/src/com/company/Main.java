package com.company;


import org.junit.Assert;
import org.junit.Test;

public class Main {

    @Test
    public void testLessMinPoint() {
        var actualResult = getMarkResult(-2);
        Assert.assertEquals("no mark result", actualResult);
    }

    @Test
    public void testMoreMaxPoint() {
        var actualResult = getMarkResult(101);
        Assert.assertEquals("no mark result", actualResult);
    }

    @Test
    public void testBoundaryPointMinPointFirst() {
        var actualResult = getMarkResult(0);
        Assert.assertEquals("2", actualResult);
    }

    @Test
    public void testBoundaryPointMaxPointFirst() {
        var actualResult = getMarkResult(35);
        Assert.assertEquals("2", actualResult);
    }

    @Test
    public void testBoundaryMinPointTwo() {
        var actualResult = getMarkResult(36);
        Assert.assertEquals("3", actualResult);
    }

    @Test
    public void testBoundaryMaxPointTwo() {
        var actualResult = getMarkResult(56);
        Assert.assertEquals("3", actualResult);
    }

    @Test
    public void testBoundaryMinPointThree() {
        var actualResult = getMarkResult(57);
        Assert.assertEquals("4", actualResult);
    }

    @Test
    public void testBoundaryMaxPointThree() {
        var actualResult = getMarkResult(71);
        Assert.assertEquals("4", actualResult);
    }

    @Test
    public void testBoundaryMinPointFour() {
        var actualResult = getMarkResult(72);
        Assert.assertEquals("5", actualResult);
    }

    @Test
    public void testBoundaryMaxPointFour() {
        var actualResult = getMarkResult(100);
        Assert.assertEquals("5", actualResult);
    }

    private String getMarkResult(Integer mark) {
        if (mark >= 0 && mark <= 35) return "2";
        if (mark > 35 && mark <= 56) return "3";
        if (mark > 56 && mark < 71) return "4";
        if (mark > 72 && mark < 100) return "5";
        return "no mark result";
    }
}
