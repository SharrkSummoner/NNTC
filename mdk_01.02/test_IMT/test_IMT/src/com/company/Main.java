package com.company;

import org.junit.Assert;
import org.junit.Test;

public class Main {
    @Test
    public void testNormalWeight() {
        var actualResult = getIMTResult(180f, 75f);
        Assert.assertEquals("нормальной массе тела", actualResult);
    }

    @Test
    public void testZeroHeight() {
        var actualResult = getIMTResult(0f, 65f);
        Assert.assertEquals("указан некорректный рост", actualResult);
    }

    @Test
    public void testZeroWeght() {
        var actualResult = getIMTResult(180f, 0f);
        Assert.assertEquals("указан некорректный вес", actualResult);
    }

    @Test
    public void testZeroValues() {
        var actualResult = getIMTResult(0f, 0f);
        Assert.assertEquals("указаны некорректные рост и вес", actualResult);
    }

    @Test
    public void testMaxHeight() {
        var actualResult = getIMTResult(305f, 80f);
        Assert.assertEquals("указан некорректный рост", actualResult);
    }

    @Test
    public void testMaxWeight() {
        var actualResult = getIMTResult(180f, 400f);
        Assert.assertEquals("указан некорректный вес", actualResult);
    }


    private String getIMTResult(Float heightCm, Float weightKg) {
        var userIndex = Math.round(weightKg / Math.pow((heightCm / 100), 2));
        String userResult = null;

        if ((weightKg.equals(0.0f)) && (heightCm.equals(0.0f))) {
            userResult = "указаны некорректные рост и вес";
            return userResult;
        } else if (weightKg.equals(0.0f) | weightKg > (300f)) {
            userResult = "указан некорректный вес";
            return userResult;
        } else if (heightCm.equals(0.0f) | heightCm > (300f)) {
            userResult = "указан некорректный рост";
            return userResult;
        }

        if (userIndex <= 16) {
            userResult = "выраженному дефициту массы тела";
        } else if (userIndex > 16 && userIndex < 19) {
            userResult = "недостаточной массе тела";
        } else if (userIndex > 19 && userIndex < 25) {
            userResult = "нормальной массе тела";
        } else if (userIndex > 25) {
            userResult = "избыточной массе тела";
        }

        return userResult;
    }
}
