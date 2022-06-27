class zadacha_4 {
    public static void main(String args[]) {
        int value = 237;
        int lastNumber = 0;

        value = value % 100 * 10 + (int) (value / 100);

        System.out.println("Число x: " + value);
    }
}
