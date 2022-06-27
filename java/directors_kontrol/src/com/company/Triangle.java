package com.company;

public class Triangle extends Polygons {
    private double x1, x2, x3;
    private double y1, y2, y3;

    public Triangle(double x1, double y1, double x2, double y2, double x3, double y3) {
        this.x1 = x1;
        this.y1 = y1;

        this.x2 = x2;
        this.y2 = y2;

        this.x3 = x3;
        this.y3 = y3;
    }

    public void setVertexX(int vertexNumber, double x) {
        switch (vertexNumber) {
            case 1:
                x1 = x;
                break;

            case 2:
                x2 = x;
                break;

            case 3:
                x3 = x;
                break;

            default:
                return;
        }
    }

    public void setVertexY(int vertexNumber, double y) {
        switch (vertexNumber) {
            case 1:
                y1 = y;
                break;

            case 2:
                y2 = y;
                break;

            case 3:
                y3 = y;
                break;

            default:
                return;
        }
    }

    public void setVertexCoordinates(int vertexNumber, double x, double y) {
        switch (vertexNumber) {
            case 1:
                x1 = x;
                y1 = y;
                break;

            case 2:
                x2 = x;
                y2 = y;
                break;

            case 3:
                x3 = x;
                y3 = y;
                break;

            default:
                return;
        }
    }

    public double[] setVertexCoordinates(int vertexNumber) {
        double[] result = new double[2];
        switch (vertexNumber) {
            case 1:
                result[0] = x1;
                result[1] = y1;
                break;

            case 2:
                result[0] = x2;
                result[1] = y2;
                break;

            case 3:
                result[0] = x3;
                result[1] = y3;
                break;

            default:
                result[0] = 0.0;
                result[1] = 0.0;
        }
        return result;
    }
}