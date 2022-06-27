package com.company;

public class Main {
    public static void main(String[] args) {
        Triangle triangle = new Triangle(1.3, 2.7, 4.1, 7.2, 2.3, 6.4);
        Quadrilateral quadrilateral = new Quadrilateral(1.3, 2.7, 1.3, 7.2, 4.1, 7.2, 2.3, 6.4);
        Pentagon pentagon = new Pentagon(1.3, 2.7, 1.3, 7.2, 2.7, 9.4, 4.1, 7.2, 2.3, 6.4);
        Hexagon hexagon = new Hexagon(1.3, 2.7, 1.3, 7.2, 2.7, 9.4, 4.1, 7.2, 2.3, 6.4, 2.7, 1.6);

        Polygons[] mass = new Polygons[]{triangle, quadrilateral, pentagon, hexagon};

        FigureOnPlane figureOnPlane = new FigureOnPlane(mass);
    }
}