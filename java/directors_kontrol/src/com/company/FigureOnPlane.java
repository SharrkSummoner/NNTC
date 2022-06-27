package com.company;

import java.util.Arrays;

public class FigureOnPlane extends Polygons {
    private Polygons[] polygons;

    public FigureOnPlane(Polygons[] polygonsArray) {
        polygons = polygonsArray.clone();
    }

    public void addToFigure(Polygons polygon) {
        polygons = Arrays.copyOf(polygons, polygons.length + 1);
        polygons[polygons.length - 1] = polygon;
    }

    public Polygons[] getFigure() {
        return polygons.clone();
    }
}