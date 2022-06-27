package com.company;

public class Hexagon extends Polygons {
    private double x1, x2, x3, x4, x5, x6;
    private double y1, y2, y3, y4, y5, y6;

    public Hexagon(double x1, double y1, double x2, double y2, double x3, double y3, double x4, double y4, double x5, double y5, double x6, double y6) {
        this.x1 = x1;
        this.y1 = y1;

        this.x2 = x2;
        this.y2 = y2;

        this.x3 = x3;
        this.y3 = y3;

        this.x4 = x4;
        this.y4 = y4;

        this.x5 = x5;
        this.y5 = y5;

        this.x6 = x6;
        this.y6 = y6;
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

            case 4:
                x4 = x;
                break;

            case 5:
                x5 = x;
                break;

            case 6:
                x6 = x;
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

            case 4:
                y4 = y;
                break;

            case 5:
                y5 = y;
                break;

            case 6:
                y6 = y;
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

            case 4:
                x4 = x;
                y4 = y;
                break;

            case 5:
                x5 = x;
                y5 = y;
                break;

            case 6:
                x6 = x;
                y6 = y;
                break;

            default:
                return;
        }
    }

    public double[] getVertexCoordinates(int vertexNumber) {
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

            case 4:
                result[0] = x4;
                result[1] = y4;
                break;

            case 5:
                result[0] = x5;
                result[1] = y5;
                break;

            case 6:
                result[0] = x6;
                result[1] = y6;
                break;

            default:
                result[0] = 0.0;
                result[1] = 0.0;
        }
        return result;
    }
}